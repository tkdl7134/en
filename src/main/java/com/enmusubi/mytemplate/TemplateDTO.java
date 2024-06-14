package com.enmusubi.mytemplate;

public class TemplateDTO {
	 private int e_no;
	 
	 private String w_groom;
	 private String w_bride;
	 private String w_img;
	 
	 private int r_no;
	 private String r_time;
	 
	 private int t_pk;
	 private String t_preview;
	 private String t_template;
	 
	 
	 public TemplateDTO() {
		// TODO Auto-generated constructor stub
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


	public int getR_no() {
		return r_no;
	}


	public void setR_no(int r_no) {
		this.r_no = r_no;
	}


	public String getR_time() {
		return r_time;
	}


	public void setR_time(String r_time) {
		this.r_time = r_time;
	}


	public int getT_pk() {
		return t_pk;
	}


	public void setT_pk(int t_pk) {
		this.t_pk = t_pk;
	}


	public String getT_preview() {
		return t_preview;
	}


	public void setT_preview(String t_preview) {
		this.t_preview = t_preview;
	}


	public String getT_template() {
		return t_template;
	}


	public void setT_template(String t_template) {
		this.t_template = t_template;
	}


	@Override
	public String toString() {
		return "TemplateDTO [e_no=" + e_no + ", w_groom=" + w_groom + ", w_bride=" + w_bride + ", w_img=" + w_img
				+ ", r_no=" + r_no + ", r_time=" + r_time + ", t_pk=" + t_pk + ", t_preview=" + t_preview
				+ ", t_template=" + t_template + "]";
	}


	public TemplateDTO(int e_no, String w_groom, String w_bride, String w_img, int r_no, String r_time, int t_pk,
			String t_preview, String t_template) {
		super();
		this.e_no = e_no;
		this.w_groom = w_groom;
		this.w_bride = w_bride;
		this.w_img = w_img;
		this.r_no = r_no;
		this.r_time = r_time;
		this.t_pk = t_pk;
		this.t_preview = t_preview;
		this.t_template = t_template;
	}
}
	
