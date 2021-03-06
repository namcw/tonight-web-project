package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdate
 */
@WebServlet("/mupdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String memberId = request.getParameter("memberid");
		String memberPwd = request.getParameter("memberpwd");
		String email = request.getParameter("memberemail");
		String phone = request.getParameter("memberphone");
		String address = request.getParameter("memberaddress");
		
		
		Member member = new Member(memberId, memberPwd, phone, email, address);

		int result = new MemberService().updateMember(member);
		
		RequestDispatcher rd = null;
		if(result > 0) {
			Member smember = new MemberService().selectMember(memberId);
			HttpSession session = request.getSession(false);
			session.removeAttribute("member");
			session.setAttribute("member", smember);
			
			response.sendRedirect("/tonight/index.jsp");
		} else {
			rd=request.getRequestDispatcher("/views/member/memberError.jsp");
			request.setAttribute("message", "회원정보 수정 실패");
			rd.forward(request, response);
		}
		
	}

}
