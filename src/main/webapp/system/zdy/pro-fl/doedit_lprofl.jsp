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
<title>芯片商城有限公司</title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
 String id1=request.getParameter("id");
 String ncpro=request.getParameter("ncpro");
 String seckind=request.getParameter("seckind");
 String tnumber=request.getParameter("tnumber");
 String cpro1=request.getParameter("cpro");
 String epro=request.getParameter("epro");
 String remark1=request.getParameter("remark");
 String strSQL="update profll set tnumber='" +tnumber + "',cpro='" +cpro1 + "',epro='" +epro + "',remark='" + remark1 + "' where id='" + id1 + "'";
 einfodb.executeUpdate(strSQL);
 %>
<body bgcolor="#ffffff"><div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">修改成功!</font></b></p>
  <p><font color="#000000" size="2"><a href="lprofl.jsp" style="font-size: 12px">返回</a></font></p>
</div>
</body>
</html><%}%>