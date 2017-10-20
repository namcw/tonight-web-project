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
									 rset.getString("MEMBER_BIRTHDATE"),
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
	         
	         String query = "delete from MEMBER where member_id = ?";
	         
	         try {
	            pstmt = con.prepareStatement(query);
	            pstmt.setString(1, userId);
	            
	            result=pstmt.executeUpdate();
	            		
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
	         
	         String query = "insert into MEMBER values(?, ?, ?, ?, ?, ?, ?, ?, default)";
	         
	         try {
	            pstmt = con.prepareStatement(query);
	            pstmt.setString(1,  member.getMemberId());
	            pstmt.setString(2, member.getMemberPwd());
	            pstmt.setString(3, member.getMemberName());
	            pstmt.setString(4, member.getMemberType());
	            pstmt.setString(5, member.getBirthDate());
	            pstmt.setString(6, member.getPhone());
	            pstmt.setString(7, member.getEmail());
	            pstmt.setString(8, member.getAddress());
	            
	            result = pstmt.executeUpdate();
	            
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
	         
	         String query = "select * from MEMBER where member_id =?";
	         
	         try {
	            pstmt = con.prepareStatement(query);
	            pstmt.setString(1,  userId);
	            
	            rset = pstmt.executeQuery();
	            
	            if(rset.next()){
	               member = new Member();
	               
	               member.setMemberId(userId);
	               member.setMemberPwd(rset.getString("member_pwd"));
	               member.setMemberName(rset.getString("member_name"));
	               member.setMemberType(rset.getString("member_type"));
	               member.setBirthDate(rset.getString("member_birthdate"));
	               member.setPhone(rset.getString("member_phone"));
	               member.setEmail(rset.getString("member_email"));
	               member.setAddress(rset.getString("member_address"));
	               member.setRank(rset.getString("member_rank"));
	            }
	            
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
	         
	         String query = "update member set member_pwd =?,"
	               + " member_birth_date = ?, member_phone = ?, member_email =?, member_address =?"
	               + "where member_id =?";
	         
	         try {   
	            pstmt = con.prepareStatement(query);
	            pstmt.setString(1, member.getMemberPwd());
	            pstmt.setString(2, member.getBirthDate());
	            pstmt.setString(3, member.getPhone());
	            pstmt.setString(4, member.getEmail());
	            pstmt.setString(5, member.getAddress());
	            pstmt.setString(6, member.getMemberId());
	            
	            result = pstmt.executeUpdate();
	            
	         } catch (Exception e) {
	            e.printStackTrace();
	         }finally{
	            close(pstmt);
	         }
	         
	         return result;
	      }

}
