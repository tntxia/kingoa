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
<title>工资</title>
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
 String id=request.getParameter("id");
 String menber_year=request.getParameter("menber_year");
 String menber_month=request.getParameter("menber_month");
 String menber_name=request.getParameter("menber_name");
 double menber_wage=0;
 String menber_wage1=request.getParameter("menber_wage");
 if(menber_wage1!=null)
 menber_wage=Double.parseDouble(menber_wage1);
  double menber_bt=0;
 String menber_bt1=request.getParameter("menber_bt");
 if(menber_bt1!=null)
 menber_bt=Double.parseDouble(menber_bt1);
 double menber_fl=0;
 String menber_fl1=request.getParameter("menber_fl");
 if(menber_fl1!=null)
 menber_fl=Double.parseDouble(menber_fl1);
 double menber_cd=0;
 String menber_cd1=request.getParameter("menber_cd");
 if(menber_cd1!=null)
 menber_cd=Double.parseDouble(menber_cd1);
 String menber_jbsj1=request.getParameter("menber_jbsj");
 double menber_jbsj=0.00;
 if(menber_jbsj1!=null)
 menber_jbsj=Double.parseDouble(menber_jbsj1);
 double menber_zmjbsj=0;
 String menber_zmjbsj1=request.getParameter("menber_zmjbsj");
 if(menber_zmjbsj1!=null)
 menber_zmjbsj=Double.parseDouble(menber_zmjbsj1);
  double menber_sjsj=0;
 String menber_sjsj1=request.getParameter("menber_sjsj");
 if(menber_sjsj1!=null)
 menber_sjsj=Double.parseDouble(menber_sjsj1);
  double menber_sb=0;
 String menber_sb1=request.getParameter("menber_sb");
 if(menber_sb1!=null)
 menber_sb=Double.parseDouble(menber_sb1);
  double menber_ht=0;
 String menber_ht1=request.getParameter("menber_ht");
 if(menber_ht1!=null)
 menber_ht=Double.parseDouble(menber_ht1);
 double menber_total=menber_wage+menber_bt+menber_fl+menber_cd-menber_sb+menber_ht+menber_jbsj+menber_zmjbsj+-menber_sjsj;
 String strSQL="update wage_menber set menber_year='" + menber_year + "',menber_month='" +menber_month + "',menber_name='" + menber_name+"',menber_wage='" + menber_wage + "',menber_bt='" + menber_bt+ "',menber_fl='" + menber_fl + "',menber_cd='"+menber_cd + "',menber_sb='" + menber_sb + "',menber_ht='" + menber_ht + "',menber_jbsj='" +menber_jbsj+ "',menber_zmjbsj='" + menber_zmjbsj+ "',menber_sjsj='" +menber_sjsj + "',menber_total='" + menber_total+ "' where id='"+id+"'";
   boolean t= einfodb.executeUpdate(strSQL);
   if(!t)
   {
     out.println("添加失败,你所输入的内容超出系统范围或输入类型不符!");
	 return;
   }
 %>
<body bgcolor="#ffffff"><div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">修改成功!</font></b></p>
  <p style="font-size: 12px;"><a href="javascript:window.close()" style="font-size: 12px">关闭</a></p>
  <p><font color="#000000"></font></p>
</div>
</body>
</html>
<script language=javascript>
window.close();
</script>
