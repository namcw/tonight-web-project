package tour.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import static common.JDBCTemplate.*;
import tour.model.vo.Tour;

public class TourDao {
	
	public TourDao() {}

	public ArrayList<Tour> selectList(Connection con) {
		ArrayList<Tour> list = null;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM TOUR";
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset != null) {
				list = new ArrayList<Tour>();
				while(rset.next()) {
					Tour tour = new Tour(
							rset.getInt("TOUR_ID"),
							rset.getString("TOUR_TITLE"),
							rset.getString("GUIDE_ID"),
							rset.getString("TOUR_STATE"),
							rset.getDate("START_DATE"),
							rset.getDate("ARRIVAL_DATE"),
							rset.getInt("TOUR_ADULT_PRICE"),
							rset.getInt("TOUR_CHILD_PRICE"),
							rset.getDouble("TOUR_DISCOUNT"),
							rset.getString("TOUR_THUMNAIL"),
							rset.getString("TOUR_DETAIL"));
					list.add(tour);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}

}
