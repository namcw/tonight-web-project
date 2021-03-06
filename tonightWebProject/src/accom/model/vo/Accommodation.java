package accom.model.vo;

import java.sql.Date;

public class Accommodation implements java.io.Serializable{

	private int accId;
	private String bizId;
	private String accName;
	private String accInfo;
	private String accType;
	private String accAddress;
	private String accContact;
	private String accRank;
	private String accOname;
	private String accRname;
	private String accRules;
	private String facilities;
	private String accRefund;
	
	public Accommodation() {}

	public Accommodation(int accId, String bizId, String accName, String accInfo, String accType, String accAddress,
			String accContact, String accRank, String accOname, String accRname, String accRules, String facilities,
			String accRefund) {
		super();
		this.accId = accId;
		this.bizId = bizId;
		this.accName = accName;
		this.accInfo = accInfo;
		this.accType = accType;
		this.accAddress = accAddress;
		this.accContact = accContact;
		this.accRank = accRank;
		this.accOname = accOname;
		this.accRname = accRname;
		this.accRules = accRules;
		this.facilities = facilities;
		this.accRefund = accRefund;
	}

	public int getAccId() {
		return accId;
	}

	public void setAccId(int accId) {
		this.accId = accId;
	}

	public String getBizId() {
		return bizId;
	}

	public void setBizId(String bizId) {
		this.bizId = bizId;
	}

	public String getAccName() {
		return accName;
	}

	public void setAccName(String accName) {
		this.accName = accName;
	}

	public String getAccInfo() {
		return accInfo;
	}

	public void setAccInfo(String accInfo) {
		this.accInfo = accInfo;
	}

	public String getAccType() {
		return accType;
	}

	public void setAccType(String accType) {
		this.accType = accType;
	}

	public String getAccAddress() {
		return accAddress;
	}

	public void setAccAddress(String accAddress) {
		this.accAddress = accAddress;
	}

	public String getAccContact() {
		return accContact;
	}

	public void setAccContact(String accContact) {
		this.accContact = accContact;
	}

	public String getAccRank() {
		return accRank;
	}

	public void setAccRank(String accRank) {
		this.accRank = accRank;
	}

	public String getAccOname() {
		return accOname;
	}

	public void setAccOname(String accOname) {
		this.accOname = accOname;
	}

	public String getAccRname() {
		return accRname;
	}

	public void setAccRname(String accRname) {
		this.accRname = accRname;
	}

	public String getAccRules() {
		return accRules;
	}

	public void setAccRules(String accRules) {
		this.accRules = accRules;
	}

	public String getFacilities() {
		return facilities;
	}

	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}

	public String getAccRefund() {
		return accRefund;
	}

	public void setAccRefund(String accRefund) {
		this.accRefund = accRefund;
	}

	@Override
	public String toString(){
		return  this.accId + ", " + this.bizId + ", " + this.accName + ", " + this.accInfo + ", " 
				+ this.accType + ", " + this.accAddress + ", " + this.accContact + ", " +  this.accRank + ", " 
				+ this.accOname + ", "+ this.accRname + ", " + this.accRules + ", " + ", " + this.facilities + ", " + this.accRefund;
	}
}


