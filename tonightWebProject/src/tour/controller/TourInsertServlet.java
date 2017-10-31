package tour.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
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

import tour.model.service.TourService;
import tour.model.vo.Tour;
import tour.model.vo.TourConf;
import tour.model.vo.TourDetail;
import tour.model.vo.TourImage;

/**
 * Servlet implementation class TourInsertServlet
 */
@WebServlet("/tinsert")
public class TourInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TourInsertServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int maxSize = 1024 * 1024 * 10;
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "tuploadfiles";
		
		MultipartRequest mrequest = new MultipartRequest(request, savePath,
				maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		
		TourService tservice = new TourService();
		
		int tourId = tservice.getListCount()+1;
		Tour tour = new Tour(tourId, mrequest.getParameter("tourtitle"), mrequest.getParameter("guideid"), null, null);
		
		ArrayList<TourImage> timageList = new ArrayList<TourImage>();
		Enumeration files = mrequest.getFileNames();
		
		while(files.hasMoreElements()) {
			String name = (String) files.nextElement();
			String originalFileName = mrequest.getFilesystemName(name);
			
			TourImage timage = null;
			
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
				if(name.equals("timg")) {
					tour.setTourOname(originalFileName);
					tour.setTourRname(renameFileName);
				} else {
					timage = new TourImage(originalFileName, renameFileName, tourId);
					timageList.add(timage);
				}
			}
			/*
			String type = mrequest.getContentType(name);
			System.out.println(name);
			System.out.println(originalFilename);
			System.out.println(type);*/
		}
		TourDetail tdetail = new TourDetail(tourId,
				mrequest.getParameter("tourinfo"),
				mrequest.getParameter("tguidement"),
				mrequest.getParameter("tmeetingplace"),
				mrequest.getParameter("tourlist"),
				mrequest.getParameter("thistory"),
				mrequest.getParameter("tschedule"),
				mrequest.getParameter("toption"),
				mrequest.getParameter("tpolicy"));
		
		
		ArrayList<TourConf> tconfList = new ArrayList<TourConf>();		
		int confCnt = Integer.parseInt(mrequest.getParameter("confcnt"));
		TourConf tconf = null;
		for(int i = 1; i < confCnt+1; i++) {
			tconf = new TourConf(tourId,
					java.sql.Date.valueOf(mrequest.getParameter("sdate"+i)), java.sql.Date.valueOf(mrequest.getParameter("adate"+i)),
					Integer.parseInt(mrequest.getParameter("aprice"+i)), Integer.parseInt(mrequest.getParameter("cprice"+i)), "Y");
			tconfList.add(tconf);
		}
		
		int rInsertTour = tservice.insertTour(tour);
		int rInsertTdetail = tservice.insertTourDetail(tdetail);
		int rInsertTconf = tservice.insertTourConfList(tconfList);
		int rInsertTimage = tservice.insertTourImageList(timageList);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
