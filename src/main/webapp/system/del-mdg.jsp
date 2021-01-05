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
<title></title>
<link rel=stylesheet href="style.css" type="text/css">
<style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
.STYLE1 {color: #0000FF}
a {
	font-family: 新宋体;
	font-size: 14px;
}
a:link {
	text-decoration: underline;
}
a:visited {
	text-decoration: underline;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: underline;
}
-->
</style></head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="RegBean2" scope="page" class="infocrmdb.infocrmdb" />
<%
 String id1=request.getParameter("id");
 String dept=request.getParameter("dept");
 String dept_code=request.getParameter("dept_code");
  String strSQL="delete from department where dept_code like  '" + dept_code + "%'";
  RegBean2.executeUpdate(strSQL);
 %>
<body>
<div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">删除操作成功!</font></b></p>
  <p><a href="mdgxx.jsp" class="STYLE1" style="font-size: 12px">返回</a></p>
</div>
</body>
<%}}%>
</html>