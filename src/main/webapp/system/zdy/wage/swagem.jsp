<jsp:useBean id="einfodb" scope="page" class="bankdb.bankdb" />
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
<script language=javascript>
window.location="../../refuse.jsp"
</script>
<% }     
%>
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
<jsp:useBean id="infodb" scope="page" class="infocrmdb.infocrmdb" />
<% NumberFormat nf=NumberFormat.getNumberInstance(); 
  nf.setMaximumFractionDigits(4); 
 nf.setMinimumFractionDigits(4); 
 
String menber_year = request.getParameter("menber_year");
String menber_month = request.getParameter("menber_month");
String menber_name = request.getParameter("menber_name");
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
double total=0.00;
intPageSize = 20;
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
 if(wageview.equals("有")){
    strSQL = "select count(*) from wage_menber where menber_year like '%"+menber_year+"%' and menber_month like '%"+menber_month+"%' and menber_name like '%"+menber_name+"%' and deptjb like '"+deptjb+"%'";
}else
    strSQL = "select count(*) from wage_menber where menber_year like '%"+menber_year+"%' and menber_month like '%"+menber_month+"%' and menber_name like '%"+menber_name+"%' and menber_name='"+username+"'";
sqlRst = infodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
 if(wageview.equals("有")){
    strSQL = "select  id,menber_year,menber_month,menber_name,menber_wage,menber_bt,menber_fl,menber_cd,menber_ht,menber_jbsj,menber_zmjbsj,menber_sb,menber_sjsj,menber_total from wage_menber where menber_year like '%"+menber_year+"%' and menber_month like '%"+menber_month+"%' and menber_name like '%"+menber_name+"%' and deptjb like '"+deptjb+"%'";
}else
    strSQL = "select id,menber_year,menber_month,menber_name,menber_wage,menber_bt,menber_fl,menber_cd,menber_ht,menber_jbsj,menber_zmjbsj,menber_sb,menber_sjsj,menber_total from wage_menber where menber_year like '%"+menber_year+"%' and menber_month like '%"+menber_month+"%' and menber_name like '%"+menber_name+"%' and  menber_name='"+username+"'";

sqlRst = infodb.executeQuery(strSQL);
String  strSQL1 = "select menber_total from wage_menber where menber_year like '%"+menber_year+"%' and menber_month like '%"+menber_month+"%' and menber_name like '%"+menber_name+"%' and deptjb like '"+deptjb+"%'";
	    ResultSet prs=infodb.executeQuery(strSQL1);
        int tmpi=0;
		while(prs.next()){ 
		double price=0;
        String tmpprice=prs.getString("menber_total");
        if(tmpprice!=null)
        price=Double.parseDouble(tmpprice);
        total=total+price;
		tmpi++;}
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
</head>
<body bgcolor="#ffffff" text="#000000" bgcolor="#FFFFFF" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <th width="81%" align="left" scope="col"><font size="5" face="Georgia, Times New Roman, Times, serif">　 <span class="f14">OFFICE ONLINE </span></font></th>
    <th width="19%" align="center" scope="col"> 
      <table width="145"  border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <th width="45" scope="col"><a href="../../fina_m.jsp" target="_parent" class="cpx12orange" style="font-size: 12px"><img src="../../images/4.gif" alt="回到产品管理首页" width="26" height="24" border="0"></a></th>
          <th width="45" scope="col"><a href="#" class="cpx12orange" style="font-size: 12px"><img src="/images/1.gif" alt="在线帮助" width="26" height="24" border="0" ></a></th>
          <th width="45" scope="col"><a href="javascript:window.close();" class="cpx12orange" style="font-size: 12px"><img src="/images/3.gif" alt="关闭窗口" width="26" height="24" border="0"></a></th>
          <th scope="col">&nbsp;</th>
        </tr>
      </table>
    </th>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <th width="28%" height="28" align="left" background="../../images/pop4.gif" scope="col"> 
      <table width="218" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <th align="left" scope="col"><img src="../../images/fina_m.gif" width="217" height="28"></th>
        </tr>
      </table>
    </th>
    <th width="72%" align="left" valign="bottom" background="../../images/pop4.gif" scope="col"><span class="cpx12lan"><font size="2">&gt;&gt; 
      资金管理</font></span></th>
  </tr>
