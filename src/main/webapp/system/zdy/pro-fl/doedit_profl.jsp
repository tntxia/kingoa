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
<title>修改仓库定义</title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
request.setCharacterEncoding("gb2312");
 String id1=request.getParameter("id");
 if(id1!=""){
 String number=request.getParameter("number");
 String proflname1=request.getParameter("proflname");
 String ocpro=request.getParameter("ocpro").trim();
 String cpro1=request.getParameter("cpro");
 String remark1=request.getParameter("remark");
 String strSQL="update profl set number='" + number + "',proflname='" + proflname1 + "',cpro='" + cpro1 + "',remark='" + remark1 + "' where id='" + id1 + "'";
 einfodb.executeUpdate(strSQL);
 String strSQLc="update warehouse set pro_addr='" + cpro1 + "'  where pro_addr='" + ocpro + "'";
 einfodb.executeUpdate(strSQLc);
       }
  else 
  out.println("err");
 %>
<body bgcolor="#ffffff">
<div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">仓库修改成功!</font></b></p>
  <p><a href="zjkindf.jsp" style="font-size: 12px">返回</a></p>
  <p><font color="#000000"></font></p>
</div>
</body><%}%>
</html>