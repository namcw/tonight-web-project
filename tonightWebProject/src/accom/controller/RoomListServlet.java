package accom.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import accom.model.service.RoomService;
import accom.model.vo.Room;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/rlist")
public class RoomListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 페이지 단위로 게시글 목록 조회 처리용 컨트롤러
		response.setContentType("text/html; charset=utf-8");
		
		RoomService rservice = new RoomService();
		
		ArrayList<Room> list = rservice.selectList();
		RequestDispatcher view = null;
		
		if(list != null){
			view = request.getRequestDispatcher("views/room/roomListView.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
		
		
		}else{
			view = request.getRequestDispatcher("views/room/roomError.jsp");
			request.setAttribute("message", "리스트 조회 실패!");
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









