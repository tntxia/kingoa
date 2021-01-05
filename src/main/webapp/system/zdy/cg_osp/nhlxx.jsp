<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,java.util.*"%>
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
<% } else {%>   

<jsp:useBean id="infocrmdb" scope="page" class="infocrmdb.infocrmdb" />
<%
java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String currentDate=simple.format(new java.util.Date());
%>
<html>
<head>
<title>芯片商城有限公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

</script>

</head>
<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="do_hlxx.jsp"> <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1"> 
<TR BGCOLOR="#d3d8eb"> <td width="14%"><FONT SIZE="2" COLOR="#000000">办公用品审批流程</font>&nbsp;</td><td colspan="3"> 
<div align="right"><font size="2" color="#000000"> <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF"> 
</font> <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF"> 
</div></td></tr> <tr bgcolor="#FFFFFF"> <td width="14%"><font size="2" color="#000000">申请部门:</font>&nbsp;</td>
<td width="26%"><font size="2" face="Arial, Helvetica, sans-serif"> 
<select size="1" name="dept"> <%
  try
  {
    ResultSet rs=infocrmdb.executeQuery("select departname from department");
    while(rs.next())
    {
      String departname=rs.getString("departname");
      out.println("<option value='"+departname+"'>"+departname+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%> </select> </font>&nbsp;</td><td width="19%"><font size="2" color="#000000">申请人职位:</font>&nbsp;</td><td width="41%"> 
<font size="2"> <select name="role" size="1" id="role"> <%
  try
  {
    ResultSet rs=infocrmdb.executeQuery("select role_name from role");
    while(rs.next())
    {
      String name=rs.getString("role_name");
      out.println("<option value='"+name+"'>"+name+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%> </select> </font>&nbsp;</td></tr> <tr bgcolor="#FFFFFF"> <td width="14%"><font size="2" color="#000000">审批额度:</font>&nbsp;</td>
<td colspan="3"><font size="2" color="#000000">最少金额: 
<input type="text" name="price_min" size="10" value="0"> RMB, 最多金额: <input type="text" name="price_max" size="10" value="100000"> 
RMB；</font>&nbsp;</td></tr> <tr bgcolor="#FFFFFF"> <td width="14%"><font size="2" color="#000000">审批人:</font>&nbsp;</td>
<td colspan="3"><font size="2"> 
<select size="1" name="dd_man"> <%
  try
  {
    ResultSet rs=infocrmdb.executeQuery("select name from username");
    while(rs.next())
    {
      String name=rs.getString("name");
      out.println("<option value='"+name+"'>"+name+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%> </select> </font><font size="2" color="#000000">　　<font color="#000000">是否需要复审: 
<select name="fif"> 
    <option>是</option> 
    <option>否</option>
</select> 　　　
复审者:</font></font><font size="2"> 
<select size="1" name="fspman"> <option></option> <%
  try
  {
    ResultSet rs=infocrmdb.executeQuery("select name from username");
    while(rs.next())
    {
      String name=rs.getString("name");
      out.println("<option value='"+name+"'>"+name+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%> </select> </font>&nbsp;</td></tr> <tr bgcolor="#FFFFFF"> <td width="14%"><font size="2" color="#000000">备　　注:</font>&nbsp;</td>
<td colspan="3"> 
<textarea name="remark" cols="60"></textarea> </td></tr> <tr bgcolor="#FFFFFF"> 
<td width="14%"><font size="2" color="#000000">添加日期:</font>&nbsp;</td>
<td colspan="3"> 
<div align="left"><font size="2" color="#000000"> </font> <input type="hidden" name="dd_date" value="<%=currentDate%>"> 
<%=currentDate%> </div></td></tr> </table>
</form>
</body><%}}%>
</html>

