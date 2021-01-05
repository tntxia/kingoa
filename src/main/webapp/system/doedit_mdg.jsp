<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../refuse.jsp"
    </script>
<% } else {    
 String getaLoginmessage = (String) session.getValue("adminloginSign");
   if(getaLoginmessage!="admin"){
%>
    <script language=javascript>
    window.location="manageslogin.jsp"
    </script>
<% } else {    
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>芯片商城有限公司</title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="RegBean2" scope="page" class="infocrmdb.infocrmdb" />
<%
 String id1=request.getParameter("id");
 String departname1=request.getParameter("departname");
 String dept=request.getParameter("dept").trim();
 String remark1=request.getParameter("remark");
 String leader = request.getParameter("leader");
  String strSQLa="update username set yjxs='" + departname1 + "'  where yjxs='" + dept + "'";
  RegBean2.executeUpdate(strSQLa);
  String strSQL="update department set departname='" + departname1 + "',remark='" + remark1 + "',leader='"+leader+"'  where id='" + id1 + "'";
  RegBean2.executeUpdate(strSQL);
 %>
<body bgcolor="#ffffff"><div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">部门修改成功!</font></b></p>
  <p><a href="mdgxx.jsp" style="font-size: 12px">返回</a></p>
  <p><font color="#000000"></font></p>
</div>
</body>
<%}}%>
</html>