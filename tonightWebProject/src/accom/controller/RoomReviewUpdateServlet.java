package accom.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import accom.model.service.RoomReviewService;
import accom.model.vo.RoomReview;

/**
 * Servlet implementation class RoomReviewUpdateServlet
 */
@WebServlet("/rrupdate")
public class RoomReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomReviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		int maxSize = 1024 * 1024 * 10;
		

		RequestDispatcher view = null;
		if(!ServletFileUpload.isMultipartContent(request)){
			view = request.getRequestDispatcher("views/room/roomReviewError.jsp");
			request.setAttribute("message", "form enctype 속성 사용 안 함!");
			view.forward(request, response);
		}
		
		
		String root = request.getSession().getServletContext().getRealPath("/");

		String savePath = root + "ruploadfiles";
		
		MultipartRequest mrequest = new MultipartRequest(request, savePath,
				maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String title = mrequest.getParameter("rtitle");
		String content = mrequest.getParameter("rcontent");
		int rnum = Integer.parseInt(mrequest.getParameter("rnum"));
		int currentPage = Integer.parseInt(mrequest.getParameter("page"));
		String oFileName = mrequest.getParameter("ofile");
		String rFileName = mrequest.getParameter("rfile");
		
		String originalFileName = mrequest.getFilesystemName("upfile");
		RoomReview r = null;
		if(originalFileName != null && 
				!oFileName.equals(originalFileName)){

			SimpleDateFormat sdf = 
					new SimpleDateFormat("yyyyMMddHHmmss");
			String renameFileName = sdf.format(
					new java.sql.Date(System.currentTimeMillis())) + "."
					+ originalFileName.substring(
							originalFileName.lastIndexOf(".") + 1);
			
			
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
				new File(savePath + "/" + rFileName).delete();
			}
			r = new RoomReview(rnum, title, content, originalFileName, renameFileName);
		}else 
			r = new RoomReview(rnum, title, content, oFileName, rFileName);
				
		
		if(new RoomReviewService().updateRoomReview(r) > 0){
			response.sendRedirect("/tonight/rreview?page=" + currentPage);
		}else{
			view = request.getRequestDispatcher("views/room/roomReviewError.jsp");
			request.setAttribute("message", "roomReview 서비스 : 원글 수정 실패!");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
