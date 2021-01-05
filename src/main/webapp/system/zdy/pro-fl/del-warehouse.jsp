<%@ page contentType="text/html;charset=gb2312" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>info</title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="warehouseManager" scope="page" class="com.tntxia.oa.warehouse.WarehouseManager" />
<%
  String id1=request.getParameter("id");
  if(id1!=""){
	  warehouseManager.deleteWarehouse(id1);
 }
 else out.println("err");
 %>
<body bgcolor="#ffffff">
<div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">删除操作成功!</font></b></p>
  <p><font color="#000000"></font></p>
</div>
</body>
</html>