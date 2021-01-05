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
 String id1=request.getParameter("id");
String sql="select * from restrain_name where id='"+id1+"'";
ResultSet rs=einfodb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
String  r_name=rs.getString("r_name").trim();
String  dept=rs.getString("dept").trim();
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
<form name="form1" method="post" action="do_epunit.jsp"  onSubmit="return isValid();">
  <table width="100%" border="1" cellspacing="0" cellpadding="0" height="286">
    <tr> 
      <td width="15%" height="6" bgcolor="#C1D9FF"><font size="2" color="#000000">编辑 &gt;&gt;</font>&nbsp;</td>
      <td height="6" colspan="3" bgcolor="#C1D9FF"> 
        <div align="right"> </div>
      </td>
    </tr>
    <tr> 
      <td height="2" colspan="4"><b></b> <font color="#000000"><b> 
        <input name="id" type="hidden" id="id" value="<%=id1%>">
        请选择用户</b></font><font size="2"> 
        <select name="username" size="1" id="w_spman">
          <option ><%=r_name%></option>
          <%
  try
  {
    ResultSet rsn=einfodb.executeQuery("select name from username   order by hometel");
    while(rsn.next())
    {
      String name=rsn.getString("name");
      out.println("<option value='"+name+"'>"+name+"</option>");
    }
    rsn.close();
  }catch(Exception e){}
%>
        </select>
        </font><font color="#000000"><b>查看部门</b></font><font size="2" face="Arial, Helvetica, sans-serif"> 
        <select size="1" name="dept">
          <option ><%=dept%></option>
          <%
  try
  {
    ResultSet rsn=einfodb.executeQuery("select departname from department  order  by dept_code  asc");
    while(rsn.next())
    {
      String departname=rsn.getString("departname");
      out.println("<option value='"+departname+"'>"+departname+"</option>");
    }
    rsn.close();
  }catch(Exception e){}
