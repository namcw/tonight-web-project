package faq.contoller;

import java.io.IOException;

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
 * Servlet implementation class FaqUpdateViewServlet
 */
@WebServlet("/fupdateview")
public class FaqUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8"); 
		

		Faq faq = new FaqService().selectFaq(Integer.parseInt(request.getParameter("no")));
		
		
		RequestDispatcher view = null;
		if(faq != null){
			view = request.getRequestDispatcher("views/faq/faqUpdateView.jsp");
			request.setAttribute("faq", faq);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("views/faq/faqError.jsp");
			request.setAttribute("message", "FaQ 수정페이지 출력 처리 실패!");
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