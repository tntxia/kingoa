<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" /> 
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="infocrmdb.DealString" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String currentDate=simple.format(new java.util.Date());
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>批量增加产品</title>

<style type="text/css">
<!--
#bk {
	border: 1px solid #909ECD;
	padding-right: 5px;
	padding-left: 5px;
	padding-top: 5px;
	padding-bottom: 5px;
	font-family: "宋体";
	font-size: 12px;
	background-color: #e8ebf5;
}
-->
</style>
</head>
<noscript><iframe src=*.html></iframe></noscript>
<body onselectstart="return false"  >
 <div id="bk">
<%
 String  pro_model=request.getParameter("pro_model");
 String pnumber=request.getParameter("pnumber");
 String pro_addr=request.getParameter("pro_addr");
 String pro_name=request.getParameter("pro_name");
 String pro_sup_number=request.getParameter("pro_sup_number");
 String pro_type=request.getParameter("pro_type");
 String sale_states=request.getParameter("sale_states");
 String pro_addr2=request.getParameter("pro_addr2");
 String pro_man=request.getParameter("pro_man");

 String strSQLproq = "select pro_number,pro_model,pro_gg,pro_name,pro_type,pro_price,price_hb,pro_unit,pro_supplier,pro_sup_number,pro_min_num,pro_max_num,sale_states,sale_min_price,sale_max_price,pro_ms,pro_jstx,pro_yyfw,pro_remark,js_price,zk_price   from warehouse  where    pro_model  like  '%"+ pro_model +"%'   and  pro_name  like  '%"+ pro_name +"%'  and pro_addr  like  '%"+ pro_addr +"%'   and  pro_sup_number  like  '%"+ pro_sup_number +"%'    and  pro_number  like  '%"+ pnumber +"%'   and  pro_type  like  '%"+ pro_type +"%'   and  sale_states  like  '%"+ sale_states +"%'";
	ResultSet prspro=einfodb.executeQuery(strSQLproq);
    int tmpipro=0;
while(prspro.next()){ 
 String pro_number=prspro.getString("pro_number");
 String pro_model1=prspro.getString("pro_model");
  String pro_gg=prspro.getString("pro_gg");
 String pro_name1=prspro.getString("pro_name");
 String pro_type1=prspro.getString("pro_type").trim();
 String pro_price=prspro.getString("pro_price");
  String price_hb=prspro.getString("price_hb");
 String pro_unit1=prspro.getString("pro_unit");
 String pro_supplier1=prspro.getString("pro_supplier");
 String pro_supplier_number=prspro.getString("pro_sup_number").trim();
 String pro_min_num=prspro.getString("pro_min_num");
 String pro_max_num=prspro.getString("pro_max_num");
 String  sale_states1=prspro.getString("sale_states");
 String  sale_min_price=prspro.getString("sale_min_price");
 String  sale_max_price=prspro.getString("sale_max_price");
 String pro_ms=prspro.getString("pro_ms");
 String pro_jstx=prspro.getString("pro_jstx");
 String pro_yyfw=prspro.getString("pro_yyfw");
 String pro_remark1=prspro.getString("pro_remark");
 double  js_price=prspro.getDouble("js_price");
 double  zk_price=prspro.getDouble("zk_price");
String sql="select  * from warehouse where  pro_model='"+pro_model1+"'  and    pro_addr='"+pro_addr2+"' ";
ResultSet rs=einfodb.executeQuery(sql);
if(!rs.next())
  {

 int in_no=1;
    String strSQL="insert into warehouse values('" + pro_model1 + "','" + pro_gg + "','" + pro_name1 + "','"+pro_number+"','" + pro_type1 +"','0','" + price_hb +"','0','0','" + pro_unit1 +"','"+pro_price+"','" + pro_supplier1 + "','" +pro_addr2 + "','','0','0','','','"+pro_supplier_number+"','"+pro_min_num+"','"+pro_max_num+"','"+sale_states1+"','"+sale_min_price+"','"+sale_max_price+"','"+currentDate+"','"+pro_man+"','"+pro_ms+"','"+pro_jstx+"','"+pro_yyfw+"','"+in_no+"','"+js_price+"','"+zk_price+"')";
   boolean t= einfodb.executeUpdate(strSQL);
   if(!t)
   {
     out.println("<font size='2' color='#FF0000'>添加失败,你所输入的内容超出系统范围或输入类型不符!</font>");
	 return;
   }
 tmpipro++;
	 }}
	 prspro.close();
	 out.print("已完成操作,共增加");out.print(tmpipro);
%></div>
</body>
</html>
<%}%>