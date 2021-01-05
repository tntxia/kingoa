<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
    
<%

String companyName = (String)request.getAttribute("companyName");
String website = (String)request.getAttribute("website");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>OA 系统信息维护</title>
</head>
<body>
<form action="updateSystemInfo.dispatch" method="post">
<table>
	<tr><td>公司名：</td><td><input name="companyName" value="<%=companyName%>"/></td></tr>
	<tr><td>公司网址：</td><td><input name="website"  value="<%=website%>"/></td></tr>
	<tr><td colspan="2"><input type="submit" value="修改" /></td></tr>
</table>

</form>

</body>
</html>