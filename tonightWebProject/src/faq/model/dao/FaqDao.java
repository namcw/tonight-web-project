package faq.model.dao;

import static common.JDBCTemplate.close;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

import faq.model.vo.Faq;

public class FaqDao {

	public FaqDao(){}
	
	public ArrayList<Faq> selectList(Connection con, int currentPage, int limit){
		ArrayList<Faq> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from (select rownum rnum, faq_no, faq_category, FAQ_TITLE, FAQ_ANSWER, FAQ_READ_COUNT FROM (SELECT * FROM FAQ ORDER BY FAQ_NO DESC)) WHERE rnum >=? AND rnum <= ?";
		
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			if(rset != null){
				list = new ArrayList<Faq>();
				
				while(rset.next()){
					Faq f = new Faq();
					
					f.setFaqNo(rset.getInt("faq_no"));
					f.setFaqTitle(rset.getString("faq_title"));
					f.setFaqCategory(rset.getString("faq_category"));
					f.setFaqAnswer(rset.getString("faq_answer"));
					f.setFaqReadCount(rset.getInt("faq_read_count"));
	
					list.add(f);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public HashMap<Integer, Faq> selectMap(Connection con){
		HashMap<Integer, Faq> map = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from faq order by faq_no desc";
		try {
			stmt =  con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset != null){
				map = new HashMap<Integer, Faq>();
				
				while(rset.next()){
					Faq f = new Faq();
					
					f.setFaqNo(rset.getInt("faq_no"));
					f.setFaqTitle(rset.getString("faq_title"));
					f.setFaqCategory(rset.getString("faq_category"));
					f.setFaqAnswer(rset.getString("faq_answer"));
					
					map.put(f.getFaqNo(), f);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		return null;
	}

	public int insertFaq(Connection con, Faq faq){
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into faq values "
				+ "((select max(faq_no) + 1 from faq), "
				+ "?, ?, ?, default)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, faq.getFaqCategory());
			pstmt.setString(2, faq.getFaqTitle());
			pstmt.setString(3, faq.getFaqAnswer());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	public int deleteFaq(Connection con, int no){
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from faq where faq_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}
	public int updateFaq(Connection con, Faq faq){
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update faq set faq_title = ?, "
				+ "faq_category = ?, faq_answer = ? where faq_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, faq.getFaqTitle());
			pstmt.setString(2, faq.getFaqCategory());
			pstmt.setString(3, faq.getFaqAnswer());
			pstmt.setInt(4, faq.getFaqNo());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	

	public Faq selectOne(Connection con, int no) {
		Faq faq = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from faq where faq_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				faq = new Faq();
				
				faq.setFaqNo(rset.getInt("faq_no"));
				faq.setFaqCategory(rset.getString("faq_category"));
				faq.setFaqTitle(rset.getString("faq_title"));
				faq.setFaqAnswer(rset.getString("faq_answer"));
				faq.setFaqReadCount(rset.getInt("faq_read_count"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return faq;
	}

	public int getListCount(Connection con) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from faq";
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next())
				result = rset.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return result;
	}
	
	public ArrayList<Faq> selectSearch(Connection con, String keyword){
		ArrayList<Faq> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from faq "
				+ "where faq_category like ? order by faq_no desc";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			
			rset = pstmt.executeQuery();
			
			if(rset != null){
				list = new ArrayList<Faq>();
				
				while(rset.next()){
					Faq f = new Faq();
				
					f.setFaqNo(rset.getInt("faq_no"));
					f.setFaqCategory(rset.getString("faq_category"));
					f.setFaqTitle(rset.getString("faq_title"));
					f.setFaqAnswer(rset.getString("faq_answer"));
					f.setFaqReadCount(rset.getInt("faq_read_count"));
					
					list.add(f);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}
	

}