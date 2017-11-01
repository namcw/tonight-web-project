package accom.model.vo;

import java.io.Serializable;

public class AccomImage implements Serializable {
	private String imageRname;
	private String imageOname;
	private int accomId;
	
	public AccomImage() {}

	public AccomImage(String imageRname, String imageOname, int accomId) {
		super();
		this.imageRname = imageRname;
		this.imageOname = imageOname;
		this.accomId = accomId;
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

	public int getAccomId() {
		return accomId;
	}

	public void setAccomId(int accomId) {
		this.accomId = accomId;
	}

	@Override
	public String toString() {
		return "AccomImage [imageRname=" + imageRname + ", imageOname=" + imageOname + ", accomId=" + accomId + "]";
	};
	
}
