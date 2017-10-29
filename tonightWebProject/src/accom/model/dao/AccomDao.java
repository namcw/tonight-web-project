package accom.model.dao;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.*;

import accom.model.vo.AccomReview;
import accom.model.vo.Accommodation;
import tour.model.vo.TourReview;

public class AccomDao {
	//총 숙소 리스트 갯수 조회용
	public int getListCount(Connection con) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from accommodation";
		
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

	//한 페이지에 출력할 게시글 목록 조회용
	public ArrayList<Accommodation> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Accommodation> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//currentPage 에 해당되는 목록만 조회
		String query = "select * from ("
				+ "select rownum rnum, acc_id, biz_id, acc_name, acc_info, "
				+ "acc_type, acc_address, acc_contact, acc_rank, "
				+ "acc_image_path, acc_rules, acc_facilities, acc_refund from "
				+ "(select * from accommodation order by acc_name asc)) "
				+ "where rnum >= ? and rnum <= ?";
		
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			if(rset != null){
				list = new ArrayList<Accommodation>();
				
				while(rset.next()) {
					Accommodation a = new Accommodation();
					
					a.setAccId(rset.getInt("acc_id"));
					a.setBizId(rset.getString("biz_id"));
					a.setAccName(rset.getString("acc_name"));
					a.setAccInfo(rset.getString("acc_info"));
					a.setAccType(rset.getString("acc_type"));
					a.setAccAddress(rset.getString("acc_address"));
					a.setAccContact(rset.getString("acc_contact"));
					a.setAccRank(rset.getString("acc_rank"));
					a.setAccImagePath(rset.getString("acc_image_path"));
					a.setAccRules(rset.getString("acc_rules"));
					a.setFacilities(rset.getString("acc_facilities"));
					a.setAccRefund(rset.getString("acc_refund"));
					list.add(a);
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
	
	public Accommodation selectAccom(Connection con, int no) {
		Accommodation accom = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from accommodation where acc_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				accom = new Accommodation();
				
				accom.setAccId(rset.getInt("acc_id"));
				accom.setBizId(rset.getString("biz_id"));
				accom.setAccName(rset.getString("acc_name"));
				accom.setAccInfo(rset.getString("acc_info"));
				accom.setAccType(rset.getString("acc_type"));
				accom.setAccAddress(rset.getString("acc_address"));
				accom.setAccContact(rset.getString("acc_contact"));
				accom.setAccRank(rset.getString("acc_rank"));
				accom.setAccImagePath(rset.getString("acc_image_path"));
				accom.setAccRules(rset.getString("acc_rules"));
				accom.setFacilities(rset.getString("acc_facilities"));
				accom.setAccRefund(rset.getString("acc_refund"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return accom;
	}
	
	public int insertAccom(Connection con, Accommodation a) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into accommodation values ("
				+ "(select max(acc_id) + 1 from accommodation), "
				+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, a.getBizId());
			pstmt.setString(2, a.getAccName());
			pstmt.setString(3, a.getAccInfo());
			pstmt.setString(4, a.getAccType());
			pstmt.setString(5, a.getAccAddress());
			pstmt.setString(6, a.getAccContact());
			pstmt.setString(7, a.getAccRank());
			pstmt.setString(8, a.getAccImagePath());
			pstmt.setString(9, a.getAccRules());
			pstmt.setString(10, a.getFacilities());
			pstmt.setString(11, a.getAccRefund());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateAccom(Connection con, Accommodation a) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update accommodation set "
				+ "acc_name = ?, acc_info = ?, "
				+ "acc_type = ?, acc_address = ?, "
				+ "acc_contact = ?, acc_rank = ?, "
				+ "acc_image_path = ?, acc_rules = ?, "
				+ "acc_facilities = ?, acc_refund = ? "
				+ "where acc_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, a.getAccName());
			pstmt.setString(2, a.getAccInfo());
			pstmt.setString(3, a.getAccType());
			pstmt.setString(4, a.getAccAddress());
			pstmt.setString(5, a.getAccContact());
			pstmt.setString(6, a.getAccRank());
			pstmt.setString(7, a.getAccImagePath());
			pstmt.setString(8, a.getAccRules());
			pstmt.setString(9, a.getFacilities());
			pstmt.setString(10, a.getAccRefund());
			pstmt.setInt(11, a.getAccId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteAccom(Connection con, int no) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from accommodation where acc_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Accommodation> selectTitleSearch(Connection con, String keyword) {
		ArrayList<Accommodation> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from accommodation "
				+ "where acc_name like ? order by acc_name asc";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			
			rset = pstmt.executeQuery();
			
			if(rset != null){
				list = new ArrayList<Accommodation>();
				
				while(rset.next()) {
					Accommodation a = new Accommodation();
					
					a.setAccId(rset.getInt("acc_id"));
					a.setBizId(rset.getString("biz_id"));
					a.setAccName(rset.getString("acc_name"));
					a.setAccInfo(rset.getString("acc_info"));
					a.setAccType(rset.getString("acc_type"));
					a.setAccAddress(rset.getString("acc_address"));
					a.setAccContact(rset.getString("acc_contact"));
					a.setAccRank(rset.getString("acc_rank"));
					a.setAccImagePath(rset.getString("acc_image_path"));
					a.setAccRules(rset.getString("acc_rules"));
					a.setFacilities(rset.getString("acc_facilities"));
					a.setAccRefund(rset.getString("acc_refund"));
					list.add(a);
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

	public ArrayList<AccomReview> getAccomReviewList(Connection con, int accomId) {
		ArrayList<AccomReview> areviewList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from accom_review where ar_accom_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, accomId);
			
			rset = pstmt.executeQuery();
			
			if(rset != null) {
				areviewList = new ArrayList<AccomReview>();
				
				while(rset.next()) {
					AccomReview areview = new AccomReview(
									rset.getInt("ar_no"),
									accomId,
									rset.getDate("ar_date"),
									rset.getString("ar_writer_id"),
									rset.getString("ar_title"),
									rset.getString("ar_content"),
									rset.getDouble("ar_grade"));
					
					areviewList.add(areview);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return areviewList;
	}

	public double getAccomReviewGradeAvg(Connection con, int accomId) {
		double arGradeAvg = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select round(avg(ar_grade),2) avg from accom_review where ar_accom_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, accomId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				arGradeAvg = rset.getDouble(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return arGradeAvg;
	}
}
