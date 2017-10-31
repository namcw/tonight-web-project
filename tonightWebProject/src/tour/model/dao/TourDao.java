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
import tour.model.vo.TourImage;

import tour.model.vo.TourReserve;
import tour.model.vo.TourReview;

public class TourDao {
	
	public TourDao() {}

	public ArrayList<Tour> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Tour> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY TOUR_ID DESC) IDX, TOUR_ID, TOUR_TITLE, GUIDE_ID, TOUR_ONAME, TOUR_RNAME FROM TOUR) WHERE IDX BETWEEN ? AND ?";
		
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
							rset.getString("TOUR_ONAME"),
							rset.getString("TOUR_RNAME"));
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
								rset.getString("TOUR_ONAME"),
								rset.getString("TOUR_RNAME"));
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
							rset.getString("TOUR_INFO"),
							rset.getString("TOUR_GUIDEMENT"),
							rset.getString("TOUR_MEETINGPLACE"),
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
		
		String sql = "SELECT * FROM TOUR_REVIEW WHERE TR_TOUR_ID = ? ORDER BY 1 DESC";
		
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

	public int insertTour(Connection con, Tour tour) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO TOUR VALUES(?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, tour.getTourId());
			pstmt.setString(2, tour.getTourTitle());
			pstmt.setString(3, tour.getGuideId());
			pstmt.setString(4, tour.getTourOname());
			pstmt.setString(5, tour.getTourRname());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int insertTourDetail(Connection con, TourDetail tdetail) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO TOURDETAIL VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, tdetail.getTourId());
			pstmt.setString(2, tdetail.getTourGuideMent());
			pstmt.setString(3, tdetail.getTourInfo());
			pstmt.setString(4, tdetail.getTourMeetingPlace());
			pstmt.setString(5, tdetail.getTourList());
			pstmt.setString(6, tdetail.getTourHistory());
			pstmt.setString(7, tdetail.getTourSchedule());
			pstmt.setString(8, tdetail.getTourOption());
			pstmt.setString(9, tdetail.getTourPolicy());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int insertTourConfList(Connection con, ArrayList<TourConf> tconfList) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO TOURCONF VALUES(?, ?, ?, ?, ?, ?)";
		
		try {
			for(TourConf tconf : tconfList) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, tconf.getTourId());
				pstmt.setDate(2, tconf.getStartDate());
				pstmt.setDate(3, tconf.getArrivalDate());
				pstmt.setInt(4, tconf.getTourAdultPrice());
				pstmt.setInt(5, tconf.getTourChildPrice());
				pstmt.setString(6, tconf.getTourState());
				
				result = pstmt.executeUpdate();
				if(result <= 0)
					break;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int insertTourImageList(Connection con, ArrayList<TourImage> timageList) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO TOUR_IMAGE VALUES(?, ?, ?)";
		
		try {
			for(TourImage timage : timageList) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, timage.getImageOname());
				pstmt.setString(2, timage.getImageRname());
				pstmt.setInt(3, timage.getTourId());
				
				result = pstmt.executeUpdate();
				if(result <= 0)
					break;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public ArrayList<TourImage> selectTourImageList(Connection con, int tid) {
		ArrayList<TourImage> timageList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM TOUR_IMAGE WHERE TOUR_ID = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tid);
			rset = pstmt.executeQuery();
			if(rset != null) {
				timageList = new ArrayList<TourImage>();
				while(rset.next()) {
					TourImage timage = new TourImage(
									rset.getString("IMAGE_RNAME"),
									rset.getString("IMAGE_ONAME"),
									tid);
					
					timageList.add(timage);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return timageList;
	}

	public int deleteTour(Connection con, int tid) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "DELETE FROM TOUR WHERE TOUR_ID = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, tid);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int insertTourReview(Connection con, TourReview tr) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO TOUR_REVIEW VALUES((SELECT MAX(TR_NO)+1 FROM TOUR_REVIEW), ?, DEFAULT, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, tr.getTrTourId());
			pstmt.setString(2, tr.getTrWriterId());
			pstmt.setString(3, tr.getTrContent());
			pstmt.setString(4, tr.getTrContent());
			pstmt.setDouble(5, tr.getTrGrade());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int insertTourReserve(Connection con, TourReserve treserve) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO TOUR_RESERVE VALUES((SELECT COUNT(*)+1 FROM TOUR_RESERVE), ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, treserve.getMemberId());
			pstmt.setInt(2, treserve.getTourId());
			pstmt.setDate(3, treserve.getTrSdate());
			pstmt.setDate(4, treserve.getTrAdate());
			pstmt.setInt(5, treserve.getTrAdult());
			pstmt.setInt(6, treserve.getTrChild());
			pstmt.setInt(7, treserve.getTrTprice());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public ArrayList<TourReserve> selectTourReserveList(Connection con, String memberId) {
		ArrayList<TourReserve> treserveList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM TOUR_RESERVE WHERE MEMBER_ID = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset != null) {
				treserveList = new ArrayList<TourReserve>();
				while(rset.next()) {
					TourReserve treserve = new TourReserve(
									rset.getInt("TR_ID"),
									memberId,
									rset.getInt("TOUR_ID"),
									rset.getDate("TR_SDATE"),
									rset.getDate("TR_ADATE"),
									rset.getInt("TR_ADULT"),
									rset.getInt("TR_CHILD"),
									rset.getInt("TR_TPRICE"));
					
					treserveList.add(treserve);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return treserveList;
	}

}
