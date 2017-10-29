package member.model.vo;

public class Member implements java.io.Serializable {

	private static final long serialVersionUID = 8555L;
	
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberType;
	private String birthDate;
	private String phone;
	private String email;
	private String address;
	private String rank;
	
	public Member() {}

	public Member(String memberId, String memberPwd, String memberName, String memberType, String birthDate,
			String phone, String email, String address, String rank) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberType = memberType;
		this.birthDate = birthDate;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.rank = rank;
	}
	
	public Member(String memberId, String memberPwd, String phone, String email, String address) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.birthDate = birthDate;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	
	
}
