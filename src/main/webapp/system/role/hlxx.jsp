<%@ page contentType="text/html;charset=gb2312"%>
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
strSQL = "select count(*) from role";
sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select id,role_name,role_date from role";
sqlRst = einfodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title>芯片商城有限公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	background-color: #F3F3F3;
}
-->
</style></head>
<style type="text/css">
td,p,select,input,textarea {font-size:12px}
.l15 {line-height:150%}
.l13 {line-height:130%}
.f10 {font-size:10px}
.f14 {font-size:14.9px}
.bdrclr01{color:#000000; border-color:#000000}
.c03{color:#000000;border-color:#000000;}                       A:link {text-decoration:none;color:#0000ff;}
A:visited {text-decoration:none;color:#800080;}
A:active {text-decoration:none;color:#0000ff;}
A:hover {text-decoration:underline;color:#0000ff;}
</style>
<body topmargin="0" text="#000000" marginwidth="0" marginheight="0">
<form name="form1" method="post" action=""><br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <tr> 
      <td height="6"><font color="#000000" size="2">职位管理 &gt;&gt; </font>&nbsp;</td>
      <td colspan="2" height="6"> <div align="right"><font color="#000000" size="2"> 
          <input type="button" value="新建" name="B22" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('nhlxx.jsp','nw', 'height=446, width=1002, top=200, left=200, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
          </font>&nbsp;</div></td>
    </tr>
    <tr height="8" bgcolor="#d3d8eb"> <td width="285" height="8"> <div align="left"><font color="#000000"><font size="2">职位名称</font></font>&nbsp;</div></td>
      <td width="202" height="8"> <div align="left"><font size="2">日期</font>&nbsp;</div></td>
      <td width="202" height="8"> <div align="left"><font color="#000000"><font size="2">操作</font></font>&nbsp;</div></td>
    </tr>
    <%i = 0;
   while(i<intPageSize && sqlRst.next()){ %>
    <tr height="8"onMouseOver="this.bgColor='#B5DAFF'" onMouseOut="this.bgColor='#ffffff'" style="cursor:hand;"> 
      <%int id=sqlRst.getInt(1);%>
      <td width="285" height="6"> <div align="left"><font size="2"><%String role_name=sqlRst.getString(2);%><%=role_name%></font>&nbsp;</div></td>
      <td width="202" height="6"><font size="2"><%=sqlRst.getDate("role_date")%></font>&nbsp;</td>
      <td width="202" height="6"> <div align="center"><font color="#000000" size="2"> 
          <input type="button" value="编辑" name="B222" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('edit-hl.jsp?id=<%=id%>&role_name=<%=role_name%>','nw', 'height=446, width=1002, top=200, left=200, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
          </font><font color="#000000" size="2"> 
          <input type="button" value="删除" name="B222" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('del-hl.jsp?id=<%=id%>','nw', 'height=446, width=1002, top=200, left=200, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
          </font>&nbsp;</div></td>
    </tr>
    <% i++; } %>
    <tr> 
      <td colspan=7 align=center height="22"> <div align="right"><font color="#000000" size="2"> 
          </font> <font color="#C1D9FF" size="2"> 
          <%if(intPage<intPageCount){%>
          <a href="hlxx.jsp?page=<%=intPage+1%>" style="font-size: 12px">下一页</a> 
          <% 
       }

      %>
          <%if(intPage>1){%>
          <a href="hlxx.jsp?page=<%=intPage-1%>" style="font-size: 12px">上一页</a> 
          <% 
      }

      %>
          </font>&nbsp;</div></td>
    </tr>
  </table>
</form>
</body> 
<%}%>
</html> 

