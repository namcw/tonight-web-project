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
 * Servlet implementation class QnaReplyServlet
 */
@WebServlet("/qreply")
public class QnaReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html); charset=utf-8");
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		int currentPage = Integer.parseInt(request.getParameter("page"));

		
		String qnaTitle = request.getParameter("qnaTitle");
		String writerId = request.getParameter("writerId");
		String answer = request.getParameter("answer");
		System.out.println(qnaTitle);
		System.out.println(writerId);
		System.out.println(answer);
		
		QnaService qservice = new QnaService();
		
		Qna originQna = qservice.selectQna(bnum);
		
		Qna replyQna = new Qna();
		replyQna.setAnswer(answer);
		replyQna.setWriterId(writerId);
		replyQna.setAnswer(answer);
		replyQna.setQnaLevel(originQna.getQnaLevel() + 1);
		if(replyQna.getQnaLevel() == 2)
			replyQna.setQnaReplyRef(originQna.getQnaNo());
		replyQna.setQnaReplySeq(1);
		
		qservice.updateReplySeq(replyQna);
		
		int result = qservice.insertReply(originQna, replyQna);
		
		if(result > 0){
			response.sendRedirect("/tonight/qlist?page=" + currentPage);
		}else{
			RequestDispatcher view = request.getRequestDispatcher("views/board/boardError.jsp");
			request.setAttribute("message", "댓글 달기 실패!");
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
