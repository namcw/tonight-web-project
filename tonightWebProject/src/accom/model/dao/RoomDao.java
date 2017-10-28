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
				+ "?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, r.getAccId()); 
			pstmt.setString(2, r.getRoomName());
			pstmt.setString(3, r.getRoomState());
			pstmt.setInt(4, r.getAdult_Price());
			pstmt.setInt(5, r.getChild_Price());
			pstmt.setDouble(6, r.getDiscount());
			pstmt.setString(7, r.getRoomImage());
			pstmt.setString(8, r.getRoomDetails());
			
			
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
	
	

	
	
	
	
	}
	
