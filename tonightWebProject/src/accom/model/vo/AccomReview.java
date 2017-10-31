package accom.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AccomReview implements Serializable{
	
	private int arNo;
	private int arAccomId;
	private Date arDate;
	private String arWriterId;
	private String arTitle;
	private String arContent;
	private double arGrade;

	public AccomReview() {}

	public AccomReview(int arAccomId, String arWriterId, String arContent, double arGrade) {
	      super();
	      this.arAccomId = arAccomId;
	      this.arWriterId = arWriterId;
	      this.arContent = arContent;
	      this.arGrade = arGrade;
	   }
	   
	 public AccomReview(int arNo, int arAccomId, Date arDate, String arWriterId, String arTitle, String arContent, double arGrade) {
	      super();
	      this.arNo = arNo;
	      this.arAccomId = arAccomId;
	      this.arDate = arDate;
	      this.arWriterId = arWriterId;
	      this.arTitle = arTitle;
	      this.arContent = arContent;
	      this.arGrade = arGrade;
	   }

	public int getArNo() {
		return arNo;
	}

	public void setArNo(int arNo) {
		this.arNo = arNo;
	}

	public int getArAccomId() {
		return arAccomId;
	}

	public void setArAccomId(int arAccomId) {
		this.arAccomId = arAccomId;
	}

	public Date getArDate() {
		return arDate;
	}

	public void setArDate(Date arDate) {
		this.arDate = arDate;
	}

	public String getArWriterId() {
		return arWriterId;
	}

	public void setArWriterId(String arWriterId) {
		this.arWriterId = arWriterId;
	}

	public String getArTitle() {
		return arTitle;
	}

	public void setArTitle(String arTitle) {
		this.arTitle = arTitle;
	}

	public String getArContent() {
		return arContent;
	}

	public void setArContent(String arContent) {
		this.arContent = arContent;
	}

	public double getArGrade() {
		return arGrade;
	}

	public void setArGrade(double arGrade) {
		this.arGrade = arGrade;
	}
}
