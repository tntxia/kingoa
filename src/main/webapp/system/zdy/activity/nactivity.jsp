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
<% } else {%>   
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="do_activity.jsp">
  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <tr> 
      <td width="14%" height="26" bgcolor="#d3d8eb"><font face="����" size="2">�½� &gt;&gt;</font>&nbsp;</td>
      <td width="86%" height="26" colspan="2" bgcolor="#d3d8eb"> <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="ȷ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
        </div></td>
    </tr>
    <tr> 
      <td width="14%"><font face="����" size="2">�����:</font>&nbsp;</td>
      <td colspan="2" width="86%"> <div align="left"> <font face="����" size="2"> 
          <input type="text" name="act_name" size="35" maxlength="50">
          </font>&nbsp;</div></td>
    </tr>
  </table>
</form>
</body>
<%}}%>
</html>
