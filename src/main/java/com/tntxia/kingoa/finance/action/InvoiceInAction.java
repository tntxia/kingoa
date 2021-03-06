package com.tntxia.kingoa.finance.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;

import com.tntxia.db.DBConnection;
import com.tntxia.kingoa.common.entity.CommonResult;
import com.tntxia.kingoa.common.entity.PageVO;
import com.tntxia.kingoa.common.entity.PagingResult;
import com.tntxia.kingoa.finance.dao.InvoiceInDao;
import com.tntxia.kingoa.finance.entity.InvoiceInHandled;
import com.tntxia.kingoa.finance.entity.InvoiceInHandledParamBean;
import com.tntxia.kingoa.finance.entity.InvoiceInHandling;
import com.tntxia.kingoa.finance.entity.InvoiceInHandlingParamBean;
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
			
		InvoiceInHandlingParamBean param = new InvoiceInHandlingParamBean();
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
		
		UserInfo userInfo = WebUtils.getUserInfo(request);
		param.setDeptjb(userInfo.getDeptjb());
		param.setUsername(userInfo.getUsername());
		
		PageVO pageVO = WebUtils.getPageVO(request);
		
		PagingResult<InvoiceInHandling> res = invoiceInDao.listHandling(param, pageVO);
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
		
		InvoiceInHandledParamBean param = new InvoiceInHandledParamBean();
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
		String number = request.getParameter("number");
		param.setNumber(number);
		String memo = request.getParameter("memo");
		param.setMemo(memo);
		
		boolean hasRight = WebUtils.hasRight(request, "fkview");
		param.setHasViewRight(hasRight);
		
		UserInfo userInfo = WebUtils.getUserInfo(request);
		param.setDeptjb(userInfo.getDeptjb());
		param.setUsername(userInfo.getUsername());
		
		PageVO pageVO = WebUtils.getPageVO(request);
		
		PagingResult<InvoiceInHandled> res = invoiceInDao.listHandled(param, pageVO);
		WebUtils.writeJson(response, res);
		return null;
	}
	
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		invoiceInDao.delete(id);
		CommonResult res = new CommonResult();
		res.setSuccess(true);
		WebUtils.writeJson(response, res);
		return null;
	}
	
}
