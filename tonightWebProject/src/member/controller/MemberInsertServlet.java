package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/menroll")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String memberId = request.getParameter("memberid");
		String memberPwd = request.getParameter("memberpwd");
		String memberName = request.getParameter("membername");
		String memberType= request.getParameter("membertype");
		  String mon = request.getParameter("month");
	      String day = request.getParameter("day");
	      String year= request.getParameter("year");
	      	      
	      if(mon.length() == 1)
	         mon = "0"+mon;
	      if(day.length() == 1)
	         day = "0"+day;
	      
		String birthDate=year+mon+day;
		String phone = request.getParameter("memberphone");
		String email = request.getParameter("memberemail");
		String address = request.getParameter("memberaddress");
		
					
		Member member = new Member(memberId, memberPwd, memberName, 
				memberType,birthDate,phone,email,address,null);
		
		
		int result = new MemberService().insertMember(member);
		
		if(result > 0){
			response.sendRedirect("/tonight/index.jsp");
		}else{
			RequestDispatcher view = request.getRequestDispatcher("views/member/memberError.jsp");
			request.setAttribute("message", "회원 가입 실패!");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
