<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="einfodb" scope="page" class="bankdb.bankdb" />
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../refuse.jsp"
    </script>
<% } else {    
 String getaLoginmessage = (String) session.getValue("adminloginSign");
   if(getaLoginmessage!="admin"){
%>
    <script language=javascript>
    window.location="../manageslogin.jsp"
    </script>
<% } else {    
 %>
<html>
<head>
<title>权限自定义</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function isValid(){
    if(form1.restrain_name.value==""){
        alert("请输入权限组!");
        form1.restrain_name.focus();        
	return false;
    }
    return true;      
    }
</script>

</head>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="do_punit.jsp"  onSubmit="return isValid();">
  <table width="100%" border="1" cellspacing="0" cellpadding="0" height="789">
    <tr> 
      <td width="14%" height="6" bgcolor="#C1D9FF"><font size="2" color="#000000">增加 &gt;&gt;</font>&nbsp;</td>
      <td height="6" colspan="3" bgcolor="#C1D9FF"> 
        <div align="right"> </div>
      </td>
    </tr>
    <tr> 
      <td height="2" colspan="4"><b></b> 
        <div align="left"><font color="#000000"> </font>&nbsp;</div>
        <font color="#000000"><b>请选择用户</b></font><font size="2"> 
        <select name="username" size="1" id="w_spman">
          <%
  try
  {
    ResultSet rs=einfodb.executeQuery("select name from username  order by hometel");
    while(rs.next())
    {
      String name=rs.getString("name");
      out.println("<option value='"+name+"'>"+name+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%>
        </select>
        </font><font color="#000000"><b>查看部门</b></font><font size="2" face="Arial, Helvetica, sans-serif"> 
        <select size="1" name="dept">
          <%
  try
  {
    ResultSet rs=einfodb.executeQuery("select departname from department  order  by dept_code  asc");
    while(rs.next())
    {
      String departname=rs.getString("departname");
      out.println("<option value='"+departname+"'>"+departname+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%>
        </select>
        </font><font color="#000000"><b>(在该模块设置该用户能否查看到该部门相关模块的数据信息)</b></font>&nbsp;</td>
    </tr>
    <tr> 
      <td height="19" width="14%"> 
        <div align="center"><font face="宋体" size="2"><strong>业务对象</strong></font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font face="宋体" size="2"><strong>修改权限</strong></font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font face="宋体" size="2"><strong>删除权限</strong></font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font face="宋体" size="2"><strong>查看权限</strong></font>&nbsp;</div>
      </td>
    </tr>
    <tr bgcolor="#99FFFF"> 
      <td width="14%"><font face="宋体" size="2">是否全选</font>&nbsp;</td>
      <td width="12%"> 
        <div align="center"><font face="宋体" size="2"> 
          <input type="checkbox" name="allSelect3" value=""      
		     onclick="javascript:allSelect3_onclick();">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"> <font face="宋体" size="2"> 
          <input type="checkbox" name="allSelect4" value=""      
		     onclick="javascript:allSelect4_onclick();">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"> <font face="宋体" size="2"> 
          <input type="checkbox" name="allSelect5" value=""      
		     onClick="javascript:allSelect5_onclick();">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><b><font color="#000000" size="2" face="宋体">潜在客户</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="qzmod" type="checkbox" id="qzmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="qzdel" type="checkbox" id="qzdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="qzview" type="checkbox" id="qzview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><b><font color="#000000" size="2" face="宋体">现有客户</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="xhmod" type="checkbox" id="xhmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="xhdel" type="checkbox" id="xhdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="xhview" type="checkbox" id="xhview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><b><font color="#000000" size="2" face="宋体">联 系 人</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="linkmod" type="checkbox" id="linkmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="linkdel" type="checkbox" id="linkdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="linkview" type="checkbox" id="linkview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><b><font color="#000000" size="2" face="宋体">合作伙伴</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="hzmod" type="checkbox" id="hzmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="hzdel" type="checkbox" id="hzdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="hzview" type="checkbox" id="hzview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><b><font color="#000000" size="2" face="宋体">供 应 商</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="supmod" type="checkbox" id="supmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="supdel" type="checkbox" id="supdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="supview" type="checkbox" id="supview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%" height="24"><b><font color="#000000" size="2" face="宋体">活动管理</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_actmod" type="checkbox" id="r_actmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_actdel" type="checkbox" id="r_actdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_actview" type="checkbox" id="r_actview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><b><font color="#000000" size="2" face="宋体">销售机会</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="opmod" type="checkbox" id="opmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="opdel" type="checkbox" id="opdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="opview" type="checkbox" id="opview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><b><font color="#000000" size="2" face="宋体">客户报价</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="quotemod" type="checkbox" id="quotemod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="quotedel" type="checkbox" id="quotedel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="quoteview" type="checkbox" id="quoteview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">采购管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="cgmod" type="checkbox" id="cgmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="cgdel" type="checkbox" id="cgdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="cgview" type="checkbox" id="cgview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">发运管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="trmod" type="checkbox" id="trmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="trdel" type="checkbox" id="trdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="trview" type="checkbox" id="trview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">货代公司</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="hdmod" type="checkbox" id="hdmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="hddel" type="checkbox" id="hddel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="hdview" type="checkbox" id="hdview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">运费管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_yfglmod" type="checkbox" id="r_yfglmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_yfgldel" type="checkbox" id="r_yfgldel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_yfglview" type="checkbox" id="r_yfglview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">周 计 划</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="workmod" type="checkbox" id="workmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="workdel" type="checkbox" id="workdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="workview" type="checkbox" id="workview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">月 计 划</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_month_jh_mod" type="checkbox" id="r_month_jh_mod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_month_jh_del" type="checkbox" id="r_month_jh_del" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_month_jh_view" type="checkbox" id="r_month_jh_view" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">日 报 表</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_date_r_mod" type="checkbox" id="r_date_r_mod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_date_r_del" type="checkbox" id="r_date_r_del" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_date_r_view" type="checkbox" id="r_date_r_view" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">周 报 表</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_week_r_mod" type="checkbox" id="r_week_r_mod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_week_r_del" type="checkbox" id="r_week_r_del" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_week_r_view" type="checkbox" id="r_week_r_view" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">月 报 表</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_month_r_mod" type="checkbox" id="r_month_r_mod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_month_r_del" type="checkbox" id="r_month_r_del" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_month_r_view" type="checkbox" id="r_month_r_view" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">项目管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="xmmod" type="checkbox" id="xmmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="xmdel" type="checkbox" id="xmdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="xmview" type="checkbox" id="xmview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">合同管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_htgl_mod" type="checkbox" id="r_htgl_mod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_htgl_del" type="checkbox" id="r_htgl_del" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_htgl_view" type="checkbox" id="r_htgl_view" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">出库申请</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="submod" type="checkbox" id="submod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="subdel" type="checkbox" id="subdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="subview" type="checkbox" id="subview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">员工管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="manmod" type="checkbox" id="manmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="mandel" type="checkbox" id="mandel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="manview" type="checkbox" id="manview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">任务管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="rwmod" type="checkbox" id="rwmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="rwdel" type="checkbox" id="rwdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="rwview" type="checkbox" id="rwview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">费用管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="fymod" type="checkbox" id="fymod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="fydel" type="checkbox" id="fydel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="fyview" type="checkbox" id="fyview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">借款申请</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_jkgl_mod" type="checkbox" id="r_jkgl_mod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_jkgl_del" type="checkbox" id="r_jkgl_del" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_jkgl_view" type="checkbox" id="r_jkgl_view" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">付款申请</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_fksq_mod" type="checkbox" id="r_fksq_mod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_fksq_del" type="checkbox" id="r_fksq_del" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_fksq_view" type="checkbox" id="r_fksq_view" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">退货管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_thmod" type="checkbox" id="r_thmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_thdel" type="checkbox" id="r_thdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_thview" type="checkbox" id="r_thview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">客户服务</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="servermod" type="checkbox" id="servermod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="serverdel" type="checkbox" id="serverdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="serverview" type="checkbox" id="serverview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">维修管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="wxmod" type="checkbox" id="wxmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="wxdel" type="checkbox" id="wxdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="wxview" type="checkbox" id="wxview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">行业政策</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_hyzc_mod" type="checkbox" id="r_hyzc_mod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_hyzc_del" type="checkbox" id="r_hyzc_del" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_hyzc_view" type="checkbox" id="r_hyzc_view" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">媒体宣传</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_mtxc_mod" type="checkbox" id="r_mtxc_mod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_mtxc_del" type="checkbox" id="r_mtxc_del" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_mtxc_view" type="checkbox" id="r_mtxc_view" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">市场活动</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="mactmod" type="checkbox" id="mactmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="mactdel" type="checkbox" id="mactdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="mactview" type="checkbox" id="mactview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">竞争对手</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="jzdsmod" type="checkbox" id="jzdsmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="jzdsdel" type="checkbox" id="jzdsdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="jzdsview" type="checkbox" id="jzdsview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">知 识 库</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="zskmod" type="checkbox" id="zskmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="zskdel" type="checkbox" id="zskdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="zskview" type="checkbox" id="zskview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">往来帐目</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_wlz_mod" type="checkbox" id="r_wlz_mod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_wlz_del" type="checkbox" id="r_wlz_del" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_wlz_view" type="checkbox" id="r_wlz_view" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">付款汇总</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="fkhzmod" type="checkbox" id="fkhzmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="fkhzdel" type="checkbox" id="fkhzdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="fkhzview" type="checkbox" id="fkhzview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">收款汇总</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="skhzmod" type="checkbox" id="skhzmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="skhzdel" type="checkbox" id="skhzdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="skhzview" type="checkbox" id="skhzview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">付款信息</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="fkmod" type="checkbox" id="fkmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="fkdel" type="checkbox" id="fkdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="fkview" type="checkbox" id="fkview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">收款信息</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_skmod" type="checkbox" id="r_skmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_skdel" type="checkbox" id="r_skdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_skview" type="checkbox" id="r_skview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">客户欠款</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="qkmod" type="checkbox" id="qkmod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="qkdel" type="checkbox" id="qkdel" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="qkview" type="checkbox" id="qkview" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><strong><font color="#000000" size="2" face="宋体">退货金额</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_thje_mod" type="checkbox" id="r_thje_mod" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="13%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_thje_del" type="checkbox" id="r_thje_del" value="有">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <input name="r_thje_view" type="checkbox" id="r_thje_view" value="有">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="14%"><font face="宋体" size="2"><strong></strong></font>&nbsp;</td>
      <td width="12%"><font face="宋体" size="2">&nbsp;</font>&nbsp;</td>
      <td width="13%"><font face="宋体" size="2">&nbsp;</font>&nbsp;</td>
      <td width="14%">&nbsp;</td>
    </tr>
    <tr> 
      <td colspan="4"> 
        <div align="center"><font color="#000000" size="2" face="宋体"> 
          <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          　　 </font> <font face="宋体" size="2"> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font>&nbsp;</div>
      </td>
    </tr>
  </table>
  <br>
</form>
</body>
<%}}%>
</html>
<script language=javascript>
function allSelect_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("add") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function allSelect2_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect2.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("zt") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function allSelect3_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect3.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("mod") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function allSelect4_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect4.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("del") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function allSelect5_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect5.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("view") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function allSelect6_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect6.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("_yes") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function qzzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.qzzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("qz") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function xhzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.xhzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("xh") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function linkzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.linkzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("link") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function hzzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.hzzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("hz") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  supzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.supzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("sup") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  actzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.actzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_act") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function opzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.opzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("op") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function quotezt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.quotezt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("quote") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  prozt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.prozt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("pro") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  cgzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.cgzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("cg") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function trzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.trzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("tr") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function hdzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.hdzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("hd") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function workzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.workzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("work") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  xmzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.xmzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("xm") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function subzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.subzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("sub") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  manzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.manzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("man") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function rwzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.rwzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("rw") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function fyzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.fyzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("fy") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function thzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.thzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_th") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  serverzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.serverzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("server") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function tszt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.tszt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("ts") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function wxzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.wxzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("wx") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function mactzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.mactzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("mact") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function jzdszt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.jzdszt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("jzds") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function zskzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.zskzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("zsk") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function flfgzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.flfgzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("flfg") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function zjzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.zjzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("zj") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function fkhzzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.fkhzzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("fkhz") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function skhzzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.skhzzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("skhz") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function fkzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.fkzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("fk") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function skzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.skzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_sk") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function qkzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.qkzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("qk") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function intzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.intzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("int") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  outzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.outzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("out")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_yfglzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_yfglzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_yfgl")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_htgl_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_htgl_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_htgl")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_jkgl_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_jkgl_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_jkgl")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_fksq_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_fksq_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_fksq")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_month_jh_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_month_jh_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_month_jh")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_date_r_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_date_r_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_date_r")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_week_r_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_week_r_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_week_r")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_month_r_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_month_r_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_month_r")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_wlz_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_wlz_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_wlz")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_thje_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_thje_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_thje")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_hyzc_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_hyzc_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_hyzc")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_mtxc_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_mtxc_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_mtxc")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}

</script>
