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
<title>注册确认</title>
</head>
<body bgcolor="#ffffff">
<center> <font face="Arial, Helvetica, sans-serif"> <%@ page language="java" import="java.sql.*" %> 
<jsp:useBean id="RegisterBean" scope="page" class="infocrmdb.infocrmdb" /> <%
  String name1=request.getParameter("name");
  String sex1=request.getParameter("sex");
  String password1=request.getParameter("password");
  String rs_password1=request.getParameter("rs_password");
  String department1=request.getParameter("department");
  String workj1=request.getParameter("workj");
  String email1=request.getParameter("email");
  String worktel1=request.getParameter("worktel");
  String userdate1=request.getParameter("userdate");
  String yjxs1=request.getParameter("yjxs");
  String hometel1=request.getParameter("hometel");
  String user_ip=request.getParameter("user_ip");
  String ipbd=request.getParameter("ipbd");
  String log_s_date=request.getParameter("log_s_date");
  String log_e_date=request.getParameter("log_e_date");

  String sql="select * from username where name='" + name1 + "'";
  ResultSet rs = RegisterBean.executeQuery(sql); 
  if(rs.next()) { rs.close();
  session.putValue("register_message","名字已经重复!");
  %> <jsp:forward page="register.jsp"/> <% } 
  else
  { rs.close();
   } %> </font> <FORM METHOD=POST ACTION="do_register.jsp"> <font face="Arial, Helvetica, sans-serif"> 
<INPUT TYPE="hidden" name="name" value="<%=name1%>"> <INPUT TYPE="hidden" name="sex" value="<%=sex1%>"> 
<INPUT TYPE="hidden" name="password" value="<%=password1%>"> <INPUT TYPE="hidden" name="department" value="<%=department1%>"> 
<INPUT TYPE="hidden" name="workj" value="<%=workj1%>"> <INPUT TYPE="hidden" name="email" value="<%=email1%>"> 
<INPUT TYPE="hidden" name="worktel" value="<%=worktel1%>"> <INPUT TYPE="hidden" name="userdate" value="<%=userdate1%>"> 
<INPUT TYPE="hidden" name="yjxs" value="<%=yjxs1%>"> <INPUT TYPE="hidden" name="user_ip" value="<%=user_ip%>"> 
<INPUT TYPE="hidden" name="ipbd" value="<%=ipbd%>"><INPUT TYPE="hidden" NAME="log_s_date" VALUE="<%=log_s_date%>"><INPUT TYPE="hidden" NAME="log_e_date" VALUE="<%=log_e_date%>"> 
<%=name1%><font color="#000080">请检查您的登记信息</font><br> <br> </font> <table width="95%" border="1" cellspacing="0" cellpadding="0"> 
<tr> <td width="16%"><font size="2" color="#000080">姓　　名</font>&nbsp;</td><td width="33%"><font size="2" face="Arial, Helvetica, sans-serif"><%=name1%>.</font>&nbsp;</td><td width="15%"><font size="2" color="#000080">性　　别</font>&nbsp;</td><td width="36%"><font size="2" face="Arial, Helvetica, sans-serif"><%=sex1%>.</font>&nbsp;</td></tr> 
<tr> <td width="16%"><font size="2" color="#000080">员工代码</font>&nbsp;</td><td width="33%"><font size="2" face="Arial, Helvetica, sans-serif"><%=department1%>.</font>&nbsp;</td><td width="15%"><font size="2" color="#000080">工作角色</font>&nbsp;</td><td width="36%"><font size="2" face="Arial, Helvetica, sans-serif"><%=workj1%>.</font>&nbsp;</td></tr> 
<tr> <td width="16%"><font size="2" color="#000080">邮　　件</font>&nbsp;</td><td width="33%"><font size="2" face="Arial, Helvetica, sans-serif"><%=email1%>.</font>&nbsp;</td><td width="15%"><font size="2" color="#000080">办公电话</font>&nbsp;</td><td width="36%"><font size="2" face="Arial, Helvetica, sans-serif"><%=worktel1%>.</font>&nbsp;</td></tr> 
<tr> <td width="16%"><font size="2" color="#000080">权限组</font>&nbsp;</td><td width="33%"><font size="2" face="Arial, Helvetica, sans-serif"><%=userdate1%>.</font>&nbsp;</td><td width="15%"><font size="2" color="#000080">所在部门</font>&nbsp;</td><td width="36%"><font size="2" face="Arial, Helvetica, sans-serif"><%=yjxs1%>.</font>&nbsp;</td></tr><TR> 
<TD><FONT SIZE="2" COLOR="#000080">登录IP</font>&nbsp;</td><TD><FONT SIZE="2" FACE="Arial, Helvetica, sans-serif"><%=user_ip%>.</font>&nbsp;</td><TD><FONT SIZE="2" COLOR="#000080">是否绑定</font>&nbsp;</td><TD><FONT SIZE="2" FACE="Arial, Helvetica, sans-serif"><%=ipbd%>.</font>&nbsp;</td></TR><TR> 
<TD><FONT SIZE="2" COLOR="#000080">登录起始时间</font>&nbsp;</td><TD><FONT SIZE="2" FACE="Arial, Helvetica, sans-serif"><%=log_s_date%>.</font>&nbsp;</td><TD><FONT SIZE="2" COLOR="#000080">登录终止时间</font>&nbsp;</td><TD><FONT SIZE="2" FACE="Arial, Helvetica, sans-serif"><%=log_e_date%>.</font>&nbsp;</td></TR> 
</table><br> <INPUT TYPE="submit" value="提交注册">&nbsp;&nbsp; <INPUT TYPE="button" value="返回修改" onclick="history.back()"> 
</FORM></CENTER>
</body>
<%}}%>
</html>