package com.everyparking.user.api.kakaopay.vo;

public class Amount {

	private int total;
	private int tax_free;
	private int discount;
	
	public Amount() {
		super();
	}
	public Amount(int total, int tax_free, int discount) {
		super();
		this.total = total;
		this.tax_free = tax_free;
		this.discount = discount;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getTax_free() {
		return tax_free;
	}
	public void setTax_free(int tax_free) {
		this.tax_free = tax_free;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	
	
}
