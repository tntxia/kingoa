<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page import="java.sql.*,java.util.*,java.text.*,com.tntxia.oa.warehouse.*"%>
<jsp:useBean id="warehouseManager" scope="page" class="com.tntxia.oa.warehouse.WarehouseStokingManager" />
<%

request.setCharacterEncoding("GB2312");

String pro_addr = request.getParameter("pro_addr");
String path = request.getRealPath("/");

warehouseManager.pd(pro_addr, path);

%>
<%@ page contentType="text/html;charset=GB2312"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>仓库盘点</title>

<style type="text/css">
<!--
body,td,th {
	font-family: "Lucida Grande", Verdana, Lucida, Arial, Helvetica, "宋体",
		sans-serif;
	font-size: 12px;
	font-weight: normal;
}

#bk {
	border: 1px solid #909ECD;
	padding: 5px;
	width: 100%;
	background-color: #e8ebf5;
}
-->
</style>
</head>
<body onselectstart="return false">
	盘点完成
</body>
</html>
