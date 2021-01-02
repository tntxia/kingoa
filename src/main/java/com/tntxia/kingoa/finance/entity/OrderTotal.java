package com.tntxia.kingoa.finance.entity;

import java.math.BigDecimal;

public class OrderTotal {
	
	// 订单总金额
	private BigDecimal orderAmount;
	
	// 入库总金额
	private BigDecimal warehouseAmount;

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
	
	

}
