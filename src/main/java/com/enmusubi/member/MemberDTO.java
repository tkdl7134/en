package com.enmusubi.member;

import java.sql.Date;

public class MemberDTO {
	private String id;
	private String password;
	private String name;
	private String nameKana;
	private String birth;
	private String gender;
	private String email;
	private Date regdate;
	private String img;
	private String phone;

	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String id, String password, String name, String nameKana, String birth, String gender,
			String email, Date regdate, String img, String phone) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.nameKana = nameKana;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.regdate = regdate;
		this.img = img;
		this.phone = phone;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getNameKana() {
		return nameKana;
	}

	public void setNameKana(String nameKana) {
		this.nameKana = nameKana;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", password=" + password + ", name=" + name + ", nameKana=" + nameKana
				+ ", birth=" + birth + ", gender=" + gender + ", email=" + email + ", regdate=" + regdate + ", img="
				+ img + ", phone=" + phone + "]";
	}

	public char[] toJSON() {
		// TODO Auto-generated method stub
		return null;
	}

}