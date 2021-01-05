<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>处理用户信息</title>
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="UserBean" scope="page" class="infocrmdb.infocrmdb" />
<%
  String id=request.getParameter("id");
  String strSQL="update username set err='0' where nameid='" + id + "'";
  einfodb.executeUpdate(strSQL);
%>
<body>
<script language=javascript>
  window.location="username.jsp"
</script>
</body>
<%}}%>
</html>