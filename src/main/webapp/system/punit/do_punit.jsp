<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../refuse.jsp"
    </script>
<% } else {    
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�������ӵ�λ�Զ���</title>
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
 String punit_name1=request.getParameter("punit_name");
 String strSQL="insert into punit_type values('" + punit_name1 + "')";
 einfodb.executeUpdate(strSQL);
 %>
<body bgcolor="#ffffff">
<div align="center"><br><br><br> <p><img src="../../images/cg.jpg" width="111" height="111"></p>

    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
    <p style="font-size:16px; color: #f00; font-family:'����'; letter-spacing:0px; vertical-align:middle;">�����ɹ�!</font></p>
  <p><span class="STYLE1"><a href="npunit.jsp" style="font-size: 12px">��������</a> <a href="punit.jsp" style="font-size: 12px">����</a></span></p>
</div>
</body>
<%}%>
</html>