package member.model.service;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import static common.JDBCTemplate.*;
import java.sql.*;

public class MemberService {
	public MemberService(){}
	
	public Member loginCheck(String memberId, String memberPwd){
		Connection con = getConnection();
		Member member = new MemberDao().selectMember(con, memberId, memberPwd);
		close(con);
		return member;
	}
	
	public int deleteMember(String userId) {
		Connection con = getConnection();
		int result = new MemberDao().deleteMember(con, userId);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		
		return result;
	}
	
	public int insertMember(Member member) {
		Connection con = getConnection();
		int result = new MemberDao().insertMember(con, member);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		
		return result;
	}

	public Member selectMember(String userId) {
		Connection con = getConnection();
		Member member = new MemberDao().selectMember(con, userId);
		close(con);
		return member;
	}

	public int updateMember(Member member) {
		Connection con = getConnection();
		int result = new MemberDao().updateMember(con, member);
		
		if(result > 0)
			commit(con);
		else
			rollback(con);
		
		close(con);
		
		return result;
	}
}


















