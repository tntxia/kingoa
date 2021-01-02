<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){%>
<script language=javascript>
window.location="../refuse.jsp"
</script><% }%>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<jsp:useBean id="procureManager" scope="page" class="com.tntxia.oa.procure.ProcureManager" />
<% 

String basePath = request.getContextPath();
java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String currentDate=simple.format(new java.util.Date());
String edate=currentDate;
java.text.SimpleDateFormat simplec=new java.text.SimpleDateFormat("yyyy");
String cd=simplec.format(new java.util.Date());
String m_year; 
String m_month; 
String m_day;
String m;
String m_time;
m=request.getParameter("m"); 
m_month=request.getParameter("month"); 
m_year =request.getParameter("year"); 
m_day =request.getParameter("date"); 
m_time =request.getParameter("time"); 
int year,month,day,hour,minute,second;
String time1,time2;
GregorianCalendar calendar;
calendar=new GregorianCalendar();
year=calendar.get(Calendar.YEAR);
month=calendar.get(Calendar.MONTH)+1;
day=calendar.get(Calendar.DAY_OF_MONTH);
hour=calendar.get(Calendar.HOUR_OF_DAY);
minute=calendar.get(Calendar.MINUTE);
second=calendar.get(Calendar.SECOND);
		time1=year+"-"+month+"-"+day;
		time2=year+"-"+month+"-"+day;
if(m!=null)
{
if(m.equals("m1"))
{
	if(m_year==null&&m_month==null&&m_day==null)
	{
		time1=year+"-"+month+"-"+day;
		time2=year+"-"+month+"-"+day;
	}
	else
	{
		time1=m_year+"-"+m_month+"-"+m_day;
		time2=m_time;
	}
}	
else if(m.equals("m2"))
{
	if(m_year==null&&m_month==null&&m_day==null)
	{
		time1=year+"-"+month+"-"+day;
		time2=year+"-"+month+"-"+day;
	}
	else
	{
		time1=m_time;
		time2=m_year+"-"+m_month+"-"+m_day;
	}
}
else
{
		time1=year+"-"+month+"-"+day;
		time2=year+"-"+month+"-"+day;
}
}
NumberFormat nf=NumberFormat.getNumberInstance(); 
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

String depts = request.getParameter("depts");
if(depts==null)
	depts = "";
String coname = request.getParameter("coname");
if(coname==null)
	coname = "";
String cg_man = request.getParameter("cg_man");
if(cg_man==null)
	cg_man = "";
String states=request.getParameter("states");
if(states==null)
	states = "";
String co_number=request.getParameter("co_number");
if(co_number==null)
	co_number = "";
	
String sqlWhere = "";

String opinion = request.getParameter("opinion");
if (opinion != null && opinion.length() > 0) {
	sqlWhere += " and l_spyj like '%" + opinion + "%'";
}


String dept = (String) session.getValue("dept");
String username = (String) session.getValue("username");
String restrain_name = (String) session.getValue("restrain_name");
String deptjb = (String) session.getValue("deptjb");
String modsql = "select * from restrain where restrain_name='" + restrain_name + "'";
ResultSet rsmod = einfodb.executeQuery(modsql);
if(rsmod.next()) { 
    String fkview=rsmod.getString("fkview").trim();
    if(fkview.equals("有")){
        strSQL = "select count(*) from payment_view pv inner join payment_invoice_in pii on pv.id = pii.payment_id  where  wtfk like '"+deptjb+"%'" + sqlWhere;
    } else
        strSQL = "select count(*) from payment_view pv inner join payment_invoice_in pii on pv.id = pii.payment_id where remark='"+username+"'" + sqlWhere;

sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
int top = intPageSize * intPage;

String[] items = new String[] {"id", "orderform", "contract", "sub", "supplier", "sup_number", "moneyty", "receive_time", "number", "amount", "memo"};
String itemsStr = StringUtils.join(items, ",");

 if(fkview.equals("有")){
  strSQL = "select top " + top+ " "+itemsStr+" from invoice_in_view where  wtfk like '"+deptjb+"%' "+ sqlWhere+"  order by id desc";
 }
 else
	strSQL = "select top " + top+ " "+itemsStr+" from invoice_in_view where  remark='"+username+"' " + sqlWhere + " order by id desc";

 System.out.println(strSQL);
 
 sqlRst = einfodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;

System.out.println(i);
for(j=0;j<i;j++) sqlRst.next(); 
%>
<html>
<head>
<title>付款</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
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
<script src="<%=basePath%>/js/jquery.js"></script>
<script src="<%=basePath%>/js/tntxia-ui.js"></script>
<script src="<%=basePath%>/js/common.js"></script>
<script src="./handled.js"></script>
<script language="javascript">
function pic1_onclick() {
     window.open("waitcal.jsp?m=m1&time=<%=time1%>",'newwindow', 'height=230, width=230, top=200, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=n o, States=no');
}
function pic2_onclick() {
     window.open("waitcal.jsp?m=m2&time=<%=time2%>",'newwindow', 'height=230, width=230, top=200, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=n o, States=no');
}
</script>
<body>
<div>已加进项：</div>
 
  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <form name="form1" method="post" action="handled.jsp">
    <tr> 
      <td colspan="12"> <FONT SIZE="2"> 
        <SELECT name="depts" class="tntxia-ui-select" url="<%=basePath%>/main.dispatch?method=getDepartmentList" valueField="departCode" labelField="name">
          <OPTION  VALUE=''><FONT SIZE="2">选择部门</FONT></OPTION>
        </SELECT>
        <select name="cg_man" size="1" id="sendcompany">
          <option value=''>采购员</option>
          <%
  try
  {
    ResultSet rs=einfodb.executeQuery("select name from username");
    while(rs.next())
    {
      String name=rs.getString("name");
      out.println("<option value='"+name+"'>"+name+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%>
        </select>
        供应商名称 
        <input name="coname" type="text" size="10">
		产品型号 
        <input name="pros" type="text" size="8">
        采购编号 
        <input name="co_number" type="text" id="co_number" size="8">
        销售合同编号 
        <input name="saleNumber" type="text" size="8">
        <font size="2">起始日期 
        <input type="text" name="sdate" size="9">
		</font><font size="2"  ><a href="javascript:pic1_onclick()"><img border="0" src="../../images/calendar.jpg" id="pic1" width="20" height="16"></a></font><font color="#000000" size="2"  >
        终止日期 
        <input type="text" name="edate" size="9" value="<%=currentDate%>">
		</font><font size="2"  ><a href="javascript:pic2_onclick()"><img border="0" src="../../images/calendar.JPG" id="pic2" width="15" height="16"></a></font>
	
        <input type="submit" name="Submit" value="查询"></td>
	</tr>
    </form>
    <tr bgcolor="#d3d8eb"> 
      <td height="15"> 
      <div align="left">序号</div></td>
      <td> 
      <div align="left">采购订单编号</div></td>
      <td> 
      <div align="left"><font size="2">销售合同编号</font></div>      </td>  
      <td> 
        <div align="left"><font size="2">供应商</font>&nbsp;</div>
      </td>
      <td><div align="left">进项收到时间</div></td>
      <td><div align="left">进项票据号</div>      </td>
      <td><div align="left">进项金额</div></td>
      <td width="132">备注</td>
      <td>
        <div align="center">操作&nbsp;</div>
      </td>
    </tr>
    <%
        i = 0;
        double totle=0.0;
	    double stotle=0.0; 
       while(i<intPageSize && sqlRst.next()){
          int id=sqlRst.getInt("id");
	      String fk2=sqlRst.getString("orderform");
	      String number=sqlRst.getString("contract");
	       
        String thb="RMB";
	      String strSQLpro = "select sum(num*selljg) as  stprice,  sum(cgpro_num*selljg) as tprice from cgpro where  ddid='"+fk2+"'";
	      ResultSet prs=einfodb.executeQuery(strSQLpro);
        int tmpi=0;
		    while(prs.next()){ 
		      double stprice = prs.getDouble("stprice");   // 入库金额
		      double tprice = prs.getDouble("tprice");    //  订单金额
		      totle=totle+tprice;
		      stotle=stotle+stprice;
		      tmpi++;    
        }
		String fkw=sqlRst.getString("supplier");
		String sup_number = sqlRst.getString("sup_number");
		String hbq="RMB";
		String sub = sqlRst.getString("sub");
    String moneyty = sqlRst.getString("moneyty");
        String receiveDate = sqlRst.getString("receive_time");
        String invoiceInNumber = sqlRst.getString("number");
        String amount = sqlRst.getString("amount");
        String memo = sqlRst.getString("memo");
   %>
    <tr bgcolor="<%if ((i % 2)==0) out.print("#eeeeee");
        	else out.print("#ffffff");%>" style="cursor:hand;"
             onMouseOver="this.bgColor='#B5DAFF'" onMouseOut="this.bgColor='#ffffff'"> 
      <td><div align="left"><%=i+1%></div></td>
      <td>
        <div align="left">
        	<a href="javascript: void(0);" target="rtop" onclick="view(<%=id%>)"><%=number%></a>
        &nbsp;</div>      
      </td>
      <td> 
        <div><%=sub%></div>
      </td>
      <td>
        <div><%=fkw%></div>
      </td>
      <td> 
        <div>
            <%=receiveDate%>
        </div>      
      </td>
      <td> 
        <div>
            <%=invoiceInNumber%>
        </div>
      </td>
      <td> 
        <div><%=amount%></div>
      </td>
      <td> 
        <div><%=memo%></div>
      </td>
      <td>
        <div>
            <button onclick="toEdit(<%=id%>)">编辑</button>
            <button onclick="del(<%=id%>)">删除</button>
        </div>
      </td>
    </tr>
    <% i++; } %>
  </table>

<form name="form2" method="post" action="ysyfm.jsp">
    <div align="right"><font color="#000000" size="2">共<%=intRowCount%>个付款信息</font><FONT COLOR="#000000"><FONT COLOR="#000000"><FONT SIZE="2">,当前是第<%=intPage%>页,共<%=intPageCount%>页</FONT></FONT></FONT><font color="#C1D9FF" size="2">
    <%if(intPage<intPageCount){%>
    <a href="handled.jsp?page=<%=intPage+1%>&coname=<%=coname%>&co_number=<%=co_number%>&depts=<%=depts%>&cg_man=<%=cg_man%>&states=<%=states%>">下一页</a> 
          <%  }  %></font><font color="#000000"><font size="2">
  

    <%if(intPage>1){%>
    <a href="handled.jsp?page=<%=intPage-1%>">上一页</a>
    <%  } %>
  </font>&nbsp;</div>
</form>
</body> 
</html> 
<%
 sqlRst.close();
 rsmod.close();
 einfodb.closeStmt();
 einfodb.closeConn();
 }%>
