<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*,com.tntxia.oa.system.entity.*"%>
<%
Position position = (Position) request.getAttribute("result");
String role_name=position.getName();
%>

<html>
<head>
<title>�޸�ְλ��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="position.dispatch">
<input type="hidden" name="method" value="update">
<input type="hidden" name="id" value="<%=position.getId()%>">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="34%"><font size="2" color="#000000">ְλ�༭ &gt;&gt; 
        
        </font>&nbsp;</td>
      <td width="66%"> 
        <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="����" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          </font><font size="2"> 
          <input type="reset" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()">
          </font><font size="2" color="#000000"> </font>&nbsp;</div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="34%"><font size="2" color="#0000FF">ְλ����:</font>&nbsp;</td>
      <td width="66%"><font size="2" color="#000000"> 
        <input name="role_name" type="text" id="role_name" value="<%=role_name%>">
        <input name="role" type="hidden" id="role" value="<%=role_name%>">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="34%"><font size="2" color="#0000FF">ְλ����:</font>&nbsp;</td>
      <td width="66%"><font size="2" color="#000000"> 
        <textarea name="remark"><%=position.getRemark()%></textarea>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="34%"><font size="2" color="#0000FF">�޸�����:</font>&nbsp;</td>
      <td width="66%"> 
        <div align="left"><font size="2" color="#000000"> </font> <font size="2" color="#000000">
          <input name="role_date" type="text" id="role_date" value="<%=position.getDate()%>">
          </font>&nbsp;</div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
