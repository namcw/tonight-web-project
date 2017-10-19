package tour.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Tour implements Serializable {


	private static final long serialVersionUID = 3044051553377637868L;

	private int tourId;
	private String tourTitle;
	private String guidId;
	private String tourThumnailPath;
	
	public Tour() {}

	public Tour(int tourId, String tourTitle, String guidId, String tourThumnailPath) {
		super();
		this.tourId = tourId;
		this.tourTitle = tourTitle;
		this.guidId = guidId;
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

	public String getGuidId() {
		return guidId;
	}

	public void setGuidId(String guidId) {
		this.guidId = guidId;
	}

	public String getTourThumnailPath() {
		return tourThumnailPath;
	}

	public void setTourThumnailPath(String tourThumnailPath) {
		this.tourThumnailPath = tourThumnailPath;
	}
	
}
