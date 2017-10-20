package tour.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Tour implements Serializable {

	private static final long serialVersionUID = 3044051553377637868L;

	private int tourId;
	private String tourTitle;
	private String guideId;
	private String tourThumnailPath;
	
	public Tour() {}

	public Tour(int tourId, String tourTitle, String guideId, String tourThumnailPath) {
		super();
		this.tourId = tourId;
		this.tourTitle = tourTitle;
		this.guideId = guideId;
		this.tourThumnailPath = tourThumnailPath;
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

	public String getTourThumnailPath() {
		return tourThumnailPath;
	}

	public void setTourThumnailPath(String tourThumnailPath) {
		this.tourThumnailPath = tourThumnailPath;
	}
}
