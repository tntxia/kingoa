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
<% } else {    
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
 String xyjb_name=request.getParameter("xyjb_name");
 String remark1=request.getParameter("remark");
 String xy_date=request.getParameter("xy_date");

 String strSQL="insert into xyjb values('" + xyjb_name + "','" + remark1 +"','"+xy_date+"')";
   boolean t= einfodb.executeUpdate(strSQL);
   if(!t)
   {
     out.println("���ʧ��,������������ݳ���ϵͳ��Χ���������Ͳ���!");
	 return;
   }
 %>
<body bgcolor="#ffffff"><div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">�Ǽǳɹ�!</font></b></p>
  <p><font color="#000000" size="2"><a href="nhlxx.jsp" style="font-size: 12px">�����Ǽ�</a> </font><font color="#000000" size="2"><a href="hlxx.jsp" style="font-size: 12px">����</a></font></p>
  <p><font color="#000000"></font></p>
</div>
</body><%}}%>
</html>