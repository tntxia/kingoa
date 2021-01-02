package com.tntxia.kingoa.finance.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;

import com.tntxia.db.DBConnection;
import com.tntxia.kingoa.common.entity.PageVO;
import com.tntxia.kingoa.common.entity.PagingResult;
import com.tntxia.kingoa.finance.dao.InvoiceInDao;
import com.tntxia.kingoa.finance.entity.InvoiceIn;
import com.tntxia.kingoa.finance.entity.InvoiceInParamBean;
import com.tntxia.kingoa.utils.DateUtil;
import com.tntxia.kingoa.utils.WebUtils;
import com.tntxia.oa.system.entity.UserInfo;
import com.tntxia.oa.util.CommonAction;

public class InvoiceInAction extends CommonAction {
	
	public static Logger logger = Logger.getLogger(DBConnection.class);
	
	private InvoiceInDao invoiceInDao;
	
	public void setInvoiceInDao(InvoiceInDao invoiceInDao) {
		this.invoiceInDao = invoiceInDao;
	}
	
	/**
	 *   未处理列表
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView listHandling(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String startDate = "2020-11-01";
		String currentDate = DateUtil.getCurrentDateStr();
			
		InvoiceInParamBean param = new InvoiceInParamBean();
		String depts = request.getParameter("depts");
		param.setDepts(depts);
		String coname = WebUtils.unescape(request.getParameter("coname"));
		param.setConame(coname);
		String cg_man = WebUtils.unescape(request.getParameter("cg_man"));
		param.setPurchaseMan(cg_man);
		String coNumber=request.getParameter("co_number");
		param.setCoNumber(coNumber);
		String sub=request.getParameter("sub");
		param.setSub(sub);
		String epro=request.getParameter("epro");
		param.setEpro(epro);
		String sdate=request.getParameter("sdate");
		if(sdate==null || sdate.trim().length() == 0)
			sdate = startDate;
		param.setSdate(sdate);
		String edate=request.getParameter("edate");
		if(sdate==null || sdate.trim().length() == 0)
			sdate = startDate;
		if(edate==null || edate.trim().length() == 0)
			edate = currentDate;
		
		boolean hasRight = WebUtils.hasRight(request, "fkview");
		param.setHasViewRight(hasRight);
		
		int intPageSize = 50;
		int intPage = 1;
		String strPage = request.getParameter("page");
		if(strPage==null){
			intPage = 1;
		} else{
			intPage = java.lang.Integer.parseInt(strPage);
			if(intPage<1) intPage = 1; 
		}
		
		UserInfo userInfo = WebUtils.getUserInfo(request);
		param.setDeptjb(userInfo.getDeptjb());
		param.setUsername(userInfo.getUsername());
		
		PageVO pageVO = new PageVO();
		pageVO.setPage(intPage);
		pageVO.setPageSize(intPageSize);
		
		PagingResult<InvoiceIn> res = invoiceInDao.listHandling(param, pageVO);
		WebUtils.writeJson(response, res);
		return null;
	}
	
	/**
	 * 已处理列表
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView listHandled(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		InvoiceInParamBean param = new InvoiceInParamBean();
		String depts = request.getParameter("depts");
		param.setDepts(depts);
		String coname = WebUtils.unescape(request.getParameter("coname"));
		param.setConame(coname);
		String cg_man = WebUtils.unescape(request.getParameter("cg_man"));
		param.setPurchaseMan(cg_man);
		String coNumber=request.getParameter("co_number");
		param.setCoNumber(coNumber);
		String sub=request.getParameter("sub");
		param.setSub(sub);
		String epro=request.getParameter("epro");
		param.setEpro(epro);
		String sdate=request.getParameter("sdate");
		param.setSdate(sdate);
		String edate=request.getParameter("edate");
		param.setEdate(edate);
		
		boolean hasRight = WebUtils.hasRight(request, "fkview");
		param.setHasViewRight(hasRight);
		
		UserInfo userInfo = WebUtils.getUserInfo(request);
		param.setDeptjb(userInfo.getDeptjb());
		param.setUsername(userInfo.getUsername());
		
		PageVO pageVO = WebUtils.getPageVO(request);
		
		PagingResult<InvoiceIn> res = invoiceInDao.listHandled(param, pageVO);
		WebUtils.writeJson(response, res);
		return null;
	}
	
}
