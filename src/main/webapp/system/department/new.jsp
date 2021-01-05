<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,java.util.*"%>
<%
String basePath = request.getContextPath();
String type = request.getParameter("type");
int deptType = 1;
if(type!=null){
	deptType = Integer.valueOf(type)+1;
}
String deptCode = "";
if(request.getParameter("code")!=null){
	deptCode = request.getParameter("code");
}

%>
<html>
<head>
<title>新增部门</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript" src="<%=basePath%>/js/config.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/jquery.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/common.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/system/department/new.js"></script>
</head>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="<%=basePath%>/system/department.dispatch">
<input name="method" value="add" type="hidden">
<br>  

<table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="12%"><table width="90" height="18" border="0" cellspacing="0" cellpadding="0">
        <tr><td><font size="2" color="#000000">增加部门 &gt;&gt;</font></td></tr></table></td>
      <td colspan="3" bgcolor="#d3d8eb"> <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="保存信息" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="重新填写" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
        </div></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="12%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">部门名称:</font>&nbsp;</td>
      <td colspan="3"><font size="2" color="#000000"> 
        <input name="departname" type="text" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td nowrap bgcolor="#e8ebf5"><font color="#000000" size="2">部门类型:</font>&nbsp;</td>
      <td width="37%" bgcolor="#FFFFFF">
      	<input type='hidden' name='dept_types' value='<%=deptType %>' />
      	<%
          switch(deptType){
          case 1 : out.print("顶级部门");break;
          case 2 : out.print("一级部门");break;
          case 3 : out.print("二级部门");break;
          case 4 : out.print("三级部门");break;
          case 5 : out.print("四级部门");break;
          case 6 : out.print("五级部门");break;
          default : out.print("");break;
          
          }
	
	   	   %>
	  </td>
      <td width="10%" nowrap bgcolor="#e8ebf5"><font color="#000000" size="2">部门编号:</font>&nbsp;</td>
      <td width="41%" bgcolor="#FFFFFF"><font size="2" face="Arial, Helvetica, sans-serif"> 
      	<input type="hidden" name="deptCodeFrom" value="<%=deptCode%>" />
      	<%=deptCode%>
        <select name="dept_code" id="dept_code">
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">A</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">B</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">C</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">D</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">E</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">F</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">G</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">H</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">I</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">J</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">K</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">L</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">M</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">N</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">O</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">P</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Q</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">R</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">S</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">T</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">U</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">V</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">W</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">X</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Y</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Z</font></option>
        </select>
        * </font><font size="5"><b><font size="2" color="#000000">
        </font></b></font><font color="#000000" size="2">&nbsp; 
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="12%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">部门简称:</font>&nbsp;</td>
      <td colspan="3"> <div align="left"><font size="2" color="#000000"> 
          </font> <font size="2" color="#000000"> 
          <input name="remark" type="text" value="" size="45">
          </font>&nbsp;</div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="24%"><font size="2" color="#000000">部门负责人:</font>&nbsp;</td>
      <td width="76%"> <div align="left"><font size="2" color="#000000"> </font> 
          <font size="2" color="#000000"> 
          <select name="leader" id="leader"><option value="">请选择</option>
          </select>
          </font>&nbsp;</div></td>
    </tr>
  </table>
  <p><font size="2">说明：部门类型级别高的可查阅级别低的。</font></p>
</form>
</body>
</html>
