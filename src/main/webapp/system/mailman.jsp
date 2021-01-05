<jsp:useBean id="infocrmdb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page import="java.sql.*,java.util.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
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
<META HTTP-EQUIV="Pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache"> 
<META HTTP-EQUIV="Expires" CONTENT="0"> 
<title>邮件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String id1=request.getParameter("id");
String sql="select  * from mailman where id='1'";
ResultSet rs=infocrmdb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
	
  }
%>

<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="do_mail.jsp">
  <table width="399" border="1" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr> 
      <td colspan="2"> <div align="center"><font color="#000000" face="Arial, Helvetica, sans-serif">电子促销邮件帐号设置</font>&nbsp;</div></td>
    </tr>
    <tr> 
      <td width="90" height="26">smtp</td>
      <td width="290" height="26"> <input name="hostname" type="text" value="<%=rs.getString("hostname")%>" size="35"> 
      </td>
    </tr>
    <tr> 
      <td width="90">用户名</td>
      <td width="290"> <input type="text" name="name" value="<%=rs.getString("name")%>"> 
      </td>
    </tr>
    <tr> 
      <td width="90" height="20">密码</td>
      <td width="290"> <input type="password" name="password" value="<%=rs.getString("password")%>"> 
      </td>
    </tr>
    <tr> 
      <td>发件邮件</td>
      <td> <input name="from" type="text" id="from" value="<%=rs.getString("frommail")%>"> </td>
    </tr>
    <tr> 
      <td width="90">&nbsp;</td>
      <td width="290"> <input type="submit" name="Submit" value="确定"> </td>
    </tr>
  </table>
  </form>
</body>
<%}}%>
</html>
