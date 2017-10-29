package accom.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import accom.model.service.AccomService;
import accom.model.vo.Accommodation;

/**
 * Servlet implementation class accomUpdateServlet
 */
@WebServlet("/aupview")
public class AccomUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccomUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//숙소 수정 처리용 컨트롤러
		response.setContentType("text/html; charset=utf-8");
		
		int anum = Integer.parseInt(request.getParameter("anum"));
		
		Accommodation accom = new AccomService().selectAccom(anum);
		
		RequestDispatcher view = null;
		if(accom != null) {
			view = request.getRequestDispatcher("views/accom/accomUpdateView.jsp");
			request.setAttribute("accom", accom);
			view.forward(request, response);
			
		}else {
			view = request.getRequestDispatcher("views/accom/accomError.jsp");
			request.setAttribute("message", "수정페이지 출력 요청 실패!");
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
