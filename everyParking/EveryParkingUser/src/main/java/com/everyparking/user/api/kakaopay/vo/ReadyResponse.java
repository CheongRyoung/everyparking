package com.everyparking.user.api.kakaopay.vo;

public class ReadyResponse {
	
	private String tid;
	private String next_redirect_pc_url;
	private String partner_order_id;
	
	
	public ReadyResponse() {
		super();
	}
	
	public ReadyResponse(String tid, String next_redirect_pc_url, String partner_order_id) {
		super();
		this.tid = tid;
		this.next_redirect_pc_url = next_redirect_pc_url;
		this.partner_order_id = partner_order_id;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}

	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}

	public String getPartner_order_id() {
		return partner_order_id;
	}

	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}
	
	
}
