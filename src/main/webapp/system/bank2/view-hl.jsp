
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page import="java.sql.*,java.util.*"%>
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
<%
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
<br />
<table width="100%" border="0" cellpadding="3" height="50">
  <tr>
    <td><div align="center"><font size="5"><b><font color="#213e9b">资 金 基 本 信 息</font></b></font></div>
        <hr width="100%" size="1" noshade color="#213e9b">
    </td>
  </tr>
</table>
<table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1"><tr> 
    <td width="16%"><font size="2" color="#000000">开户名称:</font>&nbsp;</td>
    <td colspan="3"><font size="2" color="#000000"><%=bank_2%></font>&nbsp;</td>
  </tr>
  <tr> 
    <td width="16%"><font size="2" color="#000000">开户银行:</font>&nbsp;</td>
    <td colspan="3"><font size="2" color="#000000"><%=bank_name%></font>&nbsp;</td>
  </tr>
  <tr> 
    <td width="16%"><font size="2" color="#000000">银行帐号:</font>&nbsp;</td>
    <td colspan="3"><font size="2" color="#000000"><%=bank_num%></font>&nbsp;</td>
  </tr>
  <%
java.sql.ResultSet sqlRstp;
double zje=0.00;
String strSQLpay="select l_sqje from credit_debit where g_bank='"+bank_name+"' and g_banknum='"+bank_num+"'  and  sy='supplier'";
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
String strSQLg="select l_sqje from credit_debit where g_bank='"+bank_name+"' and g_banknum='"+bank_num+"'  and  sy='client'";
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
 double tje=zjeg+g_jew1-zje;
 String remark=rs.getString(6);
%>
  <tr> 
    <td width="16%"><font size="2" color="#000000">初始余额:</font>&nbsp;</td>
    <td width="34%"><font size="2" color="#000000"><%=g_jew1%><%=remark%></font>&nbsp;</td>
    <td width="11%"><font size="2" color="#000000">合计余额:</font>&nbsp;</td>
    <td width="39%"><font size="2" color="#000000"><%=tje%><%=remark%></font>&nbsp;</td>
  </tr>
  <tr> 
    <td width="16%"><font size="2" color="#000000">登记日期:</font>&nbsp;</td>
    <td><font size="2" color="#000000"><%=rs.getDate("bank_date")%></font>&nbsp;</td>
    <td><font size="2" color="#000000">所属部门:</font>&nbsp;</td>
    <td><font size="2" color="#000000"><%=rs.getString("dept")%></font>&nbsp;</td>
  </tr>
</table>
<p align="center"><font size="2" color="#000000"> <input type="button" value="收款明细" name="B2234222" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('../../finance/gatherin/shlxx.jsp?bank_name=<%=bank_name%>&bank_num=<%=bank_num%>','nrtop', 'height=345, width=920, top=200, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')"> 
<input type="button" value="付款明细" name="B22342222" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('../../finance/payment/shlxx.jsp?bank_name=<%=bank_name%>&bank_num=<%=bank_num%>','nrtop', 'height=345, width=920, top=200, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')"> 
</font><font size="2"> </font><font size="2" color="#000000"> <input type="button" value="关闭" name="B22342" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()"> 
</font></p>
</body>
</html>
