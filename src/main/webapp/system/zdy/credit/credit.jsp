<%@ page contentType="text/html;charset=gb2312" %>
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
String cre_name2=request.getParameter("cre_name");
strSQL = "select count(*) from credit_type";
sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select * from credit_type order by id desc";
sqlRst = einfodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000">
<br>  <table height=8 width="90%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
  <TR BGCOLOR="#d3d8eb"> 
    <td height="30" width="765"> 
      <div align="left"><font color="#000000" size="2">信用级别</font><font color="#000000" size="2"> &gt;&gt;</font>&nbsp;</div>
    </td>
    <td height="30" width="132"> 
      <div align="right">
        <input type="button" value="新建" name="B22" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('ncredit.jsp','adminwz', 'height=446, width=1002, top=200, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no')">
      </div>
    </td>
  </tr>
  <%
   i = 0;
   while(i<intPageSize && sqlRst.next()){ %>
  <tr height="8"> 
    <%int id=sqlRst.getInt(1);%>
    <td height="8" width="765"><font size="2"><%=sqlRst.getString(2)%></font>&nbsp;</td>
    <td width="132" height="8"> 
      <div align="center"><a href="editncredit.jsp?id=<%=id%>" style="font-size: 12px"><font size="2">编辑</font></a> 
        <font size="2"><a href="del-credit.jsp?id=<%=id%>" style="font-size: 12px">删除</a> </font>&nbsp;</div>
    </td>
  </tr>
  <% i++; } %>
  <tr> 
    <td colspan=3 align=center height="16"> 
      <div align="right"><font color="#000000" size="2"> </font> <font color="#C1D9FF" size="2"> 
        <%if(intPage<intPageCount){%>
        <a href="credit.jsp?page=<%=intPage+1%>" style="font-size: 12px">下一页</a> 
        <% 
}

%>
        <%if(intPage>1){%>
        <a href="credit.jsp?page=<%=intPage-1%>" style="font-size: 12px">上一页</a> 
        <% 
}

%>
        </font>&nbsp;</div>
    </td>
  </tr>
</table>
</body>
<%}}%>
</html>
 
