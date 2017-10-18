package member.model.dao;

import member.model.vo.Member;
import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

public class MemberDao {

		public MemberDao() {}
		
		public Member selectMember(Connection con, String memberId, String memberPwd) {
			Member member = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query = "SELECT * FROM MEMBER WHERE MEMBER_ID = ? AND MEMBER_PWD = ?";
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, memberId);
				pstmt.setString(2, memberPwd);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					member = new Member(memberId, memberPwd,
									 rset.getString("MEMBER_NAME"),
									 rset.getString("MEMBER_TYPE"),
									 rset.getString("MEMBER_BIRTH_DATE"),
									 rset.getString("MEMBER_PHONE"),
									 rset.getString("MEMBER_EMAIL"),
									 rset.getString("MEMBER_ADDRESS"),
									 rset.getString("MEMBER_RANK"));
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return member;
		}
		
		public int deleteMember(Connection con, String userId) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			// TODO
			
			try {
				// TODO
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
		public int insertMember(Connection con, Member member) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			// TODO
			
			try {
				// TODO
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
		public Member selectMember(Connection con, String userId) {
			Member member = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			// TODO
			
			try {
				// TODO
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return member;
		}

		public int updateMember(Connection con, Member member) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			// TODO
			
			try {	
				// TODO
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				close(pstmt);
			}
			
			return result;
		}

}
