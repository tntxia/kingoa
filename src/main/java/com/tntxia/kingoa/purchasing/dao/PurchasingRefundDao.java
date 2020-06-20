package com.tntxia.kingoa.purchasing.dao;

import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;

import com.tntxia.kingoa.purchasing.entity.RefundProduct;

public class PurchasingRefundDao {

	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@SuppressWarnings("rawtypes")
	public Map getRefund(Integer id) {
		return this.getRefund(String.valueOf(id));
	}

	@SuppressWarnings("rawtypes")
	public Map getRefund(String id) {
		String sql = "select * from th_table_supplier where id = ?";
		Map res = this.jdbcTemplate.queryForMap(sql, new String[] { id });
		return res;
	}
	
	@SuppressWarnings("rawtypes")
	public RefundProduct getProductById(int id) {
		String sql = "select * from th_pro_supplier where id = ?";
		Map purchasingRefundProduct = this.jdbcTemplate.queryForMap(sql, new Object[] { Integer.valueOf(id) });
		RefundProduct result = new RefundProduct();
		result.setEpro((String) purchasingRefundProduct.get("epro"));
		result.setCpro((String) purchasingRefundProduct.get("cpro"));
		result.setNum(((Integer) purchasingRefundProduct.get("num")).intValue());
		result.setPurchasingNumber((String) purchasingRefundProduct.get("cg_number"));
		result.setDdid((Integer) purchasingRefundProduct.get("ddid"));
		return result;
	}

}
