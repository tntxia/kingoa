<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
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
intPageSize =50;
strPage = request.getParameter("page");

if(strPage==null){
intPage = 1;
} else{
intPage = java.lang.Integer.parseInt(strPage);
if(intPage<1) intPage = 1; }
String cre_name2=request.getParameter("cre_name");
strSQL = "select count(*) from km_f";
sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select * from km_f order by id asc";
sqlRst = einfodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title>科目自定义</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF" text="#000000">
<br>  <table height=8 width="90%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1"> 
<TR BGCOLOR="#d3d8eb"> <td width="525" height="30"> <div align="left"><FONT SIZE="2" COLOR="#000000">费用帐目科目列表</FONT><font color="#000000" size="2"> &gt;&gt;</font>&nbsp;</div></td><td height="30" width="182"> <div align="right"> <input type="button" value="添加" name="B22" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('ncredit.jsp','gnw', 'height=200, width=550, top=200, left=200, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')"> 
</div></td></tr> <%
   i = 0;
   while(i<intPageSize && sqlRst.next()){ %> <tr height="8"> <%int id=sqlRst.getInt(1);%> 
<td height="8" width="525"><font size="2"><%String p=sqlRst.getString(3);out.print(p);%></font>&nbsp;</td><td width="182" height="8"> 
<div align="center"><a href="editncredit.jsp?id=<%=id%>&p=<%=p%>" style="font-size: 12px"><font size="2">编辑</font></a> 
<font size="2"><a href="del-credit.jsp?id=<%=id%>&p=<%=p%>" style="font-size: 12px">删除</a> </font>&nbsp;</div></td></tr> 
<% i++; } %> <tr> <td colspan=3 align=center height="16"> <div align="right"><font color="#000000" size="2"> 
</font> <font color="#C1D9FF" size="2"> <%if(intPage<intPageCount){%> <a href="credit.jsp?page=<%=intPage+1%>" style="font-size: 12px">下一页</a> 
<% 
}

%> <%if(intPage>1){%> <a href="credit.jsp?page=<%=intPage-1%>" style="font-size: 12px">上一页</a> <% 
}

%> </font>&nbsp;</div></td></tr> </table>
</body>
</html>
 
