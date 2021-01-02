package com.tntxia.kingoa.common.entity;

public class PageVO {
	
	private int page = 1;
	
	private int pageSize = 5;
	
	private Integer total;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}
	
	public int getEnd() {
		int end = this.getStart() + this.pageSize - 1;
		return end;
	}

	public int getStart() {
		return (this.page - 1) * this.pageSize + 1;
	}
	
	public int getTotalPage() {
		int res = total / pageSize + (total % pageSize == 0 ? 0 : 1);
		return res;
	}

}
