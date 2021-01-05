<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*,com.tntxia.oa.system.entity.*" %>
<%
String id2=request.getParameter("id");
Department dept = (Department) request.getAttribute("result");
String name=dept.getName();
int dept_types=dept.getType();
String basePath = request.getContextPath();

%>
<html>
<head>
<title>部门信息编辑</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript" src="<%=basePath%>/js/config.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/jquery.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/common.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/system/department/edit.js"></script>
</head>

<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="department.dispatch">
<INPUT TYPE="hidden" name="method" value="update">
<INPUT TYPE="hidden" name="id" value="<%=id2%>">

  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="24%"><font size="2" color="#000000">编辑 &gt;&gt;</font>&nbsp;</td>
      <td width="76%"> <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="保存" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font><font size="2"> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()">
          </font><font size="2" color="#000000"> </font>&nbsp;</div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="24%"><font size="2" color="#000000">部门名称:</font>&nbsp;</td>
      <td width="76%"><font size="2" color="#000000"> <%=name%>
        <input name="departname" type="hidden" value="<%=name%>" size="38">
        
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td><font size="2" color="#000000">部门类型:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
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
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="24%"><font size="2" color="#000000">部门简称:</font>&nbsp;</td>
      <td width="76%"> <div align="left"><font size="2" color="#000000"> </font> 
          <font size="2" color="#000000"> 
          <input name="remark" type="text" value="<%=dept.getRemark()%>" size="38">
          </font>&nbsp;</div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="24%"><font size="2" color="#000000">部门负责人:</font>&nbsp;</td>
      <td width="76%"> <div align="left"><font size="2" color="#000000"> </font> 
          <font size="2" color="#000000"> 
          <select name="leader" id="leader" defaultValue="<%=dept.getLeader()%>"><option value="">请选择</option>
          </select>
          </font>&nbsp;</div></td>
    </tr>
  </table>
  </form>
</body>
</html>
