<%@ page contentType="text/html;charset=gb2312" %>
<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
%>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
String seckind=request.getParameter("seckind");
String proname1=request.getParameter("proname");
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
strSQL = "select count(*) from profll where seccode='"+seckind+"'";
sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select cpro from profll where seccode='"+seckind+"'";
sqlRst = einfodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
td,p,select,input,textarea {font-size:12px}
.l15 {line-height:150%}
.l13 {line-height:130%}
.f10 {font-size:10px}
.f14 {font-size:14.9px}
.bdrclr01{color:#000000; border-color:#000000}
.c03{color:#000000;border-color:#000000;}
A:link {text-decoration:none;color:#0000ff;}
A:visited {text-decoration:none;color:#800080;}
A:active {text-decoration:none;color:#0000ff;}
A:hover {text-decoration:underline;color:#0000ff;}
</style>
</head>

<body bgcolor="#ffffff" text="#000000" topmargin="0">
<font face="Arial, Helvetica, sans-serif" size="2"> &gt;&gt;<%=proname1%></font><br>
<hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <%i = 0;
    while(i<intPageSize && sqlRst.next()){ %>
  <tr height="8"> 
    <%String proname=sqlRst.getString("cpro");
	  %>
    <td width="100%" height="2"> 
      <p><b>＊　</b><font size="2" face="Arial, Helvetica, sans-serif"><a href="../../../warehouse/nswarehousem.jsp?proname=<%=proname%>&seckind=<%=seckind%>" target="rbottom" style="font-size: 12px"><%=proname%></a> 
        </font></p>
    </td>
  </tr>
  <% i++; } %>
  <tr> 
    <td align=center height="22"> 
      <div align="right"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"> 
        </font> <font color="#C1D9FF" size="2" face="Arial, Helvetica, sans-serif"> 
        <%if(intPage<intPageCount){%>
        <a href="zthskindf.jsp?page=<%=intPage+1%>&seckind=<%=seckind%>" style="font-size: 12px">下一页</a> 
        <% 
}

%>
        <%if(intPage>1){%>
        <a href="zthskindf.jsp?page=<%=intPage-1%>&seckind=<%=seckind%>" style="font-size: 12px">上一页</a> 
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
