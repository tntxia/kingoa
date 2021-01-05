<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../refuse.jsp"
    </script>
<% } else {    
 String getaLoginmessage = (String) session.getValue("adminloginSign");
   if(getaLoginmessage!="admin"){
%>
    <script language=javascript>
    window.location="manageslogin.jsp"
    </script>
<% } else {    
%>
<html>
<head>
<title>修改密码</title>
<link rel=stylesheet href="style.css" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
-->
</style></head>
<body>
<jsp:useBean id="AdminChangeBean" scope="page" class="infocrmdb.infocrmdb" /> 
<div align="center">   <br /><form method="post" action="managesdo_userchange.jsp"> 
  <table width="100%" border="0" cellpadding="3" height="50">
    <tr>
      <td><div align="center"><font size="5"><b><font color="#213e9b">管理员密码修改</font></b></font></div>
          <hr width="100%" size="1" noshade color="#213e9b">
      </td>
    </tr>
  </table> <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
<tr> <td width="26%"> <div align="center"><FONT COLOR="#000000" size="2" FACE="宋体">管理员名称：</font>&nbsp;</div></td><td width="21%"> 
<font face="宋体" size="2"><%@ page language="java" import="java.sql.*" %> <%
  String name = (String) session.getValue("adminname");
  String sql="select * from admin where adminname='" + name + "'";
  ResultSet rs = AdminChangeBean.executeQuery(sql); 
  String password="";
  String pwd="";
 if(rs.next()) { 
  password=rs.getString("password");
  pwd=new String(password.getBytes("8859_1"),"gb2312");
  
  rs.close();
}
%> <%=name%> </FONT><div align="center"></div><div align="center"></div></td><td width="21%"> 
<div align="center"><FONT COLOR="#000000" size="2" FACE="宋体">管理员密码：</font>&nbsp;</div></td><td width="32%"> 
<div align="center"> <font face="宋体" size="2"><input name="password" type="password" value="<%=pwd%>" maxlength="30" > 
</font>&nbsp;</div></td></tr> <tr> <td width="26%">&nbsp;</td><td width="21%">&nbsp;</td><td width="21%">&nbsp;</td><td width="32%">&nbsp;</td></tr> 
<tr> <td colspan="4" height="9"> <div align="center"> <input type="submit" name="Submit" value="修改"> 
<input type="button" name="closebutton" value="关闭" onClick="javascript:window.close()"> 
</div><div align="center"> </div></td></tr> </table></form><p>&nbsp;</p></div>
</body>
<%}}%>
</html>
