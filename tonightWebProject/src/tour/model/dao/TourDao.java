package tour.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import static common.JDBCTemplate.*;
import tour.model.vo.Tour;
import tour.model.vo.TourConf;
import tour.model.vo.TourDetail;
import tour.model.vo.TourPopularity;
import tour.model.vo.TourReview;

public class TourDao {
	
	public TourDao() {}

	public ArrayList<Tour> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Tour> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM TOUR WHERE TOUR_ID BETWEEN ? AND ? ORDER BY 1 DESC";
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
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
			close(pstmt);
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

	public TourDetail selectTourDetail(Connection con, int tid) {
		TourDetail tdetail = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM TOURDETAIL WHERE TOUR_ID = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tid);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				tdetail = new TourDetail(
							tid,
							rset.getString("TOUR_INTRO"),
							rset.getString("TOUR_TOURLIST"),
							rset.getString("TOUR_HISTORY"),
							rset.getString("TOUR_SCHEDULE"),
							rset.getString("TOUR_OPTION"),
							rset.getString("TOUR_POLICY")
						);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return tdetail;
	}

	public int getListCount(Connection con) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from tour";
		
		try{
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) 
				result = rset.getInt(1);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return result;
	}

	public ArrayList<TourReview> getTourReviewList(Connection con, int tid) {
		ArrayList<TourReview> treviewList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM TOUR_REVIEW WHERE TR_TOUR_ID = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tid);
			rset = pstmt.executeQuery();
			if(rset != null) {
				treviewList = new ArrayList<TourReview>();
				while(rset.next()) {
					TourReview treview = new TourReview(
									rset.getInt("TR_NO"),
									tid,
									rset.getDate("TR_DATE"),
									rset.getString("TR_WRITER_ID"),
									rset.getString("TR_TITLE"),
									rset.getString("TR_CONTENT"),
									rset.getDouble("TR_GRADE"));
					
					treviewList.add(treview);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return treviewList;
	}

	public double getTourReviewGradeAvg(Connection con, int tid) {
		double trGradeAvg = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT ROUND(AVG(TR_GRADE),2) avg FROM TOUR_REVIEW WHERE TR_TOUR_ID = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tid);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				trGradeAvg = rset.getDouble(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return trGradeAvg;
	}

	public ArrayList<Integer> getTourReviewCntList(Connection con) {
		ArrayList<Integer> trCntList = null;
		Statement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT NVL(TNUM, 0) TNUM "
					+"FROM TOUR "
					+"LEFT JOIN (SELECT TR_TOUR_ID, COUNT(*) TNUM "
					+"FROM TOUR_REVIEW "
					+"GROUP BY TR_TOUR_ID) ON (TOUR_ID = TR_TOUR_ID) "
					+"ORDER BY TOUR_ID";
		try {
			pstmt = con.createStatement();
			rset = pstmt.executeQuery(sql);
			
			if(rset != null) {
				trCntList = new ArrayList<Integer>();
				while(rset.next()) {
					trCntList.add(rset.getInt("TNUM"));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		return trCntList;
	}

	public ArrayList<Double> getTourReviewAvgList(Connection con) {
		ArrayList<Double> trAvgList = null;
		Statement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT ROUND(NVL(TAVG, 0),2) TAVG "
					+"FROM TOUR "
					+"LEFT JOIN (SELECT TR_TOUR_ID, AVG(TR_GRADE) TAVG "
					+"FROM TOUR_REVIEW "
					+"GROUP BY TR_TOUR_ID) ON (TOUR_ID = TR_TOUR_ID) "
					+"ORDER BY TOUR_ID";
		try {
			pstmt = con.createStatement();
			rset = pstmt.executeQuery(sql);
			
			if(rset != null) {
				trAvgList = new ArrayList<Double>();
				while(rset.next()) {
					trAvgList.add(rset.getDouble("TAVG"));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		return trAvgList;
	}

	public ArrayList<TourConf> getTourConfList(Connection con, int tid) {
		ArrayList<TourConf> tconfList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM TOURCONF WHERE TOUR_ID = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tid);
			rset = pstmt.executeQuery();
			if(rset != null) {
				tconfList = new ArrayList<TourConf>();
				while(rset.next()) {
					TourConf tconf = new TourConf(
								tid,
								rset.getDate("START_DATE"),
								rset.getDate("ARRIVAL_DATE"),
								rset.getInt("TOUR_ADULT_PRICE"),
								rset.getInt("TOUR_CHILD_PRICE"),
								rset.getDouble("TOUR_DISCOUNT"),
								rset.getString("TOUR_STATE")
							);
					tconfList.add(tconf);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return tconfList;
	}

	public ArrayList<Tour> getTourPopularity(Connection con) {
		ArrayList<Tour> tpopul=null;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql="SELECT * "
				+ "FROM TOUR JOIN (SELECT TOUR_ID, RANK() OVER(ORDER BY COUNT(TOUR_ID)DESC) RANKING "
				+ "FROM RESERVE_TOUR "
				+ "WHERE REV_TOUR_DATE BETWEEN ADD_MONTHS(SYSDATE,-1) AND SYSDATE GROUP BY TOUR_ID) USING (TOUR_ID) "
				+ "ORDER BY RANKING ASC";
		
		try {
			
			stmt=con.createStatement();
			rset=stmt.executeQuery(sql);
			
			
			if(rset != null) {
					tpopul = new ArrayList<Tour>();
				while(rset.next()) {
					Tour tour=new Tour();
					tour.setTourId(rset.getInt("TOUR_ID"));
					tour.setTourTitle(rset.getString("TOUR_TITLE"));
					tour.setGuideId(rset.getString("GUIDE_ID"));
					tour.setTourThumnailPath(rset.getString("TOUR_THUMNAIL_PATH"));
					tpopul.add(tour);
				}
				
			}
						
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return tpopul;
	}

}
