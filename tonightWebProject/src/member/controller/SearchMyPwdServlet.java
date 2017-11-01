package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import member.model.service.MemberService;

/**
 * Servlet implementation class SearchMyPwdServlet
 */
@WebServlet("/msearchMyPwd")
public class SearchMyPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMyPwdServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
		String memberPwd = new MemberService().searchMyPwd(request.getParameter("memberid"),
				request.getParameter("membername"), request.getParameter("memberemail"));
		
		JSONObject obj = new JSONObject();
		if (memberPwd != null) {
			obj.put("mpwd", memberPwd);
			response.getWriter().print(obj);
		} else {
			obj.put("mpwd", memberPwd);
			response.getWriter().print(obj);
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
