package accom.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import accom.model.service.AccomService;
import accom.model.vo.Accommodation;

/**
 * Servlet implementation class AccomUpdateServlet
 */
@WebServlet("/aupdate")
public class AccomUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccomUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//숙소 수정 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// enctype 이 multipart 방식으로 전송되었는지 확인
		RequestDispatcher view = null;
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			view = request.getRequestDispatcher("views/accom/accomError.jsp");
			request.setAttribute("message", "form 의 enctype 속성 누락됨!");
			view.forward(request, response);
		}
		
		//업로드할 파일의 용량 제한 : 10Mbyte 로 제한한다면
		int maxSize = 1024 * 1024 * 10;
		
		//업로드된 파일의 저장 위치 지정
		//해당 컨테이너에서 구동중인 웹 애플리케이션의 루트 폴더의 경로 알아냄
		String root = request.getSession().getServletContext().getRealPath("/");
		//업로드될 파일의 폴더명과 루트 폴더 연결처리
		String savePath = root + "uploadfiles";
		//web/uploadfiles 로 만들어짐
		
		// request 를 MultipartRequest 객체로 변환함
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
		int aId = Integer.parseInt(mrequest.getParameter("aid"));
		String aName = mrequest.getParameter("aname");
		String aWriter = mrequest.getParameter("awriter");
		String aRank = mrequest.getParameter("arank");
		String aType = mrequest.getParameter("atype");
		String aAddress = mrequest.getParameter("aaddress");
		String aContact = mrequest.getParameter("acontact");
		String aInfo = mrequest.getParameter("ainfo");
		String[] aFacilitiess = mrequest.getParameterValues("afacilities");
		String aRules = mrequest.getParameter("arules");
		String aRefund = mrequest.getParameter("arefund");
		
		StringBuilder hb = new StringBuilder();
		for(int i = 0; i < aFacilitiess.length; i++) {
			if(i< aFacilitiess.length - 1)
				hb.append(aFacilitiess[i] + ",");
			else
				hb.append(aFacilitiess[i]);
		}
		
		String aFacilities = hb.toString();
		
		String aFileName1 = "/tonight/uploadfiles/" + mrequest.getFilesystemName("aupfile1");
		String aFileName2 = mrequest.getFilesystemName("aupfile2");
		
		Accommodation accom = null;
		
		if(aFileName1 != null && aFileName2 != null){ //숙소대표이미지파일 존재, 숙소상세이미지파일 존재
			accom = new Accommodation(aId, aWriter, aName, aInfo, aType, aAddress,
					aContact, aRank, aFileName1, aRules, aFacilities, aRefund);
			//int accId, String bizId, String accName, String accInfo, String accType, String accAddress,
			//String accContact, String accRank, String accImagePath, String accRules, String facilities,
			//String accRefund
			System.out.println(accom);
		}else if(aFileName1 != null && aFileName2 == null){ //숙소대표이미지파일 존재, 숙소상세이미지파일 미존재 
			
		}else{ //숙소 대표이미지 미존재, 숙소 상세페이지 미존재
			
		}
		
		//처리결과에 따라 뷰 지정함
		if(new AccomService().updateAccom(accom) > 0) {
			response.sendRedirect("/tonight/alist");
		}else {
			view = request.getRequestDispatcher("views/accom/accomError.jsp");
			request.setAttribute("message", "숙소 수정 처리 실패!");
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
