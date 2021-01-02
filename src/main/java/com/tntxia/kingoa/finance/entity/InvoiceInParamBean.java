package com.tntxia.kingoa.finance.entity;

public class InvoiceInParamBean {
	
	// 部门
	private String depts;
	
	// 供应商
	private String coname;
	
	// 供应商编号
	private String coNumber;
	
	// 采购人员
	private String purchaseMan;
	
	// 销售编号
	private String sub;
	
	// 产品型号
	private String epro;
	
	// 开始时间
	private String sdate;
	
	// 结束时间
	private String edate;
	
	// 用户是否有查看部门信息的权限
	private boolean hasViewRight;
	
	private String deptjb;
	
	private String username;
	
	

	public String getDepts() {
		return depts;
	}

	public void setDepts(String depts) {
		this.depts = depts;
	}

	public String getConame() {
		return coname;
	}

	public void setConame(String coname) {
		this.coname = coname;
	}

	public String getCoNumber() {
		return coNumber;
	}

	public void setCoNumber(String coNumber) {
		this.coNumber = coNumber;
	}

	public String getPurchaseMan() {
		return purchaseMan;
	}

	public void setPurchaseMan(String purchaseMan) {
		this.purchaseMan = purchaseMan;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public String getEpro() {
		return epro;
	}

	public void setEpro(String epro) {
		this.epro = epro;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public boolean isHasViewRight() {
		return hasViewRight;
	}

	public void setHasViewRight(boolean hasViewRight) {
		this.hasViewRight = hasViewRight;
	}

	public String getDeptjb() {
		return deptjb;
	}

	public void setDeptjb(String deptjb) {
		this.deptjb = deptjb;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
