<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
 String getaLoginmessage = (String) session.getValue("adminloginSign");
   if(getaLoginmessage!="admin"){
%>
    <script language=javascript>
    window.location="../../manageslogin.jsp"
    </script>
<% } else {    
%>

<%
java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String currentDate=simple.format(new java.util.Date());
%>
<html>
<head>
<title>芯片商城有限公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000"  topmargin="0">
<form name="form1" method="post" action="do_hlxx.jsp">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <tr> 
      <td width="13%" bgcolor="#d3d8eb"><font size="2" color="#000000">信用级别</font>&nbsp;</td>
      <td width="87%" bgcolor="#d3d8eb"> 
        <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
        </div>      </td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#e8ebf5"><font size="2" color="#000000">信用级别:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="xyjb_name" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#e8ebf5"><font size="2" color="#000000">备　　注:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <textarea name="remark" cols="60"></textarea>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#e8ebf5"><font size="2" color="#000000">创建日期:</font>&nbsp;</td>
      <td width="87%"> 
        <div align="left"><font size="2" color="#000000"> </font> 
          <input type="hidden" name="xy_date" value="<%=currentDate%>">
          <%=currentDate%>        </div>      </td>
    </tr>
  </table>
</form>
</body><%}}%>
</html>

