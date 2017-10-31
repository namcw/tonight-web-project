package accom.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import accom.model.service.RoomReviewService;
import accom.model.vo.RoomReview;


/**
 * Servlet implementation class RoomReplyUpdateServlet
 */
@WebServlet("/rreplyupdate")
public class RoomReplyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomReplyUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 댓글 수정 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		String rtitle = request.getParameter("rtitle");
		String rcontent = request.getParameter("rcontent");
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		RoomReview reply = new RoomReview(rnum, rtitle, rcontent);
		
		int result = new RoomReviewService().updateReply(reply);
		
		if(result > 0){
			response.sendRedirect("/tonight/rreview?page=" + currentPage);
		}else{
			request.setAttribute("message", "댓글 수정 실패!");
			request.getRequestDispatcher("views/room/roomReviewError.jsp").forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
