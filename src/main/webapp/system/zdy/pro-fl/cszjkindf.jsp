<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
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
intPageSize = 25;
strPage = request.getParameter("page");

if(strPage==null){
intPage = 1;
} else{
intPage = java.lang.Integer.parseInt(strPage);
if(intPage<1) intPage = 1; }
String dept = (String) session.getValue("dept");
String username = (String) session.getValue("username");
String restrain_name = (String) session.getValue("restrain_name");
String deptjb = (String) session.getValue("deptjb");
  String  strSQLhc = "select * from restrain_gp where restrain_name='"+restrain_name+"'";
 java.sql.ResultSet sqlRsthc = einfodb.executeQuery(strSQLhc);
 int tmpigpc=0;
 String pro_ckc="";
 String pro_ztc="";
 String gp_gpc="";
 while(sqlRsthc.next()){ 
 pro_ckc=sqlRsthc.getString("pro_ck").trim();
 pro_ztc=sqlRsthc.getString("pro_zt").trim();
 String proadd1=sqlRsthc.getString("pro_add").trim();
 if(pro_ztc.equals("有")){
 gp_gpc=gp_gpc+" or cpro='"+pro_ckc +"'";
 }
 tmpigpc++;}
 sqlRsthc.close();
strSQL = "select count(*) from profl  where  cpro='' "+gp_gpc+"";
sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select  id,cpro,number from profl where  cpro='' "+gp_gpc+" order by number asc";
System.out.println(strSQL);

sqlRst = einfodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>

<html>
<head>
<title>仓库</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
#bk {
	border: 1px solid #909ECD;
	padding: 5px;
	width: 100%;
}
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
<script type="text/javascript" src="../../../js/jquery.js"></script>
<script type="text/javascript">

function warehousepd(addr){
	$("#pdForm").attr("action","warepd.jsp");
	$("#pdForm input[name=pro_addr]").val(addr);
	$("#pdForm").submit();
}

function view_warehousepd_normal(addr){
	$("#pdForm").attr("action","viewPdResult.dispatch");
	$("#pdForm input[name=pro_addr]").val(addr);
	$("#pdForm input[name=status]").val(1);
	$("#pdForm").submit();
}

function view_warehousepd_exception(addr){
	$("#pdForm").attr("action","viewPdResult.dispatch");
	$("#pdForm input[name=pro_addr]").val(addr);
	$("#pdForm input[name=status]").val(2);
	$("#pdForm").submit();
}

</script>
</head>

<body bgcolor="#ffffff" text="#000000" topmargin="0"><br>

<form action="warepd.jsp" id="pdForm" method="post">
	<input type="hidden" name="pro_addr" value="">
	<input type="hidden" name="status" value="">
</form>

<form name="form1" method="post" action=""> <font size="2"><font size="2" color="#666600"> 
</font></font> <div id="bk"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center"> 
<%i = 0;
    while(i<intPageSize && sqlRst.next()){ %> 
    
    <tr height="8"> <%
	  int id=sqlRst.getInt("id");
	  String proname=sqlRst.getString("cpro");
	  String firnumber=sqlRst.getString("number");
	  %> 
      <td width="100%" height="2"> 
        <p><b>·</b><font size="2" face="Arial, Helvetica, sans-serif"><a href="../../../warehouse/cnwarehousem.jsp?proname=<%=proname%>&seckind=1&profl=1&tnumber=1" target="rbottom" style="font-size: 12px"><%=firnumber%></a> 
          <a href="../../../warehouse/cnwarehousem.jsp?proname=<%=proname%>&seckind='1'&profl=''&tnumber='1'" target="rbottom" style="font-size: 12px"><%=proname%></a> 
          <a href="javascript:warehousepd('<%=proname%>')" style="font-size: 12px">·库存盘点</a> 
          <a href="javascript:view_warehousepd_normal('<%=proname%>')" style="font-size: 12px">·查看盘点结果(正常)</a> 
          <a href="javascript:view_warehousepd_exception('<%=proname%>')" style="font-size: 12px">·查看盘点结果(异常)</a> 
        	
        </font>
          
          
        </p>
      </td>
     </tr> 
      
      <% i++; 
     
    } %> <tr> <td align=center height="22"> 
        <div align="left"><a href="pl_pro.jsp" style="font-size: 12px"><font size="2">·</font><font size="2">批量自动增加产品</font></a>　</div>
      </td></tr> <tr> <td align=center height="22"> <div align="right"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"> 
</font> <font color="#C1D9FF" size="2" face="Arial, Helvetica, sans-serif"> 
<%if(intPage>1){%> 
<a href="cszjkindf.jsp?page=<%=intPage-1%>" style="font-size: 12px">上一页</a> 
<% }%> 
<%if(intPage<intPageCount){%> 
<a href="cszjkindf.jsp?page=<%=intPage+1%>" style="font-size: 12px">下一页</a> 
<% }%> 
</font>&nbsp;</div></td></tr> 
</table></div></form>
</body> 
<%}%>
</html> 
