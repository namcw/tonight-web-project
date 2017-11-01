package accom.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AccomPopularity implements Serializable{
	
	int revRid;
	String memberId;
	int accId;
	int roomId;
	Date checkIn;
	Date checkOut;
	Date revRoomDate;
	String revRoomState;
	int revRoomAdult;
	int revRoomChild;
	int totalRoomPrice;
	String roomEvent;
	
	public AccomPopularity(){}
	
	
	public AccomPopularity(int revRid, String memberId, int accId, int roomId, Date checkIn, Date checkOut,
			Date revRoomDate, String revRoomState, int revRoomAdult, int revRoomChild, int totalRoomPrice,
			String roomEvent) {
		super();
		this.revRid = revRid;
		this.memberId = memberId;
		this.accId = accId;
		this.roomId = roomId;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.revRoomDate = revRoomDate;
		this.revRoomState = revRoomState;
		this.revRoomAdult = revRoomAdult;
		this.revRoomChild = revRoomChild;
		this.totalRoomPrice = totalRoomPrice;
		this.roomEvent = roomEvent;
	}

	
	

	public AccomPopularity(int accId) {
		super();
		this.accId = accId;
	}


	public int getRevRid() {
		return revRid;
	}


	public void setRevRid(int revRid) {
		this.revRid = revRid;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public int getAccId() {
		return accId;
	}


	public void setAccId(int accId) {
		this.accId = accId;
	}


	public int getRoomId() {
		return roomId;
	}


	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}


	public Date getCheckIn() {
		return checkIn;
	}


	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}


	public Date getCheckOut() {
		return checkOut;
	}


	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}


	public Date getRevRoomDate() {
		return revRoomDate;
	}


	public void setRevRoomDate(Date revRoomDate) {
		this.revRoomDate = revRoomDate;
	}


	public String getRevRoomState() {
		return revRoomState;
	}


	public void setRevRoomState(String revRoomState) {
		this.revRoomState = revRoomState;
	}


	public int getRevRoomAdult() {
		return revRoomAdult;
	}


	public void setRevRoomAdult(int revRoomAdult) {
		this.revRoomAdult = revRoomAdult;
	}


	public int getRevRoomChild() {
		return revRoomChild;
	}


	public void setRevRoomChild(int revRoomChild) {
		this.revRoomChild = revRoomChild;
	}


	public int getTotalRoomPrice() {
		return totalRoomPrice;
	}


	public void setTotalRoomPrice(int totalRoomPrice) {
		this.totalRoomPrice = totalRoomPrice;
	}


	public String getRoomEvent() {
		return roomEvent;
	}


	public void setRoomEvent(String roomEvent) {
		this.roomEvent = roomEvent;
	}

	
	
	   
	
	
}
