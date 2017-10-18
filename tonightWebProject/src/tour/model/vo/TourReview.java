package tour.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class TourReview implements Serializable {

	private static final long serialVersionUID = 8784872682651591434L;
	
	private int trNo;
	private int trTourId;
	private Date trDate;
	private String trWriterId;
	private String trTitle;
	private String trContent;
	private double trGrade;
	
	public TourReview() {}

	public TourReview(int trNo, int trTourId, Date trDate, String trWriterId, String trTitle, String trContent,
			double trGrade) {
		super();
		this.trNo = trNo;
		this.trTourId = trTourId;
		this.trDate = trDate;
		this.trWriterId = trWriterId;
		this.trTitle = trTitle;
		this.trContent = trContent;
		this.trGrade = trGrade;
	}

	public int getTrNo() {
		return trNo;
	}

	public void setTrNo(int trNo) {
		this.trNo = trNo;
	}

	public int getTrTourId() {
		return trTourId;
	}

	public void setTrTourId(int trTourId) {
		this.trTourId = trTourId;
	}

	public Date getTrDate() {
		return trDate;
	}

	public void setTrDate(Date trDate) {
		this.trDate = trDate;
	}

	public String getTrWriterId() {
		return trWriterId;
	}

	public void setTrWriterId(String trWriterId) {
		this.trWriterId = trWriterId;
	}

	public String getTrTitle() {
		return trTitle;
	}

	public void setTrTitle(String trTitle) {
		this.trTitle = trTitle;
	}

	public String getTrContent() {
		return trContent;
	}

	public void setTrContent(String trContent) {
		this.trContent = trContent;
	}

	public double getTrGrade() {
		return trGrade;
	}

	public void setTrGrade(double trGrade) {
		this.trGrade = trGrade;
	}
	
	
	
	
}
