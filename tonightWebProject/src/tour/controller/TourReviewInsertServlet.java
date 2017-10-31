package tour.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import tour.model.service.TourService;
import tour.model.vo.TourReview;

/**
 * Servlet implementation class TourReviewInsertServlet
 */
@WebServlet("/trinsert")
public class TourReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TourReviewInsertServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setContentType("application/json");

		int tid = Integer.parseInt(request.getParameter("tid"));
		String writerId = request.getParameter("writerid");
		int grade = Integer.parseInt(request.getParameter("grade"));
		String comment = request.getParameter("comments");
		
		System.out.println(tid +", "+ writerId +", "+ grade +", "+ comment);
		
		TourReview tr = new TourReview(tid, writerId, comment, grade);
		
		int result = new TourService().insertTourReview(tr);
		
		Calendar cal = Calendar.getInstance();
		 
		int year = cal.get ( Calendar.YEAR );
		int month = cal.get ( Calendar.MONTH ) + 1 ;
		int date = cal.get ( Calendar.DATE ) ;
		String today = ""+year+"-"+month+"-"+date;
		JSONObject obj = new JSONObject();
		obj.put("writerId", writerId);
		obj.put("today", today);
		obj.put("grade", grade);
		obj.put("comment", comment);
		response.getWriter().print(obj);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
