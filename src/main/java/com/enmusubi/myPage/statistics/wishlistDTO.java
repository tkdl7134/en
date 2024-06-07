package com.enmusubi.myPage.statistics;

import java.util.Date;

public class wishlistDTO {

	private int w_no;
	private String w_product;
	private int w_price;
	private int e_no;
	private String w_comment;
	private Date w_date;
	public wishlistDTO() {
		// TODO Auto-generated constructor stub
	}

	public wishlistDTO(int w_no, String w_product, int w_price, int e_no, String w_comment, Date w_date) {
		super();
		this.w_no = w_no;
		this.w_product = w_product;
		this.w_price = w_price;
		this.e_no = e_no;
		this.w_comment = w_comment;
		this.w_date = w_date;
		
	}

	public int getW_no() {
		return w_no;
	}

	public void setW_no(int w_no) {
		this.w_no = w_no;
	}

	public String getW_product() {
		return w_product;
	}

	public void setW_product(String w_product) {
		this.w_product = w_product;
	}

	public int getW_price() {
		return w_price;
	}

	public void setW_price(int w_price) {
		this.w_price = w_price;
	}

	public int getE_no() {
		return e_no;
	}

	public void setE_no(int e_no) {
		this.e_no = e_no;
	}

	public String getW_comment() {
		return w_comment;
	}

	public void setW_comment(String w_comment) {
		this.w_comment = w_comment;
	}
	
	public Date getW_date() {
		return w_date;
	}

	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}

	@Override
	public String toString() {
		return "wishlistDTO [w_no=" + w_no + ", w_product=" + w_product + ", w_price=" + w_price + ", e_no=" + e_no
				+ ", w_comment=" + w_comment + ", w_date=" + w_date + "]";
	}

	
	
}
