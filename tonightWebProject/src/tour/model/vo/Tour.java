package tour.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Tour implements Serializable {


	private static final long serialVersionUID = 3044051553377637868L;

	private int tourId;
	private String tourTitle;
	private String guideId;
	private String tourState;
	private Date startDate;
	private Date arrivalDate;
	private int tourAdultPrice;
	private int tourChildPrice;
	private double tourDiscount;
	private String tourThumnail;
	private String tourDetail;
	
	public Tour() {}

	public Tour(int tourId, String tourTitle, String guideId, String tourState, Date startDate, Date arrivalDate,
			int tourAdultPrice, int tourChildPrice, double tourDiscount, String tourThumnail, String tourDetail) {
		super();
		this.tourId = tourId;
		this.tourTitle = tourTitle;
		this.guideId = guideId;
		this.tourState = tourState;
		this.startDate = startDate;
		this.arrivalDate = arrivalDate;
		this.tourAdultPrice = tourAdultPrice;
		this.tourChildPrice = tourChildPrice;
		this.tourDiscount = tourDiscount;
		this.tourThumnail = tourThumnail;
		this.tourDetail = tourDetail;
	}

	public int getTourId() {
		return tourId;
	}

	public void setTourId(int tourId) {
		this.tourId = tourId;
	}

	public String getTourTitle() {
		return tourTitle;
	}

	public void setTourTitle(String tourTitle) {
		this.tourTitle = tourTitle;
	}

	public String getGuideId() {
		return guideId;
	}

	public void setGuideId(String guideId) {
		this.guideId = guideId;
	}

	public String getTourState() {
		return tourState;
	}

	public void setTourState(String tourState) {
		this.tourState = tourState;
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

	public double getTourDiscount() {
		return tourDiscount;
	}

	public void setTourDiscount(double tourDiscount) {
		this.tourDiscount = tourDiscount;
	}

	public String getTourThumnail() {
		return tourThumnail;
	}

	public void setTourThumnail(String tourThumnail) {
		this.tourThumnail = tourThumnail;
	}

	public String getTourDetail() {
		return tourDetail;
	}

	public void setTourDetail(String tourDetail) {
		this.tourDetail = tourDetail;
	}
	
}
