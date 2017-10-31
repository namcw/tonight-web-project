package tour.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class TourConf implements Serializable {


	private static final long serialVersionUID = -1382502575161354944L;

	private int tourId;
	private Date startDate;
	private Date arrivalDate;
	private int tourAdultPrice;
	private int tourChildPrice;
	private String tourState;
	
	public TourConf() {}

	public TourConf(int tourId, Date startDate, Date arrivalDate, int tourAdultPrice,
				int tourChildPrice, String tourState) {
		super();
		this.tourId = tourId;
		this.startDate = startDate;
		this.arrivalDate = arrivalDate;
		this.tourAdultPrice = tourAdultPrice;
		this.tourChildPrice = tourChildPrice;
		this.tourState = tourState;
	}

	public int getTourId() {
		return tourId;
	}

	public void setTourId(int tourId) {
		this.tourId = tourId;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getArrivalDate() {
		return arrivalDate;
	}

	public void setArrivalDate(Date arrivalDate) {
		this.arrivalDate = arrivalDate;
	}

	public int getTourAdultPrice() {
		return tourAdultPrice;
	}

	public void setTourAdultPrice(int tourAdultPrice) {
		this.tourAdultPrice = tourAdultPrice;
	}

	public int getTourChildPrice() {
		return tourChildPrice;
	}

	public void setTourChildPrice(int tourChildPrice) {
		this.tourChildPrice = tourChildPrice;
	}

	public String getTourState() {
		return tourState;
	}

	public void setTourState(String tourState) {
		this.tourState = tourState;
	}

	@Override
	public String toString() {
		return "TourConf [tourId=" + tourId + ", startDate=" + startDate + ", arrivalDate=" + arrivalDate
				+ ", tourAdultPrice=" + tourAdultPrice + ", tourChildPrice=" + tourChildPrice + ", tourState="
				+ tourState + "]";
	}

	
}
