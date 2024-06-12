package com.enmusubi.funding;

public class ModalSetDTO {
	private String wl_no;
	private String wl_price;
	private String payed;
	private String percent;
	private String wl_product;
	
	public ModalSetDTO() {
		// TODO Auto-generated constructor stub
	}

	public ModalSetDTO(String wl_no, String wl_price, String payed, String percent, String wl_product) {
		super();
		this.wl_no = wl_no;
		this.wl_price = wl_price;
		this.payed = payed;
		this.percent = percent;
		this.wl_product = wl_product;
	}

	public String getWl_no() {
		return wl_no;
	}

	public void setWl_no(String wl_no) {
		this.wl_no = wl_no;
	}

	public String getWl_price() {
		return wl_price;
	}

	public void setWl_price(String wl_price) {
		this.wl_price = wl_price;
	}

	public String getPayed() {
		return payed;
	}

	public void setPayed(String payed) {
		this.payed = payed;
	}

	public String getPercent() {
		return percent;
	}

	public void setPercent(String percent) {
		this.percent = percent;
	}

	public String getProduct() {
		return wl_product;
	}

	public void setProduct(String product) {
		this.wl_product = product;
	}
	
	
}
