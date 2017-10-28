package accom.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import accom.model.service.AccomService;
import accom.model.service.RoomReviewService;
import accom.model.service.RoomService;
import accom.model.vo.Accommodation;
import accom.model.vo.Room;
import accom.model.vo.RoomReview;


/**
 * Servlet implementation class accomDetailServlet
 */
@WebServlet("/adetail")
public class AccomDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccomDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//숙소 상세보기 처리용 컨트롤러
		response.setContentType("text/html; charset=utf-8");
		
		int accomId = Integer.parseInt(request.getParameter("accomId"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		AccomService aservice = new AccomService();
		RoomService rservice = new RoomService();
		RoomReviewService rrservice = new RoomReviewService();
		double gradeAvg = rrservice.getRoomReviewGradeAvg(accomId);
		
		
		//해당 숙소정보 조회 결과 리턴받음
		Accommodation accom = aservice.selectAccom(accomId);
		ArrayList<Room> list = rservice.selectList(accomId);
		ArrayList<RoomReview> rreviewList = rrservice.selectRoomReviewList(accomId);
		
		RequestDispatcher view = null;
		if(accom != null) {
			view = request.getRequestDispatcher("views/accom/accomDetailView.jsp");
			request.setAttribute("accom", accom);
			request.setAttribute("list", list);
			request.setAttribute("rreviewList", rreviewList);
			request.setAttribute("gradeAvg", gradeAvg);
			request.setAttribute("currentPage", currentPage);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("views/accom/accomError.jsp");
			request.setAttribute("message", "숙소 상세조회 실패!");
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
