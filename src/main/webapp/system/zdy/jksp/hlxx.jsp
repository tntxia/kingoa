<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
 String getaLoginmessage = (String) session.getValue("adminloginSign");
   if(getaLoginmessage!="admin"){
%>
    <script language=javascript>
    window.location="../../manageslogin.jsp"
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
strSQL = "select count(*) from jksp";
sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select * from jksp";
sqlRst = einfodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title>EinfoCRM</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
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
<form name="form1" method="post" action=""> <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1"><tr> <td height="33" colspan="5"><font color="#000000" size="2">借款审批流程 &gt;&gt; 
</font>&nbsp;</td><td colspan="4" height="33"> <div align="right"><font color="#000000" size="2"> 
<input type="button" value="添加审批流程" name="B22" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('nhlxx.jsp','adminw', 'height=345, width=920, top=200, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')"> 
</font>&nbsp;</div></td></tr> <tr height="8" bgcolor="#d3d8eb"> <td width="127" height="8"> 
<font color="#000000" size="2">借款</font><font color="#000000"><font size="2">部门</font></font>&nbsp;</td>
<TD WIDTH="80" HEIGHT="8"> 
<DIV ALIGN="left"><font color="#000000"><FONT SIZE="2">职位</FONT></font>&nbsp;</div></TD><TD WIDTH="123" HEIGHT="8"> 
<DIV ALIGN="left"><font color="#000000"><FONT SIZE="2">最少金额</FONT></font>&nbsp;</div></TD><TD WIDTH="117" HEIGHT="8"> 
<DIV ALIGN="left"><font color="#000000"><FONT SIZE="2">最多金额</FONT></font>&nbsp;</div></TD><TD WIDTH="114" HEIGHT="8"> 
<DIV ALIGN="left"><font color="#000000"><FONT SIZE="2">第一审批人</FONT></font>&nbsp;</div></TD><td width="78" height="8"> 
<div align="left"><font color="#000000"><font size="2">是否二审</font></font>&nbsp;</div></td><td width="94" height="8"> 
<div align="left"><font color="#000000"><font size="2">第二审批人</font></font>&nbsp;</div></td><td width="137" height="8"> 
<font size="2" color="#000000">添加</font><font size="2" color="#000000">日期</font>&nbsp;</td>
<td width="129" height="8"> 
<div align="left"><font color="#000000"><font size="2">操作</font></font>&nbsp;</div></td></tr> 
<%i = 0;
   while(i<intPageSize && sqlRst.next()){ int id=sqlRst.getInt(1);%> <tr height="8"onMouseOver="this.bgColor='#B5DAFF'" onMouseOut="this.bgColor='#ffffff'" style="cursor:hand;"> 
<td width="127" height="6"> <div align="left"><font size="2"><%=sqlRst.getString(2)%></font>&nbsp;</div></td><TD WIDTH="80" HEIGHT="6"> 
<DIV ALIGN="left"><FONT SIZE="2"><%=sqlRst.getString(3)%></font>&nbsp;</div></TD><TD WIDTH="123" HEIGHT="6"> 
<DIV ALIGN="left"><FONT SIZE="2"><%=sqlRst.getString(4)%></font>&nbsp;</div></TD><TD WIDTH="117" HEIGHT="6"> 
<DIV ALIGN="left"><FONT SIZE="2"><%=sqlRst.getString(5)%></font>&nbsp;</div></TD><TD WIDTH="114" HEIGHT="6"> 
<DIV ALIGN="left"><FONT SIZE="2"><%=sqlRst.getString(6)%></font>&nbsp;</div></TD><td width="78" height="6"> 
<div align="left"><font size="2"><%=sqlRst.getString(7)%></font>&nbsp;</div></td><td width="94" height="6"> 
<div align="left"><font size="2"><%=sqlRst.getString(8)%></font>&nbsp;</div></td><td width="137" height="6"><font size="2"><%=sqlRst.getDate("dd_date")%></font>&nbsp;</td><td width="129" height="6"> 
<div align="center"><font color="#000000" size="2"> <input type="button" value="编辑" name="B222" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('edit-hl.jsp?id=<%=id%>','adminw', 'height=345, width=920, top=200, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')"> 
</font><font color="#000000" size="2"> <input type="button" value="删除" name="B223" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('del-hl.jsp?id=<%=id%>','adminw', 'height=446, width=1002, top=200, left=200, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')"> 
</font>&nbsp;</div></td></tr> <% i++; } %> <tr> <td colspan=13 align=center height="22"> 
<div align="right"><font color="#000000" size="2"> </font> <font color="#C1D9FF" size="2"> 
<%if(intPage<intPageCount){%> <a href="hlxx.jsp?page=<%=intPage+1%>" style="font-size: 12px">下一页</a> <% 
       }

      %> <%if(intPage>1){%> <a href="hlxx.jsp?page=<%=intPage-1%>" style="font-size: 12px">上一页</a> <% 
      }

      %> </font>&nbsp;</div></td></tr> </table></form>
</body> <%}}%>
 
</html> 

