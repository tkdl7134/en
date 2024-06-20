package com.enmusubi.survey;

public class GuestDTO {

	private int e_no;
	private String m_id;
	private String g_attend;
	private String g_guest_type;
	private String g_message;
	private String g_allergy_or;
	private String g_relation;
	private String allergy;
	private String p_age_type;
	private String p_numberof;
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
	public String getG_message() {
		return g_message;
	}
	public void setG_message(String g_message) {
		this.g_message = g_message;
	}
	public String getG_allergy_or() {
		return g_allergy_or;
	}
	public void setG_allergy_or(String g_allergy_or) {
		this.g_allergy_or = g_allergy_or;
	}
	public String getG_relation() {
		return g_relation;
	}
	public void setG_relation(String g_relation) {
		this.g_relation = g_relation;
	}
	public String getAllergy() {
		return allergy;
	}
	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}
	public String getP_age_type() {
		return p_age_type;
	}
	public void setP_age_type(String p_age_type) {
		this.p_age_type = p_age_type;
	}
	public String getP_numberof() {
		return p_numberof;
	}
	public void setP_numberof(String p_numberof) {
		this.p_numberof = p_numberof;
	}
	@Override
	public String toString() {
		return "GuestDTO [e_no=" + e_no + ", m_id=" + m_id + ", g_attend=" + g_attend + ", g_guest_type=" + g_guest_type
				+ ", g_message=" + g_message + ", g_allergy_or=" + g_allergy_or + ", g_relation=" + g_relation
				+ ", allergy=" + allergy + ", p_age_type=" + p_age_type + ", p_numberof=" + p_numberof + "]";
	}
	public GuestDTO(int e_no, String m_id, String g_attend, String g_guest_type, String g_message, String g_allergy_or,
			String g_relation, String allergy, String p_age_type, String p_numberof) {
		super();
		this.e_no = e_no;
		this.m_id = m_id;
		this.g_attend = g_attend;
		this.g_guest_type = g_guest_type;
		this.g_message = g_message;
		this.g_allergy_or = g_allergy_or;
		this.g_relation = g_relation;
		this.allergy = allergy;
		this.p_age_type = p_age_type;
		this.p_numberof = p_numberof;
	}

	public GuestDTO() {
		// TODO Auto-generated constructor stub
	}

}