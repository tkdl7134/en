package com.enmusubi.product;

public class invitationAllInfoDTO {

	private int e_no;
	private int t_pk;
	private String t_template;

	private String w_groomL;
	private String w_groomF;
	private String w_groom_kanaL;
	private String w_groom_kanaF;
	private String w_groom_engL;
	private String w_groom_engF;
	
	private String w_brideL;
	private String w_brideF;
	private String w_bride_kanaL;
	private String w_bride_kanaF;
	private String w_bride_engL;
	private String w_bride_engF;
	
	private String w_message_invite;
	private String w_message_bye;
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
    
	public invitationAllInfoDTO() {
		// TODO Auto-generated constructor stub
	}

	public invitationAllInfoDTO(int e_no, int t_pk, String t_template, String w_groomL, String w_groomF,
			String w_groom_kanaL, String w_groom_kanaF, String w_groom_engL, String w_groom_engF, String w_brideL,
			String w_brideF, String w_bride_kanaL, String w_bride_kanaF, String w_bride_engL, String w_bride_engF,
			String w_message_invite, String w_message_bye, String w_img1, String w_img2, String w_img3, String w_img4,
			String weddingDay, String r_weddingTime, String r_weddingTime_assemble, String r_receptionTime,
			String r_receptionTime_assemble, String r_weddingPlace, String r_weddingAddr, String r_receptionPlace,
			String r_receptionAddr) {
		super();
		this.e_no = e_no;
		this.t_pk = t_pk;
		this.t_template = t_template;
		this.w_groomL = w_groomL;
		this.w_groomF = w_groomF;
		this.w_groom_kanaL = w_groom_kanaL;
		this.w_groom_kanaF = w_groom_kanaF;
		this.w_groom_engL = w_groom_engL;
		this.w_groom_engF = w_groom_engF;
		this.w_brideL = w_brideL;
		this.w_brideF = w_brideF;
		this.w_bride_kanaL = w_bride_kanaL;
		this.w_bride_kanaF = w_bride_kanaF;
		this.w_bride_engL = w_bride_engL;
		this.w_bride_engF = w_bride_engF;
		this.w_message_invite = w_message_invite;
		this.w_message_bye = w_message_bye;
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

	public String getW_groomL() {
		return w_groomL;
	}

	public void setW_groomL(String w_groomL) {
		this.w_groomL = w_groomL;
	}

	public String getW_groomF() {
		return w_groomF;
	}

	public void setW_groomF(String w_groomF) {
		this.w_groomF = w_groomF;
	}

	public String getW_groom_kanaL() {
		return w_groom_kanaL;
	}

	public void setW_groom_kanaL(String w_groom_kanaL) {
		this.w_groom_kanaL = w_groom_kanaL;
	}

	public String getW_groom_kanaF() {
		return w_groom_kanaF;
	}

	public void setW_groom_kanaF(String w_groom_kanaF) {
		this.w_groom_kanaF = w_groom_kanaF;
	}

	public String getW_groom_engL() {
		return w_groom_engL;
	}

	public void setW_groom_engL(String w_groom_engL) {
		this.w_groom_engL = w_groom_engL;
	}

	public String getW_groom_engF() {
		return w_groom_engF;
	}

	public void setW_groom_engF(String w_groom_engF) {
		this.w_groom_engF = w_groom_engF;
	}

	public String getW_brideL() {
		return w_brideL;
	}

	public void setW_brideL(String w_brideL) {
		this.w_brideL = w_brideL;
	}

	public String getW_brideF() {
		return w_brideF;
	}

	public void setW_brideF(String w_brideF) {
		this.w_brideF = w_brideF;
	}

	public String getW_bride_kanaL() {
		return w_bride_kanaL;
	}

	public void setW_bride_kanaL(String w_bride_kanaL) {
		this.w_bride_kanaL = w_bride_kanaL;
	}

	public String getW_bride_kanaF() {
		return w_bride_kanaF;
	}

	public void setW_bride_kanaF(String w_bride_kanaF) {
		this.w_bride_kanaF = w_bride_kanaF;
	}

	public String getW_bride_engL() {
		return w_bride_engL;
	}

	public void setW_bride_engL(String w_bride_engL) {
		this.w_bride_engL = w_bride_engL;
	}

	public String getW_bride_engF() {
		return w_bride_engF;
	}

	public void setW_bride_engF(String w_bride_engF) {
		this.w_bride_engF = w_bride_engF;
	}

	public String getW_message_invite() {
		return w_message_invite;
	}

	public void setW_message_invite(String w_message_invite) {
		this.w_message_invite = w_message_invite;
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