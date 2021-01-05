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
<title>修改密码</title>
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="UserBean" scope="page" class="infocrmdb.infocrmdb" />
<%
  String  id =request.getParameter("id");
  String  password =request.getParameter("password");
  String  old_password =request.getParameter("old_password");
  String  username =request.getParameter("username");
  String strSQLc="delete from messageuser ";
  UserBean.executeUpdate(strSQLc);
  String strSQL="insert into messageuser values('" + id + "','" + username + "','" + password +"')";
     boolean t= UserBean.executeUpdate(strSQL);
   if(!t)
   {
     out.println("添加失败,你所输入的内容超出系统范围或输入类型不符!");
	 return;
   }
 UserBean.closeStmt();
 UserBean.closeConn();

%>
<script language="JavaScript">
 window.open('http://txt1.alexcomm.com:7001/smsExChangePassword?user=<%=username%>&password=<%=old_password%>&newpassword=<%=password%>','_self', 'height=500, width=710, top=200, left=200, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')
 </script>

<body>
<div align="center">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p><font color="#000000">修改成功!</font></p>
  <p><font color="#000000"></font></p>
  <p></p>
  <p>&nbsp;</p>
</div>
</body>
<%}}%>
</html>