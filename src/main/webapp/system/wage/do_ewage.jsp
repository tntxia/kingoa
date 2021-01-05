<%@ page contentType="text/html;charset=gb2312" %> 
<jsp:useBean id="infocrmdb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page import="java.sql.*,java.util.*"%>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
<script language=javascript>
window.location="../../refuse.jsp"
</script>
<% }     
%>
<%
java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String currentDate=simple.format(new java.util.Date());
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>工资模版</title>
<link rel=stylesheet href="style.css" type="text/css">
<script LANGUAGE="JavaScript">
function click() {
if (event.button==2) {alert('芯片商城有限公司')}}
document.onmousedown=click
</script>
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
 java.sql.ResultSet sqlRst;
 String wage_name=request.getParameter("wage_name");
 String wage_date=request.getParameter("wage_date");
 String wage_rgman=request.getParameter("wage_rgman");
 String wage_m_dates=request.getParameter("wage_m_dates");
 String wage_date_price=request.getParameter("wage_date_price");
 String wage_awork_price=request.getParameter("wage_awork_price");
 String wage_zf_price=request.getParameter("wage_zf_price");
 String wage_jt_price=request.getParameter("wage_jt_price");
 String wage_wc_price=request.getParameter("wage_wc_price");
 String wage_sb_price=request.getParameter("wage_sb_price");
 String wage_zdy_sub=request.getParameter("wage_zdy_sub");
 String wage_zdy_price=request.getParameter("wage_zdy_price");
 String wage_zdy_qy=request.getParameter("wage_zdy_qy");
 String wage_zdy_zj=request.getParameter("wage_zdy_zj");
 String wage_zdy_sub2=request.getParameter("wage_zdy_sub2");
 String wage_zdy_price2=request.getParameter("wage_zdy_price2");
 String wage_zdy_qy2=request.getParameter("wage_zdy_qy2");
 String wage_zdy_zj2=request.getParameter("wage_zdy_zj2");
 String wage_zdy_sub3=request.getParameter("wage_zdy_sub3");
 String wage_zdy_price3=request.getParameter("wage_zdy_price3");
 String wage_zdy_qy3=request.getParameter("wage_zdy_qy3");
 String wage_zdy_zj3=request.getParameter("wage_zdy_zj3");
 String wage_zdy_sub4=request.getParameter("wage_zdy_sub4");
 String wage_zdy_price4=request.getParameter("wage_zdy_price4");
 String wage_zdy_qy4=request.getParameter("wage_zdy_qy4");
 String wage_zdy_zj4=request.getParameter("wage_zdy_zj4");
 String wage_zdy_sub5=request.getParameter("wage_zdy_sub5");
 String wage_zdy_price5=request.getParameter("wage_zdy_price5");
 String wage_zdy_qy5=request.getParameter("wage_zdy_qy5");
 String wage_zdy_zj5=request.getParameter("wage_zdy_zj5");
 String id=request.getParameter("id");
 String remark=request.getParameter("remark");
 String strSQL="update wage_mb set wage_name='" + wage_name + "',wage_date='" +wage_date + "',wage_rgman='" + wage_rgman+"',wage_m_dates='" + wage_m_dates + "',wage_date_price='" + wage_date_price+ "',wage_awork_price='" + wage_awork_price + "',wage_zf_price='" + wage_zf_price + "',wage_jt_price='"+wage_jt_price + "',wage_wc_price='"+wage_wc_price+"',wage_sb_price='" +wage_sb_price + "',wage_zdy_sub='"+wage_zdy_sub+"',wage_zdy_price='" +wage_zdy_price+ "',wage_zdy_qy='"+wage_zdy_qy+"',wage_zdy_zj='" + wage_zdy_zj+ "',wage_zdy_sub2='"+wage_zdy_sub2+"',wage_zdy_price2='" +wage_zdy_price2+ "',wage_zdy_qy2='"+wage_zdy_qy2+"',wage_zdy_zj2='" + wage_zdy_zj2+ "',wage_zdy_sub3='"+wage_zdy_sub3+"',wage_zdy_price3='" +wage_zdy_price3+ "',wage_zdy_qy3='"+wage_zdy_qy3+"',wage_zdy_zj3='" + wage_zdy_zj3+ "',wage_zdy_sub4='"+wage_zdy_sub4+"',wage_zdy_price4='" +wage_zdy_price4+ "',wage_zdy_qy4='"+wage_zdy_qy4+"',wage_zdy_zj4='" + wage_zdy_zj4+ "',wage_zdy_sub5='"+wage_zdy_sub5+"',wage_zdy_price5='" +wage_zdy_price5+ "',wage_zdy_qy5='"+wage_zdy_qy5+"',wage_zdy_zj5='" + wage_zdy_zj5+ "',remark='" + remark+ "'  where id='"+id+"'";
   boolean t= einfodb.executeUpdate(strSQL);
   if(!t)
   {
     out.println("更新失败,你所输入的内容超出系统范围或输入类型不符!");
	 return;
   }
 %>
<body bgcolor="#ffffff">
<div align="center">
  <p>&nbsp;</p>
  <p><font color="#000000" size="5">登记成功!</font></p>
  <p><font color="#000000" size="2"><font color="#000000" size="2"><a href="javascript:window.close()" style="font-size: 12px"><font size="2">关闭</font></a></font></font></p>
  <p>&nbsp;</p>
  <p><font color="#000000"></font></p>
</div>
</body>
</html>
