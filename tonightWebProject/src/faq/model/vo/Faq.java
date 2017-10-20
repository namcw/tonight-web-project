package faq.model.vo;

public class Faq {

	private int faqNo;
	private String faqCategory;
	private String faqTitle;
	private String faqAnswer;
	private int faqReadCount;
	
	public Faq() {
		super();
	}
	public Faq(int faqNo, String faqCategory, String faqTitle, String faqAnswer, int faqReadCount) {
		super();
		this.faqNo = faqNo;
		this.faqCategory = faqCategory;
		this.faqTitle = faqTitle;
		this.faqAnswer = faqAnswer;
		this.faqReadCount = faqReadCount;
	}
	public Faq(String faqTitle, String faqCategory, String faqAnswer) {
		this.faqTitle = faqTitle;
		this.faqAnswer = faqAnswer;
		this.faqCategory = faqCategory;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public void setFaqCategory(String faqCategory) {
		this.faqCategory = faqCategory;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public void setFaqAnswer(String faqAnswer) {
		this.faqAnswer = faqAnswer;
	}
	public void setFaqReadCount(int faqReadCount) {
		this.faqReadCount = faqReadCount;
	}
	public int getFaqNo() {
		return faqNo;
	}
	public String getFaqCategory() {
		return faqCategory;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public String getFaqAnswer() {
		return faqAnswer;
	}
	public int getFaqReadCount() {
		return faqReadCount;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return faqNo + ", " + faqCategory +", " + faqTitle + ", " + faqAnswer + ", " + faqReadCount;
	}
	
	
}
