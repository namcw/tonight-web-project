package accom.model.dao;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.*;

import accom.model.vo.AccomImage;
import accom.model.vo.AccomReview;
import accom.model.vo.Accommodation;
import tour.model.dao.TourDao;
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
		/*String query = "select * from ("
				+ "select rownum rnum, acc_id, biz_id, acc_name, acc_info, "
				+ "acc_type, acc_address, acc_contact, acc_rank, "
				+ "acc_oname, acc_rname, acc_rules, acc_facilities, acc_refund from "
				+ "(select * from accommodation order by acc_name asc)) "
				+ "where rnum >= ? and rnum <= ?";*/
		
		String query = "select * from (select row_number() OVER (ORDER BY acc_id DESC) IDX, "
				+ "acc_id, biz_id, acc_name, acc_info, acc_type, acc_address, "
				+ "acc_contact, acc_rank, acc_oname, acc_rname, acc_rules, "
				+ "acc_facilities, acc_refund from accommodation)"
				+ "where idx between ? and ?";
		
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
					a.setAccOname(rset.getString("acc_oname"));
					a.setAccRname(rset.getString("acc_rname"));
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
				accom.setAccOname(rset.getString("acc_oname"));
				accom.setAccRname(rset.getString("acc_rname"));
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
				+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, a.getAccId());
			pstmt.setString(2, a.getBizId());
			pstmt.setString(3, a.getAccName());
			pstmt.setString(4, a.getAccInfo());
			pstmt.setString(5, a.getAccType());
			pstmt.setString(6, a.getAccAddress());
			pstmt.setString(7, a.getAccContact());
			pstmt.setString(8, a.getAccRank());
			pstmt.setString(9, a.getAccOname());
			pstmt.setString(10, a.getAccRname());
			pstmt.setString(11, a.getAccRules());
			pstmt.setString(12, a.getFacilities());
			pstmt.setString(13, a.getAccRefund());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/*
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
	}*/

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

	public int insertTourImageList(Connection con, ArrayList<AccomImage> aimageList) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into accommodation_image values(?, ?, ?)";
		
		try {
			for(AccomImage aimage : aimageList) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, aimage.getImageRname());
				pstmt.setString(2, aimage.getImageOname());
				pstmt.setInt(3, aimage.getAccomId());
				
				result = pstmt.executeUpdate();
				if(result <= 0)
					break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertAccomReview(Connection con, AccomReview ar) {
	      int result = 0;
	      PreparedStatement pstmt = null;
	      
	      String query = "INSERT INTO ACCOM_REVIEW VALUES((SELECT MAX(AR_NO)+1 FROM ACCOM_REVIEW), ?, DEFAULT, ?, ?, ?, ?)";
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, ar.getArAccomId());
	         pstmt.setString(2, ar.getArWriterId());
	         pstmt.setString(3, ar.getArContent());
	         pstmt.setString(4, ar.getArContent());
	         pstmt.setDouble(5, ar.getArGrade());
	         
	         result = pstmt.executeUpdate();
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally{
	         close(pstmt);
	      }
	      return result;
	   }

	public ArrayList<AccomImage> selectAccomImageList(Connection con, int accomId) {
		ArrayList<AccomImage> aimageList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from accommodation_image where acc_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, accomId);
			rset = pstmt.executeQuery();
			
			if(rset != null) {
				aimageList = new ArrayList<AccomImage>();
				while(rset.next()) {
					AccomImage aimage = new AccomImage(
									rset.getString("IMAGE_RNAME"),
									rset.getString("IMAGE_ONAME"),
									accomId);
					
					aimageList.add(aimage);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return aimageList;
	}

	public ArrayList<Accommodation> selectTitleSearch(Connection con, String keyword, String asType) {
		ArrayList<Accommodation> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from accommodation "
				+ "where acc_name like ? and acc_type like ? order by acc_name asc";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, asType);
			
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
					a.setAccOname(rset.getString("acc_oname"));
					a.setAccRname(rset.getString("acc_rname"));
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

	public ArrayList<Integer> getAccomReviewCntList(Connection con) {
		ArrayList<Integer> arCntList = null;
		Statement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT NVL(aNUM, 0) aNUM FROM ACCOMMODATION " + 
				"LEFT JOIN (SELECT ar_accom_ID, COUNT(*) aNUM FROM ACCOM_REVIEW  GROUP BY ar_accom_id) " + 
				"ON (acc_ID = aR_accom_ID) ORDER BY acc_id";
		try {
			pstmt = con.createStatement();
			rset = pstmt.executeQuery(sql);
			
			if(rset != null) {
				arCntList = new ArrayList<Integer>();
				while(rset.next()) {
					arCntList.add(rset.getInt("aNUM"));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		return arCntList;
	}

	public ArrayList<Double> getTourReviewAvgList(Connection con) {
		ArrayList<Double> arAvgList = null;
		Statement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT ROUND(NVL(aAVG, 0),2) aAVG from accommodation "
				+ "LEFT JOIN (SELECT ar_accom_id, avg(ar_grade) aAVG " + 
				"FROM accom_review " + 
				"GROUP BY ar_accom_ID) ON (acc_ID = ar_accom_ID) " + 
				"ORDER BY acc_id";
		try {
			pstmt = con.createStatement();
			rset = pstmt.executeQuery(query);
			
			if(rset != null) {
				arAvgList = new ArrayList<Double>();
				while(rset.next()) {
					arAvgList.add(rset.getDouble("aAVG"));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		return arAvgList;
	}
	
	public ArrayList<Accommodation> getAccomPopularity(Connection con) {
		ArrayList<Accommodation>apopul=null;
		
		Statement stmt=null;
		ResultSet rset=null;
		
		String sql="SELECT * "
				+ "FROM (SELECT ACC_ID, BIZ_ID, ACC_NAME, ACC_INFO, ACC_TYPE, ACC_ADDRESS, ACC_CONTACT, ACC_RANK, ACC_ONAME, ACC_RNAME, ACC_RULES, ACC_FACILITIES, ACC_REFUND, NVL(CNT, 0) CCNT "
				+ "FROM ACCOMMODATION "
				+ "LEFT JOIN (SELECT AR_ACCOM_ID, COUNT(*) CNT FROM ACCOM_REVIEW GROUP BY AR_ACCOM_ID) "
				+ "ON (ACC_ID = AR_ACCOM_ID) "
				+ "ORDER BY CCNT DESC) "
				+ "WHERE ROWNUM < 4";
		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(sql);
			if(rset!=null){
				apopul=new ArrayList<Accommodation>();
				while(rset.next()){
					Accommodation accom=new Accommodation();
					accom.setAccId(rset.getInt("ACC_ID"));
					accom.setBizId(rset.getString("BIZ_ID"));
					accom.setAccName(rset.getString("ACC_NAME"));
					accom.setAccType(rset.getString("ACC_TYPE"));
					accom.setAccAddress(rset.getString("ACC_ADDRESS"));
					accom.setAccContact(rset.getString("ACC_CONTACT"));
					accom.setAccRank(rset.getString("ACC_RANK"));
					accom.setAccOname(rset.getString("ACC_ONAME"));
					accom.setAccRname(rset.getString("ACC_RNAME"));
					accom.setAccRules(rset.getString("ACC_RULES"));
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
