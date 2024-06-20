package com.enmusubi.mytemplate;

public class mytemplateDTO {

    private int e_no;
    private int t_pk;
    private String m_id; // m_id를 int에서 String으로 변경
    
    private String t_title;
    private String t_preview;
    private String t_example;
    private String t_template;

    private String w_groom;
    private String w_bride;
    private String w_img1;
    private String w_img2;
    private String w_img3;
    
    

    public mytemplateDTO() {
        // Default constructor
    }



	public mytemplateDTO(int e_no, int t_pk, String m_id, String t_title, String t_preview, String t_example,
			String t_template, String w_groom, String w_bride, String w_img1, String w_img2, String w_img3) {
		super();
		this.e_no = e_no;
		this.t_pk = t_pk;
		this.m_id = m_id;
		this.t_title = t_title;
		this.t_preview = t_preview;
		this.t_example = t_example;
		this.t_template = t_template;
		this.w_groom = w_groom;
		this.w_bride = w_bride;
		this.w_img1 = w_img1;
		this.w_img2 = w_img2;
		this.w_img3 = w_img3;
	}



	public int getE_no() {
		return e_no;
	}



	public void setE_no(int e_no) {
		this.e_no = e_no;
	}



	public int getT_pk() {
		return t_pk;
	}



	public void setT_pk(int t_pk) {
		this.t_pk = t_pk;
	}



	public String getM_id() {
		return m_id;
	}



	public void setM_id(String m_id) {
		this.m_id = m_id;
	}



	public String getT_title() {
		return t_title;
	}



	public void setT_title(String t_title) {
		this.t_title = t_title;
	}



	public String getT_preview() {
		return t_preview;
	}



	public void setT_preview(String t_preview) {
		this.t_preview = t_preview;
	}



	public String getT_example() {
		return t_example;
	}



	public void setT_example(String t_example) {
		this.t_example = t_example;
	}



	public String getT_template() {
		return t_template;
	}



	public void setT_template(String t_template) {
		this.t_template = t_template;
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



	public String getW_img1() {
		return w_img1;
	}



	public void setW_img1(String w_img1) {
		this.w_img1 = w_img1;
	}



	public String getW_img2() {
		return w_img2;
	}



	public void setW_img2(String w_img2) {
		this.w_img2 = w_img2;
	}



	public String getW_img3() {
		return w_img3;
	}



	public void setW_img3(String w_img3) {
		this.w_img3 = w_img3;
	}



	@Override
	public String toString() {
		return "mytemplateDTO [e_no=" + e_no + ", t_pk=" + t_pk + ", m_id=" + m_id + ", t_title=" + t_title
				+ ", t_preview=" + t_preview + ", t_example=" + t_example + ", t_template=" + t_template + ", w_groom="
				+ w_groom + ", w_bride=" + w_bride + ", w_img1=" + w_img1 + ", w_img2=" + w_img2 + ", w_img3=" + w_img3
				+ "]";
	}

    
}
