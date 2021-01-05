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
<title>公司信息</title>
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="RegBean2" scope="page" class="infocrmdb.infocrmdb" />
<%
 String id1=request.getParameter("id");
 String companyname=request.getParameter("companyname");
 String companyname2=request.getParameter("companyname2");
 String companyaddr=request.getParameter("companyaddr");
 String companyaddr2=request.getParameter("companyaddr2");
 String bank_dm=request.getParameter("bank_dm");
 String bank_dm2=request.getParameter("bank_dm2");
 String companytel=request.getParameter("companytel");
 String companyfax=request.getParameter("companyfax");
 String companybank=request.getParameter("companybank");
 String companybank2=request.getParameter("companybank2");
 String companynumber=request.getParameter("companynumber");
 String companynumber2=request.getParameter("companynumber2");
 String com_bank_code=request.getParameter("com_bank_code");
 String com_bank_code2=request.getParameter("com_bank_code2");
 String com_sy_code=request.getParameter("com_sy_code");
 String com_sy_code2=request.getParameter("com_sy_code2");
 String com_sy_name=request.getParameter("com_sy_name");
 String com_sy_name2=request.getParameter("com_sy_name2");
  String bankroll=request.getParameter("bankroll");
 String companyman=request.getParameter("companyman");
   String companydm=request.getParameter("companydm");
 String companysh=request.getParameter("companysh");
  String companybm=request.getParameter("companybm");
 String companylxr=request.getParameter("companylxr");
  String companyemail=request.getParameter("companyemail");
 String companynet=request.getParameter("companynet");
  String username=request.getParameter("username");
 String datetime=request.getParameter("datetime");
  String remark=request.getParameter("remark");
 String strSQL="update company set companyname='" + companyname + "',companyname2='" + companyname2 + "',companyaddr='" + companyaddr + "',companyaddr2='" + companyaddr2 + "',companytel='" + companytel + "',companyfax='" + companyfax + "',companybank='" + companybank + "',companybank2='" + companybank2 + "',companynumber='" + companynumber + "',companynumber2='" + companynumber2 + "',com_bank_code='" + com_bank_code + "',com_bank_code2='" + com_bank_code2 + "',com_sy_code='" + com_sy_code + "',com_sy_code2='" + com_sy_code2 + "',com_sy_name='" + com_sy_name + "',com_sy_name2='" + com_sy_name2 + "',bank_dm='" + bank_dm + "',bank_dm2='" + bank_dm2 + "',bankroll='" + bankroll + "',companyman='" + companyman + "',companydm='" + companydm + "',companysh='" + companysh + "',companybm='" + companybm + "',companylxr='" + companylxr + "',companyemail='" + companyemail + "',companynet='" + companynet + "',username='" + username + "',datetime='" + datetime + "',remark='" + remark + "' where id='"+id1+"'";
 //out.print(strSQL);
 RegBean2.executeUpdate(strSQL);
 %>
<body bgcolor="#ffffff"><div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">修改成功!</font></b></p>
  <p><font color="#000000" size="2"><a href="companym.jsp" style="font-size: 12px">返回</a></font></p>
  <p><font color="#000000"></font></p>
</div>
</body>
<%}}%>
</html>