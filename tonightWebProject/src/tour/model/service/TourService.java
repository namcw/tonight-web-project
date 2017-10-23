package tour.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static common.JDBCTemplate.*;

import tour.model.dao.TourDao;
import tour.model.vo.TourDetail;
import tour.model.vo.TourReview;
import tour.model.vo.Tour;
import tour.model.vo.TourConf;

public class TourService {
	
	public TourService() {}

	public ArrayList<Tour> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Tour> list = new TourDao().selectList(con, currentPage, limit);
		close(con);
		return list;
	}

	public Tour selectTour(int tid) {
		Connection con = getConnection();
		Tour tour = new TourDao().selectTour(con, tid);
		close(con);
		return tour;
	}

	public TourDetail selectTourDetail(int tid) {
		Connection con = getConnection();
		TourDetail tdetail = new TourDao().selectTourDetail(con, tid);
		close(con);
		return tdetail;
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new TourDao().getListCount(con);
		close(con);
		return listCount;
	}

	public ArrayList<TourReview> selectTourReviewList(int tid) {
		Connection con = getConnection();
		ArrayList<TourReview> treviewList = new TourDao().getTourReviewList(con, tid);
		return treviewList;
	}

	public double getTourReviewGradeAvg(int tid) {
		Connection con = getConnection();
		double trGradeAvg = new TourDao().getTourReviewGradeAvg(con, tid);
		return trGradeAvg;
	}

	public ArrayList<Integer> getTourReviewCntList() {
		Connection con = getConnection();
		ArrayList<Integer> trCntList = new TourDao().getTourReviewCntList(con);
		return trCntList;
	}

	public ArrayList<Double> getTourReviewAvgList() {
		Connection con = getConnection();
		ArrayList<Double> trAvgList = new TourDao().getTourReviewAvgList(con);
		return trAvgList;
	}

	public ArrayList<TourConf> selectTourConfList(int tid) {
		Connection con = getConnection();
		ArrayList<TourConf> tconfList = new TourDao().getTourConfList(con, tid);
		return tconfList;
	}
}
