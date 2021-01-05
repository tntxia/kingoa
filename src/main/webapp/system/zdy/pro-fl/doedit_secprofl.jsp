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
 if(id1!=""){
  String price_gk=request.getParameter("price_gk");
 String price_jysj=request.getParameter("price_jysj");
 String price_min=request.getParameter("price_min");
 String price_dljg=request.getParameter("price_dljg");
 String price_wf=request.getParameter("price_wf");
 String snumber=request.getParameter("snumber");
 String proflname1=request.getParameter("proflname");
 String eprofl1=request.getParameter("eprofl");
 String remark1=request.getParameter("remark");
  String strSQL="update secprofl set   price_gk='" + price_gk + "',price_jysj='" + price_jysj + "',price_min='" + price_min + "',price_dljg='" + price_dljg + "',snumber='" + snumber + "',proflname='" + proflname1 + "',eprofl='" + eprofl1 + "',remark='" + remark1 + "' where id='" + id1 + "'";
  einfodb.executeUpdate(strSQL);
 } 
 else out.println("err");
 %>
<body bgcolor="#ffffff">
<div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">修改成功!</font></b></p>
  <p><font color="#000000" size="2"><a href="javascript:window.close()" style="font-size: 12px">关闭</a> <a href="secprofl.jsp" style="font-size: 12px">返回</a></font></p>
</div>
</body><%}%>
</html>