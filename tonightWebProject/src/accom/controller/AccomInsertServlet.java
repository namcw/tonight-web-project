package accom.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import accom.model.dao.AccomDao;
import accom.model.service.AccomService;
import accom.model.vo.AccomImage;
import accom.model.vo.Accommodation;

/**
 * Servlet implementation class accomInsertServlet
 */
@WebServlet("/ainsert")
public class AccomInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccomInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//숙소 등록 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		System.out.println("시작!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		int maxSize = 1024 * 1024 * 10;
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "auploadfiles";
		
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		AccomService aservice = new AccomService();
		
		int accomId = aservice.getListCount() + 1;		
	
		String aName = mrequest.getParameter("aname");
		String aWriter = mrequest.getParameter("awriter");
		String aRank = mrequest.getParameter("arank");
		String aType = mrequest.getParameter("atype");
		String aAddress = mrequest.getParameter("aaddress");
		String aContact = mrequest.getParameter("acontact");
		String aInfo = mrequest.getParameter("ainfo");
		String[] aFacilitiess = mrequest.getParameterValues("afacilities");
		
		StringBuilder hb = new StringBuilder();
		for(int i = 0; i < aFacilitiess.length; i++) {
			if(i< aFacilitiess.length - 1)
				hb.append(aFacilitiess[i] + ",");
			else
				hb.append(aFacilitiess[i]);
		}
		
		String aFacilities = hb.toString();
	
		String aRules = mrequest.getParameter("arules");
		String aRefund = mrequest.getParameter("arefund");
		
		Accommodation accom = new Accommodation(accomId, aWriter, aName, aInfo, aType, aAddress,
				aContact, aRank, null, null, aRules, aFacilities, aRefund);
		System.out.println(accom);
		
		ArrayList<AccomImage> aimageList = new ArrayList<AccomImage>();
		Enumeration files = mrequest.getFileNames();
		
		while(files.hasMoreElements()) {
			System.out.println("aaaa");
			String name = (String) files.nextElement();
			String originalFileName = mrequest.getFilesystemName(name);
			
			AccomImage aimage = null;
			
			if(originalFileName != null) {
				String renameFileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(
						new java.sql.Date(System.currentTimeMillis())) + "."
						+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				File originalFile = new File(savePath + "\\" + originalFileName);
				File renameFile = new File(savePath + "\\" + renameFileName);
				
				if(!originalFile.renameTo(renameFile)){
					int read = -1;
					byte[] buf = new byte[1024];
					
					FileInputStream fin = new FileInputStream(originalFile);
					FileOutputStream fout = new FileOutputStream(renameFile);
					
					while((read = fin.read(buf, 0, buf.length)) != -1)
						fout.write(buf, 0, read);
					
					fin.close();
					fout.close();
					originalFile.delete();
				}
				System.out.println("-----------"+name);
				if(name.equals("aimg")) {
					accom.setAccOname(originalFileName);
					accom.setAccRname(renameFileName);
					System.out.println("대표이미지");
				} else {
					aimage = new AccomImage(renameFileName, originalFileName, accomId);
					aimageList.add(aimage);
					System.out.println("상세이미지");
				}
			}
		}
		
		aservice.insertAccom(accom);
		
		aservice.insertAccomImageList(aimageList);
		
		for(AccomImage ai : aimageList) {
			System.out.println(ai);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

	}

}
