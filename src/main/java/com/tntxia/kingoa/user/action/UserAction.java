package com.tntxia.kingoa.user.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.alibaba.fastjson.JSON;
import com.tntxia.kingoa.user.dao.UserDao;
import com.tntxia.oa.system.dao.DepartmentDao;
import com.tntxia.oa.system.entity.Department;
import com.tntxia.oa.system.entity.User;

public class UserAction extends MultiActionController{
	
	private DepartmentDao departmentDao;
	  private UserDao userDao2;
	  
	  public void setDepartmentDao(DepartmentDao departmentDao) { this.departmentDao = departmentDao; }


	  
	  public void setUserDao2(UserDao userDao) { this.userDao2 = userDao; }

	
	public ModelAndView listSale(HttpServletRequest request, HttpServletResponse arg1) throws Exception {
	    String departmentId = request.getParameter("departmentId");
	    
	    String departmentName = null;
	    
	    if (departmentId != null) {
	      Department dept = this.departmentDao.getDepartment(Integer.parseInt(departmentId));
	      departmentName = dept.getName();
	    } 
	    
	    List<User> userList = this.userDao2.getSaleUserList(departmentName);
	    
	    String json = JSON.toJSONString(userList);
	    
	    Map<String, Object> result = new HashMap<String, Object>();
	    result.put("result", json);
	    
	    return new ModelAndView("common/resultAjax", result);
	  }

}
