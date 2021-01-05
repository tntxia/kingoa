<jsp:useBean id="einfodb" scope="page" class="bankdb.bankdb" />
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
<script language=javascript>
window.location="../../refuse.jsp"
</script>
<% } %>    
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
<jsp:useBean id="infodb" scope="page" class="infocrmdb.infocrmdb" />
<% NumberFormat nf=NumberFormat.getNumberInstance(); 
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
intPageSize = 200;
strPage = request.getParameter("page");
java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyyMMdd");
String currentDate=simple.format(new java.util.Date());
if(strPage==null){
intPage = 1;
} else{
intPage = java.lang.Integer.parseInt(strPage);
if(intPage<1) intPage = 1; }
String username = (String) session.getValue("username");
 String dept = (String) session.getValue("dept");
 String deptjb = (String) session.getValue("deptjb");
 String restrain_name = (String) session.getValue("restrain_name");
 String modsql = "select * from restrain where restrain_name='" + restrain_name + "'";
 ResultSet rsmod = einfodb.executeQuery(modsql);
  if(rsmod.next()) { 
 String wageadd=rsmod.getString("r_wage_add").trim();
 String wageview=rsmod.getString("r_wage_view").trim();
    strSQL = "select count(*) from wage_mb ";
sqlRst = infodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
    strSQL = "select id,wage_name,wage_m_dates,wage_date_price,wage_awork_price,wage_zf_price,wage_jt_price,wage_wc_price,wage_sb_price  from wage_mb  order by id desc";
sqlRst = infodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title>工资管理</title>
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
<script LANGUAGE="JavaScript">
function click() {
if (event.button==2) {alert('芯片商城有限公司')}}
document.onmousedown=click
</script>
</head>
<body bgcolor="#ffffff" text="#000000" bgcolor="#FFFFFF" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="swagem.jsp">
    <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <tr> 
      <td colspan="9"><a href="#" style="font-size: 12px"> </a><font size="2"> </font><font color="#0000FF"> 
        </font><font color="#000000" size="2"> 
        <%if(wageadd.equals("有")){%>
        <input type="button" value="新增工资模版" name="B22322" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('waget.jsp','_self', 'height=500, width=955, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
        <%}%>
        </font><font color="#0000FF">&nbsp; </font>&nbsp;</td>
    </tr>
    <TR BGCOLOR="#d3d8eb"> 
      <td height="12" nowrap> 
        <div align="left"><font size="2">序号</font></div>
      </td>
      <td height="12" nowrap> 
        <div align="left"><font size="2">员工姓名</font>&nbsp;</div>
      </td>
      <td height="12" nowrap> 
        <div align="left"><font size="2">月工作天数</font>&nbsp;</div>
      </td>
      <td height="12" nowrap> 
        <div align="left"><font size="2">月基本工资</font>&nbsp;</div>
      </td>
      <td height="12" nowrap> 
        <div align="left"><font size="2">每小时加班费</font>&nbsp;</div>
      </td>
      <td height="12" nowrap> 
        <div align="left"><font size="2">住房补贴费</font>&nbsp;</div>
      </td>
      <td height="12" nowrap> 
        <div align="left"><font size="2">交通补贴费</font>&nbsp;</div>
      </td>
      <td height="12" nowrap> 
        <div align="left"><font size="2">午餐补贴费</font>&nbsp;</div>
      </td>
      <td nowrap> 
        <div align="left"><font size="2">扣除社保费</font>&nbsp;</div>
      </td>
    </tr>
    <%
     i = 0;
     while(i<intPageSize && sqlRst.next()){ int id=sqlRst.getInt(1);%>
    <tr bgcolor="<%if ((i % 2)==0) out.print("#eeeeee");
        	       else out.print("#ffffff");%>" style="cursor:hand;" onClick="window.open('ewaget.jsp?id=<%=id%>','_blank', 'height=350, width=750, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')" onMouseOver="this.bgColor='#B5DAFF'" onMouseOut="this.bgColor='#ffffff'" height="8"> 
      <td height="13" nowrap> 
        <div align="left"><%=i+1%></div>
      </td>
      <td height="13" nowrap> 
        <div align="left"><font size="2"><%=sqlRst.getString("wage_name")%></font>&nbsp;</div>
      </td>
      <td height="13" nowrap> 
        <div align="left"><font size="2"><%=sqlRst.getString("wage_m_dates")%></font>&nbsp;</div>
      </td>
      <td height="13" nowrap> 
        <div align="left"><font size="2"><%=sqlRst.getString("wage_date_price")%></font>&nbsp;</div>
      </td>
      <td height="13" nowrap> 
        <div align="left"><font size="2"><%=sqlRst.getString("wage_awork_price")%></font>&nbsp;</div>
      </td>
      <td height="13" nowrap> 
        <div align="left"><font size="2"><%=sqlRst.getString("wage_zf_price")%></font>&nbsp;</div>
      </td>
      <td height="13" nowrap> 
        <div align="left"><font size="2"><%=sqlRst.getString("wage_jt_price")%></font>&nbsp;</div>
      </td>
      <td height="13" nowrap> 
        <div align="left"><font size="2"><%=sqlRst.getString("wage_wc_price")%></font>&nbsp;</div>
      </td>
      <td nowrap> 
        <div align="left"><font size="2"><%=sqlRst.getString("wage_sb_price")%></font>&nbsp;</div>
      </td>
    </tr>
    <% i++; } %>
    <tr> 
      <td colspan=9 align=center height="22"> 
        <div align="right"><font color="#000000"> <font size="2">共<%=intRowCount%>个工资模版 
          </font></font> <font color="#C1D9FF" size="2"> 
          <%if(intPage<intPageCount){%>
          <a href="wagem.jsp?page=<%=intPage+1%>" style="font-size: 12px">下一页</a> 
          <%}%>
          <%if(intPage>1){%>
          <a href="wagem.jsp?page=<%=intPage-1%>" style="font-size: 12px">上一页</a> 
          <% }%>
          </font><font color="#C1D9FF"> </font>&nbsp;</div>
      </td>
    </tr>
  </table>
</form>
</body> 
</html> 
<%
 sqlRst.close();
 rsmod.close();
 einfodb.closeStmt();
 einfodb.closeConn();
 }%>
