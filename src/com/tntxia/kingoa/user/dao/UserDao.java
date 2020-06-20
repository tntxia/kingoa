package com.tntxia.kingoa.user.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;

import com.tntxia.oa.system.entity.User;

public class UserDao {

	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@SuppressWarnings("rawtypes")
	private User getUserFromMap(Map map) throws SQLException {
		User res = new User();
		res.setId(((Integer) map.get("nameid")).intValue());
		res.setSex((String) map.get("sex"));
		res.setName((String) map.get("name"));
		res.setNameEn((String) map.get("name_en"));
		res.setPassword((String) map.get("password"));
		res.setErrCount(((Integer) map.get("err")).intValue());
		String ipbind = (String) map.get("ipbd");
		if (ipbind.trim().equals("��")) {
			res.setIpBind(true);
		} else {
			res.setIpBind(false);
		}
		res.setPosition((String) map.get("workj"));
		res.setDepartmentId(((Integer) map.get("department_id")).intValue());
		res.setRestrainId(((Integer) map.get("restrain_id")).intValue());
		res.setRestrainName((String) map.get("userdate"));
		res.setEmail((String) map.get("email"));
		res.setEmailUser((String) map.get("mail_user"));
		res.setEmailPassword((String) map.get("mail_password"));
		res.setEmailStmp((String) map.get("mail_smtp"));
		res.setTel((String) map.get("worktel"));
		String ip = (String) map.get("user_ip");

		res.setIp(ip);
		return res;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<User> getSaleUserList(String departmentName) {
		String sql = "select * from username ";

		String sqlWhere = " where ";
		if (departmentName == null) {
			sqlWhere += " (yjxs='销售部' or yjxs='销售二部' or yjxs='总经办')";
		} else {
			sqlWhere += " yjxs='" + departmentName + "'";
		}

		List<Object> list = this.jdbcTemplate.queryForList(sql + sqlWhere);

		List<User> res = new ArrayList<User>();

		try {
			for (int i = 0; i < list.size(); i++) {
				Map map = (Map) list.get(i);
				User user = getUserFromMap(map);
				res.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return res;
	}

}
