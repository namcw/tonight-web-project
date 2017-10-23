package accom.model.dao;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.*;
import accom.model.vo.Accommodation;

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
				+ "select rownum rnum, acc_id, biz_id, acc_name, "
				+ "acc_type, acc_address, acc_contact, acc_rank, "
				+ "acc_image_path, acc_rules, acc_locationinfo, "
				+ "acc_facilities, acc_refund from "
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
					a.setAccType(rset.getString("acc_type"));
					a.setAccAddress(rset.getString("acc_address"));
					a.setAccContact(rset.getString("acc_contact"));
					a.setAccRank(rset.getString("acc_rank"));
					a.setAccImagePath(rset.getString("acc_image_path"));
					a.setAccRules(rset.getString("acc_rules"));
					a.setAccLocationInfo(rset.getString("acc_locationinfo"));
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
				accom.setAccType(rset.getString("acc_type"));
				accom.setAccAddress(rset.getString("acc_address"));
				accom.setAccContact(rset.getString("acc_contact"));
				accom.setAccRank(rset.getString("acc_rank"));
				accom.setAccImagePath(rset.getString("acc_image_path"));
				accom.setAccRules(rset.getString("acc_rules"));
				accom.setAccLocationInfo(rset.getString("acc_locationinfo"));
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
		
		String query = null;
		
		try {
			//
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
		
		String query = null;
		
		try {
			//
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
		
		String query = null;
		
		try {
			//
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
		
		String query = null;
		
		try {
			//
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
}
