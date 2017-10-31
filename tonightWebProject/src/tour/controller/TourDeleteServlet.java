package tour.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tour.model.service.TourService;

/**
 * Servlet implementation class TourDeleteServlet
 */
@WebServlet("/tdelete")
public class TourDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TourDeleteServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		int tid = Integer.parseInt(request.getParameter("tid"));
		
		
		int resultDelete = new TourService().deleteTour(tid);
		if(resultDelete > 0) {
			PrintWriter out = response.getWriter();
			 
			out.println("<script language='javascript'>");
			out.println("alert('삭제가 완료되었습니다.');");
			out.println("location.href='/tonight/tlist'");
			out.println("</script>");
			out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
