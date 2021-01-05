<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="onLineUser,java.util.*" %>
<jsp:useBean id="onlineuser" class="onLineUser" scope="application"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>登录检查</title>
</head>
<body bgcolor="#ffffff">
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="LoginBean" scope="page" class="infocrmdb.infocrmdb" />
 <%
  java.text.SimpleDateFormat simple1=new java.text.SimpleDateFormat("yyyy-MM-dd");
 String cdate=simple1.format(new java.util.Date());
 String sqlinfo="select * from info where pro_date>='" + cdate + "'";
 ResultSet rsinfo = LoginBean.executeQuery(sqlinfo);
 if(!rsinfo.next()) { 
 out.print("试用已到期，请购买正式版本，联系电话：22068785");
 return;
 }
 session = request.getSession(false);
 java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd-HH-mm");
 String currentDate=simple.format(new java.util.Date());
 String username=request.getParameter("user_id").trim();
 String pwd1=request.getParameter("password");
 MD5 md5=new MD5();
  pwd1=md5.getMD5ofStr(pwd1);	//将密码进行MD5加密
 String sqlusername="select * from username where name='" + username + "'";
 ResultSet rsusername = LoginBean.executeQuery(sqlusername);
 if(!rsusername.next()) {
 out.print("系统暂无该用户!");
 return;
 }
 String Remotehost = request.getRemoteHost();
 String ipbd=rsusername.getString("ipbd").trim();
 if(ipbd.equals("是")){
  String sql="select * from username where name='" + username + "' and password='" + pwd1 + "' and user_ip='" + Remotehost + "'";
 ResultSet rs = LoginBean.executeQuery(sql);
 if(rs.next()) { 
 String name1=rs.getString("name").trim();
 String ename=rs.getString("department").trim();
 String role=rs.getString("workj");
 String restrain=rs.getString("userdate").trim();
 String dept1=rs.getString("yjxs").trim();
 String deptjb=rs.getString("hometel");
 session.putValue("login_message","" );
 rs.close();
 LoginBean.closeStmt();
 LoginBean.closeConn();
       session.setMaxInactiveInterval(3600); file://Sesion有效时长，以秒为单位
       session.setAttribute(name1,onlineuser);
	   String Remoteadd= request.getRemoteAddr(); 
	   String Sername= request.getServerName(); 
       String strSQL="insert into logdate values('" + name1 + "','" + Remotehost +"','" + Remoteadd + "','" + Sername + "','" + currentDate + "')";
   boolean t= LoginBean.executeUpdate(strSQL);
   if(!t)
   {
     out.println("<font size='2' color='#FF0000'>添加日志失败!</font>");
	 return;
   }
   
 session.putValue("Remotehost",Remotehost);
 session.putValue("Remoteadd",Remoteadd);
 session.putValue("Sername",Sername);
 session.putValue("currentDate",currentDate);
 session.putValue("restrain_name",restrain);
 session.putValue("dept",dept1);
 session.putValue("deptjb",deptjb);
 session.putValue("ename",ename);
 session.putValue("role",role);
 session.putValue("username",name1);
 session.putValue("loginSign","OK");
 session.putValue("login_message","");
  %>
     <script language=javascript>
     window.location="einfocrm.jsp"
     </script>
 <% } else{ 
  LoginBean.closeStmt();
  LoginBean.closeConn();
  String msg="登录名或口令有误!";
  session.putValue("login_message",msg );
%>
  <jsp:forward page="indexlog.jsp"/>
  <%}}
 else  if(ipbd.equals("否")){
 String sql="select * from username where name='" + username + "' and password='" + pwd1 + "'";
 ResultSet rs = LoginBean.executeQuery(sql);
 if(rs.next()) { 
 String name1=rs.getString("name").trim();
 String ename=rs.getString("department").trim();
 String role=rs.getString("workj");
 String restrain=rs.getString("userdate").trim();
 String dept1=rs.getString("yjxs").trim();
 String deptjb=rs.getString("hometel");
 session.putValue("login_message","" );
 rs.close();
 LoginBean.closeStmt();
 LoginBean.closeConn();
       session.setMaxInactiveInterval(3600); file://Sesion有效时长，以秒为单位
       session.setAttribute(name1,onlineuser);
	   String Remoteadd= request.getRemoteAddr(); 
	   String Sername= request.getServerName(); 
	   String strSQL="insert into logdate values('" + name1 + "','" + Remotehost +"','" + Remoteadd + "','" + Sername + "','" + currentDate + "')";
   boolean t= LoginBean.executeUpdate(strSQL);
   if(!t)
   {
     out.println("<font size='2' color='#FF0000'>添加日志失败!</font>");
	 return;
   }
  session.putValue("Remotehost",Remotehost);
 session.putValue("Remoteadd",Remoteadd);
 session.putValue("Sername",Sername);
 session.putValue("currentDate",currentDate);
 session.putValue("restrain_name",restrain);
 session.putValue("dept",dept1);
 session.putValue("deptjb",deptjb);
 session.putValue("ename",ename);
 session.putValue("role",role);
 session.putValue("username",name1);
 session.putValue("loginSign","OK");
 session.putValue("login_message","");
  %>
     <script language=javascript>
     window.location="einfocrm.jsp"
     </script>
 <% } else{ 
  LoginBean.closeStmt();
  LoginBean.closeConn();
  String msg="登录名或口令有误!";
  session.putValue("login_message",msg );
%>
  <jsp:forward page="indexlog.jsp"/>
  <%}}%>
</body>
</html>
