package accom.model.service;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.*;

import accom.model.vo.AccomReview;
import accom.model.vo.Accommodation;
import tour.model.dao.TourDao;
import tour.model.vo.TourReview;
import accom.model.dao.AccomDao;

public class AccomService {
	public AccomService() {}
	
	//전제 게시글 갯수 조회용
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new AccomDao().getListCount(con);
		close(con);
		return listCount;
	}
	
	//페이지별 목록 조회용
	public ArrayList<Accommodation> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Accommodation> list = new AccomDao().selectList(con, currentPage, limit);
		close(con);
		return list;
	}
	
	//숙소 상세 조회용
	public Accommodation selectAccom(int no) {
		Connection con = getConnection();
		Accommodation accom = new AccomDao().selectAccom(con, no);
		return accom;
	}
	
	//숙소 등록 처리용
	public int insertAccom(Accommodation a) {
		Connection con = getConnection();
		int result = new AccomDao().insertAccom(con, a);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	//숙소 수정 처리용
	public int updateAccom(Accommodation a) {
		Connection con = getConnection();
		int result = new AccomDao().updateAccom(con, a);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	
	//숙소 삭제 처리용
	public int deleteAccom(int no) {
		Connection con = getConnection();
		int result = new AccomDao().deleteAccom(con, no);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	//숙소 검색 처리용
	public ArrayList<Accommodation> selectSearch(String keyword) {
		Connection con =getConnection();
		ArrayList<Accommodation> list = new AccomDao().selectTitleSearch(con, keyword);
		close(con);
		return list;
	}

	public ArrayList<AccomReview> selectAccomReviewList(int accomId) {
		Connection con = getConnection();
		ArrayList<AccomReview> areviewList = new AccomDao().getAccomReviewList(con, accomId);
		return areviewList;
	}

	public double getAccomReviewGradeAvg(int accomId) {
		Connection con = getConnection();
		double arGradeAvg = new AccomDao().getAccomReviewGradeAvg(con, accomId);
		return arGradeAvg;
	}
}
