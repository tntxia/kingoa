
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
<script language=javascript>
    window.location="../../refuse.jsp"
    </script>
<% }     
%>
<html>
<head>
<title>资金</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<% NumberFormat nf=NumberFormat.getNumberInstance(); 
  nf.setMaximumFractionDigits(4); 
 nf.setMinimumFractionDigits(4); 
 
String sdate=request.getParameter("sdate").trim();
String edate=request.getParameter("edate").trim();
String id2=request.getParameter("id");
String sql="select  * from bank where id='"+id2+"'";
ResultSet rs=einfodb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
  String bank_2=rs.getString(2);
  String bank_name=rs.getString(3);
  String bank_num=rs.getString(4);
%>
<body bgcolor="#ffffff" text="#000000" bgcolor="#FFFFFF" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="3" align="center"> 
<tr> <td> <div align="center"><FONT SIZE="2" COLOR="#000000"><%=bank_2%></FONT><FONT SIZE="2" COLOR="#000000"><%=bank_name%></FONT>账户明细帐</div></td></tr> 
<tr> <td height="29"> <DIV ALIGN="CENTER"><%=sdate%>--<%=edate%></DIV></td></tr> 
</table><table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1"><%
java.sql.ResultSet sqlRstp;
double zje=0.00;
String strSQLpay="select l_sqje from credit_debit where g_bank='"+bank_name+"' and g_banknum='"+bank_num+"'  and  sy='client'   and  l_date<'"+sdate+"'";
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
String strSQLg="select l_sqje from credit_debit where g_bank='"+bank_name+"' and g_banknum='"+bank_num+"' and  sy='supplier'   and  l_date<'"+sdate+"'";
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
 String g_jew=rs.getString("bank_je");
 if(g_jew!=null)
 g_jew1=Double.parseDouble(g_jew);
 double tje=g_jew1+zje-zjeg;
%> <tr> <td width="12%"><FONT SIZE="2">上期余额:</font>&nbsp;</td><td width="88%"><font size="2" color="#000000"><%=nf.format(tje)%><%=rs.getString(6)%></font>&nbsp;</td></tr> 
</table><BR><TABLE WIDTH="98%" BORDER="0" CELLPADDING="0" CELLSPACING="0" ALIGN="CENTER"> 
<TR> <TD WIDTH="107"> <DIV ALIGN="left"><FONT SIZE="2" COLOR="#000080"> <%
String hb1="RMB";
double saletl=0.00;
double salesub=0.00;
String strSQLpro = "select id,l_date,compendium,l_coname,sy,l_sqje,l_man from credit_debit where g_bank='"+bank_name+"' and g_banknum='"+bank_num+"'  and  l_date>='"+sdate+"'  and  l_date<'"+edate+"' order  by l_date desc";
ResultSet prs=einfodb.executeQuery(strSQLpro);
int tmpi=0;
	%> 日期</FONT></DIV></TD><TD WIDTH="205"> <DIV ALIGN="left"><FONT SIZE="2" COLOR="#000080">摘要</FONT></DIV></TD><TD WIDTH="241"> 
<DIV ALIGN="left"><FONT SIZE="2" COLOR="#000080">名称</FONT></DIV></TD><TD WIDTH="157"> 
<DIV ALIGN="left"><FONT SIZE="2" COLOR="#000080">借方金额</FONT></DIV></TD><TD WIDTH="154"> 
<DIV ALIGN="left"><FONT SIZE="2" COLOR="#000080">贷方金额</FONT></DIV></TD><TD WIDTH="135"> 
<DIV ALIGN="left"><FONT SIZE="2" COLOR="#000080">余额</FONT></DIV></TD></TR> 
<%
          while(prs.next()){ %> <TR HEIGHT="8"> <%int id=prs.getInt(1);%> <TD WIDTH="107" HEIGHT="8"> 
<DIV ALIGN="left"><FONT SIZE="2" COLOR="#000000"><%=prs.getDate("l_date")%> </font>&nbsp;</div></TD><TD WIDTH="205" HEIGHT="8"><FONT SIZE="2" COLOR="#000000"><%=prs.getString("compendium")%></font>&nbsp;</td><TD WIDTH="241" HEIGHT="8"><FONT SIZE="2" COLOR="#000000"><%=prs.getString("l_coname")%></font>&nbsp;</td><TD WIDTH="157" HEIGHT="8"> 
<DIV ALIGN="left"><FONT SIZE="2" COLOR="#000000"> <%
 String  l_c_d=prs.getString("sy").trim();
 double l_sqje=prs.getDouble("l_sqje");
  if(l_c_d.equals("client")){
  out.print(l_sqje);
   tje=tje+l_sqje;
  }
  else  out.print("0");
 %> </font>&nbsp;</div></TD><TD WIDTH="154" HEIGHT="8"> <DIV ALIGN="left"><FONT SIZE="2" COLOR="#000000"> 
<%
  if(l_c_d.equals("supplier")){
  out.print(l_sqje);   tje=tje-l_sqje;
}
else  out.print("0");
	%> </font>&nbsp;</div></TD><TD WIDTH="135" HEIGHT="8"> <DIV ALIGN="center"><FONT SIZE="2" COLOR="#000000"><%=nf.format(tje)%></font>&nbsp;</div></TD></TR> 
<% tmpi++; 
	}  
	%> </TABLE><p align="center"><font size="2" color="#000000"> </font><font size="2"> 
</font></p>
</body>
</html>
<% prs.close();
 einfodb.closeStmt();
 einfodb.closeConn();
 %>
