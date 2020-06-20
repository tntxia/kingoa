package com.tntxia.kingoa.login.dao;


import org.springframework.jdbc.core.JdbcTemplate;

public class LoginDao {
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public void addLog(String name, String restrain, String dept, String deptjb, String host) {
		String sql = "insert into logdate(log_name,log_qxz,log_dept,log_deptjb,log_chost,log_datetime) values(?, ?, ?, ?, ?, getdate())";
		this.jdbcTemplate.update(sql, new Object[] { name, restrain, dept, deptjb, host });
	}
}
