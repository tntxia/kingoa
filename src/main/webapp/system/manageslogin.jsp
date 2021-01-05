<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../refuse.jsp"
    </script>
<% } else {    
%>
<html>
<head>
<title>系统管理登陆</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<script language="JavaScript">
function isValid(form){
    if(form.adminname.value==""){
        alert("登录名不能为空!");
	return false;
    }
    else if((form.password.value.length<2)||(form.password.value.length>15)){
        alert("密码必须是2-15位字母或数字!");
	return false;
    }
    else {
        return true;
    }
}
</script>

<body onselectstart="return false"  marginwidth="0" marginheight="0">
<div align="center">
  <p>&nbsp;</p>
  <p><font size="2" color="#000000"> 
    <% String getadmin = (String) session.getValue("manageslogin_message");
   if(getadmin==null) getadmin="";
%>
    <%= getadmin %></font></p>
  <form method=POST  action="manageslogin_confirm.jsp" name="form1">
    <table width="357" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#0000FF">
      <tr> 
        <td><img src="../images/admintop.gif" width="357" height="48"></td>
      </tr>
      <tr> 
        <td height="150" background="../images/adminback.gif"> <table width="357" border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td width="125" height="30"> <div align="right"><font size="2">管理员名称：</font>&nbsp;</div></td>
              <td width="7" height="30">&nbsp;</td>
              <td width="225" height="30"> <input name="adminname" type=text class=j id="adminname" style="width:160px" value="admin"> 
              </td>
            </tr>
            <tr> 
              <td height="30"> <div align="right"><font size="2">管理员密码：</font>&nbsp;</div></td>
              <td height="30">&nbsp;</td>
              <td height="30"> <input name="password" type=password class=j id="password" style="width:160px"></td>
            </tr>
            <tr> 
              <td height="44" colspan="3"><div align="center"> 
                  &nbsp;&nbsp;
                  <input type="submit" name="Submit3" value="提交">
                  　 
                  <input type="reset" name="Submit22" value="重置">
                </div></td>
            </tr>
          </table></td>
      </tr>
      <tr> 
        <td><img src="../images/adminend.gif" width="357" height="20"></td>
      </tr>
    </table>
  </form>
  <p>&nbsp;</p>
  <p>&nbsp; </p>
</div>
</body>
<%}%>
</html>
