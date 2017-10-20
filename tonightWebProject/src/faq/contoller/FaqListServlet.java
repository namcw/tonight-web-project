package faq.contoller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faq.model.service.FaqService;
import faq.model.vo.Faq;
import qna.model.service.QnaService;
import qna.model.vo.Qna;

/**
 * Servlet implementation class FaqListServlet
 */
@WebServlet("/flist")
public class FaqListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		
		ArrayList<Faq> list = new FaqService().selectList();
		RequestDispatcher view = null;
		
		if(list != null){
			view = request.getRequestDispatcher("views/faq/faqListView.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("views/faq/faqError.jsp");
			request.setAttribute("message", "FAQ 전체 조회 실패!");
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
