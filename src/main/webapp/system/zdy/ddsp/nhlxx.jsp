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
<title>оƬ�̳����޹�˾</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

</script>

</head>
<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="do_hlxx.jsp"> 
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="17%"><font size="2" color="#000000">������������</font>&nbsp;</td>
      <td colspan="3"> 
        <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="ȷ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
        </div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"><font size="2" color="#000000">��ͬ���벿��:</font>&nbsp;</td>
      <td width="32%"><font size="2" face="Arial, Helvetica, sans-serif" color="#000000"> 
        <select size="1" name="dept">
          <%
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
%>
        </select>
        </font>&nbsp;</td>
      <td width="13%"><font size="2" color="#000000">������ְλ:</font>&nbsp;</td>
      <td width="38%"> <font size="2" color="#000000"> 
        <select name="role" size="1" id="role">
          <%
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
%>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"><font size="2" color="#000000">��ͽ��:</font>&nbsp;</td>
      <td> <font color="#000000"> RMB<FONT SIZE="2"> 
        <input type="text" name="price_min" size="8" value="0">
        </FONT></font>&nbsp;</td>
      <td><font size="2" color="#000000">��߽��:</font>&nbsp;</td>
      <td><font color="#000000"><font color="#000000">RMB<font size="2"> 
        <input type="text" name="price_max" size="8" value="1000000">
        </font></font></font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"><font size="2" color="#000000">�Ƿ���Ҫ����:</font>&nbsp;</td>
      <td><font color="#000000"> 
        <select name="if_sp">
          <option><font size="2" color="#000000">��</font></option>
          <option><font size="2" color="#000000">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td><font size="2" color="#000000">������:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <select size="1" name="dd_man">
          <%
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
%>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"><font size="2" color="#000000">�Ƿ���Ҫ����: </font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <select name="fif">
          <option>��</option>
          <option>��</option>
        </select>
        ������ ���� &nbsp; </font>&nbsp;</td>
      <td><font size="2" color="#000000">������:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <select size="1" name="fspman">
          <option></option>
          <%
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
%>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"><font size="2" color="#000000">�ʼ�֪ͨ������:</font>&nbsp;</td>
      <td colspan="3"><font size="2" color="#000000"> 
        <select name="remark" size="1" id="remark">
          <%
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
%>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"><font size="2" color="#000000">�������:</font>&nbsp;</td>
      <td colspan="3"> 
        <div align="left"> <font color="#000000"> 
          <input type="hidden" name="dd_date" value="<%=currentDate%>">
          <%=currentDate%> </font>&nbsp;</div>
      </td>
    </tr>
  </table>
</form>
</body><%}}%>
</html>

