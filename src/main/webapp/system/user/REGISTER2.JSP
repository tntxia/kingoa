<jsp:useBean id="einfodb" scope="page" class="bankdb.bankdb" />
<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
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
%><HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>用户注册</title>
<script language="JavaScript">
function isValid(form){
    if(form.name.value==""){
        alert("用户名不能为空!");
	return false;
    }
    else if((form.password.value.length<3)||(form.password.value.length>8)){
        alert("密码必须是3-8位字母或数字!");
	return false;
    }
    else if(form.password.value!=form.rs_password.value){
        alert("两次输入的密码不相同!");
	return false;
    }
    else if(form.userdate.value==""){
        alert("请定义权限组!");
	return false;
    }
    else {
        return true;
    }
}
</script>
</HEAD>
<body bgcolor="#ffffff">
<CENTER> <br> <% String getmessage = (String) session.getValue("register_message");
   if(getmessage==null) getmessage="";
%> <%= getmessage %> <p>  <br />
  <table width="100%" border="0" cellpadding="3" height="50">
    <tr>
      <td><div align="center"><font size="5"><b><font color="#213e9b">用户注册</font></b></font></div>
          <hr width="100%" size="1" noshade color="#213e9b">
      </td>
    </tr>
  </table></p><FORM METHOD=POST  action="do_register.jsp" onSubmit="return isValid(this);"> 
<table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1"><tr> <td WIDTH="20%" bgcolor="#e8ebf5"><div align="left"><FONT COLOR="#000000" SIZE="2">用 户 名</font>&nbsp;</div></td>
<td WIDTH="36%"> 
<div align="left"><FONT SIZE="2"> <input name="name" type="text" maxlength="15"> 
* </font>&nbsp;</div></td><td WIDTH="13%" bgcolor="#e8ebf5"><div align="left"><FONT COLOR="#000000" SIZE="2">性　　别</font>&nbsp;</div></td><td WIDTH="31%"><div align="left"><FONT SIZE="2">男 
<input type="radio" name="sex" value="男" checked> 女 <input type="radio" name="sex" value="女"> 
</font>&nbsp;</div></td></tr> <tr> <td WIDTH="20%" bgcolor="#e8ebf5"><div align="left"><FONT COLOR="#000000" SIZE="2">密　　码</font>&nbsp;</div></td>
<td WIDTH="36%"> 
<div align="left"><FONT SIZE="2"> <input type="password" size='8' maxlength='8' name="password"> 
&nbsp;*</font>&nbsp;</div></td><td WIDTH="13%" bgcolor="#e8ebf5"><div align="left"><FONT COLOR="#000000" SIZE="2">确　　认</font>&nbsp;</div></td><td WIDTH="31%"> 
<div align="left"><FONT SIZE="2"> <input type="password" size='8' maxlength='8'name="rs_password"> 
&nbsp;*</font>&nbsp;</div></td></tr> <tr> <td WIDTH="20%" bgcolor="#e8ebf5">
          <div align="left"><font color="#000000" size="2">英文名称</font>&nbsp;</div>
        </td>
<td WIDTH="36%"> 
<div align="left"><FONT SIZE="2"> 
            <input name="department" type="text" size="10" maxlength="15"> 
