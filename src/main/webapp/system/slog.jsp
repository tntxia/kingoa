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
intPageSize = 100;
strPage = request.getParameter("page");
if(strPage==null){
intPage = 1;
} else{
intPage = java.lang.Integer.parseInt(strPage);
if(intPage<1) intPage = 1; }
String  log_name = request.getParameter("log_name");
String  log_qxz = request.getParameter("log_qxz");
String  log_dept = request.getParameter("log_dept");
String  log_chost = request.getParameter("log_chost");
String  log_datetime= request.getParameter("log_datetime");
strSQL = "select count(*) from logdate  where   log_name like '%"+ log_name+"%'   and log_qxz like '%"+ log_qxz+"%'  and log_dept like '%"+ log_dept+"%' and log_chost like '%"+ log_chost+"%'  and  log_datetime like '%"+ log_datetime+"%' ";
sqlRst = RegBean2.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select id,log_name,log_qxz,log_dept,log_deptjb,log_chost,log_datetime from logdate  where   log_name like '%"+ log_name+"%'   and log_qxz like '%"+ log_qxz+"%'  and log_dept like '%"+ log_dept+"%' and log_chost like '%"+ log_chost+"%'  and  log_datetime like '%"+ log_datetime+"%' order by id desc";
sqlRst = RegBean2.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title>芯片商城有限公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #000000}
-->
</style>
</head>
<style type="text/css">
<!--
.H1 {font-size:12pt; line-height:15pt; align=center}
.ourfont {font-size:9pt; line-height:15pt; }
.ourfont1 {font-size:8pt; line-height:13pt; }
A{text-transform: none; text-decoration:none;color:#0000ff}
a:hover {text-decoration:underline;color:#0000ff}
-->
</style>


<body bgcolor="#ffffff" text="#000000" topmargin="0"><BR>
<table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
  <tr height="8" bgcolor="#d3d8eb"> 
    <td width="78" height="8"> 
      <div align="left" class="STYLE1"><font size="2">登陆用户</font>&nbsp;</div></td>
    <td width="81" height="8"> 
      <div align="left" class="STYLE1"><font size="2">权限组</font>&nbsp;</div></td>
    <td width="212"> 
      <div align="left" class="STYLE1"><font size="2">所在部门</font>&nbsp;</div></td>
    <td width="72"> 
      <div align="left" class="STYLE1"><font size="2">部门编号</font>&nbsp;</div></td>
    <td width="129" height="8"> 
      <div align="left" class="STYLE1"><font size="2">登陆地址</font>&nbsp;</div></td>
    <td width="149" height="8"> 
      <div align="left" class="STYLE1"><font size="2">登陆时间</font>&nbsp;</div></td>
  </tr>
  <%
   i = 0;
   while(i<intPageSize && sqlRst.next()){ %>
  <tr height="8" bgcolor="#d3d8eb"> <%int id=sqlRst.getInt(1);%>
    <td width="78" height="8" bgcolor="#FFFFFF"> <div align="left"><font size="2" color="#0000FF"><%=sqlRst.getString(2)%> </font>&nbsp;</div></td>
    <td width="81" height="8" bgcolor="#FFFFFF"> <div align="left"><font size="2" color="#0000FF"><%=sqlRst.getString(3)%> </font>&nbsp;</div></td>
    <td width="212" bgcolor="#FFFFFF"><div align="left"><font size="2" color="#0000FF"><%=sqlRst.getString(4)%></font>&nbsp;</div></td>
    <td width="72" bgcolor="#FFFFFF"><div align="left"><font size="2" color="#0000FF"><%=sqlRst.getString(5)%></font>&nbsp;</div></td>
    <td width="129" height="8" bgcolor="#FFFFFF"> <div align="left"><font size="2" color="#0000FF"><%=sqlRst.getString(6)%> </font>&nbsp;</div></td>
    <td width="149" height="8" bgcolor="#FFFFFF"> <div align="left"><font size="2" color="#0000FF"><%=sqlRst.getString(7)%> </font>&nbsp;</div></td>
  </tr>
  <% i++; } %>
  <tr> 
    <td colspan=10 align=center height="22"> <div align="right"><font color="#000000" size="2"> 
        </font> <font color="#C1D9FF" size="2"> 
        <%if(intPage<intPageCount){%>
        <a href="slog.jsp?page=<%=intPage+1%>&log_name=<%=log_name%>&log_qxz=<%=log_qxz%>&log_dept=<%=log_dept%>&log_chost=<%=log_chost%>&log_datetime=<%=log_datetime%>" style="font-size: 12px">下一页</a> 
        <% } %>
        <%if(intPage>1){%>
        <a href="slog.jsp?page=<%=intPage-1%>&log_name=<%=log_name%>&log_qxz=<%=log_qxz%>&log_dept=<%=log_dept%>&log_chost=<%=log_chost%>&log_datetime=<%=log_datetime%>" style="font-size: 12px">上一页</a> 
        <% }%>
        </font>&nbsp;</div></td>
  </tr>
</table>
</body> 
<%}%>
</html> 

