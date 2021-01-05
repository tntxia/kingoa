<%@ page contentType="text/html;charset=gb2312" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>芯片商城有限公司</title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
 String id1=request.getParameter("id");
 String xh=request.getParameter("xh").trim();
 String p=request.getParameter("p").trim();
 String cre_name1=request.getParameter("cre_name").trim();
 String cre_name_old1=request.getParameter("cre_name_old").trim();
 String cre_ename1=request.getParameter("cre_ename").trim();
 String cre_number=request.getParameter("cre_number").trim();
 String km_fx=request.getParameter("km_fx").trim();
 String strSQL="update km set   km_fx='" + km_fx + "',coun_number='" + cre_number + "',coun_name='" + cre_name1 + "',coun_ename='" + cre_ename1 + "' where id='" + id1 + "'";
 einfodb.executeUpdate(strSQL);
 String strSQL1="update km_mx  set km='" + cre_name1 + "'   where km='" + p + "'";
 einfodb.executeUpdate(strSQL1);
 String strSQL3="update credit_debit  set kms='" + cre_name1 + "'   where kms='" + cre_name_old1 + "'";
 einfodb.executeUpdate(strSQL3);
 String strSQL5="update credit_debit  set km='" + cre_name1 + "'   where km='" + cre_name_old1 + "'";
 einfodb.executeUpdate(strSQL5);

 %>
 
<body bgcolor="#ffffff">
<div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p>

    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
  <p style="font-size:16px; color: #f00; font-family:'宋体'; letter-spacing:0px; vertical-align:middle;">修改成功!</font></p>
  <p><a href="credit<%=xh%>.jsp" style="font-size: 12px">返回</a></p>
</div>
</body>
</html>