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
<title>完成</title>
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="ShadeBean" scope="page" class="mydb.mydb" />
<%
 String name1=(String) session.getValue("username");
 String shade1=new String(request.getParameter("shade"));
 String strSQL="insert into shade values('" + name1 + "','" + shade1 + "')";
 ShadeBean.executeUpdate(strSQL);
%>
<body>
<% response.sendRedirect("shade.jsp"); %>
</body>
<%}}%>
</html>