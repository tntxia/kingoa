<%@ page contentType="text/html;charset=gb2312" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>芯片商城有限公司</title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
 String id1=request.getParameter("id");
 String p=request.getParameter("p");
 String cre_name1=request.getParameter("cre_name");
 String mxname=request.getParameter("mxname");
 String strSQL="update km_mx  set   km_mx='" + cre_name1 + "'   where  id='" + id1 + "'";
    boolean t= einfodb.executeUpdate(strSQL);
   if(!t)
   {
     out.println("<font size='2' color='#FF0000'>添加失败,你所输入的内容超出系统范围或输入类型不符!</font>");
	 return;
   }
 String strSQL3="update credit_debit  set l_c_d='" + cre_name1 + "'   where l_c_d='" + mxname + "'";
 einfodb.executeUpdate(strSQL3);
 String strSQL5="update credit_debit  set l_topic='" + cre_name1 + "'   where l_topic='" + mxname + "'";
 einfodb.executeUpdate(strSQL5);
 %>
 
<body bgcolor="#ffffff">
<div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p>

    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
  <p style="font-size:16px; color: #f00; font-family:'宋体'; letter-spacing:0px; vertical-align:middle;">修改成功!</font></p>
  <p><a href="credit.jsp?p=<%=p%>" style="font-size: 12px">返回</a></p>
</div>
</body>
</html>