</table>
<form name="form1" method="post" action="">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1"><TR BGCOLOR="#d3d8eb"> 
      <td width="38" height="12"> 
        <div align="left"><font size="2">序号</font></div></td>
      <td width="90" height="12"> 
        <div align="left"><font size="2">工资时间</font>&nbsp;</div></td>
      <td width="66" height="12"> 
        <div align="left"><font size="2">员工姓名</font>&nbsp;</div></td>
      <td width="71" height="12"> 
        <div align="left"><font size="2">基本工资</font>&nbsp;</div></td>
      <td width="65" height="12"> 
        <div align="left"><font size="2">住房补贴</font>&nbsp;</div></td>
      <td width="45" height="12"> 
        <div align="left"><font size="2">奖金</font>&nbsp;</div></td>
      <td width="48" height="12"> 
        <div align="left"><font size="2">全勤奖</font>&nbsp;</div></td>
      <td width="64" height="12"> 
        <div align="left"><font size="2">加班奖金</font>&nbsp;</div></td>
      <td width="62" height="12"> 
        <div align="left"><font size="2">午餐补贴</font>&nbsp;</div></td>
      <td width="72"> 
        <div align="left"><font size="2">扣除社保费</font>&nbsp;</div></td>
      <td width="52"> 
        <div align="left"><font size="2">扣除事假</font>&nbsp;</div></td>
      <td width="52" height="12"> 
        <div align="left"><font size="2">工资总计</font>&nbsp;</div></td>
    </tr>
    <%
     i = 0;
     while(i<intPageSize && sqlRst.next()){ int id=sqlRst.getInt(1);%>
    <tr bgcolor="<%if ((i % 2)==0) out.print("#eeeeee");
        	       else out.print("#ffffff");%>" style="cursor:hand;" onClick="window.open('w-view.jsp?id=<%=id%>','rtop', 'height=520, width=955, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')" onMouseOver="this.bgColor='#B5DAFF'" onMouseOut="this.bgColor='#ffffff'" height="8"> 
      <td height="13"> 
        <div align="left"><%=i+1%></div></td>
      <td height="13"> 
        <div align="left"><font size="2"><a href="w-view.jsp?id=<%=id%>"target="rtop" style="font-size: 12px"><%=sqlRst.getString("menber_year")%>年<%=sqlRst.getString("menber_month")%>月</a> </font>&nbsp;</div></td>
      <td height="13"> 
        <div align="left"><font size="2"><%=sqlRst.getString("menber_name")%></font>&nbsp;</div></td>
      <td height="13"> 
        <div align="left"><font size="2"><%=sqlRst.getString("menber_wage")%></font>&nbsp;</div></td>
      <td height="13"> 
        <div align="left"><font size="2"><%=sqlRst.getString("menber_bt")%></font>&nbsp;</div></td>
      <td height="13"> 
        <div align="left"><font size="2"><%=sqlRst.getString("menber_fl")%></font>&nbsp;</div></td>
      <td height="13"> 
        <div align="left"><font size="2"><%=sqlRst.getString("menber_cd")%>0</font>&nbsp;</div></td>
      <td height="13"> 
        <div align="left"><font size="2"><%=sqlRst.getString("menber_jbsj")%>0</font>&nbsp;</div></td>
      <td height="13"> 
        <div align="left"><font size="2"><%=sqlRst.getString("menber_zmjbsj")%>0</font>&nbsp;</div></td>
      <td> 
        <div align="left"><font size="2"><%=sqlRst.getString("menber_sb")%></font>&nbsp;</div></td>
      <td> 
        <div align="left"><font size="2"><%=sqlRst.getString("menber_sjsj")%>0</font>&nbsp;</div></td>
      <td height="13"> 
        <div align="left"><font size="2"><%=sqlRst.getString("menber_total")%></font>&nbsp;</div></td>
    </tr>
    <% i++; } %>
    <tr> 
      <td height="22" colspan=12 align=center> <div align="right"><font color="#000000"> 
          <font color="#000000"><font color="#000000"><font color="#000000"><font color="#000000" size="2"> 
          <input type="button" value="打印预览" name="B2232" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('print.jsp?menber_month=<%=menber_month%>&menber_year=<%=menber_year%>&menber_name=<%=menber_name%>','_blank', 'height=500, width=955, top=50, left=50, toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes,location=no, status=no')">
          </font></font></font><font size="2">工</font><font size="2">资总额为<%=nf.format(total)%>人民币</font></font> <font size="2">共<%=intRowCount%>个工资信息</font></font> <font color="#C1D9FF" size="2"> 
          <%if(intPage<intPageCount){%>
          <a href="swagem.jsp?page=<%=intPage+1%>&menber_month=<%=menber_month%>&menber_year=<%=menber_year%>&menber_name=<%=menber_name%>" style="font-size: 12px">下一页</a> 
          <% 
}

%>
          <%if(intPage>1){%>
          <a href="swagem.jsp?page=<%=intPage-1%>&menber_month=<%=menber_month%>&menber_year=<%=menber_year%>&menber_name=<%=menber_name%>" style="font-size: 12px">上一页</a> 
          <% 
}

%>
          </font><font color="#C1D9FF"> </font>&nbsp;</div></td>
    </tr>
  </table>
</form>
</body> 
</html> 
<% rsmod.close();
 einfodb.closeStmt();
 einfodb.closeConn();
 }%>
