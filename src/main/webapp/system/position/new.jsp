<%@ page contentType="text/html;charset=gb2312" %>
<%   
 java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String currentDate=simple.format(new java.util.Date());
String basePath = request.getContextPath();
%>
<html>
<head>
<title>新增职位</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="<%=basePath %>/system/position.dispatch">
<input name="method" type="hidden" value="add">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="19%"><font size="2" color="#000000">职位 &gt;&gt;</font>&nbsp;</td>
      <td width="81%"> 
        <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="保存信息" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="重新填写" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
        </div>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" bgcolor="#e8ebf5"><font size="2" color="#000000">职位名称:</font>&nbsp;</td>
      <td width="81%"><font size="2" color="#000000"> 
        <input name="role_name" type="text" id="role_name">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" bgcolor="#e8ebf5"><font size="2" color="#000000">职位描述:</font>&nbsp;</td>
      <td width="81%"><font size="2" color="#000000"> 
        <textarea name="remark"></textarea>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" bgcolor="#e8ebf5"><font size="2" color="#000000">创建日期:</font>&nbsp;</td>
      <td width="81%"> 
        <div align="left"><font size="2" color="#000000"> </font> 
          <input name="role_date" type="text" id="role_date" value="<%=currentDate%>">
        </div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

