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
		// 게시글 수정페이지 출력 처리용 컨트롤러
		response.setContentType("text/html; charset=utf-8");
		
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		RoomReview review = new RoomReviewService().selectRoomReview(rnum);
		
		RequestDispatcher view = null;
		if(review != null){
			view = request.getRequestDispatcher("views/room/roomUpdateView.jsp");
			request.setAttribute("review", review);
			request.setAttribute("currentPage", currentPage);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("views/room/roomReviewErrorView.jsp");
			request.setAttribute("message", "수정페이지 출력 요청 실패!");
			view.forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
