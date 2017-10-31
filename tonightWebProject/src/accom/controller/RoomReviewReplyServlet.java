package accom.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import accom.model.service.RoomReviewService;
import accom.model.vo.RoomReview;

/**
 * Servlet implementation class RoomReplyServlet
 */
@WebServlet("/rreply")
public class RoomReviewReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomReviewReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 댓글 등록 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		String rtitle = request.getParameter("rtitle");
		String rwriter = request.getParameter("rwriter");
		String rcontent = request.getParameter("rcontent");
		
		RoomReviewService rservice = new RoomReviewService();
		
		//원글 조회
		RoomReview originReview = rservice.selectRoomReview(rnum);
		
		//댓글 객체 생성, 값 기록
		RoomReview replyReview = new RoomReview();
		replyReview.setReviewContent(rcontent);
		replyReview.setReviewTitle(rtitle);
		replyReview.setReviewriter(rwriter);
		replyReview.setReviewLevel(originReview.getReviewLevel() + 1);
		replyReview.setReviewRef(originReview.getReviewRef());
		if(replyReview.getReviewLevel() == 2)
			replyReview.setReviewRef(originReview.getReviewNum());
		replyReview.setReviewReplySeq(1);
		
		//같은 레벨의 기존 댓글의 seq 1증가 처리함
		rservice.updateReplySeq(replyReview);
		
		//댓글 등록 처리
		int result = rservice.insertReply(originReview, replyReview);
		
		if(result > 0){
			response.sendRedirect("/tonight/rreview?page=" + currentPage);
		}else{
			RequestDispatcher view = request.getRequestDispatcher("views/room/roomReviewErrorView.jsp");
			request.setAttribute("message", "댓글 달기 실패!");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
