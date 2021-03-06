package com.tntxia.kingoa.finance.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;

import com.tntxia.kingoa.common.entity.PageVO;
import com.tntxia.kingoa.common.entity.PagingResult;
import com.tntxia.kingoa.finance.entity.InvoiceInHandled;
import com.tntxia.kingoa.finance.entity.InvoiceInHandledParamBean;
import com.tntxia.kingoa.finance.entity.InvoiceInHandling;
import com.tntxia.kingoa.finance.entity.InvoiceInHandlingParamBean;
import com.tntxia.kingoa.finance.entity.OrderTotal;
import com.tntxia.kingoa.utils.SQLServerUtil;

public class InvoiceInDao {
	
	private JdbcTemplate jdbcTemplate;
	  
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) { this.jdbcTemplate = jdbcTemplate; }
	
	@SuppressWarnings("rawtypes")
	public PagingResult<InvoiceInHandling> listHandling(InvoiceInHandlingParamBean paramBean, PageVO pageVO) {
		
		String strSQL;
		String coname = paramBean.getConame();
		String purchaseMan = paramBean.getPurchaseMan();
		String epro = paramBean.getEpro();
		String coNumber = paramBean.getCoNumber();
		String sub = paramBean.getSub();
		String sdate = paramBean.getSdate();
		String edate = paramBean.getEdate();
		
		String deptjb = paramBean.getDeptjb();
		String username = paramBean.getUsername();
		
		String whereSql = "";

		if (purchaseMan!=null && purchaseMan.length() > 0) {
			whereSql += " and payment.remark like '%" + purchaseMan + "%'";
		}
		
		String depts = paramBean.getDepts();
		if (depts!=null && depts.length() > 0) {
			whereSql += " and payment.wtfk = '"+depts+"'";
		}

		if (coname!=null && coname.length() > 0) {
		  whereSql += " and payment.supplier like '%"+coname+"%'";
		}

		if(epro!=null && epro.trim().length()>0){
			whereSql += " and  payment.contract in (select number from procure where id in (select ddid from cgpro where epro like '%"+epro+"%') )";
		}

		if (coNumber!=null && coNumber.length() > 0) {
		  whereSql += " and payment.contract like '%"+coNumber+"%'";
		}

		if (sub!=null && sub.length() > 0) {
		  whereSql += " and procure.sub like '%"+sub+"%'";
		}

		if(sdate!=null && sdate.trim().length()>0){
			whereSql += " and  payment.sjfkdate>='"+sdate+"'";
		}

		if(edate!=null && edate.trim().length()>0){
			whereSql += " and  payment.sjfkdate<='"+edate+"'";
		}

		whereSql += "  and payment.id not in (select payment_id from payment_invoice_in) and procure.rate = '增值发票13%'";

		boolean hasRight = paramBean.isHasViewRight();
		if (hasRight) {
			strSQL = "select count(*) from payment left outer join procure on payment.contract = procure.number  where  payment.wtfk like '"
					+ deptjb + "%'" + whereSql;
		} else
			strSQL = "select count(*) from payment left outer join procure on payment.contract = procure.number where payment.remark='"
					+ username + "'" + whereSql;
		 
		int total = jdbcTemplate.queryForInt(strSQL);
		pageVO.setTotal(total);

		String[] paymentItems = new String[]{"id", "orderform", "contract", "supplier", "sup_number", "remark", "moneyty", "htmoney", "sjfkdate", "states", "procure.rate"};
		String sqlItems = null;
		for(int i=0;i<paymentItems.length;i++) {
		  String item = paymentItems[i];
		  if (item.indexOf(".")==-1) {
		      item = "payment." + item;
		  }
		  if (sqlItems == null) {
		    sqlItems = item;
		  } else {
		    sqlItems += "," + item;
		  }
		}

		if(hasRight) {
			strSQL = "select "+sqlItems+", procure.sub from payment left outer join procure on payment.orderform = procure.id  where  payment.wtfk like '"+deptjb+"%' "+whereSql;
		} else
			strSQL = "select "+sqlItems+",procure.sub from payment left outer join procure on payment.orderform = procure.id where  payment.remark='"+username+"' "+whereSql;

		
		List list = jdbcTemplate.queryForList(SQLServerUtil.generatePagingSQL(strSQL, "payment.id desc", pageVO));
		List<InvoiceInHandling> data = new ArrayList<InvoiceInHandling>();
		for(int i = 0;i<list.size();i++) {
			Map map = (Map)list.get(i);
			InvoiceInHandling invoiceIn = new InvoiceInHandling();
			invoiceIn.setId((Integer) map.get("id"));
			invoiceIn.setContract((String) map.get("contract"));
			invoiceIn.setSub((String) map.get("sub"));
			invoiceIn.setCurrent((String) map.get("moneyty"));
			invoiceIn.setSupplier((String) map.get("supplier"));
			invoiceIn.setRate((String) map.get("rate"));
			invoiceIn.setPurchaseMan((String) map.get("remark"));
			String orderform = (String) map.get("orderform");
			OrderTotal orderTotal = this.getTotalAmountFromOrderPro(orderform);
			invoiceIn.setOrderAmount(orderTotal.getOrderAmount());
			invoiceIn.setWarehouseAmount(orderTotal.getWarehouseAmount());
			invoiceIn.setPaidAmount((BigDecimal) map.get("htmoney"));
			invoiceIn.setPayDate((String) map.get("sjfkdate"));
			data.add(invoiceIn);
		}
		
		PagingResult<InvoiceInHandling> res = new PagingResult<InvoiceInHandling>();
		res.setData(data);
		res.setPageVO(pageVO);
		return res;
		
	}
	
	@SuppressWarnings("rawtypes")
	public PagingResult<InvoiceInHandled> listHandled(InvoiceInHandledParamBean paramBean, PageVO pageVO) {
		
		String strSQL;
		String coname = paramBean.getConame();
		String purchaseMan = paramBean.getPurchaseMan();
		String epro = paramBean.getEpro();
		String coNumber = paramBean.getCoNumber();
		String sub = paramBean.getSub();
		String sdate = paramBean.getSdate();
		String edate = paramBean.getEdate();
		
		String deptjb = paramBean.getDeptjb();
		String username = paramBean.getUsername();
		
		String number = paramBean.getNumber();
		String memo = paramBean.getMemo();
		
		String whereSql = "";

		if (purchaseMan!=null && purchaseMan.length() > 0) {
			whereSql += " and remark like '%" + purchaseMan + "%'";
		}
		
		String depts = paramBean.getDepts();
		if (depts!=null && depts.length() > 0) {
			whereSql += " and wtfk = '"+depts+"'";
		}

		if (coname!=null && coname.length() > 0) {
		  whereSql += " and supplier like '%"+coname+"%'";
		}

		if(epro!=null && epro.trim().length()>0){
			whereSql += " and contract in (select number from procure where id in (select ddid from cgpro where epro like '%"+epro+"%') )";
		}

		if (coNumber!=null && coNumber.length() > 0) {
		  whereSql += " and contract like '%"+coNumber+"%'";
		}

		if (sub!=null && sub.length() > 0) {
		  whereSql += " and sub like '%"+sub+"%'";
		}

		if(sdate!=null && sdate.trim().length()>0){
			whereSql += " and receive_time >= '" + sdate + "'";
		}

		if(edate!=null && edate.trim().length()>0){
			whereSql += " and receive_time <= '"+edate+"'";
		}
		
		if(number!=null && number.trim().length()>0){
			whereSql += " and number like '%"+number+"%'";
		}
		
		if(memo!=null && memo.trim().length()>0){
			whereSql += " and memo like '%"+memo+"%'";
		}

		boolean hasRight = paramBean.isHasViewRight();
		if (hasRight) {
			strSQL = "select count(*) from invoice_in_view  where  wtfk like '"
					+ deptjb + "%'" + whereSql;
		} else
			strSQL = "select count(*) from invoice_in_view where remark='"
					+ username + "'" + whereSql;
		 
		int total = jdbcTemplate.queryForInt(strSQL);
		pageVO.setTotal(total);

		String[] items = new String[] {"id", "orderform", "contract", "sub", "supplier", "sup_number", "moneyty", "receive_time", "number", "amount", "memo"};
		String sqlItems = null;
		for(int i=0;i<items.length;i++) {
		  String item = items[i];
		  if (sqlItems == null) {
		    sqlItems = item;
		  } else {
		    sqlItems += "," + item;
		  }
		}

		if(hasRight) {
			strSQL = "select "+sqlItems+" from invoice_in_view  where wtfk like '"+deptjb+"%' "+whereSql;
		} else
			strSQL = "select "+sqlItems+" from invoice_in_view where remark='"+username+"' "+whereSql;

		
		List list = jdbcTemplate.queryForList(SQLServerUtil.generatePagingSQL(strSQL, "id desc", pageVO));
		List<InvoiceInHandled> data = new ArrayList<InvoiceInHandled>();
		for(int i = 0;i<list.size();i++) {
			Map map = (Map)list.get(i);
			InvoiceInHandled invoiceIn = new InvoiceInHandled();
			invoiceIn.setId((Integer) map.get("id"));
			invoiceIn.setContract((String) map.get("contract"));
			invoiceIn.setSub((String) map.get("sub"));
			invoiceIn.setCurrent((String) map.get("moneyty"));
			invoiceIn.setSupplier((String) map.get("supplier"));
			invoiceIn.setReceiveDate((String) map.get("receive_time"));
			invoiceIn.setNumber((String) map.get("number"));
			invoiceIn.setAmount((BigDecimal) map.get("amount"));
			invoiceIn.setMemo((String) map.get("memo"));
			data.add(invoiceIn);
		}
		
		PagingResult<InvoiceInHandled> res = new PagingResult<InvoiceInHandled>();
		res.setData(data);
		res.setPageVO(pageVO);
		return res;
		
	}
	
	// 获取订单的总价格
	@SuppressWarnings("rawtypes")
	public OrderTotal getTotalAmountFromOrderPro(String orderform) {
		OrderTotal total = new OrderTotal();
		String sql = "select sum(num*selljg) as stprice, sum(cgpro_num*selljg) as tprice from cgpro where  ddid='"+orderform+"'";
		Map map = jdbcTemplate.queryForMap(sql);
		BigDecimal orderAmount = (BigDecimal) map.get("stprice");
		BigDecimal warehouseAmount = (BigDecimal) map.get("tprice");
		total.setOrderAmount(orderAmount);
		total.setWarehouseAmount(warehouseAmount);
		return total;
	}
	
	public void delete(String id) {
		String sql = "delete from payment_invoice_in where id = " + id;
		jdbcTemplate.update(sql);
	}

}
