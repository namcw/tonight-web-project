package accom.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import accom.model.vo.Room;
import accom.model.dao.RoomDao;
import accom.model.service.RoomService;


/**
 * Servlet implementation class RoomInsertServlet
 */
@WebServlet("/rinsert")
public class RoomInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

/**
 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 원글 등록 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//업로드할 파일의 용량 제한 : 10Mbyte 로 제한한다면
		int maxSize = 1024 * 1024 * 10;
		
		//enctype="multipart/form-data" 로 전송되었는지 확인
		RequestDispatcher view = null;
		if(!ServletFileUpload.isMultipartContent(request)){
			view = request.getRequestDispatcher("views/room/roomErrorView.jsp");
			request.setAttribute("message", "form enctype 속성 사용 안 함!");
			view.forward(request, response);
		}
		
		//해당 컨테이너에서 구동중인 웹 애플리케이션의 루트 경로 알아냄
		String root = request.getSession().getServletContext().getRealPath("/");
		//업로드되는 파일이 저장될 폴더명과 루트 경로 연결 처리
		String savePath = root + "ruploadfiles";
		//web/buploadfiles 로 지정됨
		
		//request 를 MultipartRequest 객체로 변환함
		//자동 지정된 경로에 파일 저장됨
		MultipartRequest mrequest = new MultipartRequest(request, savePath,maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		

		String rname = mrequest.getParameter("rname");
		String rstate = mrequest.getParameter("rstate");
		int radult = Integer.parseInt(mrequest.getParameter("radult"));
		int rchild = Integer.parseInt(mrequest.getParameter("rchild"));
		double rdiscount = Double.parseDouble(mrequest.getParameter("rdiscount"));
		String rdetail = mrequest.getParameter("rdetail");
	
		
		
		Room room = null;
		
		/*if(accid != null ){ //숙소존재
*/			room = new Room( rname,rstate, radult, rchild, rdiscount, null, rdetail);
		
		
	
		
		//처리결과에 따라 뷰 지정함
		if(new RoomService().insertRoom(room) > 0){
			response.sendRedirect("views/room/roomWriteForm.jsp");
		}else{
			view = request.getRequestDispatcher("views/room/roomErrorView.jsp");
			request.setAttribute("message", "room 서비스 : 객실 등록 실패!");
			view.forward(request, response);
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
