package com.tntxia.kingoa.common.entity;

import java.util.List;

public class PagingResult<T> {
	
	private PageVO pageVO;
	
	private List<T> data;

	public PageVO getPageVO() {
		return pageVO;
	}

	public void setPageVO(PageVO pageVO) {
		this.pageVO = pageVO;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}
	
	

}
