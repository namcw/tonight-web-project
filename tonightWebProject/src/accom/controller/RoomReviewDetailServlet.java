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
 * Servlet implementation class RoomReviewDetailServlet
 */
@WebServlet("/rrdetail")
public class RoomReviewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomReviewDetailServlet() {
        super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 상세보기 처리용 컨트롤러
		response.setContentType("text/html; charset=utf-8");
		
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		RoomReviewService rservice = new RoomReviewService();
		
		//해당 게시글에 대한 조회수 1증가 처리
		rservice.addReadCount(rnum);
		//해당 게시글 정보 조회 결과 리턴받음
		RoomReview review = rservice.selectRoomReview(rnum);
		
		RequestDispatcher view = null;
		if(review != null){
			view = request.getRequestDispatcher("views/room/roomReviewDetailView.jsp");
			request.setAttribute("review", review);
			request.setAttribute("currentPage", currentPage);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("views/room/roomReviewErrorView.jsp");
			request.setAttribute("message", "게시글 상세조회 실패!");
			view.forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
