<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
 String getaLoginmessage = (String) session.getValue("adminloginSign");
   if(getaLoginmessage!="admin"){
%>
    <script language=javascript>
    window.location="../../manageslogin.jsp"
    </script>
<% } else {%>   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>增加组织形式</title>
<link rel=stylesheet href="../client/style.css" type="text/css">
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
-->
</style>
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
 String act_name1=request.getParameter("act_name");

 String strSQL="insert into activity_type values('" + act_name1 + "')";
 einfodb.executeUpdate(strSQL);
 %>
<body bgcolor="#ffffff">
<div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p>

    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
    <p style="font-size:16px; color: #f00; font-family:'宋体'; letter-spacing:0px; vertical-align:middle;">操作成功!</font></p>
  <p><span class="STYLE1"><a href="nactivity.jsp" style="font-size: 12px">继续增加</a> <a href="activity.jsp" style="font-size: 12px">返回</a></span></p>
</div>
</body>
<%}}%>
</html>