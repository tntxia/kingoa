<%@ page contentType="text/html;charset=gb2312"%>
<%

String basePath = request.getContextPath();

%>
<html>
<head>
<title>仓库管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript" src="<%=basePath%>/js/config.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/jquery.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/tntxia.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/system/warehouse/list.js"></script>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="">
  <br>  <table id="datagrid" height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <thead>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"><font color="#000000" size="2"> 仓库管理 &gt;&gt; 
        </font>&nbsp;</td>
      <td> <div align="right"><font color="#000000" size="2"> 
          <input type="button" value="增加仓库" name="B22" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('new.jsp','main', 'height=200, width=550, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no')">
          </font></div> </td>
    </tr>
    <tr bgcolor="#d3d8eb" height="8"> 
      <td width="84" height="8"> <div align="left"><font color="#000000"><font size="2">编号</font></font></div> </td>
      <td width="555" height="8"> <div align="left"><font color="#000000"><font size="2">仓库名称</font></font></div> </td>
      <td width="133" height="8"> <div align="center"><font color="#000000"><font size="2">操作</font></font></div> </td>
    </tr>
    </thead>
    <tbody>
    
    </tbody>
    
  </table>
</form>
</body> 
</html> 

