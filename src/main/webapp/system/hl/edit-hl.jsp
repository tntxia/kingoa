
<jsp:useBean id="infocrmdb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page import="java.sql.*,java.util.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../refuse.jsp"
    </script>
<% } else {    
 %>
<html>
<head>
<title>芯片商城有限公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String id2=request.getParameter("id");
String sql="select  * from hltable where id='"+id2+"'";
ResultSet rs=infocrmdb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
%>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="doedithl.jsp">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="37%"><font size="2" color="#000000">编辑 &gt;&gt; 
        <input type="hidden" name="id" value="<%=id2%>">
        </font>&nbsp;</td>
      <td width="63%"> 
        <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="保存" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font><font size="2"> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()">
          </font><font size="2" color="#000000"> </font>&nbsp;</div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="37%"><font size="2" color="#0000FF">货币名称:</font>&nbsp;</td>
      <td width="63%"><font size="2" color="#000000"> 
        <input type="text" name="departname" value="<%=rs.getString(2)%>">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="37%"><font size="2" color="#0000FF">当前汇率:</font>&nbsp;</td>
      <td width="63%"><font size="2" color="#000000">
        <input type="text" name="remark" value="<%=rs.getString(3)%>">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="37%"><font size="2" color="#0000FF">修改日期:</font>&nbsp;</td>
      <td width="63%"> 
        <div align="left"><font size="2" color="#000000"> </font> <font size="2" color="#000000">
          <input type="text" name="creatdate" value="<%=rs.getString(4)%>">
          </font>&nbsp;</div>
      </td>
    </tr>
  </table>
</form>
</body>
<%}%>
</html>
