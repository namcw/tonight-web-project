package tour.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import accom.model.service.AccomService;
import accom.model.vo.Accommodation;
import tour.model.service.TourService;
import tour.model.vo.Tour;

/**
 * Servlet implementation class TourPopularityservelt
 */
@WebServlet("/tpopul")
public class TourPopularityservelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TourPopularityservelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html charset=utf-8");
		
		TourService tservice = new TourService();
		AccomService aservice=new AccomService();
		
		ArrayList<Tour> tpopul=tservice.tourPopularity();
		ArrayList<Accommodation> apopul=aservice.accomPopularity();
		RequestDispatcher view = null;
		
		view=request.getRequestDispatcher("views/tour/tourPopularityItem.jsp");
		request.setAttribute("tpopul", tpopul);
		request.setAttribute("apopul", apopul);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}