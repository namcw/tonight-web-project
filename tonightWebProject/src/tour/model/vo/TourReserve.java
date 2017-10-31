package tour.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class TourReserve implements Serializable {

	private static final long serialVersionUID = -3774861802165898254L;
	
	private int trId;
	private String memberId;
	private int tourId;
	private Date trSdate;
	private Date trAdate;
	private int trAdult;
	private int trChild;
	private int trTprice;
	
	public TourReserve() {}

	public TourReserve(int trId, String memberId, int tourId, Date trSdate, 
			Date trAdate, int trAdult, int trChild, int trTprice) {
		super();
		this.trId = trId;
		this.memberId = memberId;
		this.tourId = tourId;
		this.trSdate = trSdate;
		this.trAdate = trAdate;
		this.trAdult = trAdult;
		this.trChild = trChild;
		this.trTprice = trTprice;
	}

	public int getTrId() {
		return trId;
	}

	public void setTrId(int trId) {
		this.trId = trId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getTourId() {
		return tourId;
	}

	public void setTourId(int tourId) {
		this.tourId = tourId;
	}

	public Date getTrSdate() {
		return trSdate;
	}

	public void setTrSdate(Date trSdate) {
		this.trSdate = trSdate;
	}

	public Date getTrAdate() {
		return trAdate;
	}

	public void setTrAdate(Date trAdate) {
		this.trAdate = trAdate;
	}

	public int getTrAdult() {
		return trAdult;
	}

	public void setTrAdult(int trAdult) {
		this.trAdult = trAdult;
	}

	public int getTrChild() {
		return trChild;
	}

	public void setTrChild(int trChild) {
		this.trChild = trChild;
	}

	public int getTrTprice() {
		return trTprice;
	}

	public void setTrTprice(int trTprice) {
		this.trTprice = trTprice;
	}
	
	
	
}
