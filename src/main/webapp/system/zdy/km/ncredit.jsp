<%@ page contentType="text/html;charset=gb2312" %>
<%
 String xh=request.getParameter("xh").trim();
%>
<html>
<head>
<title>��Ŀ�Զ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="do_credit.jsp">
  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="17%" height="26"><font size="2" color="#000000">��� &gt;&gt;</font>&nbsp;</td>
      <td colspan="3" height="26"> 
        <div align="right"><font size="2" color="#000000">
          <input name="xh" type="hidden" id="cre_number" value="<%=xh%>">
          <input type="submit" name="Submit" value="ȷ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
        </div>
      </td>
    </tr>
    <TR BGCOLOR="#d3d8eb"> 
      <td bgcolor="#e8ebf5"><font size="2">��Ŀ���:</font>&nbsp;</td>
      <td bgcolor="#FFFFFF"> 
        <div align="left"><font size="2" color="#000000"> 
          <%=xh%>
          <input name="cre_number" type="text" id="cre_number" size="10">
          </font>&nbsp;</div>
      </td>
      <td bgcolor="#e8ebf5"><font size="2">����:</font>&nbsp;</td>
      <td bgcolor="#FFFFFF"><font size="2">
        <select name="km_fx">
          <option>����</option>
          <option>�跽</option>
        </select>
        ������һ��������/���ӣ�</font>&nbsp;</td>
    </tr>
    <TR BGCOLOR="#d3d8eb"> 
      <td width="17%" bgcolor="#e8ebf5"><font size="2">��Ŀ����:</font>&nbsp;</td>
      <td width="34%" bgcolor="#FFFFFF"> 
        <div align="left"><font size="2" color="#000000"> 
          <input type="text" name="cre_name">
          * </font></div>
      </td>
      <td width="11%" bgcolor="#e8ebf5"><font size="2">��ע:</font>&nbsp;</td>
      <td width="38%" bgcolor="#FFFFFF"> 
        <div align="left"><font size="2" color="#000000"> 
          <input name="cre_ename" type="text" id="cre_ename">
          </font>&nbsp;</div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
