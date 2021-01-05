<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
NumberFormat nf=NumberFormat.getNumberInstance(); 
nf.setMaximumFractionDigits(4);
nf.setMinimumFractionDigits(4);

java.sql.Connection sqlCon;
java.sql.Statement sqlStmt;
java.sql.ResultSet sqlRst;
java.sql.ResultSet sqlRstq;
java.lang.String strCon;
java.lang.String strSQL,whereSQL="";
int intPageSize;
int intRowCount;
int intPageCount;
int intPage;
String prodel="";
int totalnum=0;
java.lang.String strPage;
int i,j,k; 
intPageSize =20;

String batch_no = request.getParameter("batch_no");

strPage = request.getParameter("page");

if(strPage==null){
	intPage = 1;
} else{
	intPage = java.lang.Integer.parseInt(strPage);
	if(intPage<1) intPage = 1;
}
String actionType=request.getParameter("actionType");
String pro_model="",pnumber="",pro_addr="",pro_name="",pro_sup_number="",pro_type="",mproduct="pro_model",conamesearch="",pro_supplier="",view="20",sale_states="",px="order  by  id   desc";
String dept = (String) session.getValue("dept");
String username = (String) session.getValue("username");
String restrain_name = (String) session.getValue("restrain_name");
String deptjb = (String) session.getValue("deptjb");
int tmpigp=0;
String gp_gp="";
String proview_yes="";
String gp_gpc="";
String  pro_zt="无";
String  proadd="无";
String pro_ck="无";

 
strSQL = "select count(*) from warehouse  where batch_no = '"+batch_no+"'";
if(actionType!=null && actionType.equals("query"))
{
 pro_model=request.getParameter("pro_model");
 pnumber=request.getParameter("pnumber");
 pro_addr=request.getParameter("pro_addr");
 pro_name=request.getParameter("pro_name");
 pro_sup_number=request.getParameter("pro_sup_number");
 
 conamesearch=request.getParameter("conamesearch");
 mproduct=request.getParameter("mproduct");
 
 //pro_type=request.getParameter("pro_type");
 view=request.getParameter("view");
 px=request.getParameter("px");
// sale_states=request.getParameter("sale_states");
 pro_supplier=request.getParameter("pro_supplier");
 int tmpigpc=0;
 String pro_ckc="";
 String pro_ztc="";

 
 strSQL = "select count(*) from warehouse where  batch_no = '"+batch_no+"'";
 }

sqlRst = einfodb.executeQuery(strSQL);

sqlRst.next();

intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
String  strSQLup = "select price_hb,sum(pro_num*pro_price) as zprice from warehouse  batch_no = '"+batch_no+"'";

String top = view;

if(intPage>1){
	top = String.valueOf(intPage*intPageSize);
}

strSQL = "select top "+top+" id,pro_number,pro_model,pro_gg,pro_name,pro_sup_number,yqdate,pro_secid,pro_supplier,pro_num,pro_unit,pro_min_num,pro_price,price_hb,saleprice,pro_type,pro_yyfw,pro_addr,pro_remark,th_number from warehouse where  batch_no = '"+batch_no+"'";
if(actionType!=null && actionType.equals("query"))
{
strSQL = "select id,pro_number,pro_model,pro_gg,pro_name,pro_sup_number,yqdate,pro_secid,pro_supplier,pro_num,pro_unit,pro_min_num,pro_price,price_hb,saleprice,pro_yyfw,pro_addr,pro_remark,th_number from warehouse where  batch_no = '"+batch_no+"'";

strSQLup = "select  price_hb,sum(pro_num*pro_price)  as zprice  from warehouse where batch_no = '"+batch_no+"'";
}


