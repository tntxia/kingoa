<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />


<% String getLoginmessage = (String) session.getValue("loginSign");


   if(getLoginmessage!="OK"){%>
<script language=javascript>
    window.location="../../refuse.jsp"
    </script>
<% }



java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String currentDate=simple.format(new java.util.Date());
java.text.SimpleDateFormat simpled=new java.text.SimpleDateFormat("yyyy-MM");
String cd=simpled.format(new java.util.Date()); NumberFormat nf=NumberFormat.getNumberInstance(); 
  nf.setMaximumFractionDigits(4); 
 nf.setMinimumFractionDigits(4); 
 
 
 
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
String username = (String) session.getValue("username");
String dept = (String) session.getValue("dept");
String username1 = (String) session.getValue("username");
String restrain_name = (String) session.getValue("restrain_name");
String deptjb = (String) session.getValue("deptjb");




 String modsql = "select * from restrain where restrain_name='" + restrain_name + "'";
 
 
 
 ResultSet rsmod = einfodb.executeQuery(modsql);
  if(rsmod.next()) { 
 String zjadd=rsmod.getString("zjadd").trim();
 String zjview=rsmod.getString("zjview").trim();
 
 
 
 
 
 
 if(zjview.equals("有")){
 
 
strSQL = "select count(*) from bank where deptjb like '"+deptjb+"%' and hiddens='null'";


}else


strSQL = "select count(*) from bank  where dept='"+dept+"' and hiddens='null'";


sqlRst = einfodb.executeQuery(strSQL);



sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;




 if(zjview.equals("有")){
strSQL = "select id,com_bank,bank,bank_num,dept,bank_je,bank_hb from bank where deptjb like '"+deptjb+"%' and hiddens='null' order by bank,com_bank";
}
else
strSQL = "select id,com_bank,bank,bank_num,dept,bank_je,bank_hb from bank where dept='"+dept+"' and hiddens='null' order by bank,com_bank";




sqlRst = einfodb.executeQuery(strSQL);






i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title>资金</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #000000;
}
-->
</style>
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
<body topmargin="0" text="#000000" marginwidth="0" marginheight="0"><br>
<form name="form1" method="post" action="scwhlxx.jsp">
  <FONT SIZE="2">银行名称 
  <INPUT TYPE="text" NAME="bank_name" SIZE="10">银行帐号<INPUT TYPE="text" NAME="bank_num" SIZE="10">起始时间<INPUT TYPE="text" NAME="sdate" SIZE="10" VALUE="<%=cd%>-01">结束时间<INPUT TYPE="text" NAME="edate" SIZE="10" VALUE="<%=currentDate%>"></FONT><INPUT TYPE="submit" NAME="Submit" VALUE="统计"><BR><br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1"><tr height="8" bgcolor="#d3d8eb"> 
      <td width="25" height="8"><span class="STYLE1"><FONT SIZE="2">#</FONT></span></td>
      <td width="293" height="8" bgcolor="#d3d8eb"> 
        <div align="center" class="STYLE1">
          <div align="center"><FONT SIZE="2">开户名称</font>&nbsp;</div>
      </div>      </td>
      <td width="310" height="8"> 
        <div align="center" class="STYLE1">
          <div align="center"><FONT SIZE="2">开户银行</font>&nbsp;</div>
      </div>      </td>
      <td width="265" height="8"> 
        <div align="center" class="STYLE1">
          <div align="center"><FONT SIZE="2">银行帐号</font>&nbsp;</div>
      </div>      </td>
      <td width="130" height="8"> 
        <div align="center" class="STYLE1">
          <div align="center"><font size="2">所属部门</font>&nbsp;</div>
      </div>      </td>
      <td width="127" height="8"> 
      <div align="center" class="STYLE1"><FONT SIZE="2">余额</font>&nbsp;</div>      </td>
    </tr>
    <%i = 0;
   while(i<intPageSize && sqlRst.next()){ int id=sqlRst.getInt(1);%>
    <tr height="8" onClick="window.open('view-hl.jsp?id=<%=id%>','rtop', 'height=432, width=955, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=no,location=no, status=no')" onMouseOver="this.bgColor='#B5DAFF'" onMouseOut="this.bgColor='#ffffff'" style="cursor:hand;"> 
      <td width="25" height="6"><FONT SIZE="2"><%=i+1%></font>&nbsp;</td>
      <td width="293" height="6"> 
      <div align="left"><FONT SIZE="2"><%=sqlRst.getString(2)%></font>&nbsp;</div>      </td>
      <td width="310" height="6"> 
        <div align="left"><FONT SIZE="2"> 
          <%String bank_name=sqlRst.getString(3);%>
      <%=bank_name%></font>&nbsp;</div>      </td>
      <td width="265" height="6"> 
        <div align="left"><FONT SIZE="2"> 
          <%String bank_num=sqlRst.getString(4);%>
          <%=bank_num%></font></div>
        <FONT SIZE="2">
		
		
		
		
        <%
java.sql.ResultSet sqlRstp;
double zje=0.00;
String strSQLpay="select l_sqje from credit_debit where g_bank='"+bank_name+"' and g_banknum='"+bank_num+"'  and  l_c_d='贷方'";
sqlRstp = einfodb.executeQuery(strSQLpay);




while(sqlRstp.next())
{
 double g_je1=0.00;
 String g_je=sqlRstp.getString("l_sqje");
 if(g_je!=null)
 g_je1=Double.parseDouble(g_je);
 zje+=g_je1;
}
sqlRstp.close();
java.sql.ResultSet sqlRstg;
double zjeg=0.00;
String strSQLg="select l_sqje from credit_debit where g_bank='"+bank_name+"' and g_banknum='"+bank_num+"'   and  l_c_d='借方'";
sqlRstg = einfodb.executeQuery(strSQLg);
while(sqlRstg.next())
{
  double g_jeg1=0.00;
 String g_jeg=sqlRstg.getString("l_sqje");
 if(g_jeg!=null)
 g_jeg1=Double.parseDouble(g_jeg);
 zjeg+=g_jeg1;
}
sqlRstg.close();
 double g_jew1=0.00;
 String g_jew=sqlRst.getString("bank_je");
 if(g_jew!=null)
 g_jew1=Double.parseDouble(g_jew);
 double tje=g_jew1+zje-zjeg;
%>
      </font>&nbsp;</td>
      <td width="130" height="6"><%=sqlRst.getString("dept")%></td>
      <td width="127" height="6"> 
      <div align="right"><FONT SIZE="2"><%=nf.format(tje)%><%=sqlRst.getString("bank_hb")%></font></div>      </td>
    </tr>
    <% i++; } %>
    <tr> 
      <td colspan=10 align=center height="22"> 
        <div align="right"> <FONT COLOR="#C1D9FF" SIZE="2"> 
          <%if(intPage>1){%>
          <a href="cwhlxx.jsp?page=<%=intPage-1%>" style="font-size: 12px">上一页</a> 
          <%}%>
          <%if(intPage<intPageCount){%>
          <a href="cwhlxx.jsp?page=<%=intPage+1%>" style="font-size: 12px">下一页</a> 
          <% } %>
          </font>&nbsp;</div>      </td>
    </tr>
  </table>
</form>
</body> 
</html> 
<% 
 rsmod.close();
 sqlRst.close();
 einfodb.closeStmt();
 einfodb.closeConn();
 }
 %>

