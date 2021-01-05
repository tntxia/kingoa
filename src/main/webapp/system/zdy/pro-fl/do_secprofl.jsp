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
<title>自定义</title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
 String price_gk=request.getParameter("price_gk");
 String price_jysj=request.getParameter("price_jysj");
 String price_min=request.getParameter("price_min");
 String price_dljg=request.getParameter("price_dljg");
 String price_wf=request.getParameter("price_wf");
 String snumber=request.getParameter("snumber");
 String firnumber=request.getParameter("firnumber");
 String proname1=request.getParameter("proname");
 String id=request.getParameter("id");
 String proflname1=request.getParameter("proflname");
 String eprofl1=request.getParameter("eprofl");
 String remark1=request.getParameter("remark");
 String sql="select * from secprofl where   proflname='" + proflname1 + "'";
 ResultSet rs = einfodb.executeQuery(sql); 
 if(rs.next()) { rs.close();
  session.putValue("secprofl_message","中文名称已经重复!");
 } 
else
{ 
 session.putValue("secprofl_message","");
 String strSQL="insert into secprofl values('" + id + "','" + proflname1 + "','" + eprofl1 + "','0','0','0','0','0','" + remark1 +"','" + snumber +"')";
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
<div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">添加成功!</font></b></p>
  <p><font color="#000000" size="2"><a href="secnprofl.jsp?id=<%=id%>&proname=<%=proname1%>&firnumber=<%=firnumber%>" style="font-size: 12px"> 
    继续登记</a> </font><font color="#000000" size="2"><a href="secprofl.jsp" style="font-size: 12px">返回</a></font></p>
  </div>
</body><%}%>
</html>