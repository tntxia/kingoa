package com.tntxia.kingoa.login.action;

import com.tntxia.kingoa.login.dao.LoginDao;
import com.tntxia.oa.system.dao.DepartmentDao;
import com.tntxia.oa.system.dao.RightDao;
import com.tntxia.oa.system.dao.SystemDao;
import com.tntxia.oa.system.dao.UserDao;
import com.tntxia.oa.system.entity.Department;
 import com.tntxia.oa.system.entity.Restrain;
 import com.tntxia.oa.system.entity.RestrainGP;
 import com.tntxia.oa.system.entity.Right;
 import com.tntxia.oa.system.entity.SystemInfo;
 import com.tntxia.oa.system.entity.User;
 import java.text.SimpleDateFormat;
 import java.util.ArrayList;
 import java.util.Date;
 import java.util.HashMap;
 import java.util.List;
 import java.util.Map;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;
 import javax.servlet.http.HttpSession;
 import org.apache.log4j.Logger;
 import org.springframework.web.servlet.ModelAndView;
 import org.springframework.web.servlet.mvc.Controller;

public class LoginAction implements Controller
{
	private Logger logger = Logger.getLogger(getClass());
	private UserDao userDao;

	private LoginDao loginDao;

	private SystemDao systemDao;
	
	private DepartmentDao departmentDao;
	
	private RightDao rightDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}

	public void setSystemDao(SystemDao systemDao) {
		this.systemDao = systemDao;
	}

	
	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	
	public void setRightDao(RightDao rightDao) {
		this.rightDao = rightDao;
	}

	private ModelAndView getErrorResult(String username, String msg) {
		this.logger.info("用户" + username + "登陆失败,用户不存在 !");
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", Boolean.valueOf(false));
		result.put("message", msg);
		result.put("clickAndJump", "javascript:window.history.back()");
		result.put("clickAndJumpLabel", "返回");
		return new ModelAndView("common/result", result);
	}

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse arg1) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();

		String username = null;
		if (request.getParameter("user_id") == null) {
			return getErrorResult(username, "请输入登录名！");
		}

		username = request.getParameter("user_id").trim();

		HttpSession session = request.getSession(true);
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd-HH-mm");
		String currentDate = simple.format(new Date());
		String q_company = "";

		SystemInfo systemInfo = this.systemDao.getSystemInfo();
		q_company = systemInfo.getCompanyName();

		String pwd1 = request.getParameter("password");

		boolean existFlag = this.userDao.checkUserExist(username);

		if (!existFlag) {
			return getErrorResult(username, "用户不存在 !");
		}

		User user = this.userDao.getUser(username);

		if (user.getErrCount() >= 3) {
			return getErrorResult(username, "该用户被锁定(三次错误输入密码,将被锁定),请与系统管理员联系!");
		}

		String host = request.getRemoteHost();
		int nameid = user.getId();
		boolean ipbd = user.isIpBind();

		if (user.getPassword().equals(pwd1)) {

			if (ipbd && !host.equals(user.getIp())) {
				return getErrorResult(username, "用户登陆的IP检验失败，请使用办公电脑登陆！");
			
			}
		}else {
			
			if (nameid != 0) {
				this.userDao.addUserErrorCount(nameid);
			}
			return getErrorResult(username, "用户登陆的密码错误");
		}
		
		String name1 = user.getName();
		String ename = user.getNameEn();
		String role = user.getPosition();
		int restrainId = user.getRestrainId();
		
		Restrain restrain = this.rightDao.getRestrain(restrainId);
		
		String restrain_name = restrain.getName();
		
		String Remoteadd = request.getRemoteAddr();
		String Sername = request.getServerName();
		
		this.userDao.resetUserErrCount(nameid);
		
		int departId = user.getDepartmentId();
		
		Department depart = this.departmentDao.getDepartment(departId);
		
		session.setAttribute("ecompany", q_company);
		session.setAttribute("Remotehost", host);
		session.setAttribute("Remoteadd", Remoteadd);
		session.setAttribute("Sername", Sername);
		session.setAttribute("currentDate", currentDate);
		session.setAttribute("ename", ename);
		session.setAttribute("role", role);
		session.setAttribute("username", name1);
		session.setAttribute("loginSign", "OK");
		session.setAttribute("login_message", "");
		session.setAttribute("restrainId", Integer.valueOf(restrainId));
		session.setAttribute("restrain_name", restrain_name);
		String dept = depart.getName();
		String deptjb = depart.getDepartCode();
		if (depart != null) {
		 session.setAttribute("dept", dept);
		 session.setAttribute("deptjb", deptjb);
		 }
		
		List<Right> rightList = this.rightDao.getRightListByRoleId(restrainId);
		
		List<String> userRightList = new ArrayList<String>();
		
		for (Right right : rightList) {
		 userRightList.add(right.getRightName());
		}
		
		List<RestrainGP> restrainGPList = this.rightDao.getRestrainGP(restrain_name);
		
		session.setAttribute("restrainGPList", restrainGPList);
		
		userRightList.addAll(this.rightDao.getRestrainListById(restrainId));
		
		session.setAttribute("userRightList", userRightList);

		loginDao.addLog(name1, restrain.getName(), dept, deptjb, host);

		return new ModelAndView("einfocrm", result);
	}
}
