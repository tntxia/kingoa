<%@ page contentType="text/html;charset=gb2312" %>
<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>仓库</title>
<link rel=stylesheet href="style.css" type="text/css">

<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
-->
</style>
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%

request.setCharacterEncoding("gb2312");
 String number=request.getParameter("number");
 String proflname1=request.getParameter("proflname");
 String cpro1=request.getParameter("cpro");
 String remark1=request.getParameter("remark");
 String sql="select * from profl where cpro='" + cpro1 + "'";
 ResultSet rs = einfodb.executeQuery(sql); 
 if(rs.next()) { rs.close();
  session.putValue("profl_message","仓库名称已经重复!");
  %>
  <jsp:forward page="nprofl.jsp"/>
 <% } 
 else
 { 
  session.putValue("profl_message","");
  String strSQL="insert into profl values('" + number + "','" + proflname1 + "','" + cpro1 +"','" + remark1 +"')";
   boolean t= einfodb.executeUpdate(strSQL);
   if(!t)
   {
     out.println("添加失败,你所输入的内容超出系统范围或输入类型不符!");
	 return;
   }
  rs.close();
 } 
 %>
<body bgcolor="#ffffff">
<div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p>

    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
  <p style="font-size:16px; color: #f00; font-family:'宋体'; letter-spacing:0px; vertical-align:middle;">仓库登记成功!</font></p>
  <p align="center" class="STYLE2"><span class="STYLE1"><a href="nprofl.jsp" style="font-size: 12px">继续登记</a> <a href="zjkindf.jsp" style="font-size: 12px">返回</a></span></p>
  <p><font color="#000000"></font></p>
</div>
</body><%}%>
</html>