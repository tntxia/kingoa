<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../refuse.jsp"
    </script>
<% } else {    
%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>芯片商城有限公司</title>
<script language="JavaScript">
function isValid(){
    if((form1.password.value.length<3)||(form1.password.value.length>20)){
        alert("密码必须是3-20位字母或数字!");
	return false;
    }
    else if(form1.password.value!=form1.re_password.value){
        alert("两次输入的密码不相同!");
	return false;
    }
    return true;      
    }
</script>

</HEAD>
<style type="text/css">
<!--
.H1 {font-size:12pt; line-height:15pt; align=center}
.ourfont {font-size:9pt; line-height:15pt; }
.ourfont1 {font-size:8pt; line-height:13pt; }
A{text-transform: none; text-decoration:none;color:#0000ff}
a:hover {text-decoration:underline;color:#0000ff}
-->
</style>

<body>
<%@ page language="java" import="java.sql.*" %> <jsp:useBean id="UserChangeBean1" scope="page" class="infocrmdb.infocrmdb" /> 
<%
  String name1 = (String) session.getValue("username");
  String sql="select * from username where name='" + name1 + "'";
  ResultSet rs = UserChangeBean1.executeQuery(sql); 
  String password1="";
  String  email1="";
    String  mail_user="";
   String  mail_password="";
   String  mail_smtp="";
 if(rs.next()) { 
   password1=rs.getString("password");
   email1=rs.getString("email");
   mail_user=rs.getString("mail_user");
   mail_password=rs.getString("mail_password");
   mail_smtp=rs.getString("mail_smtp"); 
   rs.close();
}
%> <CENTER> 

 <FORM METHOD="POST" action="do_passchange.jsp" " name="form1"  onSubmit="return isValid();">
  <table width="100%" border="0" cellpadding="3" height="50">
    <tr>
      <td><div align="center"><font size="5"><font color="#213e9b" style="font-weight: bold;">密　码　修　改</font></font>&nbsp;</div>
          <hr width="100%" size="1" noshade color="#213e9b">
      </td>
    </tr>
  </table>

  
  
<INPUT TYPE="hidden" name="name" value="<%= name1%>">  <table height=8 width="98%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
  <TR BGCOLOR="#d3d8eb"><TD COLSPAN="4" bgcolor="#d3d8eb"><FONT SIZE="2">用户名：：<%=name1%></font>&nbsp;</td>
</TR><TR><TD nowrap bgcolor="#e8ebf5"><FONT SIZE="2">登陆密码：</font>&nbsp;</td>
    <TD><FONT SIZE="2"><INPUT TYPE="password" SIZE='8' MAXLENGTH='8' NAME="password"
        VALUE='<%= password1%>'> &nbsp;*</font>&nbsp;</td><TD nowrap bgcolor="#e8ebf5"><FONT SIZE="2">密码确认：</font>&nbsp;</td>
    <TD><FONT SIZE="2"><INPUT TYPE="password" SIZE='8' MAXLENGTH='8' NAME="re_password"
        VALUE='<%= password1%>'> &nbsp;*</font>&nbsp;</td></TR><TR>
      <TD COLSPAN="4" nowrap bgcolor="#d3d8eb"><FONT SIZE="2">电子邮件服务器设置:</font>&nbsp;</td>
    </TR><TR><TD WIDTH="20%" height="24" nowrap bgcolor="#e8ebf5"><FONT SIZE="2">用 
户 名 :</font>&nbsp;</td>
    <TD COLSPAN="3"><FONT SIZE="2"><INPUT NAME="mail_user" TYPE="TEXT" ID="user_ip" SIZE="50" VALUE="<%=mail_user%>"></font>&nbsp;</td></TR><TR><TD WIDTH="20%" height="24" nowrap bgcolor="#e8ebf5"><FONT SIZE="2">邮件密码:</font>&nbsp;</td>
    <TD COLSPAN="3"><FONT SIZE="2"><INPUT NAME="mail_password" TYPE="PASSWORD" ID="user_ip" SIZE="50" VALUE="<%=mail_password%>"></font>&nbsp;</td></TR><TR><TD WIDTH="20%" height="24" nowrap bgcolor="#e8ebf5"><FONT SIZE="2">发件邮件:</font>&nbsp;</td>
    <TD COLSPAN="3"><INPUT TYPE="text" NAME="email" VALUE="<%=email1%>" SIZE="50"></TD></TR><TR><TD WIDTH="20%" height="24" nowrap bgcolor="#e8ebf5"><FONT SIZE="2">发件服务器SMTP:</font>&nbsp;</td>
    <TD COLSPAN="3"><FONT SIZE="2"><INPUT TYPE="text" NAME="mail_smtp" SIZE="50" VALUE="<%=mail_smtp%>"></font>&nbsp;</td></TR> 
</TABLE>
 <input type="submit" size="4" value=" 确 认 " name="submit"> <input type="button" value=" 关 闭 " onClick="window.close()" name="button"> 
</FORM></CENTER>
</BODY>
<%}%>
</HTML>
