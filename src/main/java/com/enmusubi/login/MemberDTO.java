package com.enmusubi.login;

public class MemberDTO {
	private String userId;
	private String password;
	private String name;
	private String kana;
	private String birthdate;
	private String gender;
	private String email;
	private String phone;
	private boolean newsletter;
	private String regDate;

	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String userId, String password, String name, String kana, String birthdate, String gender,
			String email, String phone, boolean newsletter, String regDate) {
		super();
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.kana = kana;
		this.birthdate = birthdate;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.newsletter = newsletter;
		this.regDate = regDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKana() {
		return kana;
	}

	public void setKana(String kana) {
		this.kana = kana;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public boolean isNewsletter() {
		return newsletter;
	}

	public void setNewsletter(boolean newsletter) {
		this.newsletter = newsletter;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "MemberDTO [userId=" + userId + ", password=" + password + ", name=" + name + ", kana=" + kana
				+ ", birthdate=" + birthdate + ", gender=" + gender + ", email=" + email + ", phone=" + phone
				+ ", newsletter=" + newsletter + ", regDate=" + regDate + "]";
	}

}
