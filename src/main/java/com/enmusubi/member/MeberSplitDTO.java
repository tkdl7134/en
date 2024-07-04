package com.enmusubi.member;

import java.util.Arrays;

public class MeberSplitDTO {
	private String m_id;
	private String m_pw;
	private String m_name1;
	private String m_name2;
	private String m_name_kana1;
	private String m_name_kana2;
	private String m_name_rome1;
	private String m_name_rome2;
	private String m_birth_year;
	private String m_birth_month;
	private String m_birth_day;
	private String m_gender;
	private String m_email;
	private String m_regdate;
	private String m_img;
	private String m_phone;
	private String[] a_address;
	private String a_postcode;
	public MeberSplitDTO() {
		// TODO Auto-generated constructor stub
	}
	public MeberSplitDTO(String m_id, String m_pw, String m_name1, String m_name2, String m_name_kana1,
			String m_name_kana2, String m_name_rome1, String m_name_rome2, String m_birth_year, String m_birth_month,
			String m_birth_day, String m_gender, String m_email, String m_regdate, String m_img, String m_phone,
			String[] a_address, String a_postcode) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name1 = m_name1;
		this.m_name2 = m_name2;
		this.m_name_kana1 = m_name_kana1;
		this.m_name_kana2 = m_name_kana2;
		this.m_name_rome1 = m_name_rome1;
		this.m_name_rome2 = m_name_rome2;
		this.m_birth_year = m_birth_year;
		this.m_birth_month = m_birth_month;
		this.m_birth_day = m_birth_day;
		this.m_gender = m_gender;
		this.m_email = m_email;
		this.m_regdate = m_regdate;
		this.m_img = m_img;
		this.m_phone = m_phone;
		this.a_address = a_address;
		this.a_postcode = a_postcode;
	}
	public String getM_id() {
		return m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public String getM_name1() {
		return m_name1;
	}
	public String getM_name2() {
		return m_name2;
	}
	public String getM_name_kana1() {
		return m_name_kana1;
	}
	public String getM_name_kana2() {
		return m_name_kana2;
	}
	public String getM_name_rome1() {
		return m_name_rome1;
	}
	public String getM_name_rome2() {
		return m_name_rome2;
	}
	public String getM_birth_year() {
		return m_birth_year;
	}
	public String getM_birth_month() {
		return m_birth_month;
	}
	public String getM_birth_day() {
		return m_birth_day;
	}
	public String getM_gender() {
		return m_gender;
	}
	public String getM_email() {
		return m_email;
	}
	public String getM_regdate() {
		return m_regdate;
	}
	public String getM_img() {
		return m_img;
	}
	public String getM_phone() {
		return m_phone;
	}
	public String[] getA_address() {
		return a_address;
	}
	public String getA_postcode() {
		return a_postcode;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public void setM_name1(String m_name1) {
		this.m_name1 = m_name1;
	}
	public void setM_name2(String m_name2) {
		this.m_name2 = m_name2;
	}
	public void setM_name_kana1(String m_name_kana1) {
		this.m_name_kana1 = m_name_kana1;
	}
	public void setM_name_kana2(String m_name_kana2) {
		this.m_name_kana2 = m_name_kana2;
	}
	public void setM_name_rome1(String m_name_rome1) {
		this.m_name_rome1 = m_name_rome1;
	}
	public void setM_name_rome2(String m_name_rome2) {
		this.m_name_rome2 = m_name_rome2;
	}
	public void setM_birth_year(String m_birth_year) {
		this.m_birth_year = m_birth_year;
	}
	public void setM_birth_month(String m_birth_month) {
		this.m_birth_month = m_birth_month;
	}
	public void setM_birth_day(String m_birth_day) {
		this.m_birth_day = m_birth_day;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public void setM_regdate(String m_regdate) {
		this.m_regdate = m_regdate;
	}
	public void setM_img(String m_img) {
		this.m_img = m_img;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public void setA_address(String[] a_address) {
		this.a_address = a_address;
	}
	public void setA_postcode(String a_postcode) {
		this.a_postcode = a_postcode;
	}
	@Override
	public String toString() {
		return "MeberSplitDTO [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name1=" + m_name1 + ", m_name2=" + m_name2
				+ ", m_name_kana1=" + m_name_kana1 + ", m_name_kana2=" + m_name_kana2 + ", m_name_rome1=" + m_name_rome1
				+ ", m_name_rome2=" + m_name_rome2 + ", m_birth_year=" + m_birth_year + ", m_birth_month="
				+ m_birth_month + ", m_birth_day=" + m_birth_day + ", m_gender=" + m_gender + ", m_email=" + m_email
				+ ", m_regdate=" + m_regdate + ", m_img=" + m_img + ", m_phone=" + m_phone + ", a_address="
				+ Arrays.toString(a_address) + ", a_postcode=" + a_postcode + "]";
	}
}
