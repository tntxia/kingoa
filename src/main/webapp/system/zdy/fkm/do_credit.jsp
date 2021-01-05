<%@ page contentType="text/html;charset=gb2312" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>增加科目</title>
<link rel=stylesheet href="../client/style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
 String com_name1=request.getParameter("cre_name");
 String com_ename1=request.getParameter("cre_ename");
 String com_number=request.getParameter("cre_number");

 String strSQL="insert into km_f values('" + com_number + "','" + com_name1 + "','" + com_ename1 + "')";
 einfodb.executeUpdate(strSQL);
 %>
<body bgcolor="#ffffff">
<div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p>

    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
    <p style="font-size:16px; color: #f00; font-family:'宋体'; letter-spacing:0px; vertical-align:middle;">操作成功!</font></p>
  <p><a href="ncredit.jsp" style="font-size: 12px">继续增加</a> <a href="credit.jsp" style="font-size: 12px">返回</a></p>
</div>
</body>
</html>