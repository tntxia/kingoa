<%@ page contentType="text/html;charset=gb2312" %>
<%
 String p=request.getParameter("p");
%>
<html>
<head>
<title>�Զ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="do_credit.jsp"  >
  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="17%" height="26"><font size="2" color="#000000">��Ŀ��ϸ &gt;&gt;</font>&nbsp;</td>
      <td width="83%" height="26"> 
        <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="ȷ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> <font size="2" color="#000000"> 
          <input type="reset" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td bgcolor="#e8ebf5"><font size="2" color="#000000">������Ŀ:</font>&nbsp;</td>
      <td> 
        <div align="left"><font size="2" color="#000000"> 
          <input name="p" type="hidden" id="p" value="<%=p%>" size="6" maxlength="3">
          <%=p%> </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="17%" bgcolor="#e8ebf5"><font size="2" color="#000000">��ϸ����:</font>&nbsp;</td>
      <td width="83%"> 
        <div align="left"><font size="2" color="#000000"> 
          <input name="km_mx" type="text" id="km_mx" size="50">
          </font>&nbsp;</div>
      </td>
    </tr>
  </table>
</form>
<font size="2" color="#000000">�����Ŀ��ϸ����ǰ������һ������һ����Ŀ��ŵ��ӱ�š� </font> 
</body>
</html>
