<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.*,com.tntxia.oa.system.entity.*" %>
<%

String basePath = request.getContextPath();

List<Department> result = (List<Department>) request.getAttribute("result");

%>
<html>
<head>
<title>部门管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <tr bgcolor="#FFFFFF"> 
      <td bgcolor="#FFFFFF"><font color="#000000" size="2">部门管理 &gt;&gt; </font>&nbsp;</td>
      <td colspan="3"> <div align="right"><font size="2" color="#666600"> 
          <input type="button" value="增加顶级部门" name="B22333233" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('<%=basePath%>/system/department/new.jsp','bqt', 'height=380, width=650, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
          </font><font color="#000000" size="2"> </font>&nbsp;</div></td>
    </tr>
    <tr height="8" bgcolor="#d3d8eb"> 
      <td width="203" height="8"> <div align="left"><font color="#000000"><font size="2">部门名称</font></font>&nbsp;</div></td>
      <td width="101"> <div align="left"><font color="#000000"><font size="2">部门类型</font></font>&nbsp;</div></td>
      <td width="87"> <div align="left"><font color="#000000"><font size="2">部门编号</font></font></div></td>
      <td width="258" height="8"><font color="#000000">&nbsp;</font>&nbsp;</td>
    </tr>
    <%
   int i = 0;
   for(Department dep : result){ 
	   int id=dep.getId();
		String dept=dep.getName();
	  int  dept_types = dep.getType();
	  String dept_code=dep.getDepartCode();
   %>
    <tr height="8" bgcolor="#FFFFFF"> 
      
      <td width="203" height="30"> 
      <div align="left">
      	<font size="2" color="#000000"> 
          <%=dept%> </font>&nbsp;
      </div>
      </td>
      <td width="101" height="30"> 
      	<div align="left"><font size="2"> 
          <%
          switch(dept_types){
          case 1 : out.print("顶级部门");break;
          case 2 : out.print("一级部门");break;
          case 3 : out.print("二级部门");break;
          case 4 : out.print("三级部门");break;
          case 5 : out.print("四级部门");break;
          case 6 : out.print("五级部门");break;
          default : out.print("");break;
          
          }
	
	   	   %>
          </font>&nbsp;</div></td>
      <td width="87" height="30"> <div align="left"><font size="2"><%=dept_code%> </font>&nbsp;</div></td>
      <td width="258" height="30"><font size="2" color="#666600">&nbsp; </font><font size="2" color="#666600">
<input type="button" value="增加下级部门" name="B223332322" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('<%=basePath%>/system/department/new.jsp?type=<%=dept_types%>&code=<%=dept_code%>','bqt', 'height=380, width=650, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
        <input type="button" value="编辑" name="B22333232" 
        style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" 
        onClick="window.open('<%=basePath%>/system/department.dispatch?method=toEdit&id=<%=id%>','bqt', 'height=380, width=650, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
        </font><font size="2" color="#666600"> 
        <input type="button" value="删除" name="B22333232" 
        style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" 
        onClick="window.open('<%=basePath%>/system/department.dispatch?method=del&id=<%=id%>','bqt', 'height=380, width=650, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
        </font><font size="2" color="#666600"> </font></td>
    </tr>
    <% i++; 
    } %>
    
  </table>
</form>
</body> 
</html> 

