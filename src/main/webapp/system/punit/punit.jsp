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
intPageSize = 20;
strPage = request.getParameter("page");
if(strPage==null){
intPage = 1;
} else{
intPage = java.lang.Integer.parseInt(strPage);
if(intPage<1) intPage = 1; }
String punit_name2=request.getParameter("punit_name");
strSQL = "select count(*) from punit_type";
sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select * from punit_type order by id desc";
sqlRst = einfodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title></title>
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
<body topmargin="0" text="#000000" marginwidth="0" marginheight="0">
<br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">  
  <tr> 
    <td width="24%" height="14" bgcolor="#d3d8eb"><font color="#000000" size="2">单位自定义 &gt;&gt;</font>&nbsp;</td>
    <td height="14" colspan="2" bgcolor="#d3d8eb"> 
    <div align="right"> 
          <input type="button" value="新建" name="B22" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('npunit.jsp','adminwd', 'height=446, width=1002, top=200, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no')">
      </div>
    </td>
  </tr>
  <%
   i = 0;
   while(i<intPageSize && sqlRst.next()){ %>
  <tr height="8"onMouseOver="this.bgColor='#B5DAFF'" onMouseOut="this.bgColor='#ffffff'" style="cursor:hand;"> 
    <%int id=sqlRst.getInt(1);%>
    <td colspan="2" height="8"> 
      <div align="left"><font size="2"> </font></div>
      <font size="2"><%=sqlRst.getString(2)%></font>&nbsp;</td>
    <td height="8" width="29%"> 
      <div align="center">
        <input type="button" value="编辑" name="B222" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('editnpunit.jsp?id=<%=id%>','_self', 'height=450, width=930, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
        <input type="button" value="删除" name="B222" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('del-punit.jsp?id=<%=id%>','_self', 'height=450, width=930, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
      </div>
    </td>
  </tr>
  <% i++; } %>
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
 
