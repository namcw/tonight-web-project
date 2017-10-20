package tour.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class TourConf implements Serializable {


	private static final long serialVersionUID = -1382502575161354944L;

	private int tourId;
	private Date startDate;
	private Date arriavlaDate;
	private int tourAdultPrice;
	private int tourChildPrice;
	private double tourDiscount;
	private String tourState;
	
	public TourConf() {}

	public TourConf(int tourId, Date startDate, Date arriavlaDate, int tourAdultPrice, int tourChildPrice,
			double tourDiscount, String tourState) {
		super();
		this.tourId = tourId;
		this.startDate = startDate;
		this.arriavlaDate = arriavlaDate;
		this.tourAdultPrice = tourAdultPrice;
		this.tourChildPrice = tourChildPrice;
		this.tourDiscount = tourDiscount;
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

	public Date getArriavlaDate() {
		return arriavlaDate;
	}

	public void setArriavlaDate(Date arriavlaDate) {
		this.arriavlaDate = arriavlaDate;
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

	public double getTourDiscount() {
		return tourDiscount;
	}

	public void setTourDiscount(double tourDiscount) {
		this.tourDiscount = tourDiscount;
	}

	public String getTourState() {
		return tourState;
	}

	public void setTourState(String tourState) {
		this.tourState = tourState;
	}
	
}
