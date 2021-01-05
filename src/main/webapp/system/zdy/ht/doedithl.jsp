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
<title>芯片商城有限公司</title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="infocrmdb.DealString" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%

request.setCharacterEncoding("gb2312");
 String id1=request.getParameter("id");
 String q_topic=request.getParameter("q_topic");
 String q_company=request.getParameter("q_company");
 String q_addr=request.getParameter("q_addr");
 String q_tel=request.getParameter("q_tel");
 String q_fax=request.getParameter("q_fax");
 String q_email=request.getParameter("q_email");
 String q_net=request.getParameter("q_net");
 String q_man=request.getParameter("q_man");
 String q_post=request.getParameter("q_post");
 String q_number=request.getParameter("q_number");
 String q_tk=request.getParameter("q_tk");
  q_tk = DealString.htmlEncode(q_tk);
 q_tk=com.infoally.util.Replace.strReplace(q_tk,"'","''");
 String remark1=request.getParameter("remark");
 String q_name=request.getParameter("q_name");

  String strSQL="update ht_mb set q_name='" + q_name + "',q_topic='" + q_topic + "',q_company='" + q_company + "',q_man='" + q_man + "',q_addr='" + q_addr + "',q_tel='" + q_tel + "',q_fax='" + q_fax + "',q_email='" + q_email + "',q_net='" + q_net + "',q_tk='" + q_tk + "',q_post='" + q_post + "',q_number='" + q_number + "',remark='" + remark1 + "' where id='" + id1 + "'";
   boolean t= einfodb.executeUpdate(strSQL);
   if(!t)
   {
     out.println("添加失败,你所输入的内容超出系统范围或输入类型不符!");
	 return;
   }
 %>
<body bgcolor="#ffffff"><div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">修改成功!</font></b></p>
  <p><font color="#000000"></font><font color="#000000" size="2"><a href="hlxx.jsp" style="font-size: 12px">返回</a></font></p>
</div>
</body><%}%>
</html>