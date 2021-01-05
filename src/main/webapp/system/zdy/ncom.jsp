<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
 String getaLoginmessage = (String) session.getValue("adminloginSign");
   if(getaLoginmessage!="admin"){
%>
    <script language=javascript>
    window.location="../../manageslogin.jsp"
    </script>
<% } else {    
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="do_com.jsp">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb">
      <td width="20%" height="26"><font size="2" color="#000000">新建 &gt;&gt;</font>&nbsp;</td>
      <td colspan="2" height="26"> 
        <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font>
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </div>
      </td>
    </tr>
    <TR BGCOLOR="#d3d8eb"> 
      <td width="20%"><font size="2" color="#000000">公司性质自定义:</font>&nbsp;</td>
      <td colspan="2"> 
        <div align="left"><font size="2" color="#000000"> 
          <input type="text" name="com_name" size="20" maxlength="30">
          </font>&nbsp;</div>
      </td>
    </tr>
  </table>
  </form>
</body><%}}%>
</html>
