<%@ page import="java.sql.*,java.util.*"%>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page contentType="text/html;charset=GB2312"%>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../refuse.jsp"
    </script>
<% } else {    
 %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>оƬ�̳����޹�˾</title>
<style type="text/css">
<!--
.H1 {font-size:12pt; line-height:15pt; align=center}
.ourfont {font-size:9pt; line-height:15pt; }
.ourfont1 {font-size:8pt; line-height:13pt; }
A{text-transform: none; text-decoration:none;color:#0000ff}
a:hover {text-decoration:underline;color:#0000ff}
body,td,th {
	color: #000000;
}
body {
	background-color: #FFFFFF;
}
-->
</style>
<%
String id1=request.getParameter("id");
String sql="select * from punit_type where id='"+id1+"'";

ResultSet rs=einfodb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
%>
</head>
<body>
<form name="form1" method="post" action="doeditpunit.jsp">
  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb">
      <td width="20%" height="12"><font size="2" color="#000000">�༭ &gt;&gt;</font></td>
      <td colspan="2" height="12"> 
        <div align="right"><font size="2">
          <input type="hidden" name="id" size="20" style="border: 1 inset #C3D9FF" value="<%=id1%>">
          </font><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="ȷ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="button" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF" onclick=javascript:history.back()>
          </div>
      </td>
    </tr>
    <TR BGCOLOR="#d3d8eb"> 
      <td width="20%" bgcolor="#e8ebf5"><font size="2" color="#0000FF">��λ�Զ���:</font>&nbsp;</td>
      <td colspan="2" bgcolor="#FFFFFF"> 
        <div align="left"><font size="2" color="#000000"> 
          <input type="text" name="punit_name" size="20" maxlength="30" value="<%=rs.getString("punit_name")%>">
          </font>&nbsp;</div>
      </td>
    </tr>
  </table>
</form>
</body>
<%}%>
</html>
