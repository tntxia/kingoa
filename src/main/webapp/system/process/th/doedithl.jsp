<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../../../common/checklogin.jsp"%>
<%@ include file="../../../common/checkManageLogin.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>修改退货审批流程</title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%

 String id1=request.getParameter("id");
 String dept=request.getParameter("dept");
 String role=request.getParameter("role");
 String dd_man=request.getParameter("dd_man");
 String fif=request.getParameter("fif");
  String fspman=request.getParameter("fspman");
 String firspif=request.getParameter("firspif");
  String firspman=request.getParameter("firspman");
  String remark=request.getParameter("remark");
  String strSQL="update thsp set dept='" + dept + "',role='" + role + "',dd_man='" + dd_man + "',fif='" + fif + "',fspman='" + fspman + "',firspif='" + firspif + "',firspman='" + firspman + "',remark='" + remark + "' where id='" + id1 + "'";
  einfodb.executeUpdate(strSQL);
 %>
<body bgcolor="#ffffff"><div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p><hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1><p><font color="#ff0000" size="3">修改成功!</font></b></p>
  <p><font color="#000000" size="2"><a href="hlxx.jsp" style="font-size: 12px">返回</a></font></p>
</div>
</body>
</html>