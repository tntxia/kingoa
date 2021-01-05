<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../../common/checklogin.jsp" %>
<%@ include file="../../common/checkManageLogin.jsp" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>处理用户修改信息</title>
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="UserBean" scope="page" class="infocrmdb.infocrmdb" />
<%

request.setCharacterEncoding("gb2312");

  String name1=request.getParameter("name").trim();
  String sex1=request.getParameter("sex");
  String password=request.getParameter("password");
  String department1=request.getParameter("department");
  String workj1=request.getParameter("workj");
  String email1=request.getParameter("email");
  String worktel1=request.getParameter("worktel");
  String restrainId=request.getParameter("restrainId");
  String waptel1=request.getParameter("waptel");
  String ipbd=request.getParameter("ipbd");
  String deptId=request.getParameter("deptId");
  String deptName = request.getParameter("deptName");
  
  String mail_user=request.getParameter("mail_user");
  String mail_password=request.getParameter("mail_password");
  String mail_smtp=request.getParameter("mail_smtp");
  String sql="select  * from department where id="+deptId;
  ResultSet rs=UserBean.executeQuery(sql);
 if(!rs.next())
  {
    out.println("not have record");
    return;
  }
 String deptjb=rs.getString("dept_code");

  String strSQL="update username set   mail_user='" + mail_user + "',mail_password='" + mail_password + "',mail_smtp='" + mail_smtp + "',sex='" + sex1 + "',department_id = "+deptId+",yjxs='" + deptName + "',hometel='"+deptjb+"',password='" + password + "',name_en='" + department1 + "',workj='" + workj1 + "',email='" + email1 + "',worktel='" + worktel1 + "',restrain_id=" + restrainId + ",user_ip='" + waptel1 + "',ipbd='" + ipbd + "' where name='" + name1 + "'";
       boolean tq1q1= einfodb.executeUpdate(strSQL);
   if(!tq1q1)
   {
     out.println("<font size='2' color='#FF0000'>更新失败!</font>"+strSQL);
	 return;
   }

  String strSQLman="update linkman   set  dept='"+deptName+"',deptjb='"+deptjb+"'  where   username='"+name1+"' ";
       boolean tman= einfodb.executeUpdate(strSQLman);
   if(!tman)
   {
     out.println("<font size='2' color='#FF0000'>转移联系人失败!</font>");
	 return;
   }
   String strSQLop="update opportunity set   dept='"+deptName+"',deptjb='"+deptjb+"'  where   username='"+name1+"'";
       boolean top= einfodb.executeUpdate(strSQLop);
   if(!top)
   {
     out.println("<font size='2' color='#FF0000'>转移销售机会失败!</font>");
	 return;
   }
   String strSQLact="update activity set state='"+deptName+"',deptjb='"+deptjb+"'  where  name='"+name1+"' ";
       boolean tact= einfodb.executeUpdate(strSQLact);
   if(!tact)
   {
     out.println("<font size='2' color='#FF0000'>转移客户跟进失败!</font>");
	 return;
   }
   String strSQLq="update quote set dept='"+deptName+"',deptjb='"+deptjb+"'  where   man='"+name1+"' ";
       boolean tq= einfodb.executeUpdate(strSQLq);
   if(!tq)
   {
     out.println("<font size='2' color='#FF0000'>转移客户报价失败!</font>");
	 return;
   }

   String strSQLsub1="update subscribe set dept='"+deptName+"',deptjb='"+deptjb+"'  where   man='"+name1+"' ";
       boolean tsub1= einfodb.executeUpdate(strSQLsub1);
   if(!tsub1)
   {
     out.println("<font size='2' color='#FF0000'>转移客户出库失败!</font>");
	 return;
   }

  String strSQLopin="update Inquiry set dept='"+deptName+"',deptjb='"+deptjb+"'  where   man='"+name1+"' ";
       boolean topin= einfodb.executeUpdate(strSQLopin);
   if(!topin)
   {
     out.println("<font size='2' color='#FF0000'>转移销售机会失败!</font>");
	 return;
   } 
    String strSQLc="update client set dept='"+deptName+"',deptjb='"+deptjb+"' where  username='" + name1 + "'";
     boolean tc= einfodb.executeUpdate(strSQLc);
   if(!tc)
   {
     out.println("<font size='2' color='#FF0000'>转移客户资料失败,!</font>");
	 return;
   }
   String strSQLfw="update work_report set w_dept='"+deptName+"',w_deptjb='"+deptjb+"'  where    w_man='"+name1+"' ";
       boolean tworkw= einfodb.executeUpdate(strSQLfw);
   if(!tworkw)
   {
     out.println("<font size='2' color='#FF0000'>转移客户收款信息失败!</font>");
	 return;
   }
   String strSQLfw1="update work_report_rd set w_dept='"+deptName+"',w_deptjb='"+deptjb+"'  where    w_man='"+name1+"' ";
       boolean tworkw1= einfodb.executeUpdate(strSQLfw1);
   if(!tworkw1)
   {
     out.println("<font size='2' color='#FF0000'>转移客户收款信息失败!</font>");
	 return;
   }
    String strSQLm="update menber set  dept='"+deptName+"',deptjb='"+deptjb+"' where   name='"+name1+"' ";
     boolean tm= einfodb.executeUpdate(strSQLm);
   if(!tm)
   {
     out.println("<font size='2' color='#FF0000'>转移客户资料失败,!</font>");
	 return;
   }
    String strSQLmz="update supplier set  dept='"+deptName+"',deptjb='"+deptjb+"' where    username='"+name1+"' ";
     boolean tmz= einfodb.executeUpdate(strSQLmz);
   if(!tmz)
   {
     out.println("<font size='2' color='#FF0000'>转移客户资料失败,!</font>");
	 return;
   }
    String strSQLmzl="update qlinkman set  dept='"+deptName+"',deptjb='"+deptjb+"' where    username='"+name1+"' ";
     boolean tmzl= einfodb.executeUpdate(strSQLmzl);
   if(!tmzl)
   {
     out.println("<font size='2' color='#FF0000'>转移客户资料失败,!</font>");
	 return;
   }
    String strSQLmzl1="update sample set  dept='"+deptName+"',deptjb='"+deptjb+"' where   man='"+name1+"' ";
     boolean tmzl1= einfodb.executeUpdate(strSQLmzl1);
   if(!tmzl1)
   {
     out.println("<font size='2' color='#FF0000'>转移失败,!</font>");
	 return;
   }
    String strSQLmzl2="update programer set  dept='"+deptName+"',deptjb='"+deptjb+"' where   application='"+name1+"' ";
     boolean tmzl2= einfodb.executeUpdate(strSQLmzl2);
   if(!tmzl2)
   {
     out.println("<font size='2' color='#FF0000'>转移失败,!</font>");
	 return;
   }
    String strSQLmzl3="update th_table set  dept='"+deptName+"',deptjb='"+deptjb+"' where   man='"+name1+"' ";
     boolean tmzl3= einfodb.executeUpdate(strSQLmzl3);
   if(!tmzl3)
   {
     out.println("<font size='2' color='#FF0000'>转移失败,!</font>");
	 return;
   }

    String strSQLmzl33="update credit_debit set  l_dept='"+deptName+"',l_deptjb='"+deptjb+"' where   l_man='"+name1+"' ";
     boolean tmzl33= einfodb.executeUpdate(strSQLmzl33);
   if(!tmzl33)
   {
     out.println("<font size='2' color='#FF0000'>转移失败,!</font>");
	 return;
   }

%>
<body>
<script language=javascript>
  window.location="passthrough.jsp?showword=修改"
</script>
</body>
</html>