</font>&nbsp;</div></td><td WIDTH="13%" bgcolor="#e8ebf5"><div align="left"><FONT COLOR="#000000" SIZE="2">职　　位</font>&nbsp;</div></td><td WIDTH="31%"> 
<div align="left"><FONT SIZE="2"> <select name="workj" size="1" id="workj"> <%
  try
  {
    ResultSet rs=einfodb.executeQuery("select role_name from role");
    while(rs.next())
    {
      String departname=rs.getString("role_name").trim();
      out.println("<option value='"+departname+"'>"+departname+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%> </select> &nbsp; </font>&nbsp;</div></td></tr> <tr><TD WIDTH="13%" bgcolor="#e8ebf5"><DIV ALIGN="left"><FONT COLOR="#000000" SIZE="2">办公电话</font>&nbsp;</div></TD>
<TD COLSPAN="3"> 
<DIV ALIGN="left"><FONT SIZE="2"> <INPUT NAME="worktel" TYPE="text" SIZE="50" maxlength="50"> 
</font>&nbsp;</div></TD></tr> <tr> <%
java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String userdate=simple.format(new java.util.Date());
%> <td WIDTH="20%" bgcolor="#e8ebf5"> <div align="left"><FONT color="#000000" SIZE="2">职位权限组</font>&nbsp;</div></td>
<td WIDTH="36%"> 
<div align="left"><FONT SIZE="2"> <select name="userdate" size="1" id="userdate"> 
<%
  try
  {
    ResultSet rs=einfodb.executeQuery("select restrain_name from restrain");
    while(rs.next())
    {
      String restrain_name=rs.getString("restrain_name").trim();
      out.println("<option value='"+restrain_name+"'>"+restrain_name+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%> </select> &nbsp; </font>&nbsp;</div></td><td WIDTH="13%" bgcolor="#e8ebf5"><div align="left"><FONT COLOR="#000000" SIZE="2">所在部门</font>&nbsp;</div></td><td WIDTH="31%"> 
<div align="left"><FONT SIZE="2"> <select size="1" name="yjxs"> <%
  try
  {
    ResultSet rs=einfodb.executeQuery("select departname from department  order  by dept_code  asc");
    while(rs.next())
    {
      String departname=rs.getString("departname");
      out.println("<option value='"+departname+"'>"+departname+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%> </select> </font>&nbsp;</div></td></tr><TR> <TD WIDTH="20%" bgcolor="#e8ebf5"><DIV ALIGN="left"><FONT COLOR="#000000" SIZE="2">登 
录 IP</font>&nbsp;</div></TD>
<TD WIDTH="36%"> <DIV ALIGN="left"><FONT SIZE="2"> <INPUT NAME="user_ip" TYPE="text" ID="user_ip"> 
</font>&nbsp;</div></TD><TD WIDTH="13%" bgcolor="#e8ebf5"><DIV ALIGN="left"><FONT COLOR="#000000" SIZE="2">是否绑定</font>&nbsp;</div></TD><TD WIDTH="31%"><DIV ALIGN="left"> 
<FONT SIZE="2"><SELECT NAME="ipbd" ID="ipbd"> <OPTION>否</OPTION> <OPTION>是</OPTION> 
</SELECT> </font>&nbsp;</div></TD></TR><TR BGCOLOR="#d3d8eb">
  <td COLSPAN="4" bgcolor="#e8ebf5"><FONT color="#000000" SIZE="2">电子邮件服务器设置:</font>&nbsp;</td>
</tr><tr><td WIDTH="20%" bgcolor="#e8ebf5"><FONT COLOR="#000000" SIZE="2">用 
户 名 :</font>&nbsp;</td>
<td COLSPAN="3"><FONT SIZE="2"><INPUT NAME="mail_user" TYPE="TEXT" ID="user_ip" SIZE="50" maxlength="50">
</font>&nbsp;</td></tr><tr><td WIDTH="20%" bgcolor="#e8ebf5"><FONT COLOR="#000000" SIZE="2">密　　码:</font>&nbsp;</td>
<td COLSPAN="3"><FONT SIZE="2"><INPUT NAME="mail_password" TYPE="PASSWORD" ID="user_ip" SIZE="50"></font>&nbsp;</td></tr><TR><TD WIDTH="20%" bgcolor="#e8ebf5"><FONT COLOR="#000000" SIZE="2">发件邮件:</font>&nbsp;</td>
<TD COLSPAN="3"><FONT SIZE="2"><INPUT TYPE="text" NAME="email" SIZE="50"></font>&nbsp;</td></TR><TR><TD WIDTH="20%" bgcolor="#e8ebf5"><FONT COLOR="#000000" SIZE="2">发件服务器SMTP:</font>&nbsp;</td>
<TD COLSPAN="3"><FONT SIZE="2"><INPUT TYPE="text" NAME="mail_smtp" SIZE="50"></font>&nbsp;</td></TR> 
</table>
<br> <input type="submit" name="Submit" value="登记完毕" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" > 
<input type="reset" name="Submit52" value="重新填写" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF"> 
<input type="reset" name="Submit5" value=" 关 闭 " style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()"> 
</FORM></CENTER>
</BODY>
<%}}%>
</HTML>
