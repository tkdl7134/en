package com.enmusubi.member;

public class MemberDTO {
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_name_kana;
	private String m_name_rome;
	private String m_birth;
	private String m_gender;
	private String m_email;
	private String m_regdate;
	private String m_img;
	private String m_phone;
	private String a_address;
	private String a_postcode;

	// 생성자
	public MemberDTO() {
	}

	public MemberDTO(String m_id, String m_pw, String m_name, String m_name_kana, String m_name_rome, String m_birth,
			String m_gender, String m_email, String m_regdate, String m_img, String m_phone, String a_address,
			String a_postcode) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_name_kana = m_name_kana;
		this.m_name_rome = m_name_rome;
		this.m_birth = m_birth;
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

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_name_kana() {
		return m_name_kana;
	}

	public void setM_name_kana(String m_name_kana) {
		this.m_name_kana = m_name_kana;
	}

	public String getM_name_rome() {
		return m_name_rome;
	}

	public void setM_name_rome(String m_name_rome) {
		this.m_name_rome = m_name_rome;
	}

	public String getM_birth() {
		return m_birth;
	}

	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_regdate() {
		return m_regdate;
	}

	public void setM_regdate(String m_regdate) {
		this.m_regdate = m_regdate;
	}

	public String getM_img() {
		return m_img;
	}

	public void setM_img(String m_img) {
		this.m_img = m_img;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getA_address() {
		return a_address;
	}

	public void setA_address(String a_address) {
		this.a_address = a_address;
	}

	public String getA_postcode() {
		return a_postcode;
	}

	public void setA_postcode(String a_postcode) {
		this.a_postcode = a_postcode;
	}

	public char[] toJSON() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String toString() {
		return "MemberDTO [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_name_kana=" + m_name_kana
				+ ", m_name_rome=" + m_name_rome + ", m_birth=" + m_birth + ", m_gender=" + m_gender + ", m_email="
				+ m_email + ", m_regdate=" + m_regdate + ", m_img=" + m_img + ", m_phone=" + m_phone + ", a_address="
				+ a_address + ", a_postcode=" + a_postcode + "]";
	}
  
}