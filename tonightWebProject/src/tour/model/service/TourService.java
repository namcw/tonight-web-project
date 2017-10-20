package tour.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static common.JDBCTemplate.*;

import tour.model.dao.TourDao;
import tour.model.vo.TourDetail;
import tour.model.vo.Tour;

public class TourService {
	
	public TourService() {}

	public ArrayList<Tour> selectList() {
		Connection con = getConnection();
		ArrayList<Tour> list = new TourDao().selectList(con);
		close(con);
		return list;
	}

	public Tour selectTour(int tid) {
		Connection con = getConnection();
		Tour tour = new TourDao().selectTour(con, tid);
		close(con);
		return tour;
	}

	public TourDetail selectDetail(int tid) {
		Connection con = getConnection();
		TourDetail tdetail = new TourDao().selectTourDetail(con, tid);
		close(con);
		return tdetail;
	}
}
