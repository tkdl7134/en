package com.enmusubi.funding;

public class FundListDTO {
	private String wl_no;
	private String wl_product;
	private String wl_price;
	private String e_no;
	private String wl_comment;
	
	public FundListDTO() {
		// TODO Auto-generated constructor stub
	}

	public FundListDTO(String wl_no, String wl_product, String wl_price, String e_no, String wl_comment) {
		super();
		this.wl_no = wl_no;
		this.wl_product = wl_product;
		this.wl_price = wl_price;
		this.e_no = e_no;
		this.wl_comment = wl_comment;
	}

	public String getWl_no() {
		return wl_no;
	}

	public void setWl_no(String wl_no) {
		this.wl_no = wl_no;
	}

	public String getWl_product() {
		return wl_product;
	}

	public void setWl_product(String wl_product) {
		this.wl_product = wl_product;
	}

	public String getWl_price() {
		return wl_price;
	}

	public void setWl_price(String wl_price) {
		this.wl_price = wl_price;
	}

	public String getE_no() {
		return e_no;
	}

	public void setE_no(String e_no) {
		this.e_no = e_no;
	}

	public String getWl_comment() {
		return wl_comment;
	}

	public void setWl_comment(String wl_comment) {
		this.wl_comment = wl_comment;
	}

	@Override
	public String toString() {
		return "FundListDTO [wl_no=" + wl_no + ", wl_product=" + wl_product + ", wl_price=" + wl_price + ", e_no="
				+ e_no + ", wl_comment=" + wl_comment + "]";
	}
	
}
