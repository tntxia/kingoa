<jsp:useBean id="infocrmdb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page import="java.sql.*,java.util.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="infocrmdb.DealString" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
%>

<html>
<head>
<title>оƬ�̳����޹�˾</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String id2=request.getParameter("id");
String sql="select  * from ht_mb where id='"+id2+"'";
ResultSet rs=infocrmdb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
%>
<body bgcolor="#ffffff" text="#000000" topmargin="0" >
<form name="form1" method="post" action="">
<br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">    <TR BGCOLOR="#d3d8eb"> 
      <td width="20%"><font size="2" color="#000000">-&gt;&gt; 
        <input type="hidden" name="id" value="<%=id2%>">
        </font>&nbsp;</td>
      <td width="80%"> 
        <div align="right"><font size="2"> <a href="javascript:window.close()" style="font-size: 12px">�ر�</a> 
          </font>&nbsp;</div>
      </td>
    </tr>
  </table>
<br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">    <tr> 
      <td height="18" nowrap bgcolor="#e8ebf5"><font face="����" size="2">��ͬ����:</font>&nbsp;</td>
      <td><font face="����" size="2"> <%=rs.getString(2)%> </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font face="����" size="2">��ͬ����:</font>&nbsp;</td>
      <td width="87%"><font face="����" size="2"> <%=rs.getString(3)%> </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font face="����" size="2">��˾����:</font>&nbsp;</td>
      <td width="87%"><font face="����" size="2"> <%=rs.getString(4)%> </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font face="����" size="2">��˾��ַ:</font>&nbsp;</td>
      <td width="87%"><font face="����" size="2"> <%=rs.getString(5)%> </font>&nbsp;</td>
    </tr>
    <tr> 
      <td nowrap bgcolor="#e8ebf5"><font face="����" size="2">��������:</font>&nbsp;</td>
      <td><font face="����" size="2"> <%=rs.getString(6)%> </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font face="����" size="2">��˾�绰:</font>&nbsp;</td>
      <td width="87%"><font face="����" size="2"> <%=rs.getString(7)%> </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font face="����" size="2">��˾����:</font>&nbsp;</td>
      <td width="87%"><font face="����" size="2"> <%=rs.getString(8)%> </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font face="����" size="2">��������:</font>&nbsp;</td>
      <td width="87%"><font face="����" size="2"> <%=rs.getString(9)%> </font>&nbsp;</td>
    </tr>
    <tr> 
      <td nowrap bgcolor="#e8ebf5"><font face="����" size="2">�����ʺ�:</font>&nbsp;</td>
      <td><font face="����" size="2"> <%=rs.getString(10)%> </font>&nbsp;</td>
    </tr>
    <tr> 
      <td nowrap bgcolor="#e8ebf5"><font face="����" size="2">��������:</font>&nbsp;</td>
      <td><font face="����" size="2"> <%=rs.getString(11)%> </font>&nbsp;</td>
    </tr>
    <tr> 
      <td nowrap bgcolor="#e8ebf5"><font face="����" size="2">��˰���:</font>&nbsp;</td>
      <td><font face="����" size="2"> <%=rs.getString(12)%> </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font face="����" size="2">��������:</font>&nbsp;</td>
      <td width="87%"><font face="����" size="2"> <%=rs.getString(13)%> </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font face="����" size="2">������ע:</font>&nbsp;</td>
      <td width="87%"><font face="����" size="2"> <%=rs.getString(14)%> </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font face="����" size="2">��������:</font>&nbsp;</td>
      <td width="87%"> <div align="left"> <font face="����" size="2"><%=rs.getDate(15)%> </font>&nbsp;</div></td>
    </tr>
  </table>
</form>
</body><%}%>
</html>
