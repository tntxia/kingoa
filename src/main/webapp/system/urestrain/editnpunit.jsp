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
<title>Ȩ���Զ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function isValid(){
    if(form1.restrain_name.value==""){
        alert("������Ȩ����!");
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
      <td width="15%" height="6" bgcolor="#C1D9FF"><font size="2" color="#000000">�༭ &gt;&gt;</font>&nbsp;</td>
      <td height="6" colspan="3" bgcolor="#C1D9FF"> 
        <div align="right"> </div>
      </td>
    </tr>
    <tr> 
      <td height="2" colspan="4"><b></b> <font color="#000000"><b> 
        <input name="id" type="hidden" id="id" value="<%=id1%>">
        ��ѡ���û�</b></font><font size="2"> 
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
        </font><font color="#000000"><b>�鿴����</b></font><font size="2" face="Arial, Helvetica, sans-serif"> 
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
        <div align="center"><font face="����" size="2"><strong>ҵ�����</strong></font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font face="����" size="2"><strong>�޸�Ȩ��</strong></font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font face="����" size="2"><strong>ɾ��Ȩ��</strong></font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font face="����" size="2"><strong>�鿴Ȩ��</strong></font>&nbsp;</div>
      </td>
    </tr>
    <tr bgcolor="#99FFFF" > 
      <td width="15%"><font face="����" size="2">�Ƿ�ȫѡ</font>&nbsp;</td>
      <td width="12%"> 
        <div align="center"><font face="����" size="2"> 
          <input type="checkbox" name="allSelect3" value=""      
		     onclick="javascript:allSelect3_onclick();">
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"> <font face="����" size="2"> 
          <input type="checkbox" name="allSelect4" value=""      
		     onclick="javascript:allSelect4_onclick();">
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"> <font face="����" size="2"> 
          <input type="checkbox" name="allSelect5" value=""      
		     onclick="javascript:allSelect5_onclick();">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><b><font color="#000000" size="2" face="����">Ǳ�ڿͻ�</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String qzmod1= ""; String qzmod=rs.getString("qzmod").trim();if(qzmod.equals("��")){qzmod1="checked";}%>
          <input name="qzmod" type="checkbox" id="qzmod" value="��"  <%=qzmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String qzdel1= ""; String qzdel=rs.getString("qzdel").trim();if(qzdel.equals("��")){qzdel1="checked";}%>
          <input name="qzdel" type="checkbox" id="qzdel" value="��" <%=qzdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String qzview1= ""; String qzview=rs.getString("qzview").trim();if(qzview.equals("��")){qzview1="checked";}%>
          <input name="qzview" type="checkbox" id="qzview" value="��" <%=qzview1%> >
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><b><font color="#000000" size="2" face="����">���пͻ�</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String xhmod1= ""; String xhmod=rs.getString("xhmod").trim();if(xhmod.equals("��")){xhmod1="checked";}%>
          <input name="xhmod" type="checkbox" id="xhmod" value="��" <%=xhmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String xhdel1= ""; String xhdel=rs.getString("xhdel").trim();if(xhdel.equals("��")){xhdel1="checked";}%>
          <input name="xhdel" type="checkbox" id="xhdel" value="��" <%=xhdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String xhview1= ""; String xhview=rs.getString("xhview").trim();if(xhview.equals("��")){xhview1="checked";}%>
          <input name="xhview" type="checkbox" id="xhview" value="��" <%=xhview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><b><font color="#000000" size="2" face="����">�� ϵ ��</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String linkmod1= ""; String linkmod=rs.getString("linkmod").trim();if(linkmod.equals("��")){linkmod1="checked";}%>
          <input name="linkmod" type="checkbox" id="linkmod" value="��" <%=linkmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String linkdel1= ""; String linkdel=rs.getString("linkdel").trim();if(linkdel.equals("��")){linkdel1="checked";}%>
          <input name="linkdel" type="checkbox" id="linkdel" value="��" <%=linkdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String linkview1= ""; String linkview=rs.getString("linkview").trim();if(linkview.equals("��")){linkview1="checked";}%>
          <input name="linkview" type="checkbox" id="linkview" value="��" <%=linkview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><b><font color="#000000" size="2" face="����">�������</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String hzmod1= ""; String hzmod=rs.getString("hzmod").trim();if(hzmod.equals("��")){hzmod1="checked";}%>
          <input name="hzmod" type="checkbox" id="hzmod" value="��" <%=hzmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String hzdel1= ""; String hzdel=rs.getString("hzdel").trim();if(hzdel.equals("��")){hzdel1="checked";}%>
          <input name="hzdel" type="checkbox" id="hzdel" value="��" <%=hzdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String hzview1= ""; String hzview=rs.getString("hzview").trim();if(hzview.equals("��")){hzview1="checked";}%>
          <input name="hzview" type="checkbox" id="hzview" value="��" <%=hzview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><b><font color="#000000" size="2" face="����">�� Ӧ ��</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String supmod1= ""; String supmod=rs.getString("supmod").trim();if(supmod.equals("��")){supmod1="checked";}%>
          <input name="supmod" type="checkbox" id="supmod" value="��" <%=supmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String supdel1= ""; String supdel=rs.getString("supdel").trim();if(supdel.equals("��")){supdel1="checked";}%>
          <input name="supdel" type="checkbox" id="supdel" value="��" <%=supdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String supview1= ""; String supview=rs.getString("supview").trim();if(supview.equals("��")){supview1="checked";}%>
          <input name="supview" type="checkbox" id="supview" value="��" <%=supview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%" height="24"><b><font color="#000000" size="2" face="����">�����</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String actmod1= ""; String actmod=rs.getString("actmod").trim();if(actmod.equals("��")){actmod1="checked";}%>
          <input name="r_actmod" type="checkbox" id="r_actmod" value="��" <%=actmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String actdel1= ""; String actdel=rs.getString("actdel").trim();if(actdel.equals("��")){actdel1="checked";}%>
          <input name="r_actdel" type="checkbox" id="r_actdel" value="��" <%=actdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String actview1= ""; String actview=rs.getString("actview").trim();if(actview.equals("��")){actview1="checked";}%>
          <input name="r_actview" type="checkbox" id="r_actview" value="��" <%=actview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><b><font color="#000000" size="2" face="����">���ۻ���</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String opmod1= ""; String opmod=rs.getString("opmod").trim();if(opmod.equals("��")){opmod1="checked";}%>
          <input name="opmod" type="checkbox" id="opmod" value="��" <%=opmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String opdel1= ""; String opdel=rs.getString("opdel").trim();if(opdel.equals("��")){opdel1="checked";}%>
          <input name="opdel" type="checkbox" id="opdel" value="��" <%=opdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String opview1= ""; String opview=rs.getString("opview").trim();if(opview.equals("��")){opview1="checked";}%>
          <input name="opview" type="checkbox" id="opview" value="��" <%=opview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><b><font color="#000000" size="2" face="����">�ͻ�����</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String quotemod1= ""; String quotemod=rs.getString("quotemod").trim();if(quotemod.equals("��")){quotemod1="checked";}%>
          <input name="quotemod" type="checkbox" id="quotemod" value="��" <%=quotemod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String quotedel1= ""; String quotedel=rs.getString("quotedel").trim();if(quotedel.equals("��")){quotedel1="checked";}%>
          <input name="quotedel" type="checkbox" id="quotedel" value="��" <%=quotedel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String quoteview1= ""; String quoteview=rs.getString("quoteview").trim();if(quoteview.equals("��")){quoteview1="checked";}%>
          <input name="quoteview" type="checkbox" id="quoteview" value="��" <%=quoteview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�ɹ�����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String cgmod1= ""; String cgmod=rs.getString("cgmod").trim();if(cgmod.equals("��")){cgmod1="checked";}%>
          <input name="cgmod" type="checkbox" id="cgmod" value="��" <%=cgmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String cgdel1= ""; String cgdel=rs.getString("cgdel").trim();if(cgdel.equals("��")){cgdel1="checked";}%>
          <input name="cgdel" type="checkbox" id="cgdel" value="��" <%=cgdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String cgview1= ""; String cgview=rs.getString("cgview").trim();if(cgview.equals("��")){cgview1="checked";}%>
          <input name="cgview" type="checkbox" id="cgview" value="��" <%=cgview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">���˹���</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String trmod1= ""; String trmod=rs.getString("trmod").trim();if(trmod.equals("��")){trmod1="checked";}%>
          <input name="trmod" type="checkbox" id="trmod" value="��" <%=trmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String trdel1= ""; String trdel=rs.getString("trdel").trim();if(trdel.equals("��")){trdel1="checked";}%>
          <input name="trdel" type="checkbox" id="trdel" value="��" <%=trdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String trview1= ""; String trview=rs.getString("trview").trim();if(trview.equals("��")){trview1="checked";}%>
          <input name="trview" type="checkbox" id="trview" value="��" <%=trview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">������˾</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String hdmod1= ""; String hdmod=rs.getString("hdmod").trim();if(hdmod.equals("��")){hdmod1="checked";}%>
          <input name="hdmod" type="checkbox" id="hdmod" value="��" <%=hdmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String hddel1= ""; String hddel=rs.getString("hddel").trim();if(hddel.equals("��")){hddel1="checked";}%>
          <input name="hddel" type="checkbox" id="hddel" value="��" <%=hddel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String hdview1= ""; String hdview=rs.getString("hdview").trim();if(hdview.equals("��")){hdview1="checked";}%>
          <input name="hdview" type="checkbox" id="hdview" value="��" <%=hdview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�˷ѹ���</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_yfglmod1= ""; String r_yfglmod=rs.getString("r_yfglmod").trim();if(r_yfglmod.equals("��")){r_yfglmod1="checked";}%>
          <input name="r_yfglmod" type="checkbox" id="r_yfglmod" value="��" <%=r_yfglmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_yfgldel1= ""; String r_yfgldel=rs.getString("r_yfgldel").trim();if(r_yfgldel.equals("��")){r_yfgldel1="checked";}%>
          <input name="r_yfgldel" type="checkbox" id="r_yfgldel" value="��" <%=r_yfgldel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_yfglview1= ""; String r_yfglview=rs.getString("r_yfglview").trim();if(r_yfglview.equals("��")){r_yfglview1="checked";}%>
          <input name="r_yfglview" type="checkbox" id="r_yfglview" value="��" <%=r_yfglview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�� �� ��<font size="2"></font></font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String workmod1= ""; String workmod=rs.getString("workmod").trim();if(workmod.equals("��")){workmod1="checked";}%>
          <input name="workmod" type="checkbox" id="workmod" value="��" <%=workmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String workdel1= ""; String workdel=rs.getString("workdel").trim();if(workdel.equals("��")){workdel1="checked";}%>
          <input name="workdel" type="checkbox" id="workdel" value="��" <%=workdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String workview1= ""; String workview=rs.getString("workview").trim();if(workview.equals("��")){workview1="checked";}%>
          <input name="workview" type="checkbox" id="workview" value="��" <%=workview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�� �� ��</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_month_jh_mod1= ""; String r_month_jh_mod=rs.getString("r_month_jh_mod").trim();if(r_month_jh_mod.equals("��")){r_month_jh_mod1="checked";}%>
          <input name="r_month_jh_mod" type="checkbox" id="r_month_jh_mod" value="��" <%=r_month_jh_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_month_jh_del1= ""; String r_month_jh_del=rs.getString("r_month_jh_del").trim();if(r_month_jh_del.equals("��")){r_month_jh_del1="checked";}%>
          <input name="r_month_jh_del" type="checkbox" id="r_month_jh_del" value="��" <%=r_month_jh_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_month_jh_view1= ""; String r_month_jh_view=rs.getString("r_month_jh_view").trim();if(r_month_jh_view.equals("��")){r_month_jh_view1="checked";}%>
          <input name="r_month_jh_view" type="checkbox" id="r_month_jh_view" value="��" <%=r_month_jh_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�� �� ��</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_date_r_mod1= ""; String r_date_r_mod=rs.getString("r_date_r_mod").trim();if(r_date_r_mod.equals("��")){r_date_r_mod1="checked";}%>
          <input name="r_date_r_mod" type="checkbox" id="r_date_r_mod" value="��" <%=r_date_r_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_date_r_del1= ""; String r_date_r_del=rs.getString("r_date_r_del").trim();if(r_date_r_del.equals("��")){r_date_r_del1="checked";}%>
          <input name="r_date_r_del" type="checkbox" id="r_date_r_del" value="��" <%=r_date_r_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_date_r_view1= ""; String r_date_r_view=rs.getString("r_date_r_view").trim();if(r_date_r_view.equals("��")){r_date_r_view1="checked";}%>
          <input name="r_date_r_view" type="checkbox" id="r_date_r_view" value="��" <%=r_date_r_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�� �� ��</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_week_r_mod1= ""; String r_week_r_mod=rs.getString("r_week_r_mod").trim();if(r_week_r_mod.equals("��")){r_week_r_mod1="checked";}%>
          <input name="r_week_r_mod" type="checkbox" id="r_week_r_mod" value="��" <%=r_week_r_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_week_r_del1= ""; String r_week_r_del=rs.getString("r_week_r_del").trim();if(r_week_r_del.equals("��")){r_week_r_del1="checked";}%>
          <input name="r_week_r_del" type="checkbox" id="r_week_r_del" value="��" <%=r_week_r_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_week_r_view1= ""; String r_week_r_view=rs.getString("r_week_r_view").trim();if(r_week_r_view.equals("��")){r_week_r_view1="checked";}%>
          <input name="r_week_r_view" type="checkbox" id="r_week_r_view" value="��" <%=r_week_r_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�� �� ��</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_month_r_mod1= ""; String r_month_r_mod=rs.getString("r_month_r_mod").trim();if(r_month_r_mod.equals("��")){r_month_r_mod1="checked";}%>
          <input name="r_month_r_mod" type="checkbox" id="r_month_r_mod" value="��" <%=r_month_r_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_month_r_del1= ""; String r_month_r_del=rs.getString("r_month_r_del").trim();if(r_month_r_del.equals("��")){r_month_r_del1="checked";}%>
          <input name="r_month_r_del" type="checkbox" id="r_month_r_del" value="��" <%=r_month_r_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_month_r_view1= ""; String r_month_r_view=rs.getString("r_month_r_view").trim();if(r_month_r_view.equals("��")){r_month_r_view1="checked";}%>
          <input name="r_month_r_view" type="checkbox" id="r_month_r_view" value="��" <%=r_month_r_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">��Ŀ����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String xmmod1= ""; String xmmod=rs.getString("xmmod").trim();if(xmmod.equals("��")){xmmod1="checked";}%>
          <input name="xmmod" type="checkbox" id="xmmod" value="��" <%=xmmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String xmdel1= ""; String xmdel=rs.getString("xmdel").trim();if(xmdel.equals("��")){xmdel1="checked";}%>
          <input name="xmdel" type="checkbox" id="xmdel" value="��" <%=xmdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String xmview1= ""; String xmview=rs.getString("xmview").trim();if(xmview.equals("��")){xmview1="checked";}%>
          <input name="xmview" type="checkbox" id="xmview" value="��" <%=xmview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">��ͬ����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_htgl_mod1= ""; String r_htgl_mod=rs.getString("r_htgl_mod").trim();if(r_htgl_mod.equals("��")){r_htgl_mod1="checked";}%>
          <input name="r_htgl_mod" type="checkbox" id="r_htgl_mod" value="��" <%=r_htgl_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_htgl_del1= ""; String r_htgl_del=rs.getString("r_htgl_del").trim();if(r_htgl_del.equals("��")){r_htgl_del1="checked";}%>
          <input name="r_htgl_del" type="checkbox" id="r_htgl_del" value="��" <%=r_htgl_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_htgl_view1= ""; String r_htgl_view=rs.getString("r_htgl_view").trim();if(r_htgl_view.equals("��")){r_htgl_view1="checked";}%>
          <input name="r_htgl_view" type="checkbox" id="r_htgl_view" value="��" <%=r_htgl_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">���۳���</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String submod1= ""; String submod=rs.getString("submod").trim();if(submod.equals("��")){submod1="checked";}%>
          <input name="submod" type="checkbox" id="submod" value="��" <%=submod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String subdel1= ""; String subdel=rs.getString("subdel").trim();if(subdel.equals("��")){subdel1="checked";}%>
          <input name="subdel" type="checkbox" id="subdel" value="��" <%=subdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String subview1= ""; String subview=rs.getString("subview").trim();if(subview.equals("��")){subview1="checked";}%>
          <input name="subview" type="checkbox" id="subview" value="��" <%=subview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">Ա������</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String manmod1= ""; String manmod=rs.getString("manmod").trim();if(manmod.equals("��")){manmod1="checked";}%>
          <input name="manmod" type="checkbox" id="manmod" value="��" <%=manmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String mandel1= ""; String mandel=rs.getString("mandel").trim();if(mandel.equals("��")){mandel1="checked";}%>
          <input name="mandel" type="checkbox" id="mandel" value="��" <%=mandel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String manview1= ""; String manview=rs.getString("manview").trim();if(manview.equals("��")){manview1="checked";}%>
          <input name="manview" type="checkbox" id="manview" value="��" <%=manview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�������</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String rwmod1= ""; String rwmod=rs.getString("rwmod").trim();if(rwmod.equals("��")){rwmod1="checked";}%>
          <input name="rwmod" type="checkbox" id="rwmod" value="��" <%=rwmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String rwdel1= ""; String rwdel=rs.getString("rwdel").trim();if(rwdel.equals("��")){rwdel1="checked";}%>
          <input name="rwdel" type="checkbox" id="rwdel" value="��" <%=rwdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String rwview1= ""; String rwview=rs.getString("rwview").trim();if(rwview.equals("��")){rwview1="checked";}%>
          <input name="rwview" type="checkbox" id="rwview" value="��" <%=rwview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">���ù���</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fymod1= ""; String fymod=rs.getString("fymod").trim();if(fymod.equals("��")){fymod1="checked";}%>
          <input name="fymod" type="checkbox" id="fymod" value="��" <%=fymod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fydel1= ""; String fydel=rs.getString("fydel").trim();if(fydel.equals("��")){fydel1="checked";}%>
          <input name="fydel" type="checkbox" id="fydel" value="��" <%=fydel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fyview1= ""; String fyview=rs.getString("fyview").trim();if(fyview.equals("��")){fyview1="checked";}%>
          <input name="fyview" type="checkbox" id="fyview" value="��" <%=fyview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�������</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_jkgl_mod1= ""; String r_jkgl_mod=rs.getString("r_jkgl_mod").trim();if(r_jkgl_mod.equals("��")){r_jkgl_mod1="checked";}%>
          <input name="r_jkgl_mod" type="checkbox" id="r_jkgl_mod" value="��" <%=r_jkgl_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_jkgl_del1= ""; String r_jkgl_del=rs.getString("r_jkgl_del").trim();if(r_jkgl_del.equals("��")){r_jkgl_del1="checked";}%>
          <input name="r_jkgl_del" type="checkbox" id="r_jkgl_del" value="��" <%=r_jkgl_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_jkgl_view1= ""; String r_jkgl_view=rs.getString("r_jkgl_view").trim();if(r_jkgl_view.equals("��")){r_jkgl_view1="checked";}%>
          <input name="r_jkgl_view" type="checkbox" id="r_jkgl_view" value="��" <%=r_jkgl_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">��������</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_fksq_mod1= ""; String r_fksq_mod=rs.getString("r_fksq_mod").trim();if(r_fksq_mod.equals("��")){r_fksq_mod1="checked";}%>
          <input name="r_fksq_mod" type="checkbox" id="r_fksq_mod" value="��" <%=r_fksq_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_fksq_del1= ""; String r_fksq_del=rs.getString("r_fksq_del").trim();if(r_fksq_del.equals("��")){r_fksq_del1="checked";}%>
          <input name="r_fksq_del" type="checkbox" id="r_fksq_del" value="��" <%=r_fksq_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_fksq_view1= ""; String r_fksq_view=rs.getString("r_fksq_view").trim();if(r_fksq_view.equals("��")){r_fksq_view1="checked";}%>
          <input name="r_fksq_view" type="checkbox" id="r_fksq_view" value="��" <%=r_fksq_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�˻�����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String thmod1= ""; String thmod=rs.getString("thmod").trim();if(thmod.equals("��")){thmod1="checked";}%>
          <input name="r_thmod" type="checkbox" id="r_thmod" value="��" <%=thmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String thdel1= ""; String thdel=rs.getString("thdel").trim();if(thdel.equals("��")){thdel1="checked";}%>
          <input name="r_thdel" type="checkbox" id="r_thdel" value="��" <%=thdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String thview1= ""; String thview=rs.getString("thview").trim();if(thview.equals("��")){thview1="checked";}%>
          <input name="r_thview" type="checkbox" id="thview2" value="��" <%=thview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�ͻ�����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String servermod1= ""; String servermod=rs.getString("servermod").trim();if(servermod.equals("��")){servermod1="checked";}%>
          <input name="servermod" type="checkbox" id="servermod" value="��" <%=servermod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String serverdel1= ""; String serverdel=rs.getString("serverdel").trim();if(serverdel.equals("��")){serverdel1="checked";}%>
          <input name="serverdel" type="checkbox" id="serverdel" value="��" <%=serverdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String serverview1= ""; String serverview=rs.getString("serverview").trim();if(serverview.equals("��")){serverview1="checked";}%>
          <input name="serverview" type="checkbox" id="serverview" value="��" <%=serverview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�ͻ�Ͷ��</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String tsmod1= ""; String tsmod=rs.getString("tsmod").trim();if(tsmod.equals("��")){tsmod1="checked";}%>
          <input name="tsmod" type="checkbox" id="tsmod" value="��" <%=tsmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String tsdel1= ""; String tsdel=rs.getString("tsdel").trim();if(tsdel.equals("��")){tsdel1="checked";}%>
          <input name="tsdel" type="checkbox" id="tsdel" value="��" <%=tsdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String tsview1= ""; String tsview=rs.getString("tsview").trim();if(tsview.equals("��")){tsview1="checked";}%>
          <input name="tsview" type="checkbox" id="tsview" value="��" <%=tsview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">ά�޹���</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String wxmod1= ""; String wxmod=rs.getString("wxmod").trim();if(wxmod.equals("��")){wxmod1="checked";}%>
          <input name="wxmod" type="checkbox" id="wxmod" value="��" <%=wxmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String wxdel1= ""; String wxdel=rs.getString("wxdel").trim();if(wxdel.equals("��")){wxdel1="checked";}%>
          <input name="wxdel" type="checkbox" id="wxdel" value="��" <%=wxdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String wxview1= ""; String wxview=rs.getString("wxview").trim();if(wxview.equals("��")){wxview1="checked";}%>
          <input name="wxview" type="checkbox" id="wxview" value="��" <%=wxview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">��ҵ����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_hyzc_mod1= ""; String r_hyzc_mod=rs.getString("r_hyzc_mod").trim();if(r_hyzc_mod.equals("��")){r_hyzc_mod1="checked";}%>
          <input name="r_hyzc_mod" type="checkbox" id="r_hyzc_mod" value="��" <%=r_hyzc_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_hyzc_del1= ""; String r_hyzc_del=rs.getString("r_hyzc_del").trim();if(r_hyzc_del.equals("��")){r_hyzc_del1="checked";}%>
          <input name="r_hyzc_del" type="checkbox" id="r_hyzc_del" value="��" <%=r_hyzc_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_hyzc_view1= ""; String r_hyzc_view=rs.getString("r_hyzc_view").trim();if(r_hyzc_view.equals("��")){r_hyzc_view1="checked";}%>
          <input name="r_hyzc_view" type="checkbox" id="r_hyzc_view" value="��" <%=r_hyzc_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">ý������</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_mtxc_mod1= ""; String r_mtxc_mod=rs.getString("r_mtxc_mod").trim();if(r_mtxc_mod.equals("��")){r_mtxc_mod1="checked";}%>
          <input name="r_mtxc_mod" type="checkbox" id="r_mtxc_mod" value="��" <%=r_mtxc_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_mtxc_del1= ""; String r_mtxc_del=rs.getString("r_mtxc_del").trim();if(r_mtxc_del.equals("��")){r_mtxc_del1="checked";}%>
          <input name="r_mtxc_del" type="checkbox" id="r_mtxc_del" value="��" <%=r_mtxc_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_mtxc_view1= ""; String r_mtxc_view=rs.getString("r_mtxc_view").trim();if(r_mtxc_view.equals("��")){r_mtxc_view1="checked";}%>
          <input name="r_mtxc_view" type="checkbox" id="r_mtxc_view" value="��" <%=r_mtxc_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�г��</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String mactmod1= ""; String mactmod=rs.getString("mactmod").trim();if(mactmod.equals("��")){mactmod1="checked";}%>
          <input name="mactmod" type="checkbox" id="mactmod" value="��" <%=mactmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String mactdel1= ""; String mactdel=rs.getString("mactdel").trim();if(mactdel.equals("��")){mactdel1="checked";}%>
          <input name="mactdel" type="checkbox" id="mactdel" value="��" <%=mactdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String mactview1= ""; String mactview=rs.getString("mactview").trim();if(mactview.equals("��")){mactview1="checked";}%>
          <input name="mactview" type="checkbox" id="mactview" value="��" <%=mactview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">��������</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String jzdsmod1= ""; String jzdsmod=rs.getString("jzdsmod").trim();if(jzdsmod.equals("��")){jzdsmod1="checked";}%>
          <input name="jzdsmod" type="checkbox" id="jzdsmod" value="��" <%=jzdsmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String jzdsdel1= ""; String jzdsdel=rs.getString("jzdsdel").trim();if(jzdsdel.equals("��")){jzdsdel1="checked";}%>
          <input name="jzdsdel" type="checkbox" id="jzdsdel" value="��" <%=jzdsdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String jzdsview1= ""; String jzdsview=rs.getString("jzdsview").trim();if(jzdsview.equals("��")){jzdsview1="checked";}%>
          <input name="jzdsview" type="checkbox" id="jzdsview" value="��" <%=jzdsview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">֪ ʶ ��</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String zskmod1= ""; String zskmod=rs.getString("zskmod").trim();if(zskmod.equals("��")){zskmod1="checked";}%>
          <input name="zskmod" type="checkbox" id="zskmod" value="��" <%=zskmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String zskdel1= ""; String zskdel=rs.getString("zskdel").trim();if(zskdel.equals("��")){zskdel1="checked";}%>
          <input name="zskdel" type="checkbox" id="zskdel" value="��" <%=zskdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String zskview1= ""; String zskview=rs.getString("zskview").trim();if(zskview.equals("��")){zskview1="checked";}%>
          <input name="zskview" type="checkbox" id="zskview" value="��" <%=zskview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">���ɷ���</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String flfgmod1= ""; String flfgmod=rs.getString("flfgmod").trim();if(flfgmod.equals("��")){flfgmod1="checked";}%>
          <input name="flfgmod" type="checkbox" id="flfgmod" value="��" <%=flfgmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String flfgdel1= ""; String flfgdel=rs.getString("flfgdel").trim();if(flfgdel.equals("��")){flfgdel1="checked";}%>
          <input name="flfgdel" type="checkbox" id="flfgdel" value="��" <%=flfgdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String flfgview1= ""; String flfgview=rs.getString("flfgview").trim();if(flfgview.equals("��")){flfgview1="checked";}%>
          <input name="flfgview" type="checkbox" id="flfgview" value="��" <%=flfgview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">������Ŀ</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_wlz_mod1= ""; String r_wlz_mod=rs.getString("r_wlz_mod").trim();if(r_wlz_mod.equals("��")){r_wlz_mod1="checked";}%>
          <input name="r_wlz_mod" type="checkbox" id="r_wlz_mod" value="��" <%=r_wlz_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_wlz_del1= ""; String r_wlz_del=rs.getString("r_wlz_del").trim();if(r_wlz_del.equals("��")){r_wlz_del1="checked";}%>
          <input name="r_wlz_del" type="checkbox" id="r_wlz_del" value="��" <%=r_wlz_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_wlz_view1= ""; String r_wlz_view=rs.getString("r_wlz_view").trim();if(r_wlz_view.equals("��")){r_wlz_view1="checked";}%>
          <input name="r_wlz_view" type="checkbox" id="r_wlz_view" value="��" <%=r_wlz_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�ʽ����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String zjmod1= ""; String zjmod=rs.getString("zjmod").trim();if(zjmod.equals("��")){zjmod1="checked";}%>
          <input name="zjmod" type="checkbox" id="zjmod" value="��" <%=zjmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String zjdel1= ""; String zjdel=rs.getString("zjdel").trim();if(zjdel.equals("��")){zjdel1="checked";}%>
          <input name="zjdel" type="checkbox" id="zjdel" value="��" <%=zjdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String zjview1= ""; String zjview=rs.getString("zjview").trim();if(zjview.equals("��")){zjview1="checked";}%>
          <input name="zjview" type="checkbox" id="zjview" value="��" <%=zjview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�������</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fkhzmod1= ""; String fkhzmod=rs.getString("fkhzmod").trim();if(fkhzmod.equals("��")){fkhzmod1="checked";}%>
          <input name="fkhzmod" type="checkbox" id="fkhzmod" value="��" <%=fkhzmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fkhzdel1= ""; String fkhzdel=rs.getString("fkhzdel").trim();if(fkhzdel.equals("��")){fkhzdel1="checked";}%>
          <input name="fkhzdel" type="checkbox" id="fkhzdel" value="��" <%=fkhzdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fkhzview1= ""; String fkhzview=rs.getString("fkhzview").trim();if(fkhzview.equals("��")){fkhzview1="checked";}%>
          <input name="fkhzview" type="checkbox" id="fkhzview" value="��" <%=fkhzview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�տ����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String skhzmod1= ""; String skhzmod=rs.getString("skhzmod").trim();if(skhzmod.equals("��")){skhzmod1="checked";}%>
          <input name="skhzmod" type="checkbox" id="skhzmod" value="��" <%=skhzmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String skhzdel1= ""; String skhzdel=rs.getString("skhzdel").trim();if(skhzdel.equals("��")){skhzdel1="checked";}%>
          <input name="skhzdel" type="checkbox" id="skhzdel" value="��" <%=skhzdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String skhzview1= ""; String skhzview=rs.getString("skhzview").trim();if(skhzview.equals("��")){skhzview1="checked";}%>
          <input name="skhzview" type="checkbox" id="skhzview" value="��" <%=skhzview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">������Ϣ</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fkmod1= ""; String fkmod=rs.getString("fkmod").trim();if(fkmod.equals("��")){fkmod1="checked";}%>
          <input name="fkmod" type="checkbox" id="fkmod" value="��" <%=fkmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fkdel1= ""; String fkdel=rs.getString("fkdel").trim();if(fkdel.equals("��")){fkdel1="checked";}%>
          <input name="fkdel" type="checkbox" id="fkdel" value="��" <%=fkdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fkview1= ""; String fkview=rs.getString("fkview").trim();if(fkview.equals("��")){fkview1="checked";}%>
          <input name="fkview" type="checkbox" id="fkview" value="��" <%=fkview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�տ���Ϣ</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String skmod1= ""; String skmod=rs.getString("skmod").trim();if(skmod.equals("��")){skmod1="checked";}%>
          <input name="r_skmod" type="checkbox" id="r_skmod" value="��" <%=skmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String skdel1= ""; String skdel=rs.getString("skdel").trim();if(skdel.equals("��")){skdel1="checked";}%>
          <input name="r_skdel" type="checkbox" id="r_skdel" value="��" <%=skdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String skview1= ""; String skview=rs.getString("skview").trim();if(skview.equals("��")){skview1="checked";}%>
          <input name="r_skview" type="checkbox" id="r_skview" value="��" <%=skview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�ͻ�Ƿ��</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String qkmod1= ""; String qkmod=rs.getString("qkmod").trim();if(qkmod.equals("��")){qkmod1="checked";}%>
          <input name="qkmod" type="checkbox" id="qkmod" value="��" <%=qkmod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String qkdel1= ""; String qkdel=rs.getString("qkdel").trim();if(qkdel.equals("��")){qkdel1="checked";}%>
          <input name="qkdel" type="checkbox" id="qkdel" value="��" <%=qkdel1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String qkview1= ""; String qkview=rs.getString("qkview").trim();if(qkview.equals("��")){qkview1="checked";}%>
          <input name="qkview" type="checkbox" id="qkview" value="��" <%=qkview1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" size="2" face="����">�˻����<font size="2"></font></font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_thje_mod1= ""; String r_thje_mod=rs.getString("r_thje_mod").trim();if(r_thje_mod.equals("��")){r_thje_mod1="checked";}%>
          <input name="r_thje_mod" type="checkbox" id="r_thje_mod" value="��" <%=r_thje_mod1%>>
          </font>&nbsp;</div>
      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_thje_del1= ""; String r_thje_del=rs.getString("r_thje_del").trim();if(r_thje_del.equals("��")){r_thje_del1="checked";}%>
          <input name="r_thje_del" type="checkbox" id="r_thje_del" value="��" <%=r_thje_del1%>>
          </font>&nbsp;</div>
      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_thje_view1= ""; String r_thje_view=rs.getString("r_thje_view").trim();if(r_thje_view.equals("��")){r_thje_view1="checked";}%>
          <input name="r_thje_view" type="checkbox" id="r_thje_view" value="��" <%=r_thje_view1%>>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="15%"><font face="����" size="2"><strong></strong></font>&nbsp;</td>
      <td width="12%"><font face="����" size="2">&nbsp;</font>&nbsp;</td>
      <td width="14%"><font face="����" size="2">&nbsp;</font>&nbsp;</td>
      <td width="12%">&nbsp;</td>
    </tr>
    <tr> 
      <td colspan="4"> 
        <div align="center"><font color="#000000" size="2" face="����"> 
          <input type="submit" name="Submit" value="ȷ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          ���� </font> <font face="����" size="2"> 
          <input type="reset" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
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
