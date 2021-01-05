<%@ page contentType="text/html;charset=gb2312"%>
<% 
String basePath = request.getContextPath();
%>
<html>
<head>
<title>国家管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/themes/icon.css" />

<script type="text/javascript" src="<%=basePath%>/js/config.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/js/system/base/country.js"></script>
</head>
<body>
	<table id="datagrid">
	</table>
</body> 
</html> 