%>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%"> 
        <div align="center"><font face="宋体" size="2"><strong>业务对象</strong></font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font face="宋体" size="2"><strong>修改权限</strong></font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font face="宋体" size="2"><strong>删除权限</strong></font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font face="宋体" size="2"><strong>查看权限</strong></font>&nbsp;</div>
      </td>
    </tr>
    <tr bgcolor="#99FFFF" > 
      <td width="15%"><font face="宋体" size="2">是否全选</font>&nbsp;</td>
      <td width="12%"> 
        <div align="center"><font face="宋体" size="2"> 
          <input type="checkbox" name="allSelect3" value=""      
		     onclick="javascript:allSelect3_onclick();">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"> <font face="宋体" size="2"> 
          <input type="checkbox" name="allSelect4" value=""      
		     onclick="javascript:allSelect4_onclick();">
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"> <font face="宋体" size="2"> 
          <input type="checkbox" name="allSelect5" value=""      
		     onclick="javascript:allSelect5_onclick();">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><b><font color="#000000" size="2" face="宋体">潜在客户</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String qzmod1= ""; String qzmod=rs.getString("qzmod").trim();if(qzmod.equals("有")){qzmod1="checked";}%>
          <input name="qzmod" type="checkbox" id="qzmod" value="有"  <%=qzmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String qzdel1= ""; String qzdel=rs.getString("qzdel").trim();if(qzdel.equals("有")){qzdel1="checked";}%>
          <input name="qzdel" type="checkbox" id="qzdel" value="有" <%=qzdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String qzview1= ""; String qzview=rs.getString("qzview").trim();if(qzview.equals("有")){qzview1="checked";}%>
          <input name="qzview" type="checkbox" id="qzview" value="有" <%=qzview1%> >
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><b><font color="#000000" size="2" face="宋体">现有客户</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String xhmod1= ""; String xhmod=rs.getString("xhmod").trim();if(xhmod.equals("有")){xhmod1="checked";}%>
          <input name="xhmod" type="checkbox" id="xhmod" value="有" <%=xhmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String xhdel1= ""; String xhdel=rs.getString("xhdel").trim();if(xhdel.equals("有")){xhdel1="checked";}%>
          <input name="xhdel" type="checkbox" id="xhdel" value="有" <%=xhdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String xhview1= ""; String xhview=rs.getString("xhview").trim();if(xhview.equals("有")){xhview1="checked";}%>
          <input name="xhview" type="checkbox" id="xhview" value="有" <%=xhview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><b><font color="#000000" size="2" face="宋体">联 系 人</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String linkmod1= ""; String linkmod=rs.getString("linkmod").trim();if(linkmod.equals("有")){linkmod1="checked";}%>
          <input name="linkmod" type="checkbox" id="linkmod" value="有" <%=linkmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String linkdel1= ""; String linkdel=rs.getString("linkdel").trim();if(linkdel.equals("有")){linkdel1="checked";}%>
          <input name="linkdel" type="checkbox" id="linkdel" value="有" <%=linkdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String linkview1= ""; String linkview=rs.getString("linkview").trim();if(linkview.equals("有")){linkview1="checked";}%>
          <input name="linkview" type="checkbox" id="linkview" value="有" <%=linkview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><b><font color="#000000" size="2" face="宋体">合作伙伴</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String hzmod1= ""; String hzmod=rs.getString("hzmod").trim();if(hzmod.equals("有")){hzmod1="checked";}%>
          <input name="hzmod" type="checkbox" id="hzmod" value="有" <%=hzmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String hzdel1= ""; String hzdel=rs.getString("hzdel").trim();if(hzdel.equals("有")){hzdel1="checked";}%>
          <input name="hzdel" type="checkbox" id="hzdel" value="有" <%=hzdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String hzview1= ""; String hzview=rs.getString("hzview").trim();if(hzview.equals("有")){hzview1="checked";}%>
          <input name="hzview" type="checkbox" id="hzview" value="有" <%=hzview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><b><font color="#000000" size="2" face="宋体">供 应 商</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String supmod1= ""; String supmod=rs.getString("supmod").trim();if(supmod.equals("有")){supmod1="checked";}%>
          <input name="supmod" type="checkbox" id="supmod" value="有" <%=supmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String supdel1= ""; String supdel=rs.getString("supdel").trim();if(supdel.equals("有")){supdel1="checked";}%>
          <input name="supdel" type="checkbox" id="supdel" value="有" <%=supdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String supview1= ""; String supview=rs.getString("supview").trim();if(supview.equals("有")){supview1="checked";}%>
          <input name="supview" type="checkbox" id="supview" value="有" <%=supview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%" height="24"><b><font color="#000000" size="2" face="宋体">活动管理</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String actmod1= ""; String actmod=rs.getString("actmod").trim();if(actmod.equals("有")){actmod1="checked";}%>
          <input name="r_actmod" type="checkbox" id="r_actmod" value="有" <%=actmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String actdel1= ""; String actdel=rs.getString("actdel").trim();if(actdel.equals("有")){actdel1="checked";}%>
          <input name="r_actdel" type="checkbox" id="r_actdel" value="有" <%=actdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String actview1= ""; String actview=rs.getString("actview").trim();if(actview.equals("有")){actview1="checked";}%>
          <input name="r_actview" type="checkbox" id="r_actview" value="有" <%=actview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><b><font color="#000000" size="2" face="宋体">销售机会</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String opmod1= ""; String opmod=rs.getString("opmod").trim();if(opmod.equals("有")){opmod1="checked";}%>
          <input name="opmod" type="checkbox" id="opmod" value="有" <%=opmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String opdel1= ""; String opdel=rs.getString("opdel").trim();if(opdel.equals("有")){opdel1="checked";}%>
          <input name="opdel" type="checkbox" id="opdel" value="有" <%=opdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String opview1= ""; String opview=rs.getString("opview").trim();if(opview.equals("有")){opview1="checked";}%>
          <input name="opview" type="checkbox" id="opview" value="有" <%=opview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><b><font color="#000000" size="2" face="宋体">客户报价</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String quotemod1= ""; String quotemod=rs.getString("quotemod").trim();if(quotemod.equals("有")){quotemod1="checked";}%>
          <input name="quotemod" type="checkbox" id="quotemod" value="有" <%=quotemod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String quotedel1= ""; String quotedel=rs.getString("quotedel").trim();if(quotedel.equals("有")){quotedel1="checked";}%>
          <input name="quotedel" type="checkbox" id="quotedel" value="有" <%=quotedel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String quoteview1= ""; String quoteview=rs.getString("quoteview").trim();if(quoteview.equals("有")){quoteview1="checked";}%>
          <input name="quoteview" type="checkbox" id="quoteview" value="有" <%=quoteview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">采购管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String cgmod1= ""; String cgmod=rs.getString("cgmod").trim();if(cgmod.equals("有")){cgmod1="checked";}%>
          <input name="cgmod" type="checkbox" id="cgmod" value="有" <%=cgmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String cgdel1= ""; String cgdel=rs.getString("cgdel").trim();if(cgdel.equals("有")){cgdel1="checked";}%>
          <input name="cgdel" type="checkbox" id="cgdel" value="有" <%=cgdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String cgview1= ""; String cgview=rs.getString("cgview").trim();if(cgview.equals("有")){cgview1="checked";}%>
          <input name="cgview" type="checkbox" id="cgview" value="有" <%=cgview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">发运管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String trmod1= ""; String trmod=rs.getString("trmod").trim();if(trmod.equals("有")){trmod1="checked";}%>
          <input name="trmod" type="checkbox" id="trmod" value="有" <%=trmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String trdel1= ""; String trdel=rs.getString("trdel").trim();if(trdel.equals("有")){trdel1="checked";}%>
          <input name="trdel" type="checkbox" id="trdel" value="有" <%=trdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String trview1= ""; String trview=rs.getString("trview").trim();if(trview.equals("有")){trview1="checked";}%>
          <input name="trview" type="checkbox" id="trview" value="有" <%=trview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">货代公司</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String hdmod1= ""; String hdmod=rs.getString("hdmod").trim();if(hdmod.equals("有")){hdmod1="checked";}%>
          <input name="hdmod" type="checkbox" id="hdmod" value="有" <%=hdmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String hddel1= ""; String hddel=rs.getString("hddel").trim();if(hddel.equals("有")){hddel1="checked";}%>
          <input name="hddel" type="checkbox" id="hddel" value="有" <%=hddel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String hdview1= ""; String hdview=rs.getString("hdview").trim();if(hdview.equals("有")){hdview1="checked";}%>
          <input name="hdview" type="checkbox" id="hdview" value="有" <%=hdview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">运费管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_yfglmod1= ""; String r_yfglmod=rs.getString("r_yfglmod").trim();if(r_yfglmod.equals("有")){r_yfglmod1="checked";}%>
          <input name="r_yfglmod" type="checkbox" id="r_yfglmod" value="有" <%=r_yfglmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_yfgldel1= ""; String r_yfgldel=rs.getString("r_yfgldel").trim();if(r_yfgldel.equals("有")){r_yfgldel1="checked";}%>
          <input name="r_yfgldel" type="checkbox" id="r_yfgldel" value="有" <%=r_yfgldel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_yfglview1= ""; String r_yfglview=rs.getString("r_yfglview").trim();if(r_yfglview.equals("有")){r_yfglview1="checked";}%>
          <input name="r_yfglview" type="checkbox" id="r_yfglview" value="有" <%=r_yfglview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">周 计 划<font size="2"></font></font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String workmod1= ""; String workmod=rs.getString("workmod").trim();if(workmod.equals("有")){workmod1="checked";}%>
          <input name="workmod" type="checkbox" id="workmod" value="有" <%=workmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String workdel1= ""; String workdel=rs.getString("workdel").trim();if(workdel.equals("有")){workdel1="checked";}%>
          <input name="workdel" type="checkbox" id="workdel" value="有" <%=workdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String workview1= ""; String workview=rs.getString("workview").trim();if(workview.equals("有")){workview1="checked";}%>
          <input name="workview" type="checkbox" id="workview" value="有" <%=workview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">月 计 划</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_month_jh_mod1= ""; String r_month_jh_mod=rs.getString("r_month_jh_mod").trim();if(r_month_jh_mod.equals("有")){r_month_jh_mod1="checked";}%>
          <input name="r_month_jh_mod" type="checkbox" id="r_month_jh_mod" value="有" <%=r_month_jh_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_month_jh_del1= ""; String r_month_jh_del=rs.getString("r_month_jh_del").trim();if(r_month_jh_del.equals("有")){r_month_jh_del1="checked";}%>
          <input name="r_month_jh_del" type="checkbox" id="r_month_jh_del" value="有" <%=r_month_jh_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_month_jh_view1= ""; String r_month_jh_view=rs.getString("r_month_jh_view").trim();if(r_month_jh_view.equals("有")){r_month_jh_view1="checked";}%>
          <input name="r_month_jh_view" type="checkbox" id="r_month_jh_view" value="有" <%=r_month_jh_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">日 报 表</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_date_r_mod1= ""; String r_date_r_mod=rs.getString("r_date_r_mod").trim();if(r_date_r_mod.equals("有")){r_date_r_mod1="checked";}%>
          <input name="r_date_r_mod" type="checkbox" id="r_date_r_mod" value="有" <%=r_date_r_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_date_r_del1= ""; String r_date_r_del=rs.getString("r_date_r_del").trim();if(r_date_r_del.equals("有")){r_date_r_del1="checked";}%>
          <input name="r_date_r_del" type="checkbox" id="r_date_r_del" value="有" <%=r_date_r_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_date_r_view1= ""; String r_date_r_view=rs.getString("r_date_r_view").trim();if(r_date_r_view.equals("有")){r_date_r_view1="checked";}%>
          <input name="r_date_r_view" type="checkbox" id="r_date_r_view" value="有" <%=r_date_r_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">周 报 表</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_week_r_mod1= ""; String r_week_r_mod=rs.getString("r_week_r_mod").trim();if(r_week_r_mod.equals("有")){r_week_r_mod1="checked";}%>
          <input name="r_week_r_mod" type="checkbox" id="r_week_r_mod" value="有" <%=r_week_r_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_week_r_del1= ""; String r_week_r_del=rs.getString("r_week_r_del").trim();if(r_week_r_del.equals("有")){r_week_r_del1="checked";}%>
          <input name="r_week_r_del" type="checkbox" id="r_week_r_del" value="有" <%=r_week_r_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_week_r_view1= ""; String r_week_r_view=rs.getString("r_week_r_view").trim();if(r_week_r_view.equals("有")){r_week_r_view1="checked";}%>
          <input name="r_week_r_view" type="checkbox" id="r_week_r_view" value="有" <%=r_week_r_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">月 报 表</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_month_r_mod1= ""; String r_month_r_mod=rs.getString("r_month_r_mod").trim();if(r_month_r_mod.equals("有")){r_month_r_mod1="checked";}%>
          <input name="r_month_r_mod" type="checkbox" id="r_month_r_mod" value="有" <%=r_month_r_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_month_r_del1= ""; String r_month_r_del=rs.getString("r_month_r_del").trim();if(r_month_r_del.equals("有")){r_month_r_del1="checked";}%>
          <input name="r_month_r_del" type="checkbox" id="r_month_r_del" value="有" <%=r_month_r_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_month_r_view1= ""; String r_month_r_view=rs.getString("r_month_r_view").trim();if(r_month_r_view.equals("有")){r_month_r_view1="checked";}%>
          <input name="r_month_r_view" type="checkbox" id="r_month_r_view" value="有" <%=r_month_r_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">项目管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String xmmod1= ""; String xmmod=rs.getString("xmmod").trim();if(xmmod.equals("有")){xmmod1="checked";}%>
          <input name="xmmod" type="checkbox" id="xmmod" value="有" <%=xmmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String xmdel1= ""; String xmdel=rs.getString("xmdel").trim();if(xmdel.equals("有")){xmdel1="checked";}%>
          <input name="xmdel" type="checkbox" id="xmdel" value="有" <%=xmdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String xmview1= ""; String xmview=rs.getString("xmview").trim();if(xmview.equals("有")){xmview1="checked";}%>
          <input name="xmview" type="checkbox" id="xmview" value="有" <%=xmview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">合同管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_htgl_mod1= ""; String r_htgl_mod=rs.getString("r_htgl_mod").trim();if(r_htgl_mod.equals("有")){r_htgl_mod1="checked";}%>
          <input name="r_htgl_mod" type="checkbox" id="r_htgl_mod" value="有" <%=r_htgl_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_htgl_del1= ""; String r_htgl_del=rs.getString("r_htgl_del").trim();if(r_htgl_del.equals("有")){r_htgl_del1="checked";}%>
          <input name="r_htgl_del" type="checkbox" id="r_htgl_del" value="有" <%=r_htgl_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_htgl_view1= ""; String r_htgl_view=rs.getString("r_htgl_view").trim();if(r_htgl_view.equals("有")){r_htgl_view1="checked";}%>
          <input name="r_htgl_view" type="checkbox" id="r_htgl_view" value="有" <%=r_htgl_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">销售出库</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String submod1= ""; String submod=rs.getString("submod").trim();if(submod.equals("有")){submod1="checked";}%>
          <input name="submod" type="checkbox" id="submod" value="有" <%=submod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String subdel1= ""; String subdel=rs.getString("subdel").trim();if(subdel.equals("有")){subdel1="checked";}%>
          <input name="subdel" type="checkbox" id="subdel" value="有" <%=subdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String subview1= ""; String subview=rs.getString("subview").trim();if(subview.equals("有")){subview1="checked";}%>
          <input name="subview" type="checkbox" id="subview" value="有" <%=subview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">员工管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String manmod1= ""; String manmod=rs.getString("manmod").trim();if(manmod.equals("有")){manmod1="checked";}%>
          <input name="manmod" type="checkbox" id="manmod" value="有" <%=manmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String mandel1= ""; String mandel=rs.getString("mandel").trim();if(mandel.equals("有")){mandel1="checked";}%>
          <input name="mandel" type="checkbox" id="mandel" value="有" <%=mandel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String manview1= ""; String manview=rs.getString("manview").trim();if(manview.equals("有")){manview1="checked";}%>
          <input name="manview" type="checkbox" id="manview" value="有" <%=manview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">任务管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String rwmod1= ""; String rwmod=rs.getString("rwmod").trim();if(rwmod.equals("有")){rwmod1="checked";}%>
          <input name="rwmod" type="checkbox" id="rwmod" value="有" <%=rwmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String rwdel1= ""; String rwdel=rs.getString("rwdel").trim();if(rwdel.equals("有")){rwdel1="checked";}%>
          <input name="rwdel" type="checkbox" id="rwdel" value="有" <%=rwdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String rwview1= ""; String rwview=rs.getString("rwview").trim();if(rwview.equals("有")){rwview1="checked";}%>
          <input name="rwview" type="checkbox" id="rwview" value="有" <%=rwview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">费用管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String fymod1= ""; String fymod=rs.getString("fymod").trim();if(fymod.equals("有")){fymod1="checked";}%>
          <input name="fymod" type="checkbox" id="fymod" value="有" <%=fymod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String fydel1= ""; String fydel=rs.getString("fydel").trim();if(fydel.equals("有")){fydel1="checked";}%>
          <input name="fydel" type="checkbox" id="fydel" value="有" <%=fydel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String fyview1= ""; String fyview=rs.getString("fyview").trim();if(fyview.equals("有")){fyview1="checked";}%>
          <input name="fyview" type="checkbox" id="fyview" value="有" <%=fyview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">借款申请</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_jkgl_mod1= ""; String r_jkgl_mod=rs.getString("r_jkgl_mod").trim();if(r_jkgl_mod.equals("有")){r_jkgl_mod1="checked";}%>
          <input name="r_jkgl_mod" type="checkbox" id="r_jkgl_mod" value="有" <%=r_jkgl_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_jkgl_del1= ""; String r_jkgl_del=rs.getString("r_jkgl_del").trim();if(r_jkgl_del.equals("有")){r_jkgl_del1="checked";}%>
          <input name="r_jkgl_del" type="checkbox" id="r_jkgl_del" value="有" <%=r_jkgl_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_jkgl_view1= ""; String r_jkgl_view=rs.getString("r_jkgl_view").trim();if(r_jkgl_view.equals("有")){r_jkgl_view1="checked";}%>
          <input name="r_jkgl_view" type="checkbox" id="r_jkgl_view" value="有" <%=r_jkgl_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">付款申请</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_fksq_mod1= ""; String r_fksq_mod=rs.getString("r_fksq_mod").trim();if(r_fksq_mod.equals("有")){r_fksq_mod1="checked";}%>
          <input name="r_fksq_mod" type="checkbox" id="r_fksq_mod" value="有" <%=r_fksq_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_fksq_del1= ""; String r_fksq_del=rs.getString("r_fksq_del").trim();if(r_fksq_del.equals("有")){r_fksq_del1="checked";}%>
          <input name="r_fksq_del" type="checkbox" id="r_fksq_del" value="有" <%=r_fksq_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_fksq_view1= ""; String r_fksq_view=rs.getString("r_fksq_view").trim();if(r_fksq_view.equals("有")){r_fksq_view1="checked";}%>
          <input name="r_fksq_view" type="checkbox" id="r_fksq_view" value="有" <%=r_fksq_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">退货管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String thmod1= ""; String thmod=rs.getString("thmod").trim();if(thmod.equals("有")){thmod1="checked";}%>
          <input name="r_thmod" type="checkbox" id="r_thmod" value="有" <%=thmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String thdel1= ""; String thdel=rs.getString("thdel").trim();if(thdel.equals("有")){thdel1="checked";}%>
          <input name="r_thdel" type="checkbox" id="r_thdel" value="有" <%=thdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String thview1= ""; String thview=rs.getString("thview").trim();if(thview.equals("有")){thview1="checked";}%>
          <input name="r_thview" type="checkbox" id="thview2" value="有" <%=thview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">客户服务</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String servermod1= ""; String servermod=rs.getString("servermod").trim();if(servermod.equals("有")){servermod1="checked";}%>
          <input name="servermod" type="checkbox" id="servermod" value="有" <%=servermod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String serverdel1= ""; String serverdel=rs.getString("serverdel").trim();if(serverdel.equals("有")){serverdel1="checked";}%>
          <input name="serverdel" type="checkbox" id="serverdel" value="有" <%=serverdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String serverview1= ""; String serverview=rs.getString("serverview").trim();if(serverview.equals("有")){serverview1="checked";}%>
          <input name="serverview" type="checkbox" id="serverview" value="有" <%=serverview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">客户投诉</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String tsmod1= ""; String tsmod=rs.getString("tsmod").trim();if(tsmod.equals("有")){tsmod1="checked";}%>
          <input name="tsmod" type="checkbox" id="tsmod" value="有" <%=tsmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String tsdel1= ""; String tsdel=rs.getString("tsdel").trim();if(tsdel.equals("有")){tsdel1="checked";}%>
          <input name="tsdel" type="checkbox" id="tsdel" value="有" <%=tsdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String tsview1= ""; String tsview=rs.getString("tsview").trim();if(tsview.equals("有")){tsview1="checked";}%>
          <input name="tsview" type="checkbox" id="tsview" value="有" <%=tsview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">维修管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String wxmod1= ""; String wxmod=rs.getString("wxmod").trim();if(wxmod.equals("有")){wxmod1="checked";}%>
          <input name="wxmod" type="checkbox" id="wxmod" value="有" <%=wxmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String wxdel1= ""; String wxdel=rs.getString("wxdel").trim();if(wxdel.equals("有")){wxdel1="checked";}%>
          <input name="wxdel" type="checkbox" id="wxdel" value="有" <%=wxdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String wxview1= ""; String wxview=rs.getString("wxview").trim();if(wxview.equals("有")){wxview1="checked";}%>
          <input name="wxview" type="checkbox" id="wxview" value="有" <%=wxview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">行业政策</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_hyzc_mod1= ""; String r_hyzc_mod=rs.getString("r_hyzc_mod").trim();if(r_hyzc_mod.equals("有")){r_hyzc_mod1="checked";}%>
          <input name="r_hyzc_mod" type="checkbox" id="r_hyzc_mod" value="有" <%=r_hyzc_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_hyzc_del1= ""; String r_hyzc_del=rs.getString("r_hyzc_del").trim();if(r_hyzc_del.equals("有")){r_hyzc_del1="checked";}%>
          <input name="r_hyzc_del" type="checkbox" id="r_hyzc_del" value="有" <%=r_hyzc_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_hyzc_view1= ""; String r_hyzc_view=rs.getString("r_hyzc_view").trim();if(r_hyzc_view.equals("有")){r_hyzc_view1="checked";}%>
          <input name="r_hyzc_view" type="checkbox" id="r_hyzc_view" value="有" <%=r_hyzc_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">媒体宣传</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_mtxc_mod1= ""; String r_mtxc_mod=rs.getString("r_mtxc_mod").trim();if(r_mtxc_mod.equals("有")){r_mtxc_mod1="checked";}%>
          <input name="r_mtxc_mod" type="checkbox" id="r_mtxc_mod" value="有" <%=r_mtxc_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_mtxc_del1= ""; String r_mtxc_del=rs.getString("r_mtxc_del").trim();if(r_mtxc_del.equals("有")){r_mtxc_del1="checked";}%>
          <input name="r_mtxc_del" type="checkbox" id="r_mtxc_del" value="有" <%=r_mtxc_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_mtxc_view1= ""; String r_mtxc_view=rs.getString("r_mtxc_view").trim();if(r_mtxc_view.equals("有")){r_mtxc_view1="checked";}%>
          <input name="r_mtxc_view" type="checkbox" id="r_mtxc_view" value="有" <%=r_mtxc_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">市场活动</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String mactmod1= ""; String mactmod=rs.getString("mactmod").trim();if(mactmod.equals("有")){mactmod1="checked";}%>
          <input name="mactmod" type="checkbox" id="mactmod" value="有" <%=mactmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String mactdel1= ""; String mactdel=rs.getString("mactdel").trim();if(mactdel.equals("有")){mactdel1="checked";}%>
          <input name="mactdel" type="checkbox" id="mactdel" value="有" <%=mactdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String mactview1= ""; String mactview=rs.getString("mactview").trim();if(mactview.equals("有")){mactview1="checked";}%>
          <input name="mactview" type="checkbox" id="mactview" value="有" <%=mactview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">竞争对手</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String jzdsmod1= ""; String jzdsmod=rs.getString("jzdsmod").trim();if(jzdsmod.equals("有")){jzdsmod1="checked";}%>
          <input name="jzdsmod" type="checkbox" id="jzdsmod" value="有" <%=jzdsmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String jzdsdel1= ""; String jzdsdel=rs.getString("jzdsdel").trim();if(jzdsdel.equals("有")){jzdsdel1="checked";}%>
          <input name="jzdsdel" type="checkbox" id="jzdsdel" value="有" <%=jzdsdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String jzdsview1= ""; String jzdsview=rs.getString("jzdsview").trim();if(jzdsview.equals("有")){jzdsview1="checked";}%>
          <input name="jzdsview" type="checkbox" id="jzdsview" value="有" <%=jzdsview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">知 识 库</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String zskmod1= ""; String zskmod=rs.getString("zskmod").trim();if(zskmod.equals("有")){zskmod1="checked";}%>
          <input name="zskmod" type="checkbox" id="zskmod" value="有" <%=zskmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String zskdel1= ""; String zskdel=rs.getString("zskdel").trim();if(zskdel.equals("有")){zskdel1="checked";}%>
          <input name="zskdel" type="checkbox" id="zskdel" value="有" <%=zskdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String zskview1= ""; String zskview=rs.getString("zskview").trim();if(zskview.equals("有")){zskview1="checked";}%>
          <input name="zskview" type="checkbox" id="zskview" value="有" <%=zskview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">法律法规</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String flfgmod1= ""; String flfgmod=rs.getString("flfgmod").trim();if(flfgmod.equals("有")){flfgmod1="checked";}%>
          <input name="flfgmod" type="checkbox" id="flfgmod" value="有" <%=flfgmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String flfgdel1= ""; String flfgdel=rs.getString("flfgdel").trim();if(flfgdel.equals("有")){flfgdel1="checked";}%>
          <input name="flfgdel" type="checkbox" id="flfgdel" value="有" <%=flfgdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String flfgview1= ""; String flfgview=rs.getString("flfgview").trim();if(flfgview.equals("有")){flfgview1="checked";}%>
          <input name="flfgview" type="checkbox" id="flfgview" value="有" <%=flfgview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">往来帐目</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_wlz_mod1= ""; String r_wlz_mod=rs.getString("r_wlz_mod").trim();if(r_wlz_mod.equals("有")){r_wlz_mod1="checked";}%>
          <input name="r_wlz_mod" type="checkbox" id="r_wlz_mod" value="有" <%=r_wlz_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_wlz_del1= ""; String r_wlz_del=rs.getString("r_wlz_del").trim();if(r_wlz_del.equals("有")){r_wlz_del1="checked";}%>
          <input name="r_wlz_del" type="checkbox" id="r_wlz_del" value="有" <%=r_wlz_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_wlz_view1= ""; String r_wlz_view=rs.getString("r_wlz_view").trim();if(r_wlz_view.equals("有")){r_wlz_view1="checked";}%>
          <input name="r_wlz_view" type="checkbox" id="r_wlz_view" value="有" <%=r_wlz_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">资金管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String zjmod1= ""; String zjmod=rs.getString("zjmod").trim();if(zjmod.equals("有")){zjmod1="checked";}%>
          <input name="zjmod" type="checkbox" id="zjmod" value="有" <%=zjmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String zjdel1= ""; String zjdel=rs.getString("zjdel").trim();if(zjdel.equals("有")){zjdel1="checked";}%>
          <input name="zjdel" type="checkbox" id="zjdel" value="有" <%=zjdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String zjview1= ""; String zjview=rs.getString("zjview").trim();if(zjview.equals("有")){zjview1="checked";}%>
          <input name="zjview" type="checkbox" id="zjview" value="有" <%=zjview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">付款汇总</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String fkhzmod1= ""; String fkhzmod=rs.getString("fkhzmod").trim();if(fkhzmod.equals("有")){fkhzmod1="checked";}%>
          <input name="fkhzmod" type="checkbox" id="fkhzmod" value="有" <%=fkhzmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String fkhzdel1= ""; String fkhzdel=rs.getString("fkhzdel").trim();if(fkhzdel.equals("有")){fkhzdel1="checked";}%>
          <input name="fkhzdel" type="checkbox" id="fkhzdel" value="有" <%=fkhzdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String fkhzview1= ""; String fkhzview=rs.getString("fkhzview").trim();if(fkhzview.equals("有")){fkhzview1="checked";}%>
          <input name="fkhzview" type="checkbox" id="fkhzview" value="有" <%=fkhzview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">收款汇总</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String skhzmod1= ""; String skhzmod=rs.getString("skhzmod").trim();if(skhzmod.equals("有")){skhzmod1="checked";}%>
          <input name="skhzmod" type="checkbox" id="skhzmod" value="有" <%=skhzmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String skhzdel1= ""; String skhzdel=rs.getString("skhzdel").trim();if(skhzdel.equals("有")){skhzdel1="checked";}%>
          <input name="skhzdel" type="checkbox" id="skhzdel" value="有" <%=skhzdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String skhzview1= ""; String skhzview=rs.getString("skhzview").trim();if(skhzview.equals("有")){skhzview1="checked";}%>
          <input name="skhzview" type="checkbox" id="skhzview" value="有" <%=skhzview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">付款信息</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String fkmod1= ""; String fkmod=rs.getString("fkmod").trim();if(fkmod.equals("有")){fkmod1="checked";}%>
          <input name="fkmod" type="checkbox" id="fkmod" value="有" <%=fkmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String fkdel1= ""; String fkdel=rs.getString("fkdel").trim();if(fkdel.equals("有")){fkdel1="checked";}%>
          <input name="fkdel" type="checkbox" id="fkdel" value="有" <%=fkdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String fkview1= ""; String fkview=rs.getString("fkview").trim();if(fkview.equals("有")){fkview1="checked";}%>
          <input name="fkview" type="checkbox" id="fkview" value="有" <%=fkview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">收款信息</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String skmod1= ""; String skmod=rs.getString("skmod").trim();if(skmod.equals("有")){skmod1="checked";}%>
          <input name="r_skmod" type="checkbox" id="r_skmod" value="有" <%=skmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String skdel1= ""; String skdel=rs.getString("skdel").trim();if(skdel.equals("有")){skdel1="checked";}%>
          <input name="r_skdel" type="checkbox" id="r_skdel" value="有" <%=skdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String skview1= ""; String skview=rs.getString("skview").trim();if(skview.equals("有")){skview1="checked";}%>
          <input name="r_skview" type="checkbox" id="r_skview" value="有" <%=skview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">客户欠款</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String qkmod1= ""; String qkmod=rs.getString("qkmod").trim();if(qkmod.equals("有")){qkmod1="checked";}%>
          <input name="qkmod" type="checkbox" id="qkmod" value="有" <%=qkmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String qkdel1= ""; String qkdel=rs.getString("qkdel").trim();if(qkdel.equals("有")){qkdel1="checked";}%>
          <input name="qkdel" type="checkbox" id="qkdel" value="有" <%=qkdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String qkview1= ""; String qkview=rs.getString("qkview").trim();if(qkview.equals("有")){qkview1="checked";}%>
          <input name="qkview" type="checkbox" id="qkview" value="有" <%=qkview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="宋体">退货金额<font size="2"></font></font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_thje_mod1= ""; String r_thje_mod=rs.getString("r_thje_mod").trim();if(r_thje_mod.equals("有")){r_thje_mod1="checked";}%>
          <input name="r_thje_mod" type="checkbox" id="r_thje_mod" value="有" <%=r_thje_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_thje_del1= ""; String r_thje_del=rs.getString("r_thje_del").trim();if(r_thje_del.equals("有")){r_thje_del1="checked";}%>
          <input name="r_thje_del" type="checkbox" id="r_thje_del" value="有" <%=r_thje_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="宋体"> 
          <% String r_thje_view1= ""; String r_thje_view=rs.getString("r_thje_view").trim();if(r_thje_view.equals("有")){r_thje_view1="checked";}%>
          <input name="r_thje_view" type="checkbox" id="r_thje_view" value="有" <%=r_thje_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><font face="宋体" size="2"><strong></strong></font>&nbsp;</td>
      <td width="12%"><font face="宋体" size="2">&nbsp;</font>&nbsp;</td>
      <td width="14%"><font face="宋体" size="2">&nbsp;</font>&nbsp;</td>
      <td width="12%">&nbsp;</td>
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
     if (document.form1.elements[i].name.indexOf("yes") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

</script>
