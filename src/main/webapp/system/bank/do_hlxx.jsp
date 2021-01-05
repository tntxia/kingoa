<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
<script language=javascript>
    window.location="../../refuse.jsp"
    </script>
<% }     
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>银行</title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
  String dept=request.getParameter("dept").trim();
  String sql="select  * from department where departname='"+dept+"'";
  ResultSet rs=einfodb.executeQuery(sql);
 if(!rs.next())
  {
    out.println("not have record");
    return;
  }
 String deptjb=rs.getString("dept_code");
 rs.close();
 String com_bank=request.getParameter("com_bank");
 String bank=request.getParameter("bank");
 String bank_num=request.getParameter("bank_num");
 String remark1=request.getParameter("remark");
 String bank_date=request.getParameter("bank_date");
 String bank_je=request.getParameter("bank_je");
 String bank_hb=request.getParameter("bank_hb");
 
 String hiddens=request.getParameter("hiddens");
 
 
 
 

 String strSQL="insert into bank values('" + com_bank + "','" + bank +"','" + bank_num +"','" + bank_je +"','" + bank_hb +"','" + remark1 +"','"+bank_date+"','"+dept+"','"+deptjb+"','"+hiddens+"')";
 
 
 
 einfodb.executeUpdate(strSQL);
 %>
<body bgcolor="#ffffff">
<div align="center"><br><br><br> <p><img src="../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">登记成功!</font></b></p>
  <p><font color="#000000" size="2"><a href="nhlxx.jsp" style="font-size: 12px">继续登记</a> <a href="hlxx.jsp" style="font-size: 12px">返回</a></font></p>
  <p><font color="#000000"></font></p>
</div>
</body>
</html>