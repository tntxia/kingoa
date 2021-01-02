package com.tntxia.kingoa.finance.entity;

import java.math.BigDecimal;

public class InvoiceInHandling {
	
	private int id;
	
	// 采购订单号
	private String contract;
	
	// 销售订单号
	private String sub;
	
	// 供应商
	private String supplier;
	
	// 发票
	private String rate;
	
	// 采购员
	private String purchaseMan;
	
	// 订单金额
	private BigDecimal orderAmount;
	
	// 入库金额
	private BigDecimal warehouseAmount;
	
	// 实付金额
	private BigDecimal paidAmount;
	
	// 付款日期
	private String payDate;
	
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

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getPurchaseMan() {
		return purchaseMan;
	}

	public void setPurchaseMan(String purchaseMan) {
		this.purchaseMan = purchaseMan;
	}

	public BigDecimal getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(BigDecimal orderAmount) {
		this.orderAmount = orderAmount;
	}

	public BigDecimal getWarehouseAmount() {
		return warehouseAmount;
	}

	public void setWarehouseAmount(BigDecimal warehouseAmount) {
		this.warehouseAmount = warehouseAmount;
	}

	public BigDecimal getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(BigDecimal paidAmount) {
		this.paidAmount = paidAmount;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public String getCurrent() {
		return current;
	}

	public void setCurrent(String current) {
		this.current = current;
	}
	
	

}
