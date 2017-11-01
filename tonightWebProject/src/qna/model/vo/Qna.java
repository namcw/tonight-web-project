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
	private int qnaLevel;
	private int qnaRef;
	private int qnaReplyRef;
	private int qnaReplySeq;

	public Qna() {
		super();
	}

	public Qna(int qnaNo, String qnaTitle, String writerId, String question, String answer, int qnaReadcount, int qnaLevel, int qnaRef, int qnaReplyRef, int qnaReplySeq) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.writerId = writerId;
		this.question = question;
		this.answer = answer;
		this.qnaReadcount = qnaReadcount;
		this.qnaLevel = qnaLevel;
		this.qnaRef = qnaRef;
		this.qnaReplyRef = qnaReplyRef;
		this.qnaReplySeq = qnaReplySeq;
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
	
	public int getQnaLevel(){
		return qnaLevel;
	}
	
	public int getQnaRef(){
		return qnaRef;
	}
	
	public int getQnaReplyRef(){
		return qnaReplyRef;
	}
	
	public int getQnaReplySeq(){
		return qnaReplySeq;
	}
	
	public void setqnaReadcount(int qnaReadcount){
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
	
	public void setQnaLevel(int qnaLevel){
		this.qnaLevel = qnaLevel;
	}
	
	public void setQnaRef(int qnaRef){
		this.qnaRef = qnaRef;
	}
	
	public void setQnaReplyRef(int qnaReplyRef){
		this.qnaReplyRef = qnaReplyRef;
	}

	public void setQnaReplySeq(int qnaReplySeq){
		this.qnaReplySeq = qnaReplySeq;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return qnaNo + ", " + qnaTitle + ", " + writerId + ", " + question + ", " + answer + ", " + qnaReadcount + ", " + qnaLevel + ", " + qnaRef + ", " + qnaReplyRef + ", " + qnaReplySeq;
	}
}