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
String proname=request.getParameter("proname");
String id=request.getParameter("id");
String sid=request.getParameter("sid");
String snumber=request.getParameter("snumber");

strSQL = "select count(*) from profll where seccode='"+sid+"'";
sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select cpro,tnumber from profll where seccode='"+sid+"'  order by tnumber asc";
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
<font face="Arial, Helvetica, sans-serif" color="#FF9900"><b><font face="Arial, Helvetica, sans-serif" color="#FF9900"><b><font size="2" color="#666600"> 
- &gt;&gt; &gt; <%=proname%></font></b></font><font size="2" color="#666600"> 
<input type="button" value="小类自定义" name="B223" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('lprofl.jsp?proname=<%=proname%>&sid=<%=sid%>&id=<%=id%>&snumber=<%=snumber%>','npro', 'height=350, width=610, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
<br>
</font></b></font>
<hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>

<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="26">
  <%i = 0;
    while(i<intPageSize && sqlRst.next()){ %>
  <tr height="8"> 
      <%
	  String profl=sqlRst.getString("cpro");
	  String tnumber=sqlRst.getString("tnumber");
	  %>
      
    <td width="100%" height="2"> <p><b>＊</b><font size="2" face="Arial, Helvetica, sans-serif"> 
        <%=tnumber%> <%=profl%> </font></p>
      </td>
    </tr>
    <% i++; } %>
    <tr> 
      <td align=center height="22"> 
        <div align="right"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"> 
          </font> <font color="#C1D9FF" size="2" face="Arial, Helvetica, sans-serif"> 
          <%if(intPage<intPageCount){%>
          <a href="thkind.jsp?page=<%=intPage+1%>&proname=<%=proname%>&sid=<%=sid%>&id=<%=id%>&snumber=<%=snumber%>" style="font-size: 12px">下一页</a> 
          <% 
}

%>
          <%if(intPage>1){%>
          <a href="thkind.jsp?page=<%=intPage-1%>&proname=<%=proname%>&sid=<%=sid%>&id=<%=id%>&snumber=<%=snumber%>" style="font-size: 12px">上一页</a> 
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
