<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../refuse.jsp"
    </script>
<% } else {    
 String getaLoginmessage = (String) session.getValue("adminloginSign");
   if(getaLoginmessage!="admin"){
%>
    <script language=javascript>
    window.location="manageslogin.jsp"
    </script>
<% } else {    
%>
<jsp:useBean id="RegBean2" scope="page" class="infocrmdb.infocrmdb" />
<%
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
java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyyMMdd");
String currentDate=simple.format(new java.util.Date());
if(strPage==null){
intPage = 1;
} else{
intPage = java.lang.Integer.parseInt(strPage);
if(intPage<1) intPage = 1; }
strSQL = "select count(*) from company";

sqlRst = RegBean2.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select id,companyname,companytel,companyfax from company ";
sqlRst = RegBean2.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>

<html>
<head>
<title>公司信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	background-color: #ffffff;
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
<body bgcolor="#ffffff" text="#000000"  topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="">
<br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">    <tr> 
      <td width="288">&nbsp; </td>
      <td colspan="3"> <div align="right"><font color="#000000" size="2"> 
          <input type="button" value="新建" name="B22" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('ncompany.jsp','nw', 'height=400, width=600, top=50, left=10, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
          </font>&nbsp;</div></td>
    </tr>
    <TR BGCOLOR="#d3d8eb"> 
      <td width="288"> <div align="left"><font color="#000000" size="2">公司名称</font>&nbsp;</div></td>
      <td width="182"> <div align="left"><font size="2" color="#000000">公司电话</font>&nbsp;</div></td>
      <td width="178"> <div align="left"><font color="#000000" size="2">公司传真</font>&nbsp;</div></td>
      <td width="131"> <div align="left"><font color="#000000" size="2">操作</font>&nbsp;</div></td>
    </tr>
    <%
     i = 0;
     while(i<intPageSize && sqlRst.next()){ %>
    <tr height="8"onMouseOver="this.bgColor='#B5DAFF'" onMouseOut="this.bgColor='#ffffff'" style="cursor:hand;"> 
      <%int id=sqlRst.getInt(1);%>
      <td width="288" height="10"> <div align="left"><font size="2"><%=sqlRst.getString(2)%> </font>&nbsp;</div></td>
      <td width="182" height="10"> <div align="left"><font size="2"><%=sqlRst.getString(3)%></font>&nbsp;</div></td>
      <td width="178" height="10"> <div align="left"><font size="2"><%=sqlRst.getString(4)%></font>&nbsp;</div></td>
      <td width="131" height="10"> <div align="left"><font color="#000000" size="2"> 
          </font><font color="#000000" size="2"> 
          <input type="button" value="编辑" name="B2232" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('company.jsp?id=<%=id%>','nw', 'height=380, width=600, top=30, left=30, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
          <input type="button" value="删除" name="B223" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('del-com.jsp?id=<%=id%>','nw', 'height=446, width=1002, top=200, left=200, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
          </font>&nbsp;</div></td>
    </tr>
    <% i++; } %>
    <tr> 
      <td colspan=4 align=center height="22"> <div align="right"><font color="#000000"> 
          <font size="2">共<%=intRowCount%>个</font></font> <font color="#C1D9FF" size="2"> 
          <%if(intPage<intPageCount){%>
          <a href="companym.jsp?page=<%=intPage+1%>" style="font-size: 12px">下一页</a> 
          <% 
}

%>
          <%if(intPage>1){%>
          <a href="companym.jsp?page=<%=intPage-1%>" style="font-size: 12px">上一页</a> 
          <% 
}

%>
          </font><font color="#C1D9FF"> </font>&nbsp;</div></td>
    </tr>
  </table>
</form>
</body> 
<%}}%>
</html> 
