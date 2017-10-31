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
 * Servlet implementation class RoomDetailServlet
 */
@WebServlet("/rdetail")
public class RoomDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		//객실 상세보기 처리용 컨트롤러
		String roomName = "";
		RoomService rservice = new RoomService();
		
		//해당 객실정보 조회 결과 리턴받음 
		Room room = rservice.selectRoom(roomName);
				
				RequestDispatcher view = null;
				if(room != null){
					view = request.getRequestDispatcher("views/room/roomDetailView.jsp");
					request.setAttribute("room", room);
					view.forward(request, response);
				}else{
					view = request.getRequestDispatcher("views/room/roomError.jsp");
					request.setAttribute("message", "게시글 상세조회 실패!");
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
