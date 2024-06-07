package com.enmusubi.invitation;

public class InvitationDTO {
	      
	private int e_no;

	private String m_id;
	private String m_name;
	private String m_name_kana;
	private String m_name_rome;
	private String m_phone;
	private String m_email;
	
	
	private	String g_attend;//참여여부
	private	String g_guest_type;//참여 유형 - 게스트 유형 신랑 신부
	private	String g_age_type;//참며인원 - 성인 어린이 유아
	
	private String allergy;

	public int getE_no() {
		return e_no;
	}

	public void setE_no(int e_no) {
		this.e_no = e_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
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

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getG_attend() {
		return g_attend;
	}

	public void setG_attend(String g_attend) {
		this.g_attend = g_attend;
	}

	public String getG_guest_type() {
		return g_guest_type;
	}

	public void setG_guest_type(String g_guest_type) {
		this.g_guest_type = g_guest_type;
	}

	public String getG_age_type() {
		return g_age_type;
	}

	public void setG_age_type(String g_age_type) {
		this.g_age_type = g_age_type;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	public InvitationDTO(int e_no, String m_id, String m_name, String m_name_kana, String m_name_rome, String m_phone,
			String m_email, String g_attend, String g_guest_type, String g_age_type, String allergy) {
		super();
		this.e_no = e_no;
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_name_kana = m_name_kana;
		this.m_name_rome = m_name_rome;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.g_attend = g_attend;
		this.g_guest_type = g_guest_type;
		this.g_age_type = g_age_type;
		this.allergy = allergy;
	}

	@Override
	public String toString() {
		return "InvitationDTO [e_no=" + e_no + ", m_id=" + m_id + ", m_name=" + m_name + ", m_name_kana=" + m_name_kana
				+ ", m_name_rome=" + m_name_rome + ", m_phone=" + m_phone + ", m_email=" + m_email + ", g_attend="
				+ g_attend + ", g_guest_type=" + g_guest_type + ", g_age_type=" + g_age_type + ", allergy=" + allergy
				+ "]";
	}
}

	