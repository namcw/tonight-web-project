package accom.model.service;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.*;
import accom.model.vo.Accommodation;
import accom.model.dao.AccomDao;

public class AccomService {
	public AccomService() {}
	
	//�쟾�젣 寃뚯떆湲� 媛��닔 議고쉶�슜
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new AccomDao().getListCount(con);
		close(con);
		return listCount;
	}
	
	//�럹�씠吏�蹂� 紐⑸줉 議고쉶�슜
	public ArrayList<Accommodation> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Accommodation> list = new AccomDao().selectList(con, currentPage, limit);
		close(con);
		return list;
	}
	
	//�닕�냼 �긽�꽭 議고쉶�슜
	public Accommodation selectAccom(int no) {
		Connection con = getConnection();
		Accommodation accom = new AccomDao().selectAccom(con, no);
		return accom;
	}
	
	//�닕�냼 �벑濡� 泥섎━�슜
	public int insertAccom(Accommodation a) {
		Connection con = getConnection();
		int result = new AccomDao().insertAccom(con, a);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	//�닕�냼 �닔�젙 泥섎━�슜
	public int updateAccom(Accommodation a) {
		Connection con = getConnection();
		int result = new AccomDao().updateAccom(con, a);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	
	//�닕�냼 �궘�젣 泥섎━�슜
	public int deleteAccom(int no) {
		Connection con = getConnection();
		int result = new AccomDao().deleteAccom(con, no);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	//�닕�냼 寃��깋 泥섎━�슜
	public ArrayList<Accommodation> selectSearch(String keyword) {
		Connection con =getConnection();
		ArrayList<Accommodation> list = new AccomDao().selectTitleSearch(con, keyword);
		close(con);
		return list;
	}

	public ArrayList<Accommodation> accomPopularity() {
		Connection con=getConnection();
		ArrayList<Accommodation> apopul=new AccomDao().getAccomPopularity(con);
		close(con);
		return apopul;
	}
}
