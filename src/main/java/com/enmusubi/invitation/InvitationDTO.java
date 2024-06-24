package com.enmusubi.invitation;

public class InvitationDTO {
	
    private int e_no;
    
    private String m_id;
    private String m_name;
    private String m_phone;
    private String m_email;
    
    private String g_attend;
    private String g_guest_type;
    private String g_message;
    private String g_relation;
    
    private String allergy;
    
    private int p_adult;
    private int p_child;
    private int p_baby;


    public InvitationDTO() {
		// TODO Auto-generated constructor stub
	}


	public InvitationDTO(int e_no, String m_id, String m_name, String m_phone, String m_email, String g_attend,
			String g_guest_type, String g_message, String g_relation, String allergy, int p_adult, int p_child,
			int p_baby) {
		super();
		this.e_no = e_no;
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.g_attend = g_attend;
		this.g_guest_type = g_guest_type;
		this.g_message = g_message;
		this.g_relation = g_relation;
		this.allergy = allergy;
		this.p_adult = p_adult;
		this.p_child = p_child;
		this.p_baby = p_baby;
	}


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


	public String getG_message() {
		return g_message;
	}


	public void setG_message(String g_message) {
		this.g_message = g_message;
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


	public int getP_adult() {
		return p_adult;
	}


	public void setP_adult(int p_adult) {
		this.p_adult = p_adult;
	}


	public int getP_child() {
		return p_child;
	}


	public void setP_child(int p_child) {
		this.p_child = p_child;
	}


	public int getP_baby() {
		return p_baby;
	}


	public void setP_baby(int p_baby) {
		this.p_baby = p_baby;
	}


	@Override
	public String toString() {
		return "InvitationDTO [e_no=" + e_no + ", m_id=" + m_id + ", m_name=" + m_name + ", m_phone=" + m_phone
				+ ", m_email=" + m_email + ", g_attend=" + g_attend + ", g_guest_type=" + g_guest_type + ", g_message="
				+ g_message + ", g_relation=" + g_relation + ", allergy=" + allergy + ", p_adult=" + p_adult
				+ ", p_child=" + p_child + ", p_baby=" + p_baby + "]";
	}


	
}
