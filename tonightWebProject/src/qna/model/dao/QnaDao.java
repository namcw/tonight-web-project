package qna.model.dao;

import java.sql.*;
import java.util.*;

import faq.model.vo.Faq;

import static common.JDBCTemplate.*;

import qna.model.vo.Qna;

public class QnaDao {
	public QnaDao(){}
	
	public ArrayList<Qna> selectList(Connection con){
		ArrayList<Qna> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from qna order by qna_no desc";
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset != null){
				list = new ArrayList<Qna>();
				
				while(rset.next()){
					Qna q = new Qna();
					
					q.setQnaNo(rset.getInt("qna_no"));
					q.setQnaTitle(rset.getString("qna_title"));
					q.setWriterId(rset.getString("writer_id"));
					q.setQuestion(rset.getString("question"));
					q.setAnswer(rset.getString("answer"));
	
					list.add(q);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		return list;
	}

	public HashMap<Integer, Qna> selectMap(Connection con){
		HashMap<Integer, Qna> map = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from qna order by qna_no desc";
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset != null){
				map = new HashMap<Integer, Qna>();
				
				while(rset.next()){
					Qna q = new Qna();
					
					q.setQnaNo(rset.getInt("qna_no"));
					q.setQnaTitle(rset.getString("qna_title"));
					q.setWriterId(rset.getString("writer_id"));
					q.setQuestion(rset.getString("question"));
					q.setAnswer(rset.getString("answer"));
					
					map.put(q.getQnaNo(), q);
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
	public int updateReadCount(Connection con, int no){
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update qna set qna_read_count = qna_read_count + 1"
				+ "where qna_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,  no);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}
	public int insertQna(Connection con, Qna qna){
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into qna values "
				+ "((select max(qna_no) + 1 from qna), "
						+ "?, ?, ?, null, default)";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, qna.getQnaTitle());
			pstmt.setString(2, qna.getWriterId());
			pstmt.setString(3, qna.getQuestion());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	public int deleteQna(Connection con, int no){
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from qna where qna_no = ?";
		
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
	public int updateQna(Connection con, Qna qna){
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query ="update qna set qna_title = ?, writer_Id = ?, question = ? where qna_no = ?";
		System.out.println(qna);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, qna.getQnaTitle());
			pstmt.setString(2, qna.getWriterId());
			pstmt.setString(3, qna.getQuestion());
			pstmt.setInt(4,  qna.getQnaNo());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	public ArrayList<Qna> selectTitleSearch(Connection con, String keyword){
		ArrayList<Qna> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from qna "
				+ "where qna_title like ? order by faq_no desc";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			
			rset = pstmt.executeQuery();
			
			if(rset != null){
				list = new ArrayList<Qna>();
				
				while(rset.next()){
					Qna q = new Qna();
				
					q.setQnaNo(rset.getInt("qaq_no"));
					q.setQnaTitle(rset.getString("qna_title"));
					q.setWriterId(rset.getString("writer_id"));
					q.setQuestion(rset.getString("question"));
					q.setAnswer(rset.getString("answer"));
					
					list.add(q);
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

	public Qna selectOne(Connection con, int no) {
		Qna qna = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from qna where qna_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				qna = new Qna();
				
				qna.setQnaNo(rset.getInt("qna_no"));
				qna.setQnaTitle(rset.getString("qna_title"));
				qna.setWriterId(rset.getString("writer_id"));
				qna.setQuestion(rset.getString("question"));
				qna.setAnswer(rset.getString("answer"));
				qna.setqnaReadcount(rset.getInt("qna_read_count"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return qna;
	}

	public int getListCount(Connection con) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from qna";
		
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
}
