<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="RegBean2" scope="page" class="infocrmdb.infocrmdb" />
<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
  String username1 = (String) session.getValue("username");
  String strSQLq="delete from quote_pic where pro_man='"+username1+"'";
  RegBean2.executeUpdate(strSQLq);
String proname1=request.getParameter("proname");
String id=request.getParameter("id");
String firnumber=request.getParameter("firnumber");
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
strSQL = "select count(*) from secprofl ";
sqlRst = RegBean2.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select id,snumber,proflname,price_gk,price_jysj,price_min,price_dljg,price_wf from secprofl  order  by  snumber desc";

sqlRst = RegBean2.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title>芯片商城有限公司</title>
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

<body TOPMARGIN="0" text="#000000">
<form name="form1" method="post" action=""> <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1"> <tr height="8" bgcolor="#d3d8eb"> <td width="226" height="8"> <div align="left"><FONT COLOR="#000000"><font size="2">产品类别名称</font></FONT></div></td></tr> 
<%
   i = 0;
   while(i<intPageSize && sqlRst.next()){ 
   int sid=sqlRst.getInt(1);
		  String snumber=sqlRst.getString(2);
		  String proname=sqlRst.getString(3).trim();
   %> <tr height="8" bgcolor="#d3d8eb"> <td width="226" height="8"> <div align="left"><FONT SIZE="2" COLOR="#000000">* 
<A HREF="../../../warehouse/print_pq.jsp?pty=<%=proname%>" style="font-size: 12px"> <%=snumber%>:<%=proname%></A></font>&nbsp;</div></td></tr> <% i++; } %> 
<tr> <td colspan=5 align=center height="22"> <div align="right"><FONT COLOR="#000000" SIZE="2">共<%=intRowCount%>个产品类别 
<%if(intPage<intPageCount){%> <a href="picty.jsp?page=<%=intPage+1%>&id=<%=id%>&proname=<%=proname1%>" style="font-size: 12px">下一页</a> 
<% } %> <%if(intPage>1){%> <a href="picty.jsp?page=<%=intPage-1%>&id=<%=id%>&proname=<%=proname1%>" style="font-size: 12px">上一页</a> 
<% }%> </font>&nbsp;</div></td></tr> </table></form>
</body> 
<%sqlRst.close();}%>
</html> 

