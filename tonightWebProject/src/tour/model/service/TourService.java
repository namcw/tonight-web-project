package tour.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static common.JDBCTemplate.*;

import tour.model.dao.TourDao;
import tour.model.vo.Tour;

public class TourService {
	
	public TourService() {}

	public ArrayList<Tour> selectList() {
		Connection con = getConnection();
		ArrayList<Tour> list = new TourDao().selectList(con);
		close(con);
		return list;
	}

}
