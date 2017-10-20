package faq.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import faq.model.dao.FaqDao;
import faq.model.vo.Faq;

public class FaqService {
public FaqService(){}
	
	public ArrayList<Faq> selectList(){
		Connection con = getConnection();
		ArrayList<Faq> list = new FaqDao().selectList(con);
		close(con);
		return list;
	}
	public HashMap<Integer, Faq> selectMap(){
		Connection con = getConnection();
		HashMap<Integer, Faq> map = new FaqDao().selectMap(con);
		close(con);
		return map;
	}
	public Faq selectFaq(int no) {
		Connection con = getConnection();
		Faq notice = new FaqDao().selectOne(con, no);
		close(con);
		return notice;
	}
	public void addReadCount(int no) {
		Connection con = getConnection();
		int result = new FaqDao().updateReadCount(con, no);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);		
	}
	public int insertFaq(Faq faq) {
		Connection con = getConnection();
		int result = new FaqDao().insertFaq(con, faq);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	public int deleteFaq(int no) {
		Connection con = getConnection();
		int result = new FaqDao().deleteFaq(con, no);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	public int updateFaq(Faq faq) {
		Connection con = getConnection();
		int result = new FaqDao().updateFaq(con, faq);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	public ArrayList<Faq> selectSearch(String keyword) {
		Connection con = getConnection();
		ArrayList<Faq> list = new FaqDao().selectTitleSearch(con, keyword);
		close(con);
		return list;
	}	
}