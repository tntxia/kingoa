<%@ page contentType="text/html;charset=gb2312"%>
<%@ page language="java" import="java.util.*,com.tntxia.oa.system.entity.*"%>
<%@ include file="../../common/checkManageLogin.jsp"%>
<%
String basePath = request.getContextPath();
List<ContactTemplate> list = (List<ContactTemplate>)request.getAttribute("list");
%>
<html>
<head>
<title>合同模板列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<style type="text/css">
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
</style>
<body topmargin="0" text="#000000"  marginwidth="0" marginheight="0">
<form name="form1" method="post" action=""><br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <tr> 
      <td height="6" width="360"><font size="2" color="#000000">合同模板</font>&nbsp;</td>
      <td colspan="3" height="6"> 
        <div align="right"><font color="#000000" size="2"> 
          <input type="button" value="添加模板" name="B22" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('nhlxx.jsp','gnw', 'height=460, width=550, top=200, left=200, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr height="8" bgcolor="#d3d8eb"> <td width="360" height="8"> 
        <div align="left"><font color="#000000"><font size="2">合同名称</font></font>&nbsp;</div>
      </td>
      <td width="333" height="8"> 
        <div align="left"><font color="#000000"><font size="2">公司名称</font></font>&nbsp;</div>
      </td>
      <td width="114" height="8"> 
        <div align="left"><font size="2">日期</font>&nbsp;</div>
      </td>
      <td width="161" height="8"> 
        <div align="left"><font color="#000000"><font size="2">操作</font></font>&nbsp;</div>
      </td>
    </tr>
    <%
   for(ContactTemplate template : list){ %>
    <tr height="8"onMouseOver="this.bgColor='#B5DAFF'" onMouseOut="this.bgColor='#ffffff'" style="cursor:hand;"> 
      <%int id=template.getId();%>
      <td width="360" height="6"> 
        <div align="left"><font size="2"><%=template.getName()%></font>&nbsp;</div>
      </td>
      <td width="333" height="6"> 
        <div align="left"><font size="2"><%=template.getCompany()%></font>&nbsp;</div>
      </td>
      <td width="114" height="6"><font size="2"><%=template.getCreateDate()%></font>&nbsp;</td>
      <td width="161" height="6"> 
        <div align="center"><font color="#000000" size="2"> 
          <input type="button" value="编辑" name="B222" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('edit-hl.jsp?id=<%=id%>','gnw', 'height=523, width=955, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
          </font><font color="#000000" size="2"> 
          <input type="button" value="删除" name="B223" 
          style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" 
          onClick="window.open('template.dispatch?method=del&id=<%=id%>','gnw', 'height=446, width=1002, top=200, left=200, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
          </font>&nbsp;</div>
      </td>
    </tr>
    <% } %>
    
  </table>
</form>
</body> 
</html> 
