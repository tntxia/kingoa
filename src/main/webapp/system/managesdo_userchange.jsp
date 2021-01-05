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
<link rel=stylesheet href="style.css" type="text/css">

</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="UserBean" scope="page" class="infocrmdb.infocrmdb" />
<%
 String name = (String) session.getValue("adminname");
 String pwd=request.getParameter("password");
 
 String strSQL="update admin set password='" + pwd + "' ";
 UserBean.executeUpdate(strSQL);
%>
<body>
<div align="center">
<br><br><br><br>
  <p><img src="../images/cg.jpg" width="111" height="111"></p>

    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
    <p style="font-size:16px; color: #f00; font-family:'宋体'; letter-spacing:0px; vertical-align:middle;">密码修改成功!</font></p>
  <p><a href="manageslogin.jsp" style="font-size: 12px"> </a></p>
  <p>&nbsp;</p>
</div>
</body>
<%}}%>
</html>