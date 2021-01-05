<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../refuse.jsp"
    </script>
<% } else {    
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>芯片商城有限公司</title>
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="UserBean" scope="page" class="infocrmdb.infocrmdb" />
<%
  String name1=request.getParameter("name");
  String password=request.getParameter("password");
    String mail_user=request.getParameter("mail_user");
  String mail_password=request.getParameter("mail_password");
  String mail_smtp=request.getParameter("mail_smtp");
  String email1=request.getParameter("email");
  String strSQL="update username set mail_user='" + mail_user + "',mail_password='" + mail_password + "',mail_smtp='" + mail_smtp + "',email='" + email1 + "',password='" + password + "' where name='" + name1 + "'";
  UserBean.executeUpdate(strSQL);
%>
<body>
<script language=javascript>
  window.location="passthrough.jsp?showword=修改"
</script> 
</body>
<%}%>
</html>