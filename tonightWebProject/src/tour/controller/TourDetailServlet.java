package tour.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tour.model.service.TourService;
import tour.model.vo.Tour;
import tour.model.vo.TourConf;
import tour.model.vo.TourDetail;
import tour.model.vo.TourImage;
import tour.model.vo.TourReview;

/**
 * Servlet implementation class TourDetailServlet
 */
@WebServlet("/tdetail")
public class TourDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TourDetailServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		int tid = Integer.parseInt(request.getParameter("tid"));
		
		TourService tservice = new TourService();
		
		Tour tour = tservice.selectTour(tid);
		TourDetail tdetail = tservice.selectTourDetail(tid);
		ArrayList<TourReview> treviewList = tservice.selectTourReviewList(tid);
		double gradeAvg = tservice.getTourReviewGradeAvg(tid);
		ArrayList<TourConf> tconfList = tservice.selectTourConfList(tid);
		ArrayList<TourImage> timageList = tservice.selectTourImageList(tid);
		
		
		RequestDispatcher view = null;
		if(tconfList == null || tconfList.size() == 0) {
			view = request.getRequestDispatcher("views/tour/tourError.jsp");
			request.setAttribute("emsg", "예약 가능한 상품이 없습니다.");
		} else {
			view = request.getRequestDispatcher("views/tour/tourDetailView.jsp");
			request.setAttribute("tour", tour);
			request.setAttribute("tdetail", tdetail);
			request.setAttribute("treviewList", treviewList);
			request.setAttribute("gradeAvg", gradeAvg);
			request.setAttribute("tconfList", tconfList);
			request.setAttribute("timageList", timageList);
		}
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
