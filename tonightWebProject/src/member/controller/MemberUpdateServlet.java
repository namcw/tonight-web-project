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
		String memberName = request.getParameter("membername");
		String memberType=request.getParameter("membertype");
		String birthDate=request.getParameter("birthdate");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String rank=request.getParameter("rank");
		/*System.out.println(memberId+","+memberPwd+","+memberName+","+birthDate+","+email+","+phone+","+address+","+rank);*/
		
		
		Member member = new Member(memberId,memberPwd,memberName,memberType,birthDate,phone,email,address,rank);

		
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
			request.setAttribute("message", "�쉶�썝�젙蹂� �닔�젙 �떎�뙣");
			rd.forward(request, response);
		}
		
	}

}
