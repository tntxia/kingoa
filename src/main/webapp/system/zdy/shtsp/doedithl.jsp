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
<title>芯片商城有限公司</title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
 String id1=request.getParameter("id");
 String dept=request.getParameter("dept");
 String role=request.getParameter("role");
  String price_min=request.getParameter("price_min");
 String price_max=request.getParameter("price_max");
 String dd_man=request.getParameter("dd_man");
  String iffsp=request.getParameter("iffsp");
 String fsp_man=request.getParameter("fsp_man");
 String firsp=request.getParameter("firsp");
 String fir_man=request.getParameter("fir_man");
  String remark=request.getParameter("remark");
  String ifsp=request.getParameter("ifsp");

  String strSQL="update shtsp set  price_min='" + price_min + "',price_max='" + price_max + "',dept='" + dept + "',role='" + role + "',ifsp='" + ifsp + "',dd_man='" + dd_man + "',iffsp='" + iffsp + "',fsp_man='" + fsp_man + "',firsp='" + firsp + "',fir_man='" + fir_man + "',remark='" + remark + "' where id='" + id1 + "'";
  einfodb.executeUpdate(strSQL);
 %>
<body bgcolor="#ffffff"><div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">修改成功!</font></b></p>
  <p><font color="#000000" size="2"><a href="hlxx.jsp" style="font-size: 12px">返回</a></font></p>
</div>
</body><%}}%>
</html>