<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../../common/checklogin.jsp" %>
<%@ include file="../../common/checkManageLogin.jsp" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>注册成功</title>
</head>
<%@ page language="java" import="java.util.*,java.sql.*" %>
<jsp:useBean id="RegBean2" scope="page" class="com.tntxia.db.DBConnection" />
<%
request.setCharacterEncoding("GB2312");
  String name1=request.getParameter("name");
  String sex1=request.getParameter("sex");
  String password1=request.getParameter("password");
  String department1=request.getParameter("department");
  String workj1=request.getParameter("workj");
  String email1=request.getParameter("email");
  String worktel1=request.getParameter("worktel");
  String restrainId=request.getParameter("restrainId");
  String yjxs1=request.getParameter("yjxs").trim();
  String hometel1=request.getParameter("hometel");
  String user_ip=request.getParameter("user_ip");
  String ipbd=request.getParameter("ipbd");
  String mail_user=request.getParameter("mail_user");
  String mail_password=request.getParameter("mail_password");
  String mail_smtp=request.getParameter("mail_smtp");

  String sql="select  * from department where departname='"+yjxs1+"'";
  out.println(sql);
  ResultSet rs=RegBean2.executeQuery(sql);
 if(!rs.next())
  {
    out.println("not have record");
    return;
  }
 String deptjb=rs.getString("dept_code");
  
 String strSQL="insert into username([name],[sex],[password],[department],[workj],[email],[worktel],[userdate],[yjxs],[hometel],[user_ip],[ipbd],[err], [mail_user],[mail_password],[mail_smtp],[restrain_id]) values('" + name1 + "','" + sex1 +"','" + password1 + "','" + department1 + "','" + workj1 + "','" + email1 + "','" + worktel1 + "','','" + yjxs1 + "','" + deptjb + "','" + user_ip + "','" + ipbd + "','0','" + mail_user + "','" + mail_password + "','" + mail_smtp + "',?)";
 List<Object> params = new ArrayList<Object>();   
 params.add(restrainId);
 boolean t1= RegBean2.executeUpdate(strSQL,params);
   if(!t1)
   {
     out.println("添加失败,你所输入的内容超出系统范围或输入类型不符!");
	 return;
   }
 %>
 <body>
</body>
<script language=javascript>
  window.location="passthrough.jsp?showword=登记"
</script>
</html>