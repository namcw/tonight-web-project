package tour.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Tour implements Serializable {

	private static final long serialVersionUID = 3044051553377637868L;

	private int tourId;
	private String tourTitle;
	private String guideId;
	private String tourOname;
	private String tourRname;
	
	public Tour() {}

	public Tour(int tourId, String tourTitle, String guideId, String tourOname, String tourRname) {
		super();
		this.tourId = tourId;
		this.tourTitle = tourTitle;
		this.guideId = guideId;
		this.tourOname = tourOname;
		this.tourRname = tourRname;
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

	public String getTourOname() {
		return tourOname;
	}

	public void setTourOname(String tourOname) {
		this.tourOname = tourOname;
	}

	public String getTourRname() {
		return tourRname;
	}

	public void setTourRname(String tourRname) {
		this.tourRname = tourRname;
	}

	@Override
	public String toString() {
		return "Tour [tourId=" + tourId + ", tourTitle=" + tourTitle + ", guideId=" + guideId + ", tourOname="
				+ tourOname + ", tourRname=" + tourRname + "]";
	}

}
