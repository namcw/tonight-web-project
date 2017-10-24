package qna.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import qna.model.vo.Qna;
import qna.model.dao.QnaDao;


import static common.JDBCTemplate.*;

public class QnaService {
	public QnaService(){}
	
	public ArrayList<Qna> selectList(){
		Connection con = getConnection();
		ArrayList<Qna> list = new QnaDao().selectList(con);
		close(con);
		return list;
	}
	public HashMap<Integer, Qna> selectMap(){
		Connection con = getConnection();
		HashMap<Integer, Qna> map = new QnaDao().selectMap(con);
		close(con);
		return map;
	}
	public Qna selectQna(int no) {
		Connection con = getConnection();
		Qna qna = new QnaDao().selectOne(con, no);
		close(con);
		return qna;
	}
	public void addReadCount(int no) {
		Connection con = getConnection();
		int result = new QnaDao().updateReadCount(con, no);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);		
	}
	public int insertQna(Qna qna) {
		Connection con = getConnection();
		int result = new QnaDao().insertQna(con, qna);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	public int deleteQna(int no) {
		Connection con = getConnection();
		int result = new QnaDao().deleteQna(con, no);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	public int updateQna(Qna qna) {
		Connection con = getConnection();
		int result = new QnaDao().updateQna(con, qna);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	public ArrayList<Qna> selectSearch(String keyword) {
		Connection con = getConnection();
		ArrayList<Qna> list = new QnaDao().selectTitleSearch(con, keyword);
		close(con);
		return list;
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new QnaDao().getListCount(con);
		return listCount;
	}	
}
