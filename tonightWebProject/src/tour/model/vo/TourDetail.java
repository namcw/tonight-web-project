package tour.model.vo;

import java.io.Serializable;

public class TourDetail implements Serializable {


	private static final long serialVersionUID = -4940555704456523343L;

	private int tourId;
	private String tourIntro;
	private String tourList;
	private String tourHistory;
	private String tourSchedule;
	private String tourOption;
	private String tourPolicy;
	
	public TourDetail() {}

	public TourDetail(int tourId, String tourIntro, String tourList, String tourHistory, String tourSchedule,
			String tourOption, String tourPolicy) {
		super();
		this.tourId = tourId;
		this.tourIntro = tourIntro;
		this.tourList = tourList;
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

	public String getTourIntro() {
		return tourIntro;
	}

	public void setTourIntro(String tourIntro) {
		this.tourIntro = tourIntro;
	}

	public String getTourList() {
		return tourList;
	}

	public void setTourList(String tourList) {
		this.tourList = tourList;
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

	@Override
	public String toString() {
		return "TourDetail [tourId=" + tourId + ", tourIntro=" + tourIntro + ", tourList=" + tourList + ", tourHistory="
				+ tourHistory + ", tourSchedule=" + tourSchedule + ", tourOption=" + tourOption + ", tourPolicy="
				+ tourPolicy + "]";
	}
	
	
}
