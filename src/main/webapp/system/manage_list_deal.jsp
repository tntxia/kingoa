<%@ page contentType="text/html;charset=gb2312" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="UserBean" scope="page" class="infocrmdb.infocrmdb" />
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

     String queryName =request.getParameter("qName");
     String sql="delete from username where name='" + queryName + "'";
     UserBean.executeUpdate(sql); 
     response.sendRedirect("manage_list.jsp?delbutton=OK");
%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>列表方式的用户信息管理的处理部分</title>
</HEAD>
<body>
</BODY>
<%}}%>
</HTML>