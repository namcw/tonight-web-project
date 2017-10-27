package accom.model.dao;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import accom.model.vo.RoomReview;


public class RoomReviewDao {
	
		// 총 게시글 갯수 조회!! 
		public int getListCount(Connection con) {
			int result = 0;
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select count(*) from review";
			
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
		
		
		
		
		// 한 페이지에 출력할 게시글 목록 조회용
		public ArrayList<RoomReview> selectList(Connection con, 
			int currentPage, int limit) {
		ArrayList<RoomReview> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		//currentPage 에 해당되는 목록만 조회
		String query ="select * from ("
				+ " select rownum rnum, REVIEW_NUM , REVIEW_TITLE , "
				+ " REVIEW_WRITER , REVIEW_CONTENT , REVIEW_ORIGINAL_FILENAME , "
				+ " REVIEW_RENAME_FILENAME , REVIEW_DATE , REVIEW_LEVEL , "
				+ " REVIEW_REF , REVIEW_REPLY_REF , REVIEW_REPLY_SEQ , "
				+ " REVIEW_READCOUNT  from (select * from REVIEW "
				+ " order by REVIEW_REF  desc, REVIEW_REPLY_REF  desc, "
				+ " REVIEW_LEVEL  asc, REVIEW_REPLY_SEQ  asc)) "
				+ " where rnum >= ? and rnum <= ?";
		
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			if(rset != null){
				list = new ArrayList<RoomReview>();
				
				while(rset.next()){
					RoomReview review = new RoomReview();
					review.setReviewNum(rset.getInt("REVIEW_NUM"));
					review.setReviewTitle(rset.getString("REVIEW_TITLE"));
					review.setReviewriter(rset.getString("REVIEW_WRITER"));
					review.setReviewContent(rset.getString("REVIEW_CONTENT"));
					review.setReviewDate(rset.getDate("REVIEW_DATE"));
					review.setReviewReadCount(rset.getInt("REVIEW_READCOUNT"));
					review.setReviewOriginalFileName(rset.getString("REVIEW_ORIGINAL_FILENAME"));
					review.setReviewRenameFileName(rset.getString("REVIEW_RENAME_FILENAME"));
					review.setReviewLevel(rset.getInt("REVIEW_LEVEL"));
					review.setReviewRef(rset.getInt("REVIEW_REF"));
					review.setReviewReplyRef(rset.getInt("REVIEW_REPLY_REF"));
					review.setReviewReplySeq(rset.getInt("REVIEW_REPLY_SEQ"));
					list.add(review);
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
		
		
		//객실리뷰 추가!!
		public int insertReview(Connection con, RoomReview review) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String query = "insert into review values ("
					+ "(select max(REVIEW_NUM ) + 1 from review), "
					+ "?, ?, ?, ?, ?, sysdate, default, 0, "
					+ "(select max(REVIEW_NUM ) + 1 from review), NULL, "
					+ "default)";
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, review.getReviewTitle());
				pstmt.setString(2, review.getReviewriter());
				pstmt.setString(3, review.getReviewContent());
				pstmt.setString(4, review.getReviewOriginalFileName());
				pstmt.setString(5, review.getReviewRenameFileName());
				
				result = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				close(pstmt);
			}
			
			return result;
		}
		
		
		
		public int addReadCount(Connection con, int rnum) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String query = "update review set "
					+ "REVIEW_READCOUNT  = REVIEW_READCOUNT  + 1 "
					+ "where REVIEW_NUM  = ?";
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, rnum);
				
