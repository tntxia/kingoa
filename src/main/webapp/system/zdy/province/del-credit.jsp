<%@ page contentType="text/html;charset=gb2312" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>省市自定义</title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
  String p=request.getParameter("p");
  String id1=request.getParameter("id");
  String strSQL="delete from province where id='" + id1 + "'";
  einfodb.executeUpdate(strSQL);
  String strSQLq="delete from  city where province='" + p + "'";
  einfodb.executeUpdate(strSQLq);

 %>
<body bgcolor="#ffffff"><div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">删除操作成功!</font></b></p>
  <p><a href="credit.jsp" style="font-size: 12px">返回</a></p>
  <p><font color="#000000"></font></p>
</div>
</body>
</html>