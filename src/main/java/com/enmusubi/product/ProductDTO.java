package com.enmusubi.product;

public class ProductDTO {
	private int t_pk;
	private String t_name;
	private String t_preview;
	private String t_example;
	private String t_template;
	
	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public ProductDTO(int t_pk, String t_name, String t_preview, String t_example, String t_template) {
		super();
		this.t_pk = t_pk;
		this.t_name = t_name;
		this.t_preview = t_preview;
		this.t_example = t_example;
		this.t_template = t_template;
	}

	public int getT_pk() {
		return t_pk;
	}

	public void setT_pk(int t_pk) {
		this.t_pk = t_pk;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
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

	@Override
	public String toString() {
		return "productDTO [t_pk=" + t_pk + ", t_name=" + t_name + ", t_preview=" + t_preview + ", t_example="
				+ t_example + ", t_template=" + t_template + "]";
	} 
	
	
}
