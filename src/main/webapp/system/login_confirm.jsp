<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="onLineUser,java.util.*" %>
<jsp:useBean id="onlineuser" class="onLineUser" scope="application"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��¼���</title>
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
 out.print("�����ѵ��ڣ��빺����ʽ�汾����ϵ�绰��22068785");
 return;
 }
 session = request.getSession(false);
 java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd-HH-mm");
 String currentDate=simple.format(new java.util.Date());
 String username=request.getParameter("user_id").trim();
 String pwd1=request.getParameter("password");
 MD5 md5=new MD5();
  pwd1=md5.getMD5ofStr(pwd1);	//���������MD5����
 String sqlusername="select * from username where name='" + username + "'";
 ResultSet rsusername = LoginBean.executeQuery(sqlusername);
 if(!rsusername.next()) {
 out.print("ϵͳ���޸��û�!");
 return;
 }
 String Remotehost = request.getRemoteHost();
 String ipbd=rsusername.getString("ipbd").trim();
 if(ipbd.equals("��")){
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
       session.setMaxInactiveInterval(3600); file://Sesion��Чʱ��������Ϊ��λ
       session.setAttribute(name1,onlineuser);
	   String Remoteadd= request.getRemoteAddr(); 
	   String Sername= request.getServerName(); 
       String strSQL="insert into logdate values('" + name1 + "','" + Remotehost +"','" + Remoteadd + "','" + Sername + "','" + currentDate + "')";
   boolean t= LoginBean.executeUpdate(strSQL);
   if(!t)
   {
     out.println("<font size='2' color='#FF0000'>�����־ʧ��!</font>");
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
  String msg="��¼�����������!";
  session.putValue("login_message",msg );
%>
  <jsp:forward page="indexlog.jsp"/>
  <%}}
 else  if(ipbd.equals("��")){
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
       session.setMaxInactiveInterval(3600); file://Sesion��Чʱ��������Ϊ��λ
       session.setAttribute(name1,onlineuser);
	   String Remoteadd= request.getRemoteAddr(); 
	   String Sername= request.getServerName(); 
	   String strSQL="insert into logdate values('" + name1 + "','" + Remotehost +"','" + Remoteadd + "','" + Sername + "','" + currentDate + "')";
   boolean t= LoginBean.executeUpdate(strSQL);
   if(!t)
   {
     out.println("<font size='2' color='#FF0000'>�����־ʧ��!</font>");
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
  String msg="��¼�����������!";
  session.putValue("login_message",msg );
%>
  <jsp:forward page="indexlog.jsp"/>
  <%}}%>
</body>
</html>
