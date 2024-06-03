package com.enmusubi.member;

public class MemberDTO {
	private String mId;
	private String mPw;
	private String mName;
	private String mNameKana;
	private String mBirth;
	private String mGender;
	private String mPostalCode;
	private String mPrefecture;
	private String mCity;
	private String mAddress;
	private String mBuilding;
	private String mEmail;
	private String mRegdate;
	private String mImg;
	private String mPhone;
	private String mBirthdate;

	// コンストラクタ
	public MemberDTO() {
	}

	public MemberDTO(String mId, String mPw, String mName, String mNameKana, String mBirth, String mGender,
			String mPostalCode, String mPrefecture, String mCity, String mAddress, String mBuilding, String mEmail,
			String mRegdate, String mImg, String mPhone, String mBirthdate) {
		super();
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mNameKana = mNameKana;
		this.mBirth = mBirth;
		this.mGender = mGender;
		this.mPostalCode = mPostalCode;
		this.mPrefecture = mPrefecture;
		this.mCity = mCity;
		this.mAddress = mAddress;
		this.mBuilding = mBuilding;
		this.mEmail = mEmail;
		this.mRegdate = mRegdate;
		this.mImg = mImg;
		this.mPhone = mPhone;
		this.mBirthdate = mBirthdate;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmNameKana() {
		return mNameKana;
	}

	public void setmNameKana(String mNameKana) {
		this.mNameKana = mNameKana;
	}

	public String getmBirth() {
		return mBirth;
	}

	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}

	public String getmGender() {
		return mGender;
	}

	public void setmGender(String mGender) {
		this.mGender = mGender;
	}

	public String getmPostalCode() {
		return mPostalCode;
	}

	public void setmPostalCode(String mPostalCode) {
		this.mPostalCode = mPostalCode;
	}

	public String getmPrefecture() {
		return mPrefecture;
	}

	public void setmPrefecture(String mPrefecture) {
		this.mPrefecture = mPrefecture;
	}

	public String getmCity() {
		return mCity;
	}

	public void setmCity(String mCity) {
		this.mCity = mCity;
	}

	public String getmAddress() {
		return mAddress;
	}

	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}

	public String getmBuilding() {
		return mBuilding;
	}

	public void setmBuilding(String mBuilding) {
		this.mBuilding = mBuilding;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmRegdate() {
		return mRegdate;
	}

	public void setmRegdate(String mRegdate) {
		this.mRegdate = mRegdate;
	}

	public String getmImg() {
		return mImg;
	}

	public void setmImg(String mImg) {
		this.mImg = mImg;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmBirthdate() {
		return mBirthdate;
	}

	public void setmBirthdate(String mBirthdate) {
		this.mBirthdate = mBirthdate;
	}

	@Override
	public String toString() {
		return "MemberDTO [mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mNameKana=" + mNameKana + ", mBirth="
				+ mBirth + ", mGender=" + mGender + ", mPostalCode=" + mPostalCode + ", mPrefecture=" + mPrefecture
				+ ", mCity=" + mCity + ", mAddress=" + mAddress + ", mBuilding=" + mBuilding + ", mEmail=" + mEmail
				+ ", mRegdate=" + mRegdate + ", mImg=" + mImg + ", mPhone=" + mPhone + ", mBirthdate=" + mBirthdate
				+ "]";
	}

	public char[] toJSON() {
		// TODO Auto-generated method stub
		return null;
	}

}