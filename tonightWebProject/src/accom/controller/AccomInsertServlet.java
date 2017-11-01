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
import accom.model.service.RoomService;
import accom.model.vo.AccomImage;
import accom.model.vo.Accommodation;
import accom.model.vo.Room;

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
				
				try {
					Thread.sleep(1);
				} catch (Exception e) {
					
				}
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
					System.out.println("DKDKDK");
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
		
		//객실추가
		RequestDispatcher view = null;
	      
		ArrayList<Room> roomList = new ArrayList<Room>();      
		int confCnt = Integer.parseInt(mrequest.getParameter("confcnt"));
		Room room = null;
		System.out.println(confCnt);
		for(int i = 0; i < confCnt+1; i++) {
		   room = new Room(i+1, accomId,
		            mrequest.getParameter("rname"+i),mrequest.getParameter("rdetail"+i),
		            Integer.parseInt(mrequest.getParameter("wkadult"+i)), Integer.parseInt(mrequest.getParameter("wkchild"+i)),
		            Integer.parseInt(mrequest.getParameter("wdadult"+i)), Integer.parseInt(mrequest.getParameter("wdchild"+i)));
		   System.out.println(room);
		   roomList.add(room);
		}
		    
		for(Room r : roomList) {
		   if(new RoomService().insertRoom(r) <= 0) {
		      view = request.getRequestDispatcher("views/room/roomErrorView.jsp");
		      request.setAttribute("message", "room 서비스 : 객실 등록 실패!");
		      view.forward(request, response);
		   }
		}
		   response.sendRedirect("/tonight/alist?page=1");
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

	}

}
