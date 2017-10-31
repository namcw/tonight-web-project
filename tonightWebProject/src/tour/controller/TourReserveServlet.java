package tour.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TourReserveServlet
 */
@WebServlet("/treserve")
public class TourReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TourReserveServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		int tourId = Integer.parseInt(request.getParameter("tourid"));
		String sdate = request.getParameter("sdatein");
		String adate = request.getParameter("adatein");
		int acnt = Integer.parseInt(request.getParameter("adult"));
		int ccnt = Integer.parseInt(request.getParameter("child"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		String registerId = request.getParameter("registerid");
		
		System.out.println(registerId);
		System.out.println(totalPrice);
		System.out.println(ccnt);
		System.out.println(acnt);
		System.out.println(adate);
		System.out.println(sdate);
		System.out.println(tourId);
		
		//int result = new TourService().insertTourReserve();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
