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

/**
 * Servlet implementation class QnaDetailServlet
 */
@WebServlet("/qdetail")
public class QnaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		QnaService nqna = new QnaService();

		nqna.addReadCount(no);
		
		Qna qna = nqna.selectQna(no);
		RequestDispatcher view = null;
		if(qna != null){
			view = request.getRequestDispatcher("views/qna/qnaDetailView.jsp");
			request.setAttribute("qna", qna);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("views/qna/qnaError.jsp");
			request.setAttribute("message", "상세 조회 실패");
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
