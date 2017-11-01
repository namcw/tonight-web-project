package faq.contoller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import faq.model.service.FaqService;
import faq.model.vo.Faq;
import member.model.vo.Member;
import qna.model.service.QnaService;
import qna.model.vo.Qna;

/**
 * Servlet implementation class FaqInsertServlet
 */
@WebServlet("/finsert")
public class FaqInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String faqTitle = request.getParameter("faqTitle");
		String faqCategory = request.getParameter("faqCategory");
		String faqAnswer = request.getParameter("faqAnswer");
		
		Faq faq = new Faq(faqTitle, faqCategory, faqAnswer);
		
		RequestDispatcher view = null;
		
		if(new FaqService().insertFaq(faq) > 0){
			response.sendRedirect("/tonight/flist");
		}else{
			view = request.getRequestDispatcher("views/faq/faqError.jsp");
			request.setAttribute("message", "공지글 등록 실패!");
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