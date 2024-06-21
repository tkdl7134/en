package com.enmusubi.product;

public class WishListDTO {

	private int wl_no;
	private String wl_product;
	private int wl_price;
	private int e_no;
	
	
	public WishListDTO() {
		// TODO Auto-generated constructor stub
	
	}


	public WishListDTO(int wl_no, String wl_product, int wl_price, int e_no) {
		super();
		this.wl_no = wl_no;
		this.wl_product = wl_product;
		this.wl_price = wl_price;
		this.e_no = e_no;
	}


	public int getWl_no() {
		return wl_no;
	}


	public void setWl_no(int wl_no) {
		this.wl_no = wl_no;
	}


	public String getWl_product() {
		return wl_product;
	}


	public void setWl_product(String wl_product) {
		this.wl_product = wl_product;
	}


	public int getWl_price() {
		return wl_price;
	}


	public void setWl_price(int wl_price) {
		this.wl_price = wl_price;
	}


	public int getE_no() {
		return e_no;
	}


	public void setE_no(int e_no) {
		this.e_no = e_no;
	}

	
	

	
}
