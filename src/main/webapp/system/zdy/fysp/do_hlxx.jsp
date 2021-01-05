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
<title>费用审批流程</title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
 String price_min=request.getParameter("price_min");
 String  price_max=request.getParameter("price_max");
 String dd_man=request.getParameter("dd_man");
 String fif=request.getParameter("fif");
 String fspman=request.getParameter("fspman");
 String firspif=request.getParameter("firspif");
 String firspman=request.getParameter("firspman");
 String dept=request.getParameter("dept");
 String role=request.getParameter("role");
 String dd_date=request.getParameter("dd_date");
 String remark1=request.getParameter("remark");
 String strSQL="insert into fysp values('" + dept + "','" + role + "','" + price_min + "','" + price_max + "','" + dd_man + "','" + fif +"','" + fspman +"','" + firspif +"','" + firspman +"','" + remark1 +"','" + dd_date +"')";
    boolean t= einfodb.executeUpdate(strSQL);
   if(!t)
   {
     out.println("<font size='2' color='#FF0000'>添加失败,你所输入的内容超出系统范围或输入类型不符!</font>");
	 return;
   }

 %>
<body bgcolor="#ffffff"><div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">登记成功!</font></b></p>
  <p><font color="#000000" size="2"><a href="nhlxx.jsp" style="font-size: 12px">继续登记</a> <a href="hlxx.jsp" style="font-size: 12px">返回</a></font></p>
  <p><font color="#000000"></font></p>
</div>
</body><%}}%>
</html>