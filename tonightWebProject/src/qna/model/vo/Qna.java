package qna.model.vo;

import java.sql.Date;

public class Qna implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	
	private int qnaNo;
	private String qnaTitle;
	private String writerId;
	private String question;
	private String answer;
	private int qnaReadcount;

	public Qna() {
		super();
	}

	public Qna(int qnaNo, String qnaTitle, String writerId, String question, String answer, int qnaReadcount) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.writerId = writerId;
		this.question = question;
		this.answer = answer;
		this.qnaReadcount = qnaReadcount;
	}
	public Qna(String qnaTitle, String writerId, String question){
		this.qnaTitle = qnaTitle;
		this.writerId = writerId;
		this.question = question;
	}
	public Qna(String qnaTitle, String writerId, String question, int qnaNo){
		this.qnaTitle = qnaTitle;
		this.writerId = writerId;
		this.question = question;
		this.qnaNo = qnaNo;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public int getqnaReadcount(){
		return qnaReadcount;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public String getWriterId() {
		return writerId;
	}

	public String getQuestion() {
		return question;
	}

	public String getAnswer() {
		return answer;
	}
	public void setqnaReadcount(int qnareadcount){
		this.qnaReadcount = qnaReadcount;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return qnaNo + ", " + qnaTitle + ", " + writerId + ", " + question + ", " + answer + ", " + qnaReadcount;
	}
}
