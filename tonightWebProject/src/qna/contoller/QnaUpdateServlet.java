package qna.contoller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnaService;
import qna.model.vo.Qna;
import qna.model.service.QnaService;
import qna.model.vo.Qna;

/**
 * Servlet implementation class QnaUpdateServlet
 */
@WebServlet("/qupdate")
public class QnaUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String Qna = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaUpdateServlet() {
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
		
		RequestDispatcher view = null;
		String qnaTitle = request.getParameter("qnaTitle");
		String writerId = request.getParameter("writerId");
		String question = request.getParameter("question");
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		Qna qna = new Qna(qnaTitle, writerId, question, qnaNo);

		if (new QnaService().updateQna(qna) > 0){
			response.sendRedirect("/tonight/qlist");
		}else{
			view = request.getRequestDispatcher("views/qna/qnaError.jsp");
			request.setAttribute("message", "오류");
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
