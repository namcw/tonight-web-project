package accom.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import accom.model.service.AccomService;
import accom.model.vo.Accommodation;

/**
 * Servlet implementation class accomSearchServlet
 */
@WebServlet("/asearch")
public class AccomSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccomSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 숙소 목록 제목 검색 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String asType = request.getParameter("astype"); 
		String keyword = request.getParameter("keyword");
		
		AccomService aservice = new AccomService();
		
		ArrayList<Accommodation> list = aservice.selectSearch(keyword, asType);
		ArrayList<Integer> arCntList = aservice.getAccomReviewCntList();
		ArrayList<Double> arAvgList = aservice.getAccomReviewAvgList();
		
		//페이지 처리용
		int currentPage = 1;
		//한 페이지에 출력할 페이지 갯수 지정
		int limit = 9;
		
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
	
		int listCount = list.size();
		
		//총 페이지 수 계산 : 목록이 최소 1개일 때는 한 페이지로 처리함
		//페이지 1이 되려면 = 목록 0.1 개 + 0.9 계산되게 함
		int maxPage = (int)((double)listCount / limit + 0.9);
		//현재 페이지가 13이면 화면에 보여줄 시작 페이지는 11로 지정
		//(1, 11, 21, 31, .......)
		int startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
		//만약, 목록 아래에 보여질 페이지 갯수가 10개이면
		//현재 페이지가 13이면 끝 페이지수는 20페이지가 되어야 함
		int endPage = startPage + limit - 1;
		if(maxPage < endPage)
				endPage = maxPage;
		
		RequestDispatcher view = null;
		
			view = request.getRequestDispatcher("views/accom/accomListView.jsp");
			request.setAttribute("list", list);
			request.setAttribute("listCount", listCount);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("arCntList", arCntList);
			request.setAttribute("arAvgList", arAvgList);
			
			view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
