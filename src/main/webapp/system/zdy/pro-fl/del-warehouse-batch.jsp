<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp";
    </script>
<% } else {
	
	request.setCharacterEncoding("GB2312");
	String pro_addr = request.getParameter("addr");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>info</title>
<link rel=stylesheet href="style.css" type="text/css">
<script type="text/javascript" src="../../../js/jquery.js"></script>
<script type="text/javascript">
function viewLeftProduct(){
	$("#form1 input[name=addr]").val(addr);
	$("#form1").submit();
}
</script>
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="warehouseManager" scope="page" class="com.tntxia.oa.warehouse.WarehouseManager" />
<%


int deleteCount = warehouseManager.deleteNoUseWarehouse(pro_addr);

 %>
<body bgcolor="#ffffff">

<form id="form1" name="form1" method="post" action="warehouseListToDel.jsp">
  	<input type="hidden" value="" name="addr" />
</form>
<div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">删除操作成功!</font></b></p>
  <p><font color="#000000">共<%=deleteCount %>条记录被删除</font></p>
</div>
</body><%}%>
</html>