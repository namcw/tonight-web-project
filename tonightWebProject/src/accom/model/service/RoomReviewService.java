package accom.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import accom.model.dao.RoomReviewDao;
import accom.model.vo.RoomReview;
import tour.model.dao.TourDao;
import tour.model.vo.TourReview;


public class RoomReviewService {

	//전체 게시글 갯수 조회용 ok
	public int getListCount(){
		Connection con = getConnection();
		int listCount = new RoomReviewDao().getListCount(con);
		close(con);
		return listCount;
	}

	//페이지별 목록 조회용 ok
	public ArrayList<RoomReview> selectList(int currentPage, int limit){
		Connection con = getConnection();
		ArrayList<RoomReview> list = new RoomReviewDao().selectList(con, currentPage, limit);
		close(con);
		return list;
	}

	
	//상세보기
	public RoomReview selectRoomReview(int rnum){
		Connection con = getConnection();
		RoomReview review = new RoomReviewDao().selectRoomReview(con, rnum);
		close(con);
		return review;
	}
	
	
		//원글 등록 처리용
		public int insertRoomReview(RoomReview b) {
			Connection con = getConnection();
			int result = new RoomReviewDao().insertReview(con, b);
			if(result > 0)
				commit(con);
			else
				rollback(con);
			close(con);
			return result;
		}

		//조회수 증가
		public void addReadCount(int rnum) {
			Connection con = getConnection();
			int result = new RoomReviewDao().addReadCount(con, rnum);
			if(result > 0)
				commit(con);
			else
				rollback(con);
			close(con);
			return;
		}
		

		//게시글삭제
		public int deleteRoomReview (int rnum) {
			Connection con = getConnection();
			int result = new RoomReviewDao().deleteReview(con, rnum);
			if(result > 0)
				commit(con);
			else
				rollback(con);
			close(con);
			return result;
		}



		
		//게시글 수정
		public int updateRoomReview(RoomReview b) {
			Connection con = getConnection();
			int result = new RoomReviewDao().updateReview(con, b);
			if(result > 0)
				commit(con);
			else
				rollback(con);
			close(con);
			return result;
		}

		
		
		
		
		
		//댓글순번
		public void updateReplySeq(RoomReview replyBoard) {
			Connection con = getConnection();
			int result = new RoomReviewDao().updateReplySeq(con, replyBoard);
			if(result > 0)
				commit(con);
			else
				rollback(con);
			close(con);		
		}
		
		
		
		//댓글
		public int insertReply(RoomReview originReview, RoomReview replyReview) {
			Connection con = getConnection();
			int result = new RoomReviewDao().insertReply(con, originReview, replyReview);
			if(result > 0)
				commit(con);
			else
				rollback(con);
			close(con);
			return result;
		}

		//댓글수정
		public int updateReply(RoomReview reply) {
			Connection con = getConnection();
			int result = new RoomReviewDao().updateReply(con, reply);
			if(result > 0)
				commit(con);
			else
				rollback(con);
			close(con);
			return result;
		}

		public ArrayList<RoomReview> selectRoomReviewList(int accomId) {
			Connection con = getConnection();
			ArrayList<RoomReview> rreviewList = new RoomReviewDao().getRoomReviewList(con, accomId);
			return rreviewList;
		}

		public double getRoomReviewGradeAvg(int accomId) {
			Connection con = getConnection();
			double rrGradeAvg = new RoomReviewDao().getRoomReviewGradeAvg(con, accomId);
			return rrGradeAvg;
		
		}

	
}
