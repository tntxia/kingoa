<%@ page contentType="text/html;charset=gb2312" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>增加省市</title>
<link rel=stylesheet href="../client/style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
 String p=request.getParameter("p");
 String com_name1=request.getParameter("cre_name");
 String strSQL="insert into city values('" + p + "','" + com_name1 + "')";
 einfodb.executeUpdate(strSQL);
 %>
<body bgcolor="#ffffff">
<div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p>

    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
    <p style="font-size:16px; color: #f00; font-family:'宋体'; letter-spacing:0px; vertical-align:middle;">操作成功!</font></p>
  <p><a href="ncredit.jsp?p=<%=p%>" style="font-size: 12px">继续增加</a> <a href="credit.jsp?p=<%=p%>" style="font-size: 12px">返回</a></p>
</div>
</body>
</html>