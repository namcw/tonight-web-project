package tour.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tour.model.service.TourService;
import tour.model.vo.TourReserve;

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
		Date sdate = java.sql.Date.valueOf(request.getParameter("sdatein"));
		Date adate = java.sql.Date.valueOf(request.getParameter("adatein"));
		int acnt = Integer.parseInt(request.getParameter("adult"));
		int ccnt = Integer.parseInt(request.getParameter("child"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		String memberId = request.getParameter("registerid");
		
		
		TourReserve treserve = new TourReserve(0, memberId, tourId, sdate, adate, acnt, ccnt, totalPrice);
		
		int result = new TourService().insertTourReserve(treserve);
		
		if(result > 0) {
			PrintWriter out = response.getWriter();
			out.println("<script language='javascript'>");
			out.println("alert('예약이 완료되었습니다.');");
			out.println("location.href='/tonight/minfo?memberid="+ memberId + "';");
			out.println("</script>");
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
