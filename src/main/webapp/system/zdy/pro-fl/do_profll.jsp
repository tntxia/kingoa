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
<title>品牌</title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
 String snumber=request.getParameter("snumber");
 String tnumber=request.getParameter("tnumber");
 String id=request.getParameter("id");
 String sid=request.getParameter("sid");
 String proname1=request.getParameter("proname");
 String epro1=request.getParameter("epro");
 String cpro1=request.getParameter("cpro");
 String remark1=request.getParameter("remark");
 String sql="select * from profll where  cpro='" + cpro1 + "'";
 ResultSet rs = einfodb.executeQuery(sql); 
 if(rs.next()) { rs.close();
  session.putValue("profll_message","中文名称已经重复!");
 } 
else
{ 
  session.putValue("profll_message","");
  String strSQL="insert into profll values('" + id + "','" + sid + "','" + cpro1 + "','" + epro1 + "','" + remark1 +"','" + tnumber +"')";
  einfodb.executeUpdate(strSQL);
  rs.close();
 } 
 %>
<body bgcolor="#ffffff"><div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">登记成功!</font></b></p>
  <p><font color="#000000" size="2"><a href="lnprofl.jsp?sid=<%=sid%>&id=<%=id%>&proname=<%=proname1%>&snumber=<%=snumber%>" style="font-size: 12px">继续登记</a> 
    <a href="lprofl.jsp" style="font-size: 12px">返回列表</a></font></p>
  <p><font color="#000000"></font></p>
</div>
</body><%}%>
</html>