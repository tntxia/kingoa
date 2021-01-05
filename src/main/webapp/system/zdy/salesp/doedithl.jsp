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
 String s_name=request.getParameter("s_name").trim();
 String s_m_min=request.getParameter("s_m_min");
 String s_m_max=request.getParameter("s_m_max");
 String s_m_tc=request.getParameter("s_m_tc");
 String s_m_tc2=request.getParameter("s_m_tc2");
 String s_m_rate_min=request.getParameter("s_m_rate_min");
 String s_m_rate_max=request.getParameter("s_m_rate_max");
 String s_m_rate_tc=request.getParameter("s_m_rate_tc");
 String s_m_rote_min=request.getParameter("s_m_rote_min");
 String s_m_rote_max=request.getParameter("s_m_rote_max");
 String s_m_rote_money=request.getParameter("s_m_rote_money");
 String s_y_rate_min=request.getParameter("s_y_rate_min");
 String s_y_rate_max=request.getParameter("s_y_rate_max");
 String s_y_rate_tc=request.getParameter("s_y_rate_tc");
 String s_y_min=request.getParameter("s_y_min");
 String s_y_max=request.getParameter("s_y_max");
 String s_types=request.getParameter("s_types").trim();
 String s_y_tc=request.getParameter("s_y_tc");
 String remark=request.getParameter("remark");
 String s_date=request.getParameter("s_date");

  String strSQL="update sale_tc set  s_m_tc2='" + s_m_tc2 + "',s_types='" + s_types + "',s_name='" + s_name + "',s_m_min='" + s_m_min + "',s_m_max='" + s_m_max + "',s_m_tc='" + s_m_tc + "',s_y_min='" + s_y_min + "',s_y_max='" + s_y_max + "',s_y_tc='" + s_y_tc + "',remark='" + remark + "',s_m_rate_min='" + s_m_rate_min + "',s_m_rate_max='" + s_m_rate_max + "',s_m_rate_tc='" + s_m_rate_tc + "',s_m_rote_min='" + s_m_rote_min + "',s_m_rote_max='" + s_m_rote_max + "',s_m_rote_money='" + s_m_rote_money + "',s_y_rate_min='" + s_y_rate_min + "',s_y_rate_max='" + s_y_rate_max + "',s_y_rate_tc='" + s_y_rate_tc + "' where id='" + id1 + "'";
  einfodb.executeUpdate(strSQL);
 %>
<body bgcolor="#ffffff"><div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">修改成功!</font></b></p>
  <p><font color="#000000" size="2"><a href="hlxx.jsp" style="font-size: 12px">返回</a></font></p>
</div>
</body><%}}%>
</html>