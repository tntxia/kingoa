<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){%>
<script language=javascript>
window.location="../../refuse.jsp"
</script>
<% }%>
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
<jsp:useBean id="RegBean2" scope="page" class="infocrmdb.infocrmdb" />
<%
 
  String id2=request.getParameter("id");
  String strSQL="delete from wage_mb where id='" + id2 + "'";
  RegBean2.executeUpdate(strSQL);
 %>
<body bgcolor="#ffffff">
<div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">删除操作成功!</font></b></p>
  <p><font color="#000000"></font></p>
</div>
</body>
</html>