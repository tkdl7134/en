package com.enmusubi.product;

public class SelectWishiDTO {
	private String eno;
	private String ef_fund;
	private String ef_send;
	private String m_id;
	private String link;
	public SelectWishiDTO() {
		// TODO Auto-generated constructor stub
	}
	public SelectWishiDTO(String eno, String ef_fund, String ef_send, String m_id, String link) {
		super();
		this.eno = eno;
		this.ef_fund = ef_fund;
		this.ef_send = ef_send;
		this.m_id = m_id;
		this.link = link;
	}
	public String getEno() {
		return eno;
	}
	public void setEno(String eno) {
		this.eno = eno;
	}
	public String getEf_fund() {
		return ef_fund;
	}
	public void setEf_fund(String ef_fund) {
		this.ef_fund = ef_fund;
	}
	public String getEf_send() {
		return ef_send;
	}
	public void setEf_send(String ef_send) {
		this.ef_send = ef_send;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	@Override
	public String toString() {
		return "SelectWishiDTO [eno=" + eno + ", ef_fund=" + ef_fund + ", ef_send=" + ef_send + ", m_id=" + m_id
				+ ", link=" + link + "]";
	}
	
}
