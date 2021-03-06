package accom.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import accom.model.service.AccomService;
import accom.model.service.RoomService;

/**
 * Servlet implementation class accomDeleteServlet
 */
@WebServlet("/adelete")
public class AccomDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccomDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//숙소 삭제 처리용 컨트롤러
		response.setContentType("text/html; charset=utf-8");
		
		int accomId = Integer.parseInt(request.getParameter("anum"));
		System.out.println(accomId);
		AccomService aservice = new AccomService();
		RoomService rservice = new RoomService();
		
		if(rservice.deleteRoom(accomId) > 0 && aservice.deleteAccom(accomId) > 0){
			response.sendRedirect("/tonight/alist?page=1");
		}else{
			RequestDispatcher view = request.getRequestDispatcher("views/accom/accomError.jsp");
			request.setAttribute("message", "숙소 삭제 처리 실패!");
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
