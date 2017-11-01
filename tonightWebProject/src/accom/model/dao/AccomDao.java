package accom.model.dao;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.*;


import accom.model.vo.Accommodation;

public class AccomDao {
	//珥� �닕�냼 由ъ뒪�듃 媛��닔 議고쉶�슜
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

	//�븳 �럹�씠吏��뿉 異쒕젰�븷 寃뚯떆湲� 紐⑸줉 議고쉶�슜
	public ArrayList<Accommodation> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Accommodation> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//currentPage �뿉 �빐�떦�릺�뒗 紐⑸줉留� 議고쉶
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

	public ArrayList<Accommodation> getAccomPopularity(Connection con) {
		ArrayList<Accommodation>apopul=null;
		
		Statement stmt=null;
		ResultSet rset=null;
		
		String sql="SELECT * "
				+ "FROM ACCOMMODATION RIGHT JOIN( SELECT ACC_ID, RANK() OVER(ORDER BY COUNT(ACC_ID)DESC) RANKING "
				+ "FROM RESERVE_ROOM "
				+ "WHERE REV_ROOM_DATE BETWEEN ADD_MONTHS(SYSDATE,-1) AND SYSDATE "
				+ "GROUP BY ACC_ID) USING(ACC_ID) "
				+ "ORDER BY RANKING";
		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(sql);
					System.out.println("rset 전");
			if(rset!=null){
				apopul=new ArrayList<Accommodation>();
				System.out.println("rset 후");
				while(rset.next()){
					Accommodation accom=new Accommodation();
					accom.setAccId(rset.getInt("ACC_ID"));
					accom.setBizId(rset.getString("BIZ_ID"));
					accom.setAccName(rset.getString("ACC_NAME"));
					accom.setAccType(rset.getString("ACC_TYPE"));
					accom.setAccAddress(rset.getString("ACC_ADDRESS"));
					accom.setAccContact(rset.getString("ACC_CONTACT"));
					accom.setAccRank(rset.getString("ACC_RANK"));
					accom.setAccImagePath(rset.getString("ACC_IMAGE_PATH"));
					accom.setAccRules(rset.getString("ACC_RULES"));
					accom.setAccLocationInfo(rset.getString("ACC_LOCATIONINFO"));
					accom.setFacilities(rset.getString("ACC_FACILITIES"));
					accom.setAccRefund(rset.getString("ACC_REFUND"));
					
					apopul.add(accom);
				
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
			
		}
		
		return apopul;
	}
}
