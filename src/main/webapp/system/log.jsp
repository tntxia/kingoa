<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="RegBean2" scope="page" class="infocrmdb.infocrmdb" />
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../refuse.jsp"
    </script>
<% } else {    
java.sql.Connection sqlCon;
java.sql.Statement sqlStmt;
java.sql.ResultSet sqlRst;
java.lang.String strCon;
java.lang.String strSQL;
int intPageSize; 
int intRowCount; 
int intPageCount;
int intPage; 
java.lang.String strPage;
int i,j,k; 
intPageSize = 20;
strPage = request.getParameter("page");
if(strPage==null){
intPage = 1;
} else{
intPage = java.lang.Integer.parseInt(strPage);
if(intPage<1) intPage = 1; }
strSQL = "select count(*) from logdate";
sqlRst = RegBean2.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select id,log_name,log_qxz,log_dept,log_deptjb,log_chost,log_datetime from logdate order by id desc";

sqlRst = RegBean2.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title>芯片商城有限公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
-->
</style></head>
<style type="text/css">
<!--
.H1 {font-size:12pt; line-height:15pt; align=center}
.ourfont {font-size:9pt; line-height:15pt; }
.ourfont1 {font-size:8pt; line-height:13pt; }
A{text-transform: none; text-decoration:none;color:#0000ff}
a:hover {text-decoration:underline;color:#0000ff}
-->
</style>


<body bgcolor="#ffffff" text="#000000" topmargin="0">
<form name="form1" method="post" action="slog.jsp"><br>
<table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td height="8" colspan="6" bgcolor="#FFFFFF"><font size="2">登陆用户 
        <input name="log_name" type="text" id="log_name" size="6">
        权限组 
        <input name="log_qxz" type="text" id="log_qxz" size="6">
        部门名称 
        <input name="log_dept" type="text" id="log_dept" size="6">
        登陆地址 
        <input name="log_chost" type="text" id="log_chost" size="10">
        时间 
        <input name="log_datetime" type="text" id="log_datetime" size="10">
        <input type="submit" name="Submit" value="查询">
        </font>&nbsp;</td>
    </tr>
    <TR BGCOLOR="#d3d8eb"> 
      <td height="8"> 
        <div align="left"><font size="2">登陆用户</font>&nbsp;</div></td>
      <td height="8"> 
        <div align="left"><font size="2">权限组</font>&nbsp;</div></td>
      <td> 
        <div align="left"><font size="2">所在部门</font>&nbsp;</div></td>
      <td> 
        <div align="left"><font size="2">部门编号</font>&nbsp;</div></td>
      <td height="8"> 
        <div align="left"><font size="2">登陆地址</font>&nbsp;</div></td>
      <td height="8"> 
        <div align="left"><font size="2">登陆时间</font>&nbsp;</div></td>
    </tr>
    <%
   i = 0;
   while(i<intPageSize && sqlRst.next()){ %>
    <tr height="8" bgcolor="#d3d8eb"> <%int id=sqlRst.getInt(1);%>
      <td width="257" height="8" bgcolor="#FFFFFF"> <div align="left"><font size="2" color="#0000FF"><%=sqlRst.getString(2)%> </font>&nbsp;</div></td>
      <td width="347" height="8" bgcolor="#FFFFFF"> <div align="left"><font size="2" color="#0000FF"><%=sqlRst.getString(3)%> </font>&nbsp;</div></td>
      <td width="772" bgcolor="#FFFFFF"><div align="left"><font size="2" color="#0000FF"><%=sqlRst.getString(4)%></font>&nbsp;</div></td>
      <td width="275" bgcolor="#FFFFFF"><div align="left"><font size="2" color="#0000FF"><%=sqlRst.getString(5)%></font>&nbsp;</div></td>
      <td width="478" height="8" bgcolor="#FFFFFF"> <div align="left"><font size="2" color="#0000FF"><%=sqlRst.getString(6)%> </font>&nbsp;</div></td>
      <td width="552" height="8" bgcolor="#FFFFFF"> <div align="left"><font size="2" color="#0000FF"><%=sqlRst.getString(7)%> </font>&nbsp;</div></td>
    </tr>
    <% i++; } %>
    <tr> 
      <td colspan=10 align=center height="22"> <div align="right"><font color="#000000" size="2"> 
          </font> <font color="#C1D9FF" size="2"> 
          <%if(intPage<intPageCount){%>
          <a href="log.jsp?page=<%=intPage+1%>" style="font-size: 12px">下一页</a> 
          <% 
       }

      %>
          <%if(intPage>1){%>
          <a href="log.jsp?page=<%=intPage-1%>" style="font-size: 12px">上一页</a> 
          <% 
      }

      %>
          登陆 </font>&nbsp;</div></td>
    </tr>
  </table>
</form>
</body> 
<%}%>
</html> 

