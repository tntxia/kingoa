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
java.text.SimpleDateFormat simpled=new java.text.SimpleDateFormat("yyyy-MM-dd");
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
double ztotle=0.0;
strPage = request.getParameter("page");
if(strPage==null){
intPage = 1;
} else{
intPage = java.lang.Integer.parseInt(strPage);
if(intPage<1) intPage = 1; }
 String bank_name=request.getParameter("bank_name").trim();
String sdate=request.getParameter("sdate").trim();
String edate=request.getParameter("edate").trim();
String bank_num=request.getParameter("bank_num").trim();
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
strSQL = "select count(*) from bank  where bank like '%"+ bank_name+"%' and bank_num like '%"+ bank_num+"%' and deptjb like '"+deptjb+"%'";
}else
strSQL = "select count(*) from bank  where bank like '%"+ bank_name+"%' and bank_num like '%"+ bank_num+"%' and dept='"+dept+"'";
sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
 if(zjview.equals("有")){
strSQL = "select * from bank  where bank like '%"+ bank_name+"%' and bank_num like '%"+ bank_num+"%' and deptjb like '"+deptjb+"%'";
}else
strSQL = "select * from bank  where bank like '%"+ bank_name+"%' and bank_num like '%"+ bank_num+"%' and dept='"+dept+"'";
sqlRst = einfodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title>资金</title>
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
<body topmargin="0" text="#000000" bgcolor="#FFFFFF" marginwidth="0" marginheight="0">
<form name="form1" method="post" action=""><br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1"><tr height="8" bgcolor="#d3d8eb"> <td width="18" height="8" nowrap><FONT COLOR="#000080" SIZE="2">#</font>&nbsp;</td><td width="145" height="8" nowrap> 
<div align="center"><FONT COLOR="#000080" SIZE="2">开户名称</font>&nbsp;</div></td><td width="173" height="8" nowrap> 
<div align="center"><FONT COLOR="#000080" SIZE="2">开户银行</font>&nbsp;</div></td><td width="122" height="8" nowrap> 
<div align="center"><FONT COLOR="#000080" SIZE="2">银行帐号</font>&nbsp;</div></td><td width="92" height="8" nowrap><FONT COLOR="#000080" SIZE="2">上期余额</font>&nbsp;</td><td width="108" height="8" nowrap><FONT COLOR="#000080" SIZE="2">本期借方金额</font>&nbsp;</td><td width="104" height="8" nowrap><FONT COLOR="#000080" SIZE="2">本期贷方金额</font>&nbsp;</td><TD WIDTH="96" HEIGHT="8" nowrap> 
<DIV ALIGN="center"><FONT SIZE="2" COLOR="#000080">本期余额</font>&nbsp;</div></TD><td width="105" height="8" nowrap> 
<div align="center"><FONT SIZE="2" COLOR="#000080">折本币金额</font>&nbsp;</div></td></tr> 
<%i = 0;
   while(i<intPageSize && sqlRst.next()){ int id=sqlRst.getInt(1);%> <tr height="8" onClick="window.open('sview-hl.jsp?id=<%=id%>&sdate=<%=sdate%>&edate=<%=edate%>','rtop', 'height=432, width=955, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')" onMouseOver="this.bgColor='#B5DAFF'" onMouseOut="this.bgColor='#ffffff'" style="cursor:hand;"> 
<td width="18" height="6" nowrap><FONT SIZE="2"><%=i+1%></font>&nbsp;</td><td width="145" height="6" nowrap> 
<div align="left"><FONT SIZE="2"><%=sqlRst.getString(2)%></font>&nbsp;</div></td><td width="173" height="6" nowrap> 
<div align="left"><FONT SIZE="2"> <%String bank_name1=sqlRst.getString(3);%> <%=bank_name1%></font>&nbsp;</div></td><td width="122" height="6" nowrap> 
<div align="left"><FONT SIZE="2"> <%String bank_num1=sqlRst.getString(4);%> <%=bank_num1%></font>&nbsp;</div><FONT SIZE="2"> 
<%
//上期收款
java.sql.ResultSet sqlRstp;
double zje=0.00;
String strSQLpay="select l_sqje from credit_debit where g_bank='"+bank_name1+"' and g_banknum='"+bank_num1+"'  and  sy='client'  and  l_date<'"+sdate+"'";
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

//本期收款
java.sql.ResultSet sqlRstp1;
double zje1=0.00;
String strSQLpay1="select l_sqje from credit_debit where g_bank='"+bank_name1+"' and g_banknum='"+bank_num1+"'  and  sy='client'  and  l_date>='"+sdate+"'  and  l_date<'"+edate+"'";
sqlRstp1 = einfodb.executeQuery(strSQLpay1);
while(sqlRstp1.next())
{
 double g_je1=0.00;
 String g_je=sqlRstp1.getString("l_sqje");
 if(g_je!=null)
 g_je1=Double.parseDouble(g_je);
 zje1+=g_je1;
}
sqlRstp1.close();

//上期付款
java.sql.ResultSet sqlRstg;
double zjeg=0.00;
String strSQLg="select l_sqje from credit_debit where g_bank='"+bank_name1+"' and g_banknum='"+bank_num1+"' and  sy='supplier'  and  l_date<'"+sdate+"'";
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

// 本期付款
java.sql.ResultSet sqlRstg1;
double zjeg1=0.00;
String strSQLg1="select l_sqje from credit_debit where g_bank='"+bank_name1+"' and g_banknum='"+bank_num1+"' and  sy='supplier'  and  l_date>='"+sdate+"'  and  l_date<'"+edate+"'";
sqlRstg1 = einfodb.executeQuery(strSQLg1);
while(sqlRstg1.next())
{
  double g_jeg1=0.00;
 String g_jeg=sqlRstg1.getString("l_sqje");
 if(g_jeg!=null)
 g_jeg1=Double.parseDouble(g_jeg);
 zjeg1+=g_jeg1;
}
sqlRstg1.close();

//起初余额
 double g_jew1=0.00;
 String g_jew=sqlRst.getString("bank_je");
 if(g_jew!=null)
 g_jew1=Double.parseDouble(g_jew);
 double tje=g_jew1+zje-zjeg;  //上期余额
  double  tje_bq=tje+zje1-zjeg1;
 String  bank_hb=sqlRst.getString("bank_hb");
  String sql="select currrate from hltable where currname='"+bank_hb+"'";
 ResultSet rs=einfodb.executeQuery(sql);
 if(!rs.next())
  {
    out.println("not have rate record");
    return;
  }
 double hl=1;
 String tmpddhb=rs.getString("currrate");
 if(tmpddhb!=null)
 hl=Double.parseDouble(tmpddhb);
 double tje_bq_rmb=tje_bq*hl;
 ztotle=ztotle+tje_bq_rmb;
%> </font>&nbsp;</td><td width="92" height="6" nowrap><FONT SIZE="2"><%=nf.format(tje)%><%=bank_hb%></font>&nbsp;</td><td width="108" height="6" nowrap><FONT SIZE="2"><%=nf.format(zjeg1)%><%=bank_hb%></font>&nbsp;</td><td width="104" height="6" nowrap><FONT SIZE="2"><%=nf.format(zje1)%><%=bank_hb%></font>&nbsp;</td><TD WIDTH="96" HEIGHT="6" nowrap><DIV ALIGN="right"><FONT SIZE="2"><%=nf.format(tje_bq)%><%=bank_hb%></font>&nbsp;</div></TD><td width="105" height="6" nowrap><div align="right"><FONT SIZE="2"><%=nf.format(tje_bq_rmb)%></font>&nbsp;</div></td></tr> 
<% i++; } %> <tr> <td colspan=13 align=center height="22"> 
        <div align="right"> <FONT SIZE="2"> 余额总计:<%=nf.format(ztotle)%>RMB</FONT><FONT COLOR="#C1D9FF" SIZE="2"> 
          <%if(intPage>1){%>
          <a href="scwhlxx.jsp?page=<%=intPage-1%>&bank_name=<%=bank_name%>&bank_num=<%=bank_num%>&sdate=<%=sdate%>&edate=<%=edate%>" style="font-size: 12px">上一页</a> 
          <%}%>
          <%if(intPage<intPageCount){%>
          <a href="scwhlxx.jsp?page=<%=intPage+1%>&bank_name=<%=bank_name%>&bank_num=<%=bank_num%>&sdate=<%=sdate%>&edate=<%=edate%>" style="font-size: 12px">下一页</a> 
          <% } %>
          </font>&nbsp;</div>
      </td></tr> </table></form>
</body> 
</html> 
<%
 rsmod.close();
 sqlRst.close();
 einfodb.closeStmt();
 einfodb.closeConn();
 }
 %>

