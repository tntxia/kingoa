package com.tntxia.kingoa.finance.entity;

import java.math.BigDecimal;

public class InvoiceInHandled {
	
	private int id;
	
	// 采购订单号
	private String contract;
	
	// 销售订单号
	private String sub;
	
	// 供应商
	private String supplier;
	
	// 收到时间
	private String receiveDate;
	
	// 票据号
	private String number;
	
	// 金额
	private BigDecimal amount;
	
	// 备注
	private String memo;
	
	// 货币类型
	private String current;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContract() {
		return contract;
	}

	public void setContract(String contract) {
		this.contract = contract;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	
	public String getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(String receiveDate) {
		this.receiveDate = receiveDate;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getCurrent() {
		return current;
	}

	public void setCurrent(String current) {
		this.current = current;
	}
	
	

}
