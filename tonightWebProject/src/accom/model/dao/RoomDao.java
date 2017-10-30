package accom.model.dao;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

import accom.model.vo.Room;


public class RoomDao {
	
	//숙소에 맞는 객실리스트 조회
	public ArrayList<Room> selectList(Connection con, int no) {
		ArrayList<Room> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from room where acc_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset != null){
				list = new ArrayList<Room>();
				
				while(rset.next()){
					Room r = new Room();
					
					r.setRoomId(rset.getInt("room_id"));
					r.setAccId(rset.getInt("acc_id"));
					r.setRoomName(rset.getString("room_name"));
					r.setRoomState(rset.getString("room_state"));
					r.setAdult_Price(rset.getInt("room_adult_price"));
					r.setChild_Price(rset.getInt("room_child_price"));
					r.setDiscount(rset.getDouble("room_discount"));
					r.setRoomImage(rset.getString("room_image_path"));
					r.setRoomDetails(rset.getString("room_details"));
					
					list.add(r);
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

	public int deleteRoom(Connection con, int no) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from room where acc_id = ?";
		
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

	public int insertRoom(Connection con, Room r) {
		int result = 0;
		PreparedStatement pstmt = null;
	
		String query = "insert into room values ("
				+ "(select max(ROOM_ID) + 1 from room), "
				+ "2,?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
		/*	pstmt.setInt(1, r.getAccId(accid)); */
			pstmt.setString(1, r.getRoomName());
			pstmt.setString(2, r.getRoomState());
			pstmt.setInt(3, r.getAdult_Price());
			pstmt.setInt(4, r.getChild_Price());
			pstmt.setDouble(5, r.getDiscount());
			pstmt.setString(6, r.getRoomImage());
			pstmt.setString(7, r.getRoomDetails());
			
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
/*
	//객실(room)하나 상세조회!!  db만들기
	public Room selectRoom(Connection con, String roomName) {
		Room room = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
	
		
	String query = "select * from board where room_name = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, roomName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				room = new Room();
				
				room.setAdult_Price(rset.getInt("ROOM_ADULT_PRICE"));
				room.setChild_Price(rset.getInt("ROOM_CHILD_PRICE"));
				room.setDiscount(rset.getDouble("ROOM_DISCOUNT"));
				room.setRoomDetails(rset.getString("ROOM_DETAILS"));
				room.setRoomState(rset.getString("ROOM_STATE"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return room;
	}
	*/
	
	
/*	// 총 게시글 갯수 조회!!
	public int getListCount(Connection con) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from RoomReview";
		
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
	*/
	
	/*//객실리뷰 추가!!
	public int insertReview(Connection con, RoomReview rr) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into board values ("
				+ "(select max(board_num) + 1 from board), "
				+ "?, ?, ?, ?, ?, sysdate, default, 0, "
				+ "(select max(board_num) + 1 from board), NULL, "
				+ "default)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, rr.getBoardTitle());
			pstmt.setString(2, rr.getBoardWriter());
			pstmt.setString(3, rr.getBoardContent());
			pstmt.setString(4, rr.getBoardOriginalFileName());
			pstmt.setString(5, rr.getBoardRenameFileName());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int updateRoom(Connection con, RoomReview rr) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update board set board_title = ?, "
				+ "board_content = ?, "
				+ "board_original_filename = ?, "
				+ "board_rename_filename = ? "
				+ "where board_num = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, rr.getBoardTitle());
			pstmt.setString(2, rr.getBoardContent());
			pstmt.setString(3, rr.getBoardOriginalFileName());
			pstmt.setString(4, rr.getBoardRenameFileName());
			pstmt.setInt(5, rr.getBoardNum());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	//객실리뷰 삭제!!
	public int deleteReview(Connection con, int rnum) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from roomreview where review_num = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, result);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}


	//객실리뷰!!
	public ArrayList<RoomReview> selectList(Connection con, 
			int currentPage, int limit) {
		// 한 페이지에 출력할 게시글 목록 조회용
		ArrayList<RoomReview> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//currentPage 에 해당되는 목록만 조회
		String query ="select * from ("
				+ "select rownum rnum, REVIEW_NUM, REVIEW_TITLE, "
				+ "REVIEW_WRITER, REVIEW_CONTENT, REVIEW_ORIGINAL_FILENAME, "
				+ "REVIEW_RENAME_FILENAME, REVIEW_DATE, REVIEW_LEVEL, "
				+ "REVIEW_REF, REVIEW_REPLY_REF, REVIEW_REPLY_SEQ, "
				+ "REVIEW_READCOUNT from (select * from REVIEW "
				+ "order by REVIEW_REF desc, REVIEW_REPLY_REF desc, "
				+ "REVIEW_LEVEL asc, REVIEW_REPLY_SEQ asc)) "
				+ "where rnum >= ? and rnum <= ?";
		
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
				
					
					review.setReviewNum(rset.getInt("board_num"));
					review.setReviewTitle(rset.getString("board_title"));
					review.setReviewriter(rset.getString("board_writer"));
					review.setReviewContent(rset.getString("board_content"));
					review.setReviewDate(rset.getDate("board_date"));
					review.setReviewReadCount(rset.getInt("board_readcount"));
					review.setReviewOriginalFileName(rset.getString("board_original_filename"));
					review.setReviewRenameFileName(rset.getString("board_rename_filename"));
					review.setReviewLevel(rset.getInt("board_level"));
					review.setReviewRef(rset.getInt("board_ref"));
					review.setReviewReplyRef(rset.getInt("board_reply_ref"));
					review.setReviewReplySeq(rset.getInt("board_reply_seq"));
					
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
*/
	
	
/*	//객실리뷰!! db수정
	public ArrayList<RoomReview> selectReview(Connection con, int no) {
		ArrayList<RoomReview> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from TOUR_REVIEW order by TR_NO desc";
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset != null){
				list = new ArrayList<RoomReview>();
				
				while(rset.next()){
					RoomReview Review = new RoomReview();
					
					Review.setTrNo(rset.getInt("TR_NO"));
					Review.setTrTourId(rset.getInt("TR_TOUR_ID"));
					Review.setTrDate(rset.getDate("TR_DATE"));
					Review.setTrWriterId(rset.getString("TR_WRITER_ID"));
					Review.setTrTitle(rset.getString("TR_TITLE"));
					Review.setTrContent(rset.getString("TR_CONTENT"));
					Review.setTrGrade(rset.getString("TR_GRADE"));
					
					list.add(Review);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}*/

	
	
	}
	
