package com.tntxia.kingoa.common.factory;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Calendar;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

public class NumberFactory {
	
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public String generateNumber(String type) {
		
		Calendar now = Calendar.getInstance();
		Integer year = now.get(Calendar.YEAR);
		Integer month = now.get(Calendar.MONTH);
	
		synchronized (year) {
			String sql = "select  last_no from number_factory_store where year = ? and month=? and type=?";
			Integer lastNo = 0;
			boolean exist = true;
			try {
				lastNo = jdbcTemplate.queryForInt(sql, new Object[] {year, month, type});
			} catch(EmptyResultDataAccessException emptyEx) {
				exist = false;
			}
			
			Integer no = lastNo + 1;
			if (exist) {
				sql = "update number_factory_store set last_no = ? where year = ? and month=? and type=?";
				jdbcTemplate.update(sql, new Object[] {no,year, month, type});
			} else {
				sql = "insert into number_factory_store(year, month, type, last_no) values(?, ?, ?, ?)";
				jdbcTemplate.update(sql, new Object[] {year, month, type, no});
			}
			
			NumberFormat nf = new DecimalFormat("000000");
			String res = type + nf.format(no);
			return res;
		}
		
	}
	
	public static void main(String[] args) {
		NumberFormat nf = new DecimalFormat("000000");
		String res = nf.format(1);
		System.out.println(res);
	}

}
