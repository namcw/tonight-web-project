package tour.model.vo;

import java.io.Serializable;

public class TourDetail implements Serializable {


	private static final long serialVersionUID = -4940555704456523343L;

	private int tourId;
	private String tourHistory;
	private String tourSchedule;
	private String tourOption;
	private String tourPolicy;
	
	public TourDetail() {}

	public TourDetail(int tourId, String tourHistory, String tourSchedule, String tourOption, String tourPolicy) {
		super();
		this.tourId = tourId;
		this.tourHistory = tourHistory;
		this.tourSchedule = tourSchedule;
		this.tourOption = tourOption;
		this.tourPolicy = tourPolicy;
	}

	public int getTourId() {
		return tourId;
	}

	public void setTourId(int tourId) {
		this.tourId = tourId;
	}

	public String getTourHistory() {
		return tourHistory;
	}

	public void setTourHistory(String tourHistory) {
		this.tourHistory = tourHistory;
	}

	public String getTourSchedule() {
		return tourSchedule;
	}

	public void setTourSchedule(String tourSchedule) {
		this.tourSchedule = tourSchedule;
	}

	public String getTourOption() {
		return tourOption;
	}

	public void setTourOption(String tourOption) {
		this.tourOption = tourOption;
	}

	public String getTourPolicy() {
		return tourPolicy;
	}

	public void setTourPolicy(String tourPolicy) {
		this.tourPolicy = tourPolicy;
	}
	
	
}
