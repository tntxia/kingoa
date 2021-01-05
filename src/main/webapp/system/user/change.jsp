<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../../common/checkManageLogin.jsp" %> 
<%@ page import="com.tntxia.oa.system.entity.*"%>
<%
String basePath = request.getContextPath();
User user = (User) request.getAttribute("user");
int id = user.getId();
String name = user.getName();
String sex = user.getSex();
String password = user.getPassword();
String nameEn = user.getNameEn();
int deptId = user.getDepartmentId();
int restrainId = user.getRestrainId();
String ip = user.getIp();
boolean ipbd = user.isIpBind();
String email = user.getEmail();
String mail_user = user.getEmailUser();
String mail_password = user.getEmailPassword();
String mail_smtp = user.getEmailStmp();
int errCount = user.getErrCount();
String tel = user.getTel();
String hometel = user.getTelHome();
String postion = user.getPosition();

%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>用户修改</title>
<script language="JavaScript" src="<%=basePath%>/js/config.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/jquery.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/common.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/system/user/change.js"></script>
<style type="text/css">
<!--
body {
	background-color: #ffffff;
}
.STYLE6 {font-size: 13px}
-->
</style></HEAD>
<body>
 <CENTER>
  <br />
  <table width="100%" border="0" cellpadding="3" height="50">
    <tr>
      <td><div align="center"><font size="5"><b><font color="#213e9b">个人信息修改</font></b></font></div>
          <hr width="100%" size="1" noshade color="#213e9b">
      </td>
    </tr>
  </table>
  <FORM METHOD="POST" action="user.dispatch" " name="form" onSubmit="return isValid(this);"> 
   <INPUT TYPE="hidden" name="method" value="update">
  <INPUT TYPE="hidden" name="id" value="<%=id%>">
  <INPUT TYPE="hidden" name="name" value="<%=name%>">
 <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1"> 
<tr> <td bgcolor="#e8ebf5"><FONT SIZE="2">姓　　名</font>&nbsp;</td>
<td> <span class="STYLE6">
  <%if(errCount>=3){out.print(name); out.print("<font size='2' color='#FF0000'>被锁定</font>");%> 
  <%}else out.print(name);%>
</span></td>
<td bgcolor="#e8ebf5"><FONT SIZE="2">性　　别</font>&nbsp;</td>
<td> <select name="sex" id="sex" > 
<%
	
          String[] sexList=new String[]{"男","女"};
          for(int i=0;i<sexList.length;i++)
           {
             if(sex.equals(sexList[i]))
               out.println("<option selected>"+sexList[i]+"</option>");
             else
               out.println("<option >"+sexList[i]+"</option>");
           }
        %> </select> </td></tr> <tr> <td bgcolor="#e8ebf5"><FONT SIZE="2">密　　码</font>&nbsp;</td>
<td> <font face="Arial, Helvetica, sans-serif"> 
<input type="password" size='8' maxlength='8' name="password" value="<%=password%>"> 
&nbsp;*</font>&nbsp;</td><td bgcolor="#e8ebf5"><FONT SIZE="2">确　　认</font>&nbsp;</td>
<td> <font face="Arial, Helvetica, sans-serif"> 
<input type="password" size='8' maxlength='8'name="rs_password" value="<%=password%>"> 
&nbsp;*</font>&nbsp;</td></tr> <tr> 
        <td height="23" bgcolor="#e8ebf5"><font size="2">英文名称</font>&nbsp;</td>
        <td> 
          <input name="nameEn" type="text" value="<%=nameEn%>" size="15"> 
</td><td bgcolor="#e8ebf5"><FONT SIZE="2">职　　位</font>&nbsp;</td>
<td> <font size="2" face="Arial, Helvetica, sans-serif"> 
<select name="position" size="1" id="position">  </select>
<input type="hidden" id="defaultPosition" value="<%=postion%>">

 </font>&nbsp;</td></tr> 
<tr><TD bgcolor="#e8ebf5"><FONT SIZE="2">办公电话</font>&nbsp;</td>
<TD> 
<INPUT TYPE="text" NAME="worktel" VALUE="<%=tel%>"> </TD><td bgcolor="#e8ebf5">&nbsp;</td>
<td>&nbsp;</td></tr> 
<tr> <td bgcolor="#e8ebf5"><div align="left"><FONT SIZE="2">权 限 组</font>&nbsp;</div></td>
<td> <div align="left"><font face="Arial, Helvetica, sans-serif"> 
</font><font size="2" face="Arial, Helvetica, sans-serif"> 

<select name="restrainId" id="restrainId"> 
 </select>
 <input type="hidden" id="defaultRestrainId" value="<%=restrainId%>">
  </font>&nbsp;&nbsp;</div></td>
 
 <td bgcolor="#e8ebf5"><div align="left"><FONT SIZE="2">所在部门</font>&nbsp;</div></td>
 <td> 
<div align="left">
<select size="1" name="deptId" id="department" onchange="changeDep()" defaultValue="<%=deptId%>"> 
	
 </select> 

 <input type="hidden" id="defaultDeptId" value="<%=deptId%>">
 &nbsp;</div></td></tr><TR> 
<TD bgcolor="#e8ebf5"><FONT SIZE="2">登 录 ip</font>&nbsp;</td>
<TD> <INPUT TYPE="text" NAME="waptel" VALUE="<%=ip%>"> 
</TD><TD bgcolor="#e8ebf5"><FONT SIZE="2">是否绑定</font>&nbsp;</td>
<TD>  
<SELECT name="ipbind" ID="ipbd" > 
	<option <%if(ipbd) out.print("selected='selected'");%>>是</option>
	<option <%if(!ipbd) out.print("selected='selected'");%>>否</option>
 </SELECT> </td>
 </TR><TR BGCOLOR="#d3d8eb">
        <TD COLSPAN="4" bgcolor="#e8ebf5"><FONT SIZE="2">电子促销邮件服务器设置:</font>&nbsp;</td>
		</TR>
		
		<TR><TD WIDTH="20%" bgcolor="#e8ebf5">
<FONT SIZE="2">用 
户 名 :</font>&nbsp;</td>
<TD COLSPAN="3"><FONT SIZE="2"><INPUT NAME="mail_user" TYPE="TEXT" ID="user_ip" SIZE="50" VALUE="<%=mail_user%>"></font>
&nbsp;</td></TR>
<TR><TD WIDTH="20%" bgcolor="#e8ebf5"><FONT SIZE="2">密　　码:</font>&nbsp;</td>
<TD COLSPAN="3"><FONT SIZE="2"><INPUT NAME="mail_password" TYPE="PASSWORD" ID="user_ip" SIZE="50" VALUE="<%=mail_password%>">
</font>&nbsp;</td></TR><TR><TD WIDTH="20%" bgcolor="#e8ebf5"><FONT SIZE="2">发件邮件:</font>&nbsp;</td>
<TD COLSPAN="3"><INPUT TYPE="text" NAME="email" VALUE="<%=email%>" SIZE="50"></TD></TR>
<TR><TD WIDTH="20%" bgcolor="#e8ebf5"><FONT SIZE="2">发件服务器SMTP:</font>&nbsp;</td>
<TD COLSPAN="3"><FONT SIZE="2"><INPUT TYPE="text" NAME="mail_smtp" SIZE="50" VALUE="<%=mail_smtp%>"></font>&nbsp;</td></TR> 
</table><p> 
<input type="submit" size="4" value=" 确 认 " name="submit"> <input type="button" value=" 关 闭 " onClick="window.close()"
name="button"> 
</p></FORM></CENTER>
</BODY>
</HTML>
