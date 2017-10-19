package tour.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
		
		String sql = "SELECT * FROM TOUR ORDER BY 1 DESC";
		
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
							rset.getString("TOUR_THUMNAIL_PATH"));
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

	public Tour selectTour(Connection con, int tid) {
		Tour tour = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM TOUR WHERE TOUR_ID = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tid);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				tour = new Tour(tid,
								rset.getString("TOUR_TITLE"),
								rset.getString("GUIDE_ID"),
								rset.getString("TOUR_THUMNAIL_PATH"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return tour;
	}

}