				result = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				close(pstmt);
			}
			
			return result;
		}
		
		
		public RoomReview selectRoomReview(Connection con, int rnum) {
			RoomReview review = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query = "select * from review where REVIEW_NUM = ?";
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, rnum);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()){
					review = new RoomReview();
					
					review.setReviewNum(rset.getInt("REVIEW_NUM"));
					review.setReviewTitle(rset.getString("REVIEW_TITLE"));
					review.setReviewriter(rset.getString("REVIEW_WRITER"));
					review.setReviewContent(rset.getString("REVIEW_CONTENT"));
					review.setReviewDate(rset.getDate("REVIEW_DATE"));
					review.setReviewReadCount(rset.getInt("REVIEW_READCOUNT"));
					review.setReviewOriginalFileName(rset.getString("REVIEW_ORIGINAL_FILENAME"));
					review.setReviewRenameFileName(rset.getString("REVIEW_RENAME_FILENAME"));
					review.setReviewLevel(rset.getInt("REVIEW_LEVEL"));
					review.setReviewRef(rset.getInt("REVIEW_REF"));
					review.setReviewReplyRef(rset.getInt("REVIEW_REPLY_REF"));
					review.setReviewReplySeq(rset.getInt("REVIEW_REPLY_SEQ"));
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				close(rset);
				close(pstmt);
			}
			
			return review;
		}
		
		
				//게시글 삭제!!
				public int deleteReview(Connection con, int rnum) {
					int result = 0;
					PreparedStatement pstmt = null;
					
					String query = "delete from REVIEW where REVIEW_NUM = ?";
					
					try {
						pstmt = con.prepareStatement(query);
						pstmt.setInt(1, rnum);
						
						result = pstmt.executeUpdate();
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally{
						close(pstmt);
					}
					
					return result;
				}

		
				public int updateReplySeq(Connection con, RoomReview replyReview) {
					int result = 0;
					PreparedStatement pstmt = null;
					
					String query = "update REVIEW set "
							+ "REVIEW_REPLY_SEQ  = REVIEW_REPLY_SEQ  + 1 "
							+ "where REVIEW_REPLY_REF  = ? and REVIEW_LEVEL  = ? "
							+ "and REVIEW_REPLY_SEQ  = ?";
					
					try {
						pstmt = con.prepareStatement(query);
						pstmt.setInt(1, replyReview.getReviewRef());
						pstmt.setInt(2, replyReview.getReviewLevel());
						pstmt.setInt(3, replyReview.getReviewReplyRef());
						
						result = pstmt.executeUpdate();
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally{
						close(pstmt);
					}
					
					return result;
				}


		
		
		
			
				public int insertReply(Connection con, RoomReview originReview, RoomReview replyReview) {
					int result = 0;
					PreparedStatement pstmt = null;
					
					String query = null;
					
					//원글의 댓글일 때
					if(replyReview.getReviewLevel() == 1){
						query = "insert into review values ("
								+ "(select max(REVIEW_NUM) + 1 from review), "
								+ "?, ?, ?, null, null, sysdate, default, ?, ?, "
								+ "(select max(REVIEW_NUM) + 1 from review), "
								+ "1)";
					}
					
					//댓글의 댓글일 때
					if(replyReview.getReviewLevel() == 2){
						query = "insert into review values ("
								+ "(select max(REVIEW_NUM) + 1 from review), "
								+ "?, ?, ?, null, null, sysdate, default, ?, ?, ?, "
								+ "1)";
					}
					
					try {
						pstmt = con.prepareStatement(query);
						pstmt.setString(1, replyReview.getReviewTitle());
						pstmt.setString(2, replyReview.getReviewriter());
						pstmt.setString(3, replyReview.getReviewContent());
						pstmt.setInt(4, replyReview.getReviewLevel());
						pstmt.setInt(5, replyReview.getReviewRef());
						
						if(replyReview.getReviewLevel() == 2)
							pstmt.setInt(6, replyReview.getReviewReplyRef());
						
						result = pstmt.executeUpdate();
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally{
						close(pstmt);
					}
					
					return result;
				}

	



				public int updateReply(Connection con, RoomReview reply) {
					int result = 0;
					PreparedStatement pstmt = null;
					
					String query = "update REVIEW set REVIEW_TITLE = ?, "
							+ "REVIEW_CONTENT = ? where REVIEW_NUM = ?";
					
					try {
						pstmt = con.prepareStatement(query);
						pstmt.setString(1, reply.getReviewTitle());
						pstmt.setString(2, reply.getReviewContent());
						pstmt.setInt(3, reply.getReviewNum());
						
						result = pstmt.executeUpdate();
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally{
						close(pstmt);
					}
					
					return result;
				}
				

				//리뷰 수정!!
				public int updateReview(Connection con, RoomReview review) {
					int result = 0;
					PreparedStatement pstmt = null;
					
					String query = "update review set REVIEW_TITLE  = ?, "
							+ "REVIEW_CONTENT  = ?, "
							+ "REVIEW_ORIGINAL_FILENAME  = ?, "
							+ "REVIEW_RENAME_FILENAME  = ? "
							+ "where REVIEW_NUM  = ?";
					
					try {
						pstmt = con.prepareStatement(query);
						pstmt.setString(1, review.getReviewTitle());
						pstmt.setString(2, review.getReviewContent());
						pstmt.setString(3, review.getReviewOriginalFileName());
						pstmt.setString(4, review.getReviewRenameFileName());
						pstmt.setInt(5, review.getReviewNum());
						
						result = pstmt.executeUpdate();
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally{
						close(pstmt);
					}
					
					return result;
				}
				
		
		
				
				
				
}

