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
<title>处理用户修改注册信息</title>
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="UserBean" scope="page" class="infocrmdb.infocrmdb" />
<%
  String name1=request.getParameter("name");
  String sex1=request.getParameter("sex");
  String department1=request.getParameter("department");
  String email1=request.getParameter("email");
  String worktel1=request.getParameter("worktel");
  String userdate1=request.getParameter("userdate");
  String yjxs1=request.getParameter("yjxs");
  String hometel1=request.getParameter("hometel");
  String waptel1=request.getParameter("waptel");
  String sql="select  * from department where departname='"+yjxs1+"'";
  ResultSet rs=RegBean2.executeQuery(sql);
 if(!rs.next())
  {
    out.println("not have record");
    return;
  }
 String deptjb=rs.getString("dept_code");

  String strSQL="update username set sex='" + sex1 + "',department='" + department1 + "',email='" + email1 + "',worktel='" + worktel1 + "',userdate='" + userdate1 + "',yjxs='" + yjxs1 + "',hometel='" + deptjb + "',waptel='" + waptel1 + "' where name='" + name1 + "'";
  UserBean.executeUpdate(strSQL);
%>
<body>
<script language=javascript>
  window.location="passthrough.jsp?showword=修改"
</script>
</body>
<%}}%>
</html>