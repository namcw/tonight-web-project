package tour.model.vo;

import java.io.Serializable;

public class TourDetail implements Serializable {


	private static final long serialVersionUID = -4940555704456523343L;

	private int tourId;
	private String tourInfo;
	private String tourGuideMent;
	private String tourMeetingPlace;
	private String tourList;
	private String tourHistory;
	private String tourSchedule;
	private String tourOption;
	private String tourPolicy;
	
	public TourDetail() {}

	public TourDetail(int tourId, String tourInfo, String tourGuideMent, String tourMeetingPlace, String tourList,
			String tourHistory, String tourSchedule, String tourOption, String tourPolicy) {
		super();
		this.tourId = tourId;
		this.tourInfo = tourInfo;
		this.tourGuideMent = tourGuideMent;
		this.tourMeetingPlace = tourMeetingPlace;
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

	public String getTourInfo() {
		return tourInfo;
	}

	public void setTourInfo(String tourInfo) {
		this.tourInfo = tourInfo;
	}

	public String getTourGuideMent() {
		return tourGuideMent;
	}

	public void setTourGuideMent(String tourGuideMent) {
		this.tourGuideMent = tourGuideMent;
	}

	public String getTourMeetingPlace() {
		return tourMeetingPlace;
	}

	public void setTourMeetingPlace(String tourMeetingPlace) {
		this.tourMeetingPlace = tourMeetingPlace;
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
		return "TourDetail [tourId=" + tourId + ", tourInfo=" + tourInfo + ", tourGuideMent=" + tourGuideMent
				+ ", tourMeetingPlace=" + tourMeetingPlace + ", tourList=" + tourList + ", tourHistory=" + tourHistory
				+ ", tourSchedule=" + tourSchedule + ", tourOption=" + tourOption + ", tourPolicy=" + tourPolicy + "]";
	}

	
}
