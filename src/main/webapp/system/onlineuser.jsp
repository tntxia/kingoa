<%@ page contentType="text/html;charset=gb2312" %> 
<%@ page import="onLineUser,java.util.*" %>
<jsp:useBean id="onlineuser" class="onLineUser" scope="application"/>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../refuse.jsp"
    </script>
<% } else {    
%>
<html> 
<head> 
<title>��������</title>
</head>
<body >
<center> 
<table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td colspan="3" bgcolor="#FFFFFF"><font size="2">
        <% 
   String username = (String) session.getValue("username");
   String Remotehost = (String) session.getValue("Remotehost");
   String Remoteadd = (String) session.getValue("Remoteadd");
   String Sername = (String) session.getValue("Sername");
   String currentDate = (String) session.getValue("currentDate");

   out.println("<br>��ǰ�����û�����:<font color=red>"+onlineuser.getCount()+"</font><br>");
   Vector vt=onlineuser.getOnLineUser();
   Enumeration e = vt.elements();
%></font></td>
    </tr>
    <tr bgcolor="#d3d8eb"> 
      <td width="13%"><font size="2">��½�û�</font>&nbsp;</td>
      <td width="15%"><font size="2">����������</font>&nbsp;</td>
      <td width="21%"><font size="2">&nbsp;</font>&nbsp;</td>
    </tr>
    <%while(e.hasMoreElements()){
	String dname=(String)e.nextElement();
	%>
    <tr> 
      <td width="13%" bgcolor="#e8ebf5"><font size="2"><%=dname%></font></td>
      <td width="15%"><font size="2"><%=Sername%></font></td>
      <td width="21%"> <font size="2"> 
        <%
   out.println("<p><a href='logout.jsp?username="+dname+"'>ǿ���˳�ϵͳ</a></p>");
%>
        </font></td>
    </tr>
    <%}%>
  </table>
<p>&nbsp;</p></center> 
</body> 
<%}%>
</html> 
