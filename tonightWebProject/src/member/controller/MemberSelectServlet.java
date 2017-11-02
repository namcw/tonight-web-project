 package member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import accom.model.service.AccomService;
import accom.model.vo.Accommodation;
import member.model.service.MemberService;
import member.model.vo.Member;
import tour.model.service.TourService;
import tour.model.vo.Tour;
import tour.model.vo.TourReserve;

/**
 * Servlet implementation class MemberSelectServlet
 */
@WebServlet("/minfo")
public class MemberSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSelectServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		Member member = new MemberService().selectMember(request.getParameter("memberid"));
		
		RequestDispatcher view = null;
		if(member != null) {
			String mtype = member.getMemberType();
			if(mtype.equals("U")) {
				ArrayList<TourReserve> treserveList = new TourService().selectTourReserveList(member.getMemberId());
				List<Integer> items = new ArrayList<Integer>();
				for(TourReserve tr : treserveList) {
					items.add(tr.getTourId());
				}
				items = new ArrayList<Integer>(new HashSet<Integer>(items));
				ArrayList<Tour> tList = new ArrayList<Tour>();
				for(int tid : items) {
					 Tour tour = new TourService().selectTour(tid);
					 tList.add(tour);
				}
				
				request.setAttribute("treserveList", treserveList);
				request.setAttribute("tList", tList);
				
			} else if(mtype.equals("G")) {
				ArrayList<Tour> tList = new TourService().selectGuideTourList(member.getMemberId());
				request.setAttribute("tList", tList);
				
			} else if(mtype.equals("B")) {
				ArrayList<Accommodation> aList = new AccomService().selectBizAccomList(member.getMemberId());
				request.setAttribute("aList", aList);
			}
			view = request.getRequestDispatcher("views/member/myInfo.jsp");
			request.setAttribute("member", member);
			view.forward(request, response);
			
		} else {
			view=request.getRequestDispatcher("views/member/memberError.jsp");
			request.setAttribute("message", "¸마이페이지 띄우기 실패");
			view.forward(request, response);
		
		}
	}
}
