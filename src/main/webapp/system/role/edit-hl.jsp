
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
String sql="select  * from role where id='"+id2+"'";
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
      <td width="34%"><font size="2" color="#000000">职位编辑 &gt;&gt; 
        <input type="hidden" name="id" value="<%=id2%>">
        </font>&nbsp;</td>
      <td width="66%"> 
        <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="保存" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font><font size="2"> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()">
          </font><font size="2" color="#000000"> </font>&nbsp;</div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="34%"><font size="2" color="#0000FF">职位名称:</font>&nbsp;</td>
      <td width="66%"><font size="2" color="#000000"> 
        <%String role_name=rs.getString(2);%>
        <input name="role_name" type="text" id="role_name" value="<%=role_name%>">
        <input name="role" type="hidden" id="role" value="<%=role_name%>">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="34%"><font size="2" color="#0000FF">职位描述:</font>&nbsp;</td>
      <td width="66%"><font size="2" color="#000000"> 
        <textarea name="remark"><%=rs.getString(3)%></textarea>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="34%"><font size="2" color="#0000FF">修改日期:</font>&nbsp;</td>
      <td width="66%"> 
        <div align="left"><font size="2" color="#000000"> </font> <font size="2" color="#000000">
          <input name="role_date" type="text" id="role_date" value="<%=rs.getDate(4)%>">
          </font>&nbsp;</div>
      </td>
    </tr>
  </table>
</form>
</body>
<%}%>
</html>
