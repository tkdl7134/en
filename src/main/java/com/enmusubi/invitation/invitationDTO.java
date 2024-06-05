package com.enmusubi.invitation;

public class invitationDTO {
	      
	private String e_no;
	private String m_id;
	private String m_name;
	private String m_phone;
	private String m_email;
	private	String g_attend;//참여여부
	private	String g_age_type;
	private String allergy;
public invitationDTO() {
	// TODO Auto-generated constructor stub
}
public String getE_no() {
	return e_no;
}
public void setE_no(String e_no) {
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
public invitationDTO(String e_no, String m_id, String m_name, String m_phone, String m_email, String g_attend,
		String g_age_type, String allergy) {
	super();
	this.e_no = e_no;
	this.m_id = m_id;
	this.m_name = m_name;
	this.m_phone = m_phone;
	this.m_email = m_email;
	this.g_attend = g_attend;
	this.g_age_type = g_age_type;
	this.allergy = allergy;
}
@Override
public String toString() {
	return "invitationDTO [e_no=" + e_no + ", m_id=" + m_id + ", m_name=" + m_name + ", m_phone=" + m_phone
			+ ", m_email=" + m_email + ", g_attend=" + g_attend + ", g_age_type=" + g_age_type + ", allergy=" + allergy
			+ "]";
}
}
