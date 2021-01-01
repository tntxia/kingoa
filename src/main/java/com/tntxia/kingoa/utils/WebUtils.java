package com.tntxia.kingoa.utils;

import com.alibaba.fastjson.JSON;
import com.tntxia.oa.system.entity.UserInfo;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WebUtils {
	public static boolean isLogin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		return (username != null);
	}

	public static boolean isNoLogin(HttpServletRequest request) {
		return !isLogin(request);
	}

	public static UserInfo getUserInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String dept = (String) session.getAttribute("dept");
		String username = (String) session.getAttribute("username");
		String restrain_name = (String) session.getAttribute("restrain_name");
		Integer restrainId = (Integer) session.getAttribute("restrainId");
		String deptjb = (String) session.getAttribute("deptjb");

		UserInfo userInfo = new UserInfo();
		userInfo.setDept(dept);
		userInfo.setDeptjb(deptjb);
		userInfo.setUsername(username);
		userInfo.setRestrain_name(restrain_name);
		if (restrainId != null)
			userInfo.setRestrainId(restrainId.intValue());
		return userInfo;
	}

	public static boolean isAdminLogin(HttpServletRequest request) {
		HttpSession session = request.getSession();

		String adminname = (String) session.getAttribute("adminname");
		String username = (String) session.getAttribute("username");
		if ("admin".equals(username)) {
			adminname = username;
			session.setAttribute("adminname", username);
			return true;
		}
		return (adminname != null && adminname.equals("admin"));
	}

	public static boolean isNoAdminLogin(HttpServletRequest request) {
		return !isAdminLogin(request);
	}

	public static void writeJson(HttpServletResponse response, Object result) throws IOException {
		String json = JSON.toJSONString(result);
		response.setContentType("text/json");
		response.getWriter().print(json);
	}

	public static String unescape(String src) {
		StringBuffer tmp = new StringBuffer();
		tmp.ensureCapacity(src.length());
		int lastPos = 0, pos = 0;
		char ch;
		while (lastPos < src.length()) {
			pos = src.indexOf("%", lastPos);
			if (pos == lastPos) {
				if (src.charAt(pos + 1) == 'u') {
					ch = (char) Integer.parseInt(src.substring(pos + 2, pos + 6), 16);
					tmp.append(ch);
					lastPos = pos + 6;
				} else {
					ch = (char) Integer.parseInt(src.substring(pos + 1, pos + 3), 16);
					tmp.append(ch);
					lastPos = pos + 3;
				}
			} else {
				if (pos == -1) {
					tmp.append(src.substring(lastPos));
					lastPos = src.length();
				} else {
					tmp.append(src.substring(lastPos, pos));
					lastPos = pos;
				}
			}
		}
		return tmp.toString();
	}
	
	@SuppressWarnings("unchecked")
	public static boolean hasRight(HttpServletRequest request, String right) {
		HttpSession session = request.getSession();
		List<String> rightList = (List<String>) session.getAttribute("userRightList");
		boolean res = false;
		for(String r : rightList) {
			if (r.equals(right)) {
				res = true;
			}
		}
		return res;
	}
}
