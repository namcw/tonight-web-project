package tour.model.vo;

import java.io.Serializable;

public class TourImage implements Serializable {

	private String imageRname;
	private String imageOname;
	private int tourId;
	
	public TourImage() {}

	public TourImage(String imageRname, String imageOname, int tourId) {
		super();
		this.imageRname = imageRname;
		this.imageOname = imageOname;
		this.tourId = tourId;
	}

	public String getImageRname() {
		return imageRname;
	}

	public void setImageRname(String imageRname) {
		this.imageRname = imageRname;
	}

	public String getImageOname() {
		return imageOname;
	}

	public void setImageOname(String imageOname) {
		this.imageOname = imageOname;
	}

	public int getTourId() {
		return tourId;
	}

	public void setTourId(int tourId) {
		this.tourId = tourId;
	}

	@Override
	public String toString() {
		return "TourImage [imageRname=" + imageRname + ", imageOname=" + imageOname + ", tourId=" + tourId + "]";
	};
	
	
}
