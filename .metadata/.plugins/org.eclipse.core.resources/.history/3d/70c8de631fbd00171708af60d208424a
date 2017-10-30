package accom.model.service;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

import accom.model.dao.RoomDao;
import accom.model.dao.RoomReviewDao;
import accom.model.vo.Room;
import accom.model.vo.RoomReview;

public class RoomService {
	//객실 전체 조회용
	public ArrayList<Room> selectList(int no) {
		Connection con = getConnection();
		ArrayList<Room> list = new RoomDao().selectList(con, no);
		close(con);
		return list;
	}
	
	//객실 삭제 처리용
	public int deleteRoom(int no) {
		Connection con = getConnection();
		int result = new RoomDao().deleteRoom(con, no);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;	
	}
	
/*	//객실 상세 조회용
	public Room selectRoom(String roomName) {
		Connection con = getConnection();
		Room room = new RoomDao().selectRoom(con, roomName);
		return room;
	}
	*/
	
	/*

	//객실 등록 처리용
	public int insertRoom(Room r) {
		Connection con = getConnection();
		int result = new RoomDao().insertRoom(con, r);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	
	//객실 수정 처리용
	public int updateRoom(Room r) {
		Connection con = getConnection();
		int result = new RoomDao().updateRoom(con, r);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

		//전체 게시글 갯수 조회용
		public int getListCount(){
			Connection con = getConnection();
			int listCount = new RoomDao().getListCount(con);
			close(con);
			return listCount;
		}

		//페이지별 목록 조회용
		public ArrayList<Room> selectList(int currentPage, int limit){
			Connection con = getConnection();
			ArrayList<Room> list = new RoomDao().selectList(con, currentPage, limit);
			close(con);
			return list;
		}

		
		//원글처리용
		public Room selectRoom(int rnum) {
			// TODO Auto-generated method stub
			return null;
		}
		
		
		//객실 후기 조회용
		public ArrayList<RoomReview> selectRoomReview(int no) {
			Connection con = getConnection();
			ArrayList<RoomReview> roomReview = new RoomReviewDao().selectReview(con, no);
			return roomReview;
		}
*/
}
