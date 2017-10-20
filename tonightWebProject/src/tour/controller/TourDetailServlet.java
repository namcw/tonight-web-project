package tour.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tour.model.service.TourService;
import tour.model.vo.Tour;
import tour.model.vo.TourDetail;

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
		TourDetail tdetail = tservice.selectDetail(tid);
		
		RequestDispatcher view = null;
		if(tour != null){
			view = request.getRequestDispatcher("views/tour/tourDetailView.jsp");
			request.setAttribute("tour", tour);
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
