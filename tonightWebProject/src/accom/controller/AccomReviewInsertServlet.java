package accom.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import accom.model.service.AccomService;
import accom.model.vo.AccomReview;

/**
 * Servlet implementation class AccomReviewInsertServlet
 */
@WebServlet("/arinsert")
public class AccomReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccomReviewInsertServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setContentType("application/json");
		
		int aid = Integer.parseInt(request.getParameter("aid"));
		String writerId = request.getParameter("writerid");
		int grade = Integer.parseInt(request.getParameter("grade"));
		String comment = request.getParameter("comments");
		
		System.out.println(aid +", "+ writerId +", "+ grade +", "+ comment);
	
		AccomReview ar = new AccomReview(aid, writerId, comment, grade);
		
		int result = new AccomService().insertAccomReview(ar);
		
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
