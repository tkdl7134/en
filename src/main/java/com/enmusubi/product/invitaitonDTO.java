package com.enmusubi.product;

public class invitaitonDTO {

	private int e_no;
	private int t_pk;
	private String w_groom;
	private String w_bride;
	private String w_message_info;
	private String w_message_bye;
	private String w_img1;
	private String w_img2;
	private String w_img3;
	private String w_img4;
	
	private String weddingDay; //r_type wedding > r_time 중 날짜만
	
	private String w_time;
	private String w_time_assemble;
	
	private String r_time;
	private String r_time_assemble;
	
	public invitaitonDTO() {
		// TODO Auto-generated constructor stub
	}

	public invitaitonDTO(int e_no, int t_pk, String w_groom, String w_bride, String w_message_info,
			String w_message_bye, String w_img1, String w_img2, String w_img3, String w_img4, String weddingDay,
			String w_time, String w_time_assemble, String r_time, String r_time_assemble) {
		super();
		this.e_no = e_no;
		this.t_pk = t_pk;
		this.w_groom = w_groom;
		this.w_bride = w_bride;
		this.w_message_info = w_message_info;
		this.w_message_bye = w_message_bye;
		this.w_img1 = w_img1;
		this.w_img2 = w_img2;
		this.w_img3 = w_img3;
		this.w_img4 = w_img4;
		this.weddingDay = weddingDay;
		this.w_time = w_time;
		this.w_time_assemble = w_time_assemble;
		this.r_time = r_time;
		this.r_time_assemble = r_time_assemble;
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

	public String getW_message_info() {
		return w_message_info;
	}

	public void setW_message_info(String w_message_info) {
		this.w_message_info = w_message_info;
	}

	public String getW_message_bye() {
		return w_message_bye;
	}

	public void setW_message_bye(String w_message_bye) {
		this.w_message_bye = w_message_bye;
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

	public String getW_img4() {
		return w_img4;
	}

	public void setW_img4(String w_img4) {
		this.w_img4 = w_img4;
	}

	public String getWeddingDay() {
		return weddingDay;
	}

	public void setWeddingDay(String weddingDay) {
		this.weddingDay = weddingDay;
	}

	public String getW_time() {
		return w_time;
	}

	public void setW_time(String w_time) {
		this.w_time = w_time;
	}

	public String getW_time_assemble() {
		return w_time_assemble;
	}

	public void setW_time_assemble(String w_time_assemble) {
		this.w_time_assemble = w_time_assemble;
	}

	public String getR_time() {
		return r_time;
	}

	public void setR_time(String r_time) {
		this.r_time = r_time;
	}

	public String getR_time_assemble() {
		return r_time_assemble;
	}

	public void setR_time_assemble(String r_time_assemble) {
		this.r_time_assemble = r_time_assemble;
	}

	@Override
	public String toString() {
		return "invitaitonDTO [e_no=" + e_no + ", t_pk=" + t_pk + ", w_groom=" + w_groom + ", w_bride=" + w_bride
				+ ", w_message_info=" + w_message_info + ", w_message_bye=" + w_message_bye + ", w_img1=" + w_img1
				+ ", w_img2=" + w_img2 + ", w_img3=" + w_img3 + ", w_img4=" + w_img4 + ", weddingDay=" + weddingDay
				+ ", w_time=" + w_time + ", w_time_assemble=" + w_time_assemble + ", r_time=" + r_time
				+ ", r_time_assemble=" + r_time_assemble + "]";
	}
	
	
	
}
