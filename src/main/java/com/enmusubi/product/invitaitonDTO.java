package com.enmusubi.product;

public class invitaitonDTO {

	private int e_no;
	private int t_pk;
	private String t_template;
	
	private String w_groom;
	private String w_bride;
	
	private String w_msg_invite;
	private String w_msg_bye;
	private String w_img1;
	private String w_img2;
	private String w_img3;
	private String w_img4;
	
	private String weddingDay; //r_type wedding > r_time 중 날짜만
	private String r_weddingTime;
	private String r_weddingTime_assemble;
	private String r_receptionTime;
	private String r_receptionTime_assemble;
	private String r_weddingPlace;
	private String r_weddingAddr;
	private String r_receptionPlace;
	private String r_receptionAddr;
	
	
	public invitaitonDTO() {
		
	}


	public invitaitonDTO(int e_no, int t_pk, String t_template, String w_groom, String w_bride, String w_msg_invite,
			String w_msg_bye, String w_img1, String w_img2, String w_img3, String w_img4, String weddingDay,
			String r_weddingTime, String r_weddingTime_assemble, String r_receptionTime,
			String r_receptionTime_assemble, String r_weddingPlace, String r_weddingAddr, String r_receptionPlace,
			String r_receptionAddr) {
		super();
		this.e_no = e_no;
		this.t_pk = t_pk;
		this.t_template = t_template;
		this.w_groom = w_groom;
		this.w_bride = w_bride;
		this.w_msg_invite = w_msg_invite;
		this.w_msg_bye = w_msg_bye;
		this.w_img1 = w_img1;
		this.w_img2 = w_img2;
		this.w_img3 = w_img3;
		this.w_img4 = w_img4;
		this.weddingDay = weddingDay;
		this.r_weddingTime = r_weddingTime;
		this.r_weddingTime_assemble = r_weddingTime_assemble;
		this.r_receptionTime = r_receptionTime;
		this.r_receptionTime_assemble = r_receptionTime_assemble;
		this.r_weddingPlace = r_weddingPlace;
		this.r_weddingAddr = r_weddingAddr;
		this.r_receptionPlace = r_receptionPlace;
		this.r_receptionAddr = r_receptionAddr;
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


	public String getW_msg_invite() {
		return w_msg_invite;
	}


	public void setW_msg_invite(String w_msg_invite) {
		this.w_msg_invite = w_msg_invite;
	}


	public String getW_msg_bye() {
		return w_msg_bye;
	}


	public void setW_msg_bye(String w_msg_bye) {
		this.w_msg_bye = w_msg_bye;
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


	public String getR_weddingTime() {
		return r_weddingTime;
	}


	public void setR_weddingTime(String r_weddingTime) {
		this.r_weddingTime = r_weddingTime;
	}


	public String getR_weddingTime_assemble() {
		return r_weddingTime_assemble;
	}


	public void setR_weddingTime_assemble(String r_weddingTime_assemble) {
		this.r_weddingTime_assemble = r_weddingTime_assemble;
	}


	public String getR_receptionTime() {
		return r_receptionTime;
	}


	public void setR_receptionTime(String r_receptionTime) {
		this.r_receptionTime = r_receptionTime;
	}


	public String getR_receptionTime_assemble() {
		return r_receptionTime_assemble;
	}


	public void setR_receptionTime_assemble(String r_receptionTime_assemble) {
		this.r_receptionTime_assemble = r_receptionTime_assemble;
	}


	public String getR_weddingPlace() {
		return r_weddingPlace;
	}


	public void setR_weddingPlace(String r_weddingPlace) {
		this.r_weddingPlace = r_weddingPlace;
	}


	public String getR_weddingAddr() {
		return r_weddingAddr;
	}


	public void setR_weddingAddr(String r_weddingAddr) {
		this.r_weddingAddr = r_weddingAddr;
	}


	public String getR_receptionPlace() {
		return r_receptionPlace;
	}


	public void setR_receptionPlace(String r_receptionPlace) {
		this.r_receptionPlace = r_receptionPlace;
	}


	public String getR_receptionAddr() {
		return r_receptionAddr;
	}


	public void setR_receptionAddr(String r_receptionAddr) {
		this.r_receptionAddr = r_receptionAddr;
	}


	
	
}