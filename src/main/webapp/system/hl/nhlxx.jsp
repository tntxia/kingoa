<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../refuse.jsp"
    </script>
<% } else {    
 java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String currentDate=simple.format(new java.util.Date());
%>
<html>
<head>
<title>芯片商城有限公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="do_hlxx.jsp">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="34%"><font size="2" color="#000000">增加汇率 &gt;&gt;</font>&nbsp;</td>
      <td width="66%"> 
        <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="保存信息" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="重新填写" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
        </div>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="34%"><font size="2" color="#000000">货币名称:</font>&nbsp;</td>
      <td width="66%"><font size="2" color="#000000"> 
        <input type="text" name="departname">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="34%"><font size="2" color="#000000">当前汇率:</font>&nbsp;</td>
      <td width="66%"><font size="2" color="#000000"> 
        <input type="text" name="remark">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="34%"><font size="2" color="#000000">创建日期:</font>&nbsp;</td>
      <td width="66%"> 
        <div align="left"><font size="2" color="#000000"> </font> 
          <input type="text" name="creatdate" value="<%=currentDate%>">
        </div>      </td>
    </tr>
  </table>
</form>
</body>
<%}%>
</html>