sqlRst = einfodb.executeQuery(strSQL);
System.out.println(strSQL);
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
.STYLE2 {font-weight: bold}
</style>
</head>
<body bgcolor="#ffffff" text="#000000" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="warehouseList.jsp"> <DIV ALIGN="LEFT">
    <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
      <br>
      <TR bgcolor="#d3d8eb"> 
        <TD HEIGHT="17"> 
          <div align="left"><font size="2">产品型号</font></div></TD>
        <TD HEIGHT="17"> 
          <div align="left"><font size="2">封装</font></div></TD>
        <td height="17"> 
          <div align="left"><font size="2">批号</font> </div></td>
        <td height="17"> 
          <div align="left"><font size="2">品牌</font> </div></td>
        <td height="17"> 
          <div align="left"><font size="2">货期</font></div></td>
        <td height="17"> 
          <div align="left"><font size="2">当前库存</font> </div></td>
        
        <TD><div align="left">产品状态</div></TD>
        <TD HEIGHT="17"> 
          <div align="left"><font size="2">进口原装价</font></div></TD>
        <TD><div align="left">国产价</div></TD>
        <TD><div align="left">散新价</div></TD>
        <TD HEIGHT="17"> 
          <div align="left"><FONT SIZE="2">仓库名称</font>&nbsp; </div></TD>
        <TD> 
          <div align="left">备注</div></TD>
      </TR>
      <%
   i = 0;
   while(i<intPageSize && sqlRst.next()){ 
	   int id=sqlRst.getInt(1);
	   
	   %>
      <TR STYLE="cursor:hand;"  ONMOUSEOVER="this.bgColor='#B5DAFF'" ONMOUSEOUT="this.bgColor='<%if ((i % 2)==0) out.print("#eeeeee");
        	       else out.print("#ffffff");%>'" HEIGHT="8" BGCOLOR="<%if ((i % 2)==0) out.print("#eeeeee");
        	       else out.print("#ffffff");%>"> 
        <TD HEIGHT="9"> 
          <DIV ALIGN="LEFT"><font size="2"><a href="#" onClick="javascript:window.open('pro-view.jsp?id=<%=id%>','_blank','height=5210,width=955,left=25,top=25,toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
            <%String promodel=sqlRst.getString("pro_model").trim();out.print(promodel);%>
          </a></font></DIV>        </TD>
        <TD HEIGHT="9"> 
          <DIV ALIGN="LEFT"><FONT SIZE="2"><A HREF="#" ONCLICK="javascript:window.open('pro-view.jsp?id=<%=id%>','_blank','height=5210,width=955,left=25,top=25,toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')"><%=sqlRst.getString("pro_gg")%></A> 
            </FONT>&nbsp;</DIV>        </TD>
        <td height="9"> 
          <div align="LEFT"><font size="2"><a href="#" onClick="javascript:window.open('pro-view.jsp?id=<%=id%>','_blank','height=5210,width=955,left=25,top=25,toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
            <%String pro_name1=sqlRst.getString("pro_name");out.print(pro_name1);%>
            </a>&nbsp; </font></div> </td>
    <td height="9"> 
     <div align="left"><font size="2"><%=sqlRst.getString("pro_sup_number")%></font>&nbsp;</div>        </td>
        <td height="9"> 
   <div align="left"><font size="2"><%=sqlRst.getString("yqdate")%></font><font size="2"> 
         <%
		  String pro_secid=sqlRst.getString("pro_secid");
	      String pro_supplier1=sqlRst.getString("pro_supplier");
		  int dqnum=sqlRst.getInt("pro_num");
		  String punit=sqlRst.getString("pro_unit");
		  int min_num=sqlRst.getInt("pro_min_num");
		  double cgprice=sqlRst.getDouble("pro_price");
		  String price_hb=sqlRst.getString("price_hb");
		  double saleprice=sqlRst.getDouble("saleprice");
		  // String pro_type1=sqlRst.getString("pro_type").trim();
		  String pro_yyfw=sqlRst.getString("pro_yyfw");
		  String pro_addr1=sqlRst.getString("pro_addr");
		  String pro_remark=sqlRst.getString("pro_remark");
		  String th_number = sqlRst.getString("th_number");
		  
		  
		  double  price_gk=0.6;
		  double  price_jysj=0.65;
		  double  price_min=0.7;
		  double  price_dljg=0.75;
		  double  price_wf=0.8;
		  String modsqlc = "select * from restrain_gp where restrain_name='" + restrain_name + "' and pro_ck='"+pro_addr1+"'";
 		  ResultSet rsmodc = einfodb.executeQuery(modsqlc);
  		  if(rsmodc.next()) { 
        	  
		  }
	      rsmodc.close();
		  if(proview_yes.equals("有")){%>
            </font><font size="2"> 
            <%}%>
            </font>　</div></td>
		    <%
		    int zout_num=0;
		    int snum = 0;
		    int zint_num = 0;
		    int ttnum=0;
		    if(th_number!=null){
		    	
		    	ttnum = 0;
		    	zint_num = 0;
		    	
		    	pro_remark = "<font color='red'>退货:</font>"+pro_remark;
		    }else{
		    	
		    }


%>
        <td height="9"> 
          <div align="left"><font size="2"> <%=dqnum%></font> <font size="2"></font>&nbsp;</div>        </td>
        
        <TD><div align="left"><%=pro_secid%>&nbsp;</div></TD>
        <TD HEIGHT="9"> 
          <div align="left"><FONT SIZE="2"> 
        <%if(proview_yes.equals("有")){out.print(nf.format(cgprice));out.print(price_hb);}%>
        </FONT>&nbsp;</div></TD>
        <TD><div align="left"><%if(proview_yes.equals("有")){  String prodrr=""; if(pro_yyfw!=null && pro_yyfw.startsWith(".")){ prodrr="0"+pro_yyfw; out.print(prodrr); }else{ out.print(pro_yyfw); }}  %>　&nbsp;</div></TD>
        <TD><div align="left"><%=nf.format(saleprice)%>&nbsp;</div></TD>
        <TD HEIGHT="9"> 
          <div align="left"><FONT SIZE="2"><%=pro_addr1%></FONT>&nbsp;</div></TD>
        <TD><div align="left"><FONT SIZE="2"><%=pro_remark%>　</FONT></div></TD>
      </TR>
      <% i++; 
	  totalnum+=dqnum;
	  
	  } %>
      <TR> 
        <TD COLSPAN=15 ALIGN=center HEIGHT="2"> 
          <div align="left"><font color="#000000" size="2">仓库唯一性以：产品型号，批号，仓库为准,产品导入1速度比较快，但不做型号重复的检测，产品导入2导入速度慢，但做型号重复的检测。</font>&nbsp;</div>        </TD>
      </TR>
    </TABLE>
  </DIV></form><form name="form2" method="post" action="cwarehousem.jsp">
    <div align="left"><font color="#000000"><font size="2"> 当前是第<%=intPage%>页,共<%=intPageCount%>页,</font></font><font color="#000000" size="2"> 共<%=intRowCount%>个产品,共 <%=totalnum%> pcs,</font>
      <%if(proview_yes.equals("有")){%>
          <font color="#000000" size="2">金额合计
          <%
		  sqlRstq = einfodb.executeQuery(strSQLup);
		while(sqlRstq.next()){
		 String price_hb=sqlRstq.getString("price_hb");
		
		 double zprice=sqlRstq.getDouble("zprice");
		 
		 //out.print("仓库金额合计:"+price_hb+":"+nf.format(zprice)+"");
		 out.print(price_hb+":"+nf.format(zprice)+"；");
		}
		sqlRstq.close();
		
		
	%>
          </font> 
      <%}%>
          <font color="#CCCCCC" size="2"> 
  <%if(intPage>1){%>
  <a href="warehouseList.jsp?page=<%=intPage-1%>&batch_no=<%=batch_no%>">上一页</a> 
  <% } %>
  <%if(intPage<intPageCount){%>
  <a href="warehouseList.jsp?page=<%=intPage+1%>&batch_no=<%=batch_no%>">下一页</a> 
  <%}%>
          </font><font color="#000000"><font size="2">
          </font></font> 
      
          <font color="#CCCCCC" size="2">
          </font>
      <INPUT NAME="pro_model" TYPE="hidden" VALUE="<%=pro_model%>">
      <INPUT NAME="pro_addr" TYPE="hidden"  VALUE="<%=pro_addr%>">
      <INPUT NAME="pnumber"  TYPE="hidden"   VALUE="<%=pnumber%>">
      <INPUT NAME="pro_sup_number" TYPE="hidden"  VALUE="<%=pro_sup_number%>">
     
      <INPUT NAME="pro_name" TYPE="hidden"  VALUE="<%=pro_name%>">
      <INPUT NAME="actionType" TYPE="hidden" VALUE="<%=actionType%>">
      <INPUT NAME="px" TYPE="hidden" VALUE="<%=px%>">
    
      <input name="pro_supplier" type="hidden"value="<%=pro_supplier%>">
      <input name="view" type="hidden" value="<%=view%>">
    </div>
  </form>
</body> 
</html> 
<%
  sqlRst.close();
  einfodb.closeStmt();
  einfodb.closeConn();
 %>
