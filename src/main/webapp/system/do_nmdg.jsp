<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../refuse.jsp"
    </script>
<% } else {    
 String getaLoginmessage = (String) session.getValue("adminloginSign");
   if(getaLoginmessage!="admin"){
%>
    <script language=javascript>
    window.location="manageslogin.jsp"
    </script>
<% } else {    
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>部门</title>
<link rel=stylesheet href="style.css" type="text/css">
<style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
-->
</style></head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="RegBean2" scope="page" class="infocrmdb.infocrmdb" />
<%
 String departname1=request.getParameter("departname");
 String remark1=request.getParameter("remark");
 String dept_types=request.getParameter("dept_types");
 String dept_code=request.getParameter("dept_code");
 String dept_code2=request.getParameter("dept_code2");
 String sqlss="select * from department where dept_code='" + dept_code2 +"" + dept_code +"'";
  ResultSet rsss = RegBean2.executeQuery(sqlss); 
  if(rsss.next()) { rsss.close();
  session.putValue("dept_message","部门编号重复!");
  %>
   <script language="JavaScript">
 window.open('nnmdgxx.jsp?dept_types=<%=dept_types%>&dept_code=<%=dept_code2%>','_self', 'height=300, width=710, top=200, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no')
 </script>
  <% } 
else
{ 
 session.putValue("dept_message","");
 String strSQL="insert into department values('" + departname1 + "','" + dept_types +"','" + dept_code2 +"" + dept_code +"','" + remark1 +"','')";
     boolean t= RegBean2.executeUpdate(strSQL);
   if(!t)
   {
     out.println("添加失败,你所输入的内容超出系统范围或部门编号重复!");
	 return;
   }
 %>
<body>
<div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">部门登记成功!</font></b></p>
  <p><font color="#000000" size="2"> <a href="mdgxx.jsp" style="font-size: 12px">返回</a></font></p>
  <p><font color="#000000"></font></p>
</div>
</body>
<%}}}%>
</html>