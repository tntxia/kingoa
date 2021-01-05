<%@ page contentType="text/html;charset=gb2312" %>

<html>
<head>
<title>科目自定义</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="do_credit.jsp">
  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="17%" height="26"><font size="2" color="#000000">添加 &gt;&gt;</font>&nbsp;</td>
      <td colspan="3" height="26"> <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
        </div></td>
    </tr>
    <TR BGCOLOR="#d3d8eb"> 
      <td bgcolor="#e8ebf5"><font size="2" color="#000000">科目编号:</font>&nbsp;</td>
      <td colspan="3" bgcolor="#FFFFFF"> <div align="left"><font size="2" color="#000000"> 
          <input name="cre_number" type="text" id="cre_number">
          </font>&nbsp;</div></td>
    </tr>
    <TR BGCOLOR="#d3d8eb"> 
      <td width="17%" bgcolor="#e8ebf5"><font size="2" color="#000000">中文名称:</font>&nbsp;</td>
      <td width="36%" bgcolor="#FFFFFF"> <div align="left"><font size="2" color="#000000"> 
          <input type="text" name="cre_name">
          * </font></div></td>
      <td width="15%" bgcolor="#e8ebf5"><font size="2" color="#000000">英文名称</font><font size="2" color="#000000">:</font>&nbsp;</td>
      <td width="32%" bgcolor="#FFFFFF"> <div align="left"><font size="2" color="#000000"> 
          <input name="cre_ename" type="text" id="cre_ename">
          </font></div></td>
    </tr>
  </table>
</form>
</body>
</html>
