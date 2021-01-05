<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,java.util.*,java.text.*,com.tntxia.oa.system.entity.*"%>
<%
   //设置无缓存
   response.setHeader("progma","no-cache");   
   response.setHeader("Cache-Control","no-cache");   
   response.setDateHeader("Expires",0);
   
   String basePath = request.getContextPath();
   List<Right> rightList = (List<Right>)request.getAttribute("rightList");
   
%>
<html>
<head>
<title>权限管理</title>
<script type="text/javascript" src="<%=basePath%>/js/config.js"></script>
<script type="text/javascript">
function addRight(){
	window.location.href = "rightAdd.jsp";
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
</head>
<body bgcolor="#ffffff">

<form action="rightAdd.dispatch" method="post">
  <table width="100%" border="1" cellspacing="0" cellpadding="0">
    <tr> 
      <td>名称</td>
      <td><input name="name" /></td>
    </tr>
    <tr> 
      <td>显示名称</td>
      <td><input name="display" /></td>
    </tr>
  </table>
  <input type="submit" value="增加" />
</form>
</body>
</html>