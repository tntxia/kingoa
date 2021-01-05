<%@ page contentType="text/html;charset=gb2312" %>
<%@ page language="java" import="java.sql.*" %> 
<jsp:useBean id="LoginBean" scope="page" class="infocrmdb.infocrmdb" /> 
<%@ include file="../common/checklogin.jsp" %>
<%
 String name=request.getParameter("adminname").trim();
 String pwd=request.getParameter("password");
 String sql="select * from admin  where adminname='" + name + "' and password='" + pwd + "'";
 ResultSet rs = LoginBean.executeQuery(sql);
 boolean success = false;
 if(rs.next()){ 
	 success = true;
	 session.putValue("adminname",name);
	 session.putValue("adminloginSign","admin");
	 session.putValue("manageslogin_message","" );
}
 rs.close();
 LoginBean.closeStmt();
 LoginBean.closeConn();
 
 if(success){
	 %>
	 <jsp:forward page="manageIndex.jsp"/>
	 <%
 }else{
	 String msg="登录名或口令有误!";
	 session.putValue("manageslogin_message",msg);
	 %>
	 <jsp:forward page="manageslogin.jsp"/>
	 <%
 }
 
%> 
