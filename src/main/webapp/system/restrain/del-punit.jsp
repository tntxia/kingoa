<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../../common/checklogin.jsp" %>
<%@ include file="../../common/checkManageLogin.jsp" %>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link rel=stylesheet href="style.css" type="text/css">
<style type="text/css">
<!--
body {
	background-color: #ffffff;
}
.STYLE1 {font-size: 12px}
-->
</style></head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%

request.setCharacterEncoding("gb2312");

  String id1=request.getParameter("id");
  String strSQL="delete from restrain where id='" + id1 + "'";
  einfodb.executeUpdate(strSQL);
 %>
<body>
<div align="center"><br><br><br> <p><img src="../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">删除操作成功!</font></b></p>
  <p><a href="punit.jsp" class="STYLE1" style="font-size: 12px">返回</a></p>
  <p><font color="#000000"></font></p>
</div>
</body>
</html>