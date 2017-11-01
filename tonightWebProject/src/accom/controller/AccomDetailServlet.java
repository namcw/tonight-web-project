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
 * Servlet implementation class accomDetailServlet
 */
@WebServlet("/adetail")
public class AccomDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccomDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�닕�냼 �긽�꽭蹂닿린 泥섎━�슜 而⑦듃濡ㅻ윭
		response.setContentType("text/html; charset=utf-8");
		
		int accomId = Integer.parseInt(request.getParameter("accomId"));
		System.out.println("여기까진 오냐");
		AccomService aservice = new AccomService();
		
		//�빐�떦 �닕�냼�젙蹂� 議고쉶 寃곌낵 由ы꽩諛쏆쓬
		Accommodation accom = aservice.selectAccom(accomId);
				
		RequestDispatcher view = null;
		if(accom != null) {
			view = request.getRequestDispatcher("views/accom/accomDetailView.jsp");
			request.setAttribute("accom", accom);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("views/accom/accomError.jsp");
			request.setAttribute("message", "상세정보 불러오기 실패!");
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
