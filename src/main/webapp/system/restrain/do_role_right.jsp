<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="com.tntxia.oa.right.RightManager"%>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../refuse.jsp"
    </script>
<%   }else
 { 
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>增加</title>
<link rel=stylesheet href="../client/style.css" type="text/css">
<style type="text/css">
<!--
body {
	background-color: #ffffff;
}
.STYLE2 {font-size: 12px}
-->
</style></head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="rightManager" scope="page" class="RightManager" />

<%

String ename=request.getParameter("restrain_name").trim();
String id1=request.getParameter("id");
String right_type = request.getParameter("right_type");

String[] delete_contact_view= request.getParameterValues(right_type);


int right_add = 0,right_update = 0,right_delete = 0,right_enable = 0;

if(delete_contact_view!=null){
	for(int i=0;i<delete_contact_view.length;i++){
		if(delete_contact_view[i].equals("1"))
			right_add = 1;
		if(delete_contact_view[i].equals("2"))
			right_update = 1;
		if(delete_contact_view[i].equals("3"))
			right_delete = 1;
		if(delete_contact_view[i].equals("5"))
			right_enable = 1;
	}
}


rightManager.updateRoleRight(id1,ename,right_type,right_add,right_update,right_delete,right_enable);
%>
<body>
<div align="center"><br><br><br> <p><img src="../../images/cg.jpg" width="111" height="111"></p>

    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
  <p style="font-size:16px; color: #f00; font-family:'宋体'; letter-spacing:0px; vertical-align:middle;">操作成功!</p>
  <p><span class="STYLE2"> <a href="javascript:window.close()" style="font-size: 12px">关闭</a> 
      <a href="role_right.jsp?id=<%=id1 %>" style="font-size: 12px">返回</a> </span></p>
</div>
</body>
<%}%>
</html>