 package com.tntxia.kingoa.finance.action;
 
 import com.tntxia.db.DBConnection;
 import com.tntxia.db.DBUtil;
 import com.tntxia.oa.finance.dao.FinanceDao;
 import com.tntxia.oa.finance.entity.CreditDebit;
 import com.tntxia.oa.finance.entity.Gathering;
 import com.tntxia.oa.sale.dao.SaleDao;
 import com.tntxia.oa.sale.entity.RefundPro;
 import com.tntxia.oa.sale.entity.SalePro;
 import com.tntxia.oa.system.dao.CurrentTypeDao;
 import com.tntxia.oa.system.dao.FinanceAccountDao;
 import com.tntxia.oa.system.entity.CurrentType;
 import com.tntxia.oa.system.entity.FinanceAccountDetail;
 import com.tntxia.oa.util.CommonAction;
 import com.tntxia.oa.util.DateUtil;
import com.tntxia.oa.util.WebUtils;

import java.math.BigDecimal;
 import java.sql.ResultSet;
 import java.text.NumberFormat;
 import java.text.SimpleDateFormat;
 import java.util.ArrayList;
 import java.util.Date;
 import java.util.HashMap;
 import java.util.List;
 import java.util.Map;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;
 import javax.servlet.http.HttpSession;
 import org.apache.commons.lang.StringUtils;
 import org.apache.log4j.Logger;
 import org.springframework.web.bind.ServletRequestUtils;
 import org.springframework.web.servlet.ModelAndView;
 
 public class FinanceAction
   extends CommonAction {
   public static Logger logger = Logger.getLogger(DBConnection.class);
   
   private FinanceDao financeDao;
   
   private SaleDao saleDao;
   
   private CurrentTypeDao currentTypeDao;
   
   private FinanceAccountDao financeAccountDao;
 
   
   public void setFinanceDao(FinanceDao financeDao) { this.financeDao = financeDao; }
 
 
   
   public void setSaleDao(SaleDao saleDao) { this.saleDao = saleDao; }
 
   public void setFinanceAccountDao(FinanceAccountDao financeAccountDao) { this.financeAccountDao = financeAccountDao; }
 
   public void setCurrentTypeDao(CurrentTypeDao currentTypeDao) { this.currentTypeDao = currentTypeDao; }
 
   public ModelAndView toAddCredit(HttpServletRequest request, HttpServletResponse arg1) throws Exception {
     Map<String, Object> resultMap = new HashMap<String, Object>();
     
     int id = Integer.parseInt(request.getParameter("id"));
     
     String type = request.getParameter("type");
     Gathering gathering = null;
     
     if (StringUtils.isEmpty(type)) {
       gathering = this.financeDao.getGathering(id);
     } else {
       gathering = this.financeDao.getGatheringRefund(id);
     } 
     
     double je = 0.0D;
     
     if (request.getParameter("je") == null) {
       List<SalePro> saleProList = this.saleDao.getSaleProList(gathering
           .getSaleId());
       for (SalePro pro : saleProList) {
         je += pro.getNum() * pro.getSalejg();
       }
       
       je = je + gathering.getBank() - gathering.getMoneyGathered();
     } else {
       je = Double.parseDouble(request.getParameter("je"));
     } 
     
     List<FinanceAccountDetail> financeAccountList = this.financeAccountDao
       .getFinanceDetailList();
     
     resultMap.put("gathering", gathering);
     
     resultMap.put("je", Double.valueOf(je));
     
     resultMap.put("financeAccountList", financeAccountList);
     
     resultMap.put("hbList", this.currentTypeDao.getCurrentTypeList());
     
     return new ModelAndView("finance/money/toAddCredit", resultMap);
   }
 
   public ModelAndView toRefundFlush(HttpServletRequest request, HttpServletResponse arg1) throws Exception {
     int intPage;
     DBConnection einfodb = new DBConnection();
     
     Map<String, Object> resultMap = new HashMap<String, Object>();
     
     NumberFormat nf = NumberFormat.getNumberInstance();
     nf.setMaximumFractionDigits(4);
     nf.setMinimumFractionDigits(4);
     
     SimpleDateFormat simple = new SimpleDateFormat(
         "yyyy-MM-dd");
     String currentDate = simple.format(new Date());
 
     int intPageSize = 500;
     String strPage = request.getParameter("page");
     
     if (strPage == null) {
       intPage = 1;
     } else {
       intPage = Integer.parseInt(strPage);
       if (intPage < 1)
         intPage = 1; 
     } 
     double g_je = 0.0D;
     String tmpsalejg1 = request.getParameter("g_je");
     if (tmpsalejg1 != null) {
       g_je = Double.parseDouble(tmpsalejg1);
     }
     
     int gid = ServletRequestUtils.getIntParameter(request, "id", 0);
     CreditDebit creditDebit = this.financeDao.getCreditDebitById(gid);
     
     String coname = creditDebit.getConame();
     resultMap.put("coname", coname);
     String hb = request.getParameter("hb").trim();
     String strSQL = "select count(*) from gathering_refund where states='退货' and coname='" + 
       coname + "' ";
     ResultSet sqlRst = einfodb.executeQuery(strSQL);
     sqlRst.next();
     int intRowCount = sqlRst.getInt(1);
     sqlRst.close();
     int intPageCount = (intRowCount + intPageSize - 1) / intPageSize;
     if (intPage > intPageCount)
       intPage = intPageCount; 
     strSQL = "select id,fyid,ymoney,smoney,invoice,coname,sjdate,skdate,sale_man,states from gathering_refund  where states='退货' and coname='" + 
       coname + "'   order by sjdate asc";
     
     sqlRst = einfodb.executeQuery(strSQL);
     int i = (intPage - 1) * intPageSize;
     for (int j = 0; j < i; j++) {
       sqlRst.next();
     }
     List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
     
     i = 0;
     while (i < intPageSize && sqlRst.next()) {
       
       Map<String, Object> item = new HashMap<String, Object>();
       
       String thnumber = sqlRst.getString("invoice");
       item.put("thnumber", thnumber);
       
       int id = sqlRst.getInt("id");
       item.put("id", Integer.valueOf(id));
       String fyid = sqlRst.getString("fyid");
       double s = 0.0D;
       String tmps = sqlRst.getString("smoney");
       if (tmps != null)
         s = Double.parseDouble(tmps); 
       double totle = 0.0D;
       String sale_man = sqlRst.getString("sale_man");
       resultMap.put("sale_man", sale_man);
       String thb = "RMB";
       String strSQLpro = "select num,salejg,pricehb from th_pro where  ddid='" + 
         fyid + "'";
       ResultSet prs = einfodb.executeQuery(strSQLpro);
       int tmpi = 0;
       while (prs.next()) {
         double num = 0.0D;
         String tmpnum = prs.getString("num");
         if (tmpnum != null)
           num = Double.parseDouble(tmpnum); 
         double price = 0.0D;
         String tmpprice = prs.getString("salejg");
         if (tmpprice != null)
           price = Double.parseDouble(tmpprice); 
         String shb = prs.getString("pricehb");
         
         CurrentType currentType = this.currentTypeDao.getByName(hb);
         
         if (currentType == null) {
           
           resultMap.put("success", Boolean.valueOf(false));
           resultMap.put("message", "货币类型不存在" + hb);
           return new ModelAndView("common/result", resultMap);
         } 
         double chl = currentType.getRate();
         
         currentType = this.currentTypeDao.getByName(shb);
         
         if (currentType == null) {
           resultMap.put("success", Boolean.valueOf(false));
           resultMap.put("message", "货币类型不存在" + shb);
           return new ModelAndView("common/result", resultMap);
         } 
         double shl = currentType.getRate();
         
         double tprice = num * price * shl / chl * -1.0D;
         totle += tprice;
         thb = shb;
         tmpi++;
       } 
       double sub1 = totle - s;
       String se = "";
       double ss_je = 0.0D;
       if (g_je >= sub1) {
         ss_je = sub1 + 0.0D;
         g_je -= sub1;
         se = "checked";
       } else {
         ss_je = g_je;
         g_je = 0.0D;
         se = "";
       } 
       item.put("s", Double.valueOf(s));
       item.put("sub1", Double.valueOf(sub1));
       item.put("ss_je", Double.valueOf(ss_je));
       item.put("se", se);
       result.add(item);
     } 
 
     
     resultMap.put("g_je", Double.valueOf(g_je));
     resultMap.put("result", result);
     
     resultMap.put("intPageSize", Integer.valueOf(intPageSize));
     resultMap.put("intRowCount", Integer.valueOf(intRowCount));
     resultMap.put("intPageCount", Integer.valueOf(intPageCount));
     resultMap.put("intPage", Integer.valueOf(intPage));
     
     return new ModelAndView("finance/bank/thxxm", resultMap);
   }
 
 
 
 
 
 
 
 
 
 
 
   
   public ModelAndView toGatheringRefundView(HttpServletRequest request, HttpServletResponse response) throws Exception {
     DBConnection einfodb = new DBConnection();
     
     Map<String, Object> resultMap = new HashMap<String, Object>();
     
     HttpSession session = request.getSession();
     
     NumberFormat nf = NumberFormat.getNumberInstance();
     nf.setMaximumFractionDigits(4);
     nf.setMinimumFractionDigits(4);
     
     String totle = request.getParameter("totle");
     String hb = request.getParameter("hb");
     String sub1 = request.getParameter("sub1");
     String id1 = request.getParameter("id");
     String dept = (String)session.getAttribute("dept");
     String username = (String)session.getAttribute("username");
     String restrain_name = (String)session.getAttribute("restrain_name");
     String deptjb = (String)session.getAttribute("deptjb");
     String modsql = "select * from restrain where restrain_name='" + 
       restrain_name + "'";
     ResultSet rsmod = einfodb.executeQuery(modsql);
     
     String t2 = null;
     
     double t7 = 0.0D;
     
     if (rsmod.next()) {
       String skmod = rsmod.getString("skmod").trim();
       String skdel = rsmod.getString("skdel").trim();
       String r_wlz_add = rsmod.getString("r_wlz_add").trim();
       String sql = "select gathering.*,th_table.sub,th_table.remarks,th_table.payway from gathering_refund gathering left outer join th_table on gathering.orderform = th_table.number where gathering.id='" + 
         id1 + "'";
       ResultSet rs = einfodb.executeQuery(sql);
       if (!rs.next())
       {
         exportErrorJSON(response, "not have record");
       }
       
       t2 = rs.getString(2);
       String t3 = rs.getString(3);
       String contact = rs.getString("orderform");
       String t5 = rs.getString(5);
       double t6 = rs.getDouble(6);
       t7 = rs.getDouble(7);
       String coname = rs.getString(8);
       double bankFee = rs.getDouble(9);
       String t10 = rs.getString(10);
       String t11 = rs.getString(11);
       String t12 = rs.getString(12);
       Date t13 = rs.getDate(13);
       String t14 = rs.getString(14);
       
       String i_man = rs.getString("i_man");
       String sale_man = rs.getString("sale_man");
       String sale_dept = rs.getString("sale_dept");
       String co_number = rs.getString("co_number");
       
       String sub = rs.getString("sub");
       String remark = rs.getString("remarks");
       String payway = rs.getString("payway");
       
       resultMap.put("co_number", co_number);
       resultMap.put("coname", coname);
       resultMap.put("totle", totle);
       resultMap.put("hb", hb);
       resultMap.put("contact", contact);
       resultMap.put("sub", sub);
       
       resultMap.put("t7", Double.valueOf(t7));
       resultMap.put("payway", payway);
       resultMap.put("t11", t11);
       
       resultMap.put("sale_man", sale_man);
       resultMap.put("sale_dept", sale_dept);
       resultMap.put("remark", remark);
     } 
 
     
     List<RefundPro> refundProList = this.saleDao.getRefundProList(t2);
     
     if (t2 != null) {
       resultMap.put("refundProList", refundProList);
     }
     
     BigDecimal saletl = BigDecimal.ZERO;
     
     for (RefundPro pro : refundProList) {
       saletl = saletl.add(pro.getSalehj());
     }
     
     resultMap.put("saletl", saletl);
     double notPayAmount = saletl.subtract(BigDecimal.valueOf(t7))
       .doubleValue();
     resultMap.put("notPayAmount", nf.format(notPayAmount));
     resultMap.put("t7f", nf.format(t7));
     rsmod.close();
     einfodb.closeStmt();
     einfodb.closeConn();
     
     return getResult("finance/refund/view", resultMap);
   }
 
 
 
 
 
 
 
 
 
 
   
   public ModelAndView getAdaptItems(HttpServletRequest request, HttpServletResponse response) throws Exception {
     String number = request.getParameter("number");
     String type = request.getParameter("type");
     if (type.equals("1")) {
       
       Map<String, Object> resultMap = new HashMap<String, Object>();
       List list = this.financeDao.getRefundGatherList(number);
       resultMap.put("list", list);
       exportJSON(response, resultMap);
     } 
     return null;
   }
 
 
   
   public ModelAndView delRefundGather(HttpServletRequest request, HttpServletResponse response) throws Exception {
     String id = request.getParameter("id");
     this.financeDao.deleteRefundGather(id);
     
     exportSuccessJSON(response);
     
     return null;
   }
 

   public ModelAndView gather(HttpServletRequest request, HttpServletResponse response) throws Exception {
     DBConnection db = new DBConnection();
     HttpSession session = request.getSession();
     
     try {
       String name1 = (String)session.getAttribute("username");
       
       String skdate = DateUtil.getNowString("yyyyMMddHHmmss");
       String[] t = request.getParameterValues("checkpro");
       String gid = request.getParameter("gid");
       String coname = request.getParameter("coname");
       String g_date = request.getParameter("g_date");
       String hb = request.getParameter("hb");
       double g_ydz = 0.0D;
       String g_sje1 = request.getParameter("g_sje");
       if (g_sje1 != null)
         g_ydz = Double.parseDouble(g_sje1); 
       double g_je = 0.0D;
       String g_je1 = request.getParameter("g_je");
       if (g_je1 != null)
         g_je = Double.parseDouble(g_je1); 
       double g_sje = g_je + 0.0D;
       double spje = 0.0D;
       if (t != null) {
         for (int i = 0; i < t.length; i++) {
           double totle = 0.0D;
           String sqlss = "select  fyid,invoice,smoney,ymoney,bank,note from gathering where id='" + 
             t[i] + "'";
           ResultSet rs = db.executeQuery(sqlss);
           if (!rs.next()) {
             DBUtil.closeResultSet(rs);
             db.close();
             return getErrorResult("收款信息不存在 ！");
           } 
           String fyid = rs.getString("fyid");
           String invoice = rs.getString("invoice");
           double smoney = rs.getDouble("smoney");
           double qt_fy = rs.getDouble("ymoney");
           double fy = rs.getDouble("bank");
           String salesman = rs.getString("note");
           double shl = 0.0D;
           String strSQLpro = "select num,salejg,pricehb from ddpro where  ddid='" + 
             fyid + "'";
           ResultSet prs = db.executeQuery(strSQLpro);
           int tmpi = 0;
           while (prs.next()) {
             double num = 0.0D;
             String tmpnum = prs.getString("num");
             if (tmpnum != null)
               num = Double.parseDouble(tmpnum); 
             double price = 0.0D;
             String tmpprice = prs.getString("salejg");
             if (tmpprice != null)
               price = Double.parseDouble(tmpprice); 
             String shb = prs.getString("pricehb");
             double j_m = num * price, tprice = 0.0D;
             tprice = j_m;
             totle += tprice;
             tmpi++;
           } 
           totle = totle;
           double j_m1 = smoney, ts1 = 0.0D;
           ts1 = j_m1;
           double ts = totle - ts1;
           ts = Math.round(ts * 10000.0D) / 10000.0D;
           if (g_je >= ts) {
             
             String strSQLmx = "insert into gather_mx_mx values('" + gid + 
               "','2','" + invoice + "','" + coname + "','" + ts + 
               "','" + hb + "','" + salesman + "','" + g_date + 
               "','" + name1 + "')";
             
             boolean tmx = db.executeUpdate(strSQLmx);
             if (!tmx) {
               db.close();
               return getErrorResult("添加收款明细失败,你所输入的内容超出系统范围或输入类型不符!");
             } 
             
             double j_mn = totle, tsn = 0.0D;
             tsn = j_mn;
             
             String strpros = "update gathering set  imoney='" + gid + 
               "',smoney='" + tsn + 
               "',states='已收全部款',note='已收款',skdate='" + skdate + 
               "'  where id='" + t[i] + "'";
             boolean tww = db.executeUpdate(strpros);
             if (!tww) {
               db.close();
               return getErrorResult("添加收款B失败,你所输入的内容超出系统范围或输入类型不符!");
             } 
             
             g_je -= ts;
           } else {
             double j_m2 = smoney, ts2 = 0.0D;
             ts2 = j_m2;
             double tst = g_je + ts2;
             String strSQLmx = "insert into gather_mx_mx values('" + gid + 
               "','2','" + invoice + "','" + coname + "','" + 
               g_je + "','" + hb + "','" + salesman + "','" + 
               g_date + "','" + name1 + "')";
             boolean ta = db.executeUpdate(strSQLmx);
             if (!ta) {
               db.close();
               return getErrorResult("添加收款B失败,你所输入的内容超出系统范围或输入类型不符!");
             } 
             
             double j_mn = tst, tsn = 0.0D;
             tsn = j_mn;
             String strpros = "update gathering set  imoney='" + gid + 
               "',smoney='" + tsn + "',note='部分收款',skdate='" + 
               skdate + "' where id='" + t[i] + "'";
             boolean t1 = db.executeUpdate(strpros);
             if (!t1) {
               db.close();
               return getErrorResult("添加收款A失败,你所输入的内容超出系统范围或输入类型不符!");
             } 
             
             g_je = 0.0D;
           } 
         } 
       }
       double zt = g_sje - g_je + g_ydz;
       String strpross = "update credit_debit set  l_sje='" + zt + 
         "'  where id='" + gid + "'";
       boolean tss = db.executeUpdate(strpross);
       if (!tss) {
         db.close();
         return getErrorResult("添加收款A失败,你所输入的内容超出系统范围或输入类型不符!");
       } 
       db.close();
     } catch (Exception e) {
       e.printStackTrace();
       getErrorResult("操作失败");
     } 
     
     return getSuccessResult();
   }
   
   /**
    * 获取付款信息的统计
    * @param request
    * @param response
    * @return
    * @throws Exception
    */
   @SuppressWarnings("unchecked")
   public ModelAndView paymentStatistist(HttpServletRequest request, HttpServletResponse response) throws Exception {
	   String sql = "select sum(payment.htmoney) totalPaid," + 
	   		"(select SUM(cgpro.selljg * num) from cgpro where cgpro.ddid = payment.orderform) total," + 
	   		"(select SUM(selljg * num) from cgpro where ddid in (select id from procure where l_spqk = '已入库' ) and  cgpro.ddid = payment.orderform) totalIn" + 
	   		" from payment";
	   HttpSession session = request.getSession();
	   String username = (String) session.getAttribute("username");
	   String deptjb = (String) session.getAttribute("deptjb");
	   List<String> userRightList = (List<String>) session.getAttribute("userRightList");
	   // 不同权限的用户
	   if (userRightList.contains("fkview")) {
		   sql += " and wtfk like '" + deptjb + "%'";
	   } else {
		   sql += " and remark = '" + username+"'";
	   }
	   String coname = request.getParameter("coname");
	   if (StringUtils.isNotEmpty(coname)) {
		   sql += " and coname like '%" + coname + "%'";
	   }
	   DBConnection db = new DBConnection();
	   ResultSet rs = db.executeQuery(sql);
	   BigDecimal total = null;
	   if (rs.next()) {
		   total = rs.getBigDecimal("total");
	   }
	   Map<String,Object> result = new HashMap<String,Object>();
	   result.put("total", total);
	   WebUtils.writeJson(response, result);
	   return null;
   }
   
   
 }


