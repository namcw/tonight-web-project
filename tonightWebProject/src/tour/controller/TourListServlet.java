package tour.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tour.model.service.TourService;
import tour.model.vo.Tour;

/**
 * Servlet implementation class TourListServlet
 */
@WebServlet("/tlist")
public class TourListServlet extends HttpServlet {
	private static final long serialVersionUID = 1123L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TourListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		//페이지 처리용
		int currentPage = 1;
		
		//한 페이지에 출력할 페이지 갯수 지정
		int limit = 9;
		
		//페이시 숫자가 전송이 왔을 경우
		
		TourService tservice = new TourService();
		
		//전체 목록 갯수 조회함
		int listCount = tservice.getListCount();
		
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		//해당 페이지용 목록 조회
		ArrayList<Tour> list = tservice.selectList(currentPage, limit);
		
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
		
		ArrayList<Integer> trCntList = tservice.getTourReviewCntList();
		ArrayList<Double> trAvgList = tservice.getTourReviewAvgList();
			
		RequestDispatcher view = null;
		

		view = request.getRequestDispatcher("views/tour/tourListView.jsp");
		request.setAttribute("list", list);
		request.setAttribute("listCount", listCount);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("trCntList", trCntList);
		request.setAttribute("trAvgList", trAvgList);
		view.forward(request, response);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
