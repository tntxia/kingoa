<%@ page contentType="text/html;charset=gb2312"%>
<%

String basePath = request.getContextPath();

%>
<html>
<head>
<title>职位管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	background-color: #F3F3F3;
}
td,p,select,input,textarea {font-size:12px}
.l15 {line-height:150%}
.l13 {line-height:130%}
.f10 {font-size:10px}
.f14 {font-size:14.9px}
.bdrclr01{color:#000000; border-color:#000000}
.c03{color:#000000;border-color:#000000;}                       A:link {text-decoration:none;color:#0000ff;}
A:visited {text-decoration:none;color:#800080;}
A:active {text-decoration:none;color:#0000ff;}
A:hover {text-decoration:underline;color:#0000ff;}
-->
</style>
<script language="JavaScript" src="<%=basePath%>/js/config.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/jquery.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/common.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/system/position/list.js"></script>
</head>

<body topmargin="0" text="#000000" marginwidth="0" marginheight="0">
<form name="form1" method="post" action=""><br>  

<table id="datagrid" height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
   <thead>
    <tr> 
      <td height="6"><font color="#000000" size="2">职位管理 &gt;&gt; </font>&nbsp;</td>
      <td colspan="2" height="6"> <div align="right"><font color="#000000" size="2"> 
          <input type="button" value="新建" name="B22" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('new.jsp','nw', 'height=446, width=1002, top=200, left=200, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
          </font>&nbsp;</div></td>
    </tr>
    <tr height="8" bgcolor="#d3d8eb"> <td width="285" height="8"> <div align="left"><font color="#000000"><font size="2">职位名称</font></font>&nbsp;</div></td>
      <td width="202" height="8"> <div align="left"><font size="2">日期</font>&nbsp;</div></td>
      <td width="202" height="8"> <div align="left"><font color="#000000"><font size="2">操作</font></font>&nbsp;</div></td>
    </tr>
   </thead>
   <tbody>
   
   </tbody>
   
   <tfoot>
    <tr> 
      <td colspan=7 align=center height="22"> <div align="right"><font color="#000000" size="2"> 
          </font> <font color="#C1D9FF" size="2"> 
          
          <a id="lastPage" href="javascript:lastPage()" style="font-size: 12px">上一页</a> 
          
          <a id="nextPage" href="javascript:nextPage()" style="font-size: 12px">下一页</a> 
          
          </font>&nbsp;</div></td>
    </tr>
   </tfoot>
  </table>
</form>
</body> 
</html> 

