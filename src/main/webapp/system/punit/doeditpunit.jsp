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
<title>��λ��Ϣ�༭</title>
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
 String id1=request.getParameter("id");
 String com_name1=request.getParameter("punit_name");
 String strSQL="update punit_type set punit_name='" + com_name1 + "' where id='" + id1 + "'";
 einfodb.executeUpdate(strSQL);
 %>
 
<body bgcolor="#ffffff">
<div align="center"><br><br><br> <p><img src="../../images/cg.jpg" width="111" height="111"></p>

    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
  <p style="font-size:16px; color: #f00; font-family:'����'; letter-spacing:0px; vertical-align:middle;">�޸ĳɹ�!</font></p>
  <p><a href="punit.jsp" class="STYLE1" style="font-size: 12px">����</a></p>
</div>
</body>
<%}%>
</html>