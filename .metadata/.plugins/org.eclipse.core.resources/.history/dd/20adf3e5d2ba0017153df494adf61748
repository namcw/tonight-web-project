package accom.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import accom.model.service.RoomService;

/**
 * Servlet implementation class RoomDeleteServlet
 */
@WebServlet("/rdelete")
public class RoomDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 삭제 처리용 컨트롤러
		response.setContentType("text/html; charset=utf-8");
		
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		
		if(new RoomService().deleteRoom(rnum) > 0){
			response.sendRedirect("/tonight/rreview?page=1");
		}else{
			RequestDispatcher view = request.getRequestDispatcher("views/room/roomErrorView.jsp");
			request.setAttribute("message", "게시글 삭제 처리 실패!");
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
