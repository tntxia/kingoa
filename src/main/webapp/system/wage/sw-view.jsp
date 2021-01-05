<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
<script language=javascript>
window.location="../../refuse.jsp"
</script>
<% }     
%>
<%@ page import="java.sql.*,java.util.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
<html>
<head>
<title>工资</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script LANGUAGE="JavaScript">
function click() {
if (event.button==2) {alert('芯片商城有限公司')}}
document.onmousedown=click
</script>
</head>
<%
String dept = (String) session.getValue("dept");
String username = (String) session.getValue("username");
 String modsql = "select * from restrain where ename='" + username + "'  and dept='" + dept + "'";
 ResultSet rsmod = einfodb.executeQuery(modsql);
  if(rsmod.next()) { 
  int  deptjb=rsmod.getInt("deptjb");
 String wagemod=rsmod.getString("wagemod").trim();
 String wagedel=rsmod.getString("wagedel").trim(); NumberFormat nf=NumberFormat.getNumberInstance(); 
  nf.setMaximumFractionDigits(4); 
 nf.setMinimumFractionDigits(4); 
 
String id2=request.getParameter("id");
String sql="select   id,menber_year,menber_month,menber_name,menber_wage,menber_bt,menber_fl,menber_cd,menber_cs,menber_kgz,menber_sb,menber_ht,menber_jbsj,menber_yjgz,menber_zmjbsj,menber_zjbsj,menber_csa,menber_je,menber_bjsj,menber_ykgz,menber_sjsj, menber_sjgz,menber_njsj,menber_njgz,menber_ccsj,menber_yjgzw,menber_zmsj,menber_zmgz,menber_total from wage_menber where id='"+id2+"'";

ResultSet rs=einfodb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
 
%>
<body bgcolor="#ffffff" text="#000000" bgcolor="#FFFFFF" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="edit-main-wage.jsp">
  <table width="100%" border="0" cellspacing="0" cellpadding="3" align="center">
    <tr>
      <td>
        <div align="center"><font size="5"><font color="#000000">工 资 基 本 信 
          息</font></font>&nbsp;</div>
      </td>
    </tr>
    <tr>
      <td height="30">
        <hr width="400" size="5">
      </td>
    </tr>
  </table>
  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1"><tr> 
      <td width="24%" height="2"><div align="left"><font color="#000000"><font size="2">工 
          资 年 份</font></font>&nbsp;</div></td>
      <td width="20%" height="2"><div align="left"><font color="#000000"><font size="2"><%=rs.getString(2)%>年</font></font>&nbsp;</div></td>
      <td width="17%" height="2"><div align="left"><font color="#000000"><font size="2">工资月份</font></font>&nbsp;</div></td>
      <td width="29%" height="2"><div align="left"><font color="#000000"><font size="2"><%=rs.getString(3)%> 月</font></font>&nbsp;</div></td>
    </tr>
    <tr> 
      <td width="24%"><div align="left"><font color="#000000"><font size="2">员 工 
          名 称</font></font>&nbsp;</div></td>
      <td width="20%"><div align="left"><font color="#000000"><font size="2"><%=rs.getString(4)%></font></font>&nbsp;</div></td>
      <td width="17%"><div align="left"><font color="#000000"><font size="2">基本工资</font></font>&nbsp;</div></td>
      <td width="29%"><div align="left"><font color="#000000"><font size="2"><%=nf.format(rs.getDouble(5))%>RMB</font></font>&nbsp;</div></td>
    </tr>
    <tr> 
      <td width="24%"><div align="left"><font color="#000000"><font size="2">住房、交通补贴</font></font>&nbsp;</div></td>
      <td width="20%"><div align="left"><font color="#000000"><font size="2"><%=nf.format(rs.getDouble(6))%>RMB</font></font>&nbsp;</div></td>
      <td width="17%"><div align="left"><font color="#000000"><font size="2">职位奖金</font></font>&nbsp;</div></td>
      <td width="29%"><div align="left"><font color="#000000"><font size="2"><%=nf.format(rs.getDouble(7))%>RMB</font></font>&nbsp;</div></td>
    </tr>
    <tr> 
      <td width="24%"><div align="left"><font color="#000000"><font size="2">全勤奖</font></font>&nbsp;</div></td>
      <td width="20%"><div align="left"><font color="#000000"><font size="2"><%=rs.getString(8)%>RMB</font></font>&nbsp;</div></td>
      <td><div align="left"><font color="#000000"><font size="2">扣除社保费</font></font>&nbsp;</div></td>
      <td><div align="left"><font color="#000000"><font size="2"><%=nf.format(rs.getDouble("menber_sb"))%>RMB</font></font>&nbsp;</div></td>
    </tr>
    <tr> 
      <td><div align="left"><font color="#000000"><font size="2">履行合同奖金</font></font>&nbsp;</div></td>
      <td colspan="3"><div align="left"><font color="#000000"><font size="2"><%=nf.format(rs.getDouble("menber_ht"))%>RMB</font></font>&nbsp;</div></td>
    </tr>
    <tr> 
      <td width="24%"><div align="left"><font color="#000000"><font size="2">加班奖金</font></font>&nbsp;</div></td>
      <td width="20%"><div align="left"><font color="#000000"> <font size="2"><%=rs.getString(13)%>RMB</font></font>&nbsp;</div></td>
      <td><div align="left"><font color="#000000"><font size="2">午餐补贴</font></font>&nbsp;</div></td>
      <td><div align="left"><font color="#000000"><font size="2"><%=rs.getString(15)%>RMB</font></font>&nbsp;</div></td>
    </tr>
    <tr> 
      <td width="24%"><div align="left"><font color="#000000"><font size="2">事假应加工资</font></font>&nbsp;</div></td>
      <td colspan="3"> <div align="left"><font color="#000000"><font size="2"><%=rs.getString(21)%>RMB</font></font>&nbsp;</div></td>
    </tr>
    <tr> 
      <td colspan="4"><b><font size="2" color="#000000">工资合计：<%=rs.getDouble(29)%>RMB</font></b></td>
    </tr>
  </table>
  <p align="center"><font size="2"> 
    <input type="hidden" name="id" size="20" style="border: 1 inset #C3D9FF" value="<%=id2%>">
    </font><font color="#000000" size="2"> 
    <%if(wagemod.equals("有")){%>
    <%}  if(wagedel.equals("有")){%>
    <%}%>
    <input type="button" value="关闭" name="B22342" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()">
    </font></p>
</form>
</body>
</html>
<% rsmod.close();
 einfodb.closeStmt();
 einfodb.closeConn();
 }%>
