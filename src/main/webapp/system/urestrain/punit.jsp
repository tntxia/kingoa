<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../refuse.jsp"
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
intPageSize = 50;
strPage = request.getParameter("page");

if(strPage==null){
intPage = 1;
} else{
intPage = java.lang.Integer.parseInt(strPage);
if(intPage<1) intPage = 1; }
strSQL = "select count(*) from restrain";
sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select * from restrain_name order by r_name desc";
sqlRst = einfodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title>用户权限组自定义</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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

<body bgcolor="#ffffff" text="#000000" bgcolor="#C1D9FF">
<br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1"><tr> 
    <td height="2" colspan="3"><font color="#000000" size="2">系统权限组自定义 &gt;&gt;<a href="npunit.jsp" style="font-size: 12px">增加</a></font> 
      <a href="npunit.jsp" style="font-size: 12px"><font size="2"><font color="#0000ff" size="2"> </font></font></a></td>
  </tr>
  <tr height="8"> 
    <td width="16%" bgcolor="#e8ebf5"><font size="2" color="#000000">&nbsp;</font>&nbsp;</td>
    <td width="15%" bgcolor="#e8ebf5"><font size="2" color="#000000">姓名</font>&nbsp;</td>
    <td width="69%" bgcolor="#e8ebf5"> 
      <div align="left"><font size="2" color="#000000">所查看部门</font>&nbsp;</div>
    </td>
  </tr>
  <%
   i = 0;
   while(i<intPageSize && sqlRst.next()){int id=sqlRst.getInt(1); %>
  <tr height="8">
    <td width="16%"> 
      <input type="button" value="查阅" name="B222" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('editnpunit.jsp?id=<%=id%>','_self', 'height=598, width=1005, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
      <input type="button" value="删除" name="B222" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('del-punit.jsp?id=<%=id%>','_self', 'height=598, width=1005, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
    <td width="15%" height="8"><font size="2"><b><%=sqlRst.getString("r_name")%></b></font>&nbsp;</td>
    <td width="69%" height="8"> 
      <div align="left"><font size="2"><%=sqlRst.getString("dept")%></font>&nbsp;</div>
    </td>
  </tr>
  <% i++; }sqlRst.close(); %>
  <tr> 
    <td colspan=4 align=center height="2"> 
      <div align="right"><font color="#000000" size="2"> </font> <font color="#C1D9FF" size="2"> 
        <%if(intPage<intPageCount){%>
        <a href="punit.jsp?page=<%=intPage+1%>" style="font-size: 12px">下一页</a> 
        <% 
        }
        %>
        <%if(intPage>1){%>
        <a href="punit.jsp?page=<%=intPage-1%>" style="font-size: 12px">上一页</a> 
        <% 
        }
        %>
        </font>&nbsp;</div>
    </td>
  </tr>
</table>
</body>
<%}%>
</html>
 
