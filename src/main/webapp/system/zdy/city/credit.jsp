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
intPageSize = 20;
strPage = request.getParameter("page");

if(strPage==null){
intPage = 1;
} else{
intPage = java.lang.Integer.parseInt(strPage);
if(intPage<1) intPage = 1; }
 String p=request.getParameter("p");
strSQL = "select count(*) from city  where  province='"+p+"'";
sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select id,province,city_name from  city  where  province='"+p+"'  order by province asc";
sqlRst = einfodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title>城市自定义</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF" text="#000000">
<br>  <table height=8 width="90%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
  <TR BGCOLOR="#d3d8eb"> 
    <td height="30"><font size="2" color="#000000"><%=p%>所属城市列表</font><font color="#000000" size="2"> &gt;&gt;</font> <div align="left"></div></td>
    <td width="121" height="30"> <div align="right"> 
        <input type="button" value="添加" name="B22" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('ncredit.jsp?p=<%=p%>','gnw', 'height=200, width=550, top=200, left=200, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
      </div></td>
  </tr>
  <%
   i = 0;
   while(i<intPageSize && sqlRst.next()){ int id=sqlRst.getInt(1);%>
  <tr height="8"> 
    <td width="492" height="8" bgcolor="#e8ebf5"><font size="2"><%=sqlRst.getString(3)%></font>&nbsp;</td>
    <td width="121" height="8"> <div align="center"><a href="editncredit.jsp?id=<%=id%>" style="font-size: 12px"><font size="2">编辑</font></a> 
        <font size="2"><a href="del-credit.jsp?id=<%=id%>&p=<%=p%>" style="font-size: 12px">删除</a> 
        </font>&nbsp;</div></td>
  </tr>
  <% i++; } %>
  <tr> 
    <td colspan=3 align=center height="16"> <div align="right"><font color="#000000" size="2"> 
        </font> <font color="#C1D9FF" size="2"> 
        <%if(intPage<intPageCount){%>
        <a href="credit.jsp?page=<%=intPage+1%>&p=<%=p%>" style="font-size: 12px">下一页</a> 
        <% 
}

%>
        <%if(intPage>1){%>
        <a href="credit.jsp?page=<%=intPage-1%>&p=<%=p%>" style="font-size: 12px">上一页</a> 
        <% 
}

%>
        </font>&nbsp;</div></td>
  </tr>
</table>
</body>
</html>
 
