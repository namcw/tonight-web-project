package accom.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class RoomReviewFileDownServlet
 */
@WebServlet("/rfdown")
public class RoomReviewFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomReviewFileDownServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파일 다운로드 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		
		String originalFileName = request.getParameter("ofile");
		String renameFileName = request.getParameter("rfile");
		
		//프로젝트 내에 파일이 저장된 폴더 경로정보 얻어옴
		String savePath = request.getSession().getServletContext().getRealPath("/ruploadfiles");
		
		//클라이언트로 내보낼 출력 스트림 생성
		ServletOutputStream downOut = response.getOutputStream();
		File downFile = new File(savePath + "/" + renameFileName);
		
		response.setContentType("text/plane; charset=utf-8");
		//한글 파일명을 다운될 os 문자셋으로 인코딩 처리함
		response.addHeader("Content-Disposition", 
				"attachment; filename=\"" + 
				new String(originalFileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
		response.setContentLength((int)downFile.length());
		
		//저장된 폴더의 파일을 읽어서 출력 스트림으로 내보냄
		//파일 읽기용 스트림 생성
		BufferedInputStream bin = new BufferedInputStream(
				new FileInputStream(downFile));
		
		int read = -1;
		while((read = bin.read()) != -1){
			downOut.write(read);
			downOut.flush();
		}
		
		downOut.close();
		bin.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
