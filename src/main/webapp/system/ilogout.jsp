<%@ page contentType="text/html;charset=gb2312" %> 
<%@ page import="com.tntxia.user.onLineUser,java.util.*" %> 
<jsp:useBean id="onlineuser" class="onLineUser" scope="application"/>
<html> 
<head> 
<title>�˳���½</title>
<link href="../css/crm.css" rel="stylesheet" type="text/css">
</head>
<body><table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="100%" align="center" valign="middle"><div align="center">
  <p><img src="../images/zx.jpg" width="111" height="111"></p>
  <br>
  
<span style="font-size:16px; color: #f00; font-family:'����'; letter-spacing:0px; vertical-align:middle;">ע���ɹ�!</span>
  <% 
 session.invalidate();
 
%>
  <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
        <span id="tlink"><a href="../index.jsp" target="_parent" style="font-size: 12px">���µ�½</a> 
        </span> 
        <p> </p></div>
    </td>
  </tr></table>
</body> 
</html>  