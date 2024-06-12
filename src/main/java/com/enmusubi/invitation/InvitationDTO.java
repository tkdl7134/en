package com.enmusubi.invitation;

public class InvitationDTO {
    private int e_no;
    
    private String w_groom;
    private String w_bride;
    private String w_img;
    
    private String m_id;
    private String m_name;
    private String m_name_kana;
    private String m_name_rome;
    private String m_phone;
    private String m_email;
    
    private String g_attend;
    private String g_guest_type;
    private String g_age_type;
    private String g_messagge;
    private String allergy;
    
    public InvitationDTO() {
		// TODO Auto-generated constructor stub
	}
    
	@Override
	public String toString() {
		return "InvitationDTO [e_no=" + e_no + ", w_groom=" + w_groom + ", w_bride=" + w_bride + ", w_img=" + w_img
				+ ", m_id=" + m_id + ", m_name=" + m_name + ", m_name_kana=" + m_name_kana + ", m_name_rome="
				+ m_name_rome + ", m_phone=" + m_phone + ", m_email=" + m_email + ", g_attend=" + g_attend
				+ ", g_guest_type=" + g_guest_type + ", g_age_type=" + g_age_type + ", g_messagge=" + g_messagge
				+ ", allergy=" + allergy + "]";
	}
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
	public String getW_groom() {
		return w_groom;
	}
	public void setW_groom(String w_groom) {
		this.w_groom = w_groom;
	}
	public String getW_bride() {
		return w_bride;
	}
	public void setW_bride(String w_bride) {
		this.w_bride = w_bride;
	}
	public String getW_img() {
		return w_img;
	}
	public void setW_img(String w_img) {
		this.w_img = w_img;
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
	public String getG_messagge() {
		return g_messagge;
	}
	public void setG_messagge(String g_messagge) {
		this.g_messagge = g_messagge;
	}
	public String getAllergy() {
		return allergy;
	}
	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}
	public InvitationDTO(int e_no, String w_groom, String w_bride, String w_img, String m_id, String m_name,
			String m_name_kana, String m_name_rome, String m_phone, String m_email, String g_attend,
			String g_guest_type, String g_age_type, String g_messagge, String allergy) {
		super();
		this.e_no = e_no;
		this.w_groom = w_groom;
		this.w_bride = w_bride;
		this.w_img = w_img;
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_name_kana = m_name_kana;
		this.m_name_rome = m_name_rome;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.g_attend = g_attend;
		this.g_guest_type = g_guest_type;
		this.g_age_type = g_age_type;
		this.g_messagge = g_messagge;
		this.allergy = allergy;
	}
}