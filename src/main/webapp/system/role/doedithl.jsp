<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../refuse.jsp"
    </script>
<% } else {    
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>芯片商城有限公司</title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<style type="text/css">
<!--
.H1 {font-size:12pt; line-height:15pt; align=center}
.ourfont {font-size:9pt; line-height:15pt; }
.ourfont1 {font-size:8pt; line-height:13pt; }
A{text-transform: none; text-decoration:none;color:#0000ff}
a:hover {text-decoration:underline;color:#0000ff}
-->
</style>

<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
request.setCharacterEncoding("gb2312");
 String id1=request.getParameter("id");
 String role=request.getParameter("role");
 String role_name=request.getParameter("role_name");
 String remark1=request.getParameter("remark");
  String role_date=request.getParameter("role_date");
  String strSQL="update role set role_name='" + role_name + "',remark='" + remark1 + "',role_date='" + role_date + "' where id='" + id1 + "'";
  einfodb.executeUpdate(strSQL);
  String strSQLa="update username set workj='" + role_name + "' where workj='" + role + "'";
  einfodb.executeUpdate(strSQLa);
  String strSQLc="update ddsp set role='" + role_name + "' where role='" + role + "'";
  einfodb.executeUpdate(strSQLc);
  
  
 %>
<body bgcolor="#ffffff"><div align="center"><br><br><br> <p><img src="../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">修改成功!</font></b></p>
  <p><font color="#000000" size="2"><a href="hlxx.jsp" style="font-size: 12px">返回</a></font></p>
  <p><font color="#000000"></font></p>
</div>
</body>
<%}%>
</html>