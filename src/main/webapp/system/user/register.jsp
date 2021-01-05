<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*,java.text.*"%>
<%

String basePath = request.getContextPath();

%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>用户注册</title>
<script language="JavaScript" src="<%=basePath%>/js/config.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/jquery.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/common.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/system/user/register.js"></script>
</HEAD>
<body bgcolor="#ffffff">
<CENTER> <br> 
 <p>  <br />
  <table width="100%" border="0" cellpadding="3" height="50">
    <tr>
      <td><div align="center"><font size="5"><b><font color="#213e9b">用户注册</font></b></font></div>
          <hr width="100%" size="1" noshade color="#213e9b">
      </td>
    </tr>
  </table></p>
  
  <FORM METHOD=POST  action="user.dispatch" onSubmit="return isValid(this);"> 
  	<input type="hidden" name="method" value="register" />
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
<div align="left"><FONT SIZE="2"> <input type="password" size='15' maxlength='15' name="password"> 
&nbsp;*</font>&nbsp;</div></td><td WIDTH="13%" bgcolor="#e8ebf5"><div align="left"><FONT COLOR="#000000" SIZE="2">确　　认</font>&nbsp;</div></td><td WIDTH="31%"> 
<div align="left"><FONT SIZE="2"> <input type="password" size='15' maxlength='15'name="rs_password"> 
&nbsp;*</font>&nbsp;</div></td></tr> <tr> <td WIDTH="20%" bgcolor="#e8ebf5">
          <div align="left"><font color="#000000" size="2">英文名称</font>&nbsp;</div>
        </td>
<td WIDTH="36%"> 
<div align="left"><FONT SIZE="2"> 
            <input name="nameEn" type="text" size="10" maxlength="15"> 
</font>&nbsp;</div></td><td WIDTH="13%" bgcolor="#e8ebf5"><div align="left"><FONT COLOR="#000000" SIZE="2">职　　位</font>&nbsp;</div></td><td WIDTH="31%"> 
<div align="left"><FONT SIZE="2"> <select name="workj" size="1" id="workj"></select> &nbsp; </font>&nbsp;</div></td></tr> <tr><TD WIDTH="13%" bgcolor="#e8ebf5"><DIV ALIGN="left"><FONT COLOR="#000000" SIZE="2">办公电话</font>&nbsp;</div></TD>
<TD COLSPAN="3"> 
<DIV ALIGN="left"><FONT SIZE="2"> <INPUT NAME="worktel" TYPE="text" SIZE="50" maxlength="50"> 
</font>&nbsp;</div></TD></tr> <tr> <%
java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String userdate=simple.format(new java.util.Date());
%> <td WIDTH="20%" bgcolor="#e8ebf5"> <div align="left"><FONT color="#000000" SIZE="2">职位权限组</font>&nbsp;</div>
</td>
<td WIDTH="36%"> 
<div align="left"><FONT SIZE="2"> 
<select name="restrainId" size="1" id="restrainId"> 
</select> &nbsp; </font>&nbsp;</div></td><td WIDTH="13%" bgcolor="#e8ebf5"><div align="left">
<FONT COLOR="#000000" SIZE="2">所在部门</font>&nbsp;</div></td><td WIDTH="31%"> 
<div align="left"><FONT SIZE="2"> 
<select size="1" name="department" id="department"> </select> </font>
&nbsp;</div></td></tr><TR> <TD WIDTH="20%" bgcolor="#e8ebf5">
<DIV ALIGN="left"><FONT COLOR="#000000" SIZE="2">登 
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
</HTML>
