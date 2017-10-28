package accom.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class RoomReview {

	private int reviewNum;
	private String reviewTitle;
	private String reviewriter;
	private String reviewContent;
	private String reviewOriginalFileName;
	private String reviewRenameFileName;
	private Date reviewDate;
	private int reviewReadCount;
	private int reviewLevel;
	private int reviewRef;
	private int reviewReplyRef;
	private int reviewReplySeq;
	private double rrGrade;
/*	private int accomId;*/
	

	public RoomReview(){}
	
	
	public RoomReview(int reviewNum, String reviewTitle, String reviewriter, String reviewContent, String reviewOriginalFileName,
			String reviewRenameFileName, Date reviewDate, int reviewReadCount, int reviewLevel, int reviewRef,
			int reviewReplyRef, int reviewReplySeq, double rrGrade) {
		
		super();
		this.reviewNum = reviewNum;
		this.reviewTitle = reviewTitle;
		this.reviewriter = reviewriter;
		this.reviewContent = reviewContent;
		this.reviewOriginalFileName = reviewOriginalFileName;
		this.reviewRenameFileName = reviewRenameFileName;
		this.reviewDate = reviewDate;
		this.reviewReadCount = reviewReadCount;
		this.reviewLevel = reviewLevel;
		this.reviewRef = reviewRef;
		this.reviewReplyRef = reviewReplyRef;
		this.reviewReplySeq = reviewReplySeq;
		this.rrGrade=rrGrade;
	}
	
	

	public double getRrGrade() {
		return rrGrade;
	}


	public void setRrGrade(double rrGrade) {
		this.rrGrade = rrGrade;
	}

	
	
	public RoomReview(int reviewNum, /*int accomId,*/ Date reviewDate, String reviewTitle, String reviewContent, String reviewriter, double rrGrade) {
		super();
		this.reviewNum = reviewNum;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewDate=reviewDate;
		this.reviewriter=reviewriter;
		this.rrGrade=rrGrade;
	/*	this.accomId=accomId;*/
	}

	
	public RoomReview(int reviewNum, String reviewTitle, String reviewriter, String reviewContent) {
		super();
		this.reviewNum = reviewNum;
		this.reviewTitle = reviewTitle;
		this.reviewriter = reviewriter;
		this.reviewContent = reviewContent;
	}

	public RoomReview(String reviewTitle, String reviewriter, String reviewContent, String reviewOriginalFileName,
			String reviewRenameFileName) {
		super();
		this.reviewTitle = reviewTitle;
		this.reviewriter = reviewriter;
		this.reviewContent = reviewContent;
		this.reviewOriginalFileName = reviewOriginalFileName;
		this.reviewRenameFileName = reviewRenameFileName;
	}

	public RoomReview(int reviewNum, String reviewTitle, String reviewContent, String reviewOriginalFileName,
			String reviewRenameFileName) {
		super();
		this.reviewNum = reviewNum;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewOriginalFileName = reviewOriginalFileName;
		this.reviewRenameFileName = reviewRenameFileName;
	}
	
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewriter() {
		return reviewriter;
	}
	public void setReviewriter(String reviewriter) {
		this.reviewriter = reviewriter;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewOriginalFileName() {
		return reviewOriginalFileName;
	}
	public void setReviewOriginalFileName(String reviewOriginalFileName) {
		this.reviewOriginalFileName = reviewOriginalFileName;
	}
	public String getReviewRenameFileName() {
		return reviewRenameFileName;
	}
	public void setReviewRenameFileName(String reviewRenameFileName) {
		this.reviewRenameFileName = reviewRenameFileName;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getReviewReadCount() {
		return reviewReadCount;
	}
	public void setReviewReadCount(int reviewReadCount) {
		this.reviewReadCount = reviewReadCount;
	}
	public int getReviewLevel() {
		return reviewLevel;
	}
	public void setReviewLevel(int reviewLevel) {
		this.reviewLevel = reviewLevel;
	}
	public int getReviewRef() {
		return reviewRef;
	}
	public void setReviewRef(int reviewRef) {
		this.reviewRef = reviewRef;
	}
	public int getReviewReplyRef() {
		return reviewReplyRef;
	}
	public void setReviewReplyRef(int reviewReplyRef) {
		this.reviewReplyRef = reviewReplyRef;
	}
	public int getReviewReplySeq() {
		return reviewReplySeq;
	}
	public void setReviewReplySeq(int reviewReplySeq) {
		this.reviewReplySeq = reviewReplySeq;
	}
	
	
	@Override
	public String toString(){
		return this.reviewNum + ", " + this.reviewTitle + ", " +
				this.reviewriter + ", " + this.reviewContent + ", " +
				this.reviewDate + ", " + this.reviewReadCount + ", " +
				this.reviewOriginalFileName + ", " +
				this.reviewRenameFileName + ", " +
				this.reviewLevel + ", " + this.reviewRef + ", " +
				this.reviewReplyRef + ", " + this.reviewReplySeq;
	}



}
