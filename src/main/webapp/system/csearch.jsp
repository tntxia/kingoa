<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
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
String coname=request.getParameter("coname").trim();
String coaddr="";
    strSQL = "select count(*) from client where  coname like '%"+ coname+"%' ";
sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
 if(intPage>intPageCount) intPage = intPageCount;
    strSQL = "select top 5 clientid,coname,coaddr,cotypes,username,rg_date from client where  coname like '%"+ coname+"%'  order by rg_date desc";
sqlRst = einfodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>芯片商城有限公司</title>
<style type="text/css">
<!--
.H1 {font-size:12pt; line-height:15pt; align=center}
.ourfont {font-size:9pt; line-height:15pt; }
.ourfont1 {font-size:8pt; line-height:13pt; }
A{text-transform: none; text-decoration:none;color:#0000ff}
a:hover {text-decoration:underline;color:#0000ff}
-->
</style>
</head>
<body bgcolor="#DAF7FE" topmargin="0" marginwidth="0" marginheight="0" >
<TABLE width="100%" height=69 bordercolor="#176B00" cellspacing="0" bordercolordark="#ffffff" cellpadding="3" align="center" bordercolorlight="#176B00" border="1">
  <tr> 
    <td class="ourfont" align="center" bgcolor="#78C1E7"><font color="#000000"   size="2">&nbsp;客户名称</font>&nbsp;</td>
    <td class="ourfont" align="center" bgcolor="#78C1E7"><font color="#000000"   size="2">客户行业</font>&nbsp;</td>
    <td class="ourfont" align="center" bgcolor="#78C1E7"><font color="#000000"   size="2">销售</font>&nbsp;</td>
    <td class="ourfont" align="center" bgcolor="#78C1E7"><font color="#000000"   size="2">登记日期</font>&nbsp;</td>
  </tr>
  <%
    i = 0;
    while(i<intPageSize && sqlRst.next()){ %>
  <tr   style="cursor:hand;" bgcolor="<%if ((i % 2)==0) out.print("#eeeeee");else out.print("#BAE6F9");%>"> 
    <%  String id=sqlRst.getString(1); %>
    <td><div align="center"><font size="2"  ><%=sqlRst.getString("coname")%></font>&nbsp;</div></td>
    <td bgcolor="<%if ((i % 2)==0) out.print("#eeeeee");else out.print("#BAE6F9");%>"><div align="center"><font size="2"  ><%=sqlRst.getString("cotypes")%></font>&nbsp;</div></td>
    <td><div align="center"><font size="2"  ><%=sqlRst.getString("username")%></font>&nbsp;</div></td>
    <td><div align="center"><font size="2"  ><%=sqlRst.getDate("rg_date")%></font>&nbsp;</div></td>
  </tr>
  <% i++; } %>
  <tr> 
    <td colspan=4 align=center height="22"> 
      <div align="right"> <font color="#000000" size="2"  >备注：如果Search结果超过五个，系统只显示最新五个客户名称信息！ 
        </font><font color="#CCCCCC" size="2"  > 
        <%if(intPage>1){%>
        <a href="csearch.jsp?page=<%=intPage-1%>&coaddr=<%=coaddr%>&coname=<%=coname%>" style="font-size: 12px">上一页</a> 
        <%}%>
        <%if(intPage<intPageCount){%>
        <a href="csearch.jsp?page=<%=intPage+1%>&coaddr=<%=coaddr%>&coname=<%=coname%>" style="font-size: 12px">下一页</a> 
        <%}%>
        </font>&nbsp;</div>    </td>
  </tr>
</table>
</body> 
<%sqlRst.close();}%> 
</html> 

