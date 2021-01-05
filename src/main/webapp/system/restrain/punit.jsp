<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*,java.text.*,com.tntxia.oa.system.entity.*"%>
<%

String basePath = request.getContextPath();
List<Restrain> list = (List<Restrain>) request.getAttribute("result");

%>
<html>
<head>
<title>系统权限组自定义</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #000000}
.H1 {font-size:12pt; line-height:15pt; align=center}
.ourfont {font-size:9pt; line-height:15pt; }
.ourfont1 {font-size:8pt; line-height:13pt; }
A{text-transform: none; text-decoration:none;color:#0000ff}
a:hover {text-decoration:underline;color:#0000ff}
-->
</style>
</head>

<body bgcolor="#ffffff" text="#000000">
<br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
  <tr> 
    <td height="2" colspan="2"><font color="#000000" size="2">系统权限组自定义 &gt;&gt;<a href="<%=basePath%>/system/restrain/npunit.jsp" style="font-size: 12px">增加</a></font> 
      <a href="npunit.jsp" style="font-size: 12px"><font size="2"><font color="#0000ff" size="2"> </font></font></a></td>
  </tr>
  <tr height="8"> 
    <td width="29%" bgcolor="#d3d8eb"><font size="2" color="#000000">&nbsp;</font>&nbsp;</td>
    <td width="71%" bgcolor="#d3d8eb"> <div align="center" class="STYLE1"><font size="2">权限组</font>&nbsp;</div></td>
  </tr>
  <%
   
   for(Restrain r : list){
	   int id=r.getId();
	   String name = r.getName();
	   %>
  <tr height="8"><td>
 	 <input type="button" value="查阅" name="B222" 
 	 style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" 
 	 onClick="window.open('<%=basePath%>/system/restrain.dispatch?method=editRestrainById&id=<%=id%>','_self', 'height=598, width=1005, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
 	 <input type="button" value="新功能权限" name="B222" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" 
 	 onClick="window.open('<%=basePath%>/system/right/roleRight.dispatch?id=<%=id%>','_self', 'height=598, width=1005, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
   <input type="button" value="删除" name="B222" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" 
   	onClick="window.open('<%=basePath%>/system/restrain.dispatch?method=del&id=<%=id%>','_self', 'height=598, width=1005, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
    <td width="71%" height="8" bgcolor="#ffffff"> <div align="left"><font size="2"><%=name%></font>&nbsp;</div></td>
  </tr>
  <% } %>
  
</table>
</body>
</html>
 
