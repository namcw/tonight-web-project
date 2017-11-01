package tour.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class TourPopularity implements Serializable{
	
	int revTid;
	String userId;
	int tourId;
	Date revTourDate;
	String revTourState;
	int revTourAdult;
	int tourChild;
	int totalTourPrice;
	String revTourEvent;
	
	public TourPopularity(){}
	
	
	public TourPopularity(int revTid, String userId, int tourId, Date revTourDate, String revTourState,
			int revTourAdult, int tourChild, int totalTourPrice, String revTourEvent) {
		super();
		this.revTid = revTid;
		this.userId = userId;
		this.tourId = tourId;
		this.revTourDate = revTourDate;
		this.revTourState = revTourState;
		this.revTourAdult = revTourAdult;
		this.tourChild = tourChild;
		this.totalTourPrice = totalTourPrice;
		this.revTourEvent = revTourEvent;
	}


	
	public TourPopularity(Date revTourDate) {
		super();
		this.revTourDate = revTourDate;
	}


	public int getRevTid() {
		return revTid;
	}


	public void setRevTid(int revTid) {
		this.revTid = revTid;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getTourId() {
		return tourId;
	}


	public void setTourId(int tourId) {
		this.tourId = tourId;
	}


	public Date getRevTourDate() {
		return revTourDate;
	}


	public void setRevTourDate(Date revTourDate) {
		this.revTourDate = revTourDate;
	}


	public String getRevTourState() {
		return revTourState;
	}


	public void setRevTourState(String revTourState) {
		this.revTourState = revTourState;
	}


	public int getRevTourAdult() {
		return revTourAdult;
	}


	public void setRevTourAdult(int revTourAdult) {
		this.revTourAdult = revTourAdult;
	}


	public int getTourChild() {
		return tourChild;
	}


	public void setTourChild(int tourChild) {
		this.tourChild = tourChild;
	}


	public int getTotalTourPrice() {
		return totalTourPrice;
	}


	public void setTotalTourPrice(int totalTourPrice) {
		this.totalTourPrice = totalTourPrice;
	}


	public String getRevTourEvent() {
		return revTourEvent;
	}


	public void setRevTourEvent(String revTourEvent) {
		this.revTourEvent = revTourEvent;
	}

	
}
