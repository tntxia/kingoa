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
 %>
<html>
<head>
<title>Ȩ���Զ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" bgcolor="#C1D9FF">
<form name="form1" method="post" action="do_punit.jsp">
  <table width="100%" border="1" cellspacing="0" cellpadding="0" height="286">
    <tr> 
      <td width="17%" height="6" bgcolor="#C1D9FF"><font size="2" color="#000000">���� &gt;&gt;</font>&nbsp;</td>
      <td height="6" colspan="5" bgcolor="#C1D9FF"> <div align="right"> </div></td>
    </tr>
    <tr> 
      <td width="17%" height="2"><b><font size="2" color="#000080">����</font></b></td>
      <td height="2" colspan="5"><font size="2">&nbsp; </font> <div align="left"><font size="2"> 
          </font><font size="2" face="Arial, Helvetica, sans-serif"> 
          <select name="dept" size="1" id="dept">
            <%
  try
  {
    ResultSet rs=einfodb.executeQuery("select departname from department");
    while(rs.next())
    {
      String departname=rs.getString("departname");
      out.println("<option value='"+departname+"'>"+departname+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%>
          </select>
          </font><font size="2"> </font><font size="2" color="#000000"> </font>&nbsp;</div>
        <b></b><b></b><font size="2" face="Arial, Helvetica, sans-serif">&nbsp; 
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><div align="center"><strong><font size="2">ҵ�����</font></strong></div></td>
      <td><div align="center"><strong><font size="2">����</font></strong></div></td>
      <td><div align="center"><strong><font size="2">�޸�</font></strong></div></td>
      <td><div align="center"><strong><font size="2">ɾ��</font></strong></div></td>
      <td><div align="center"><strong><font size="2">�鿴</font></strong></div></td>
      <td><div align="center"><strong><font size="2">�Ƿ����</font></strong></div></td>
    </tr>
    <tr> 
      <td width="17%"><b><font size="2" color="#000080">Ǳ�ڿͻ�</font></b></td>
      <td width="16%"> <font size="2"> 
        <select name="qzadd" id="qzadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="qzmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="qzdel">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="qzview" id="qzview">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="qzzt" id="qzzt">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%"><b><font size="2" color="#000080">���пͻ�</font></b></td>
      <td width="16%"> <font size="2"> 
        <select name="xhadd" id="xhadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="xhmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="xhdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="xhview" id="xhview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="xhzt" id="xhzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%"><b><font size="2" color="#000080">��ϵ��</font></b></td>
      <td width="16%"> <font size="2"> 
        <select name="linkadd" id="linkadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="linkmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="linkdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="linkview" id="linkview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="linkzt" id="linkzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%"><b><font size="2" color="#000080">��Ӧ��</font></b></td>
      <td width="16%"> <font size="2"> 
        <select name="supadd" id="supadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="supmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="supdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="supview" id="supview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="supzt" id="supzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%" height="24"><b><font size="2" color="#000080">�</font></b></td>
      <td width="16%"> <font size="2"> 
        <select name="actadd" id="actadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="actmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="actdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="actview" id="actview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="actzt" id="actzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%"><b><font size="2" color="#000080">���ۻ���</font></b></td>
      <td width="16%"> <font size="2"> 
        <select name="opadd" id="opadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="opmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="opdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="opview" id="opview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="opzt" id="opzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%"><b><font size="2" color="#000080">����</font></b></td>
      <td width="16%"> <font size="2"> 
        <select name="quoteadd" id="quoteadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="quotemod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="quotedel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="quoteview" id="quoteview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="quotezt" id="quotezt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><b><font size="2" color="#000080">��Ʒ</font></b></td>
      <td> <font size="2"> 
        <select name="proadd" id="proadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="promod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="prodel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="proview" id="proview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="prozt" id="prozt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">��Ʒ</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="samadd" id="samadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="sammod" id="sammod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="samdel" id="samdel">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="samview" id="samview">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="samzt" id="samzt">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">�ʼ���Ʒ</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="psamadd" id="psamadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="psammod" id="psammod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="psamdel" id="psamdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="psamview" id="psamview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="psamzt" id="psamzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">�ɹ�</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="cgadd" id="cgadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="cgmod" id="cgmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="cgdel" id="cgdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="cgview" id="cgview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="cgzt" id="cgzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">����</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="tradd" id="tradd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="trmod" id="trmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="trdel" id="trdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="trview" id="trview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="trzt" id="trzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">������˾</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="hdadd" id="hdadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="hdmod" id="hdmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="hddel" id="hddel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="hdview" id="hdview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="hdzt" id="hdzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">�����㱨</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="workadd" id="workadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="workmod" id="workmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="workdel" id="workdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="workview" id="workview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="workzt" id="workzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">��Ŀ</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="xmadd" id="xmadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="xmmod" id="xmmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="xmdel" id="xmdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="xmview" id="xmview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="xmzt" id="xmzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">����</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="subadd" id="subadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="submod" id="submod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="subdel" id="subdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="subview" id="subview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="subzt" id="subzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">Ա��</font></strong></td>
      <td> <font size="2"> 
        <select name="manadd" id="manadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="manmod" id="manmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="mandel" id="mandel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="manview" id="manview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="manzt" id="manzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">����</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="rwadd" id="rwadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="rwmod" id="rwmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="rwdel" id="rwdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="rwview" id="rwview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="rwzt" id="rwzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">����</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="fyadd" id="fyadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="fymod" id="fymod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="fydel" id="fydel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="fyview" id="fyview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="fyzt" id="fyzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">����</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="hhadd" id="hhadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="hhmod" id="hhmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="hhdel" id="hhdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="hhview" id="hhview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="hhzt" id="hhzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">�˻�</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="thadd" id="thadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="thmod" id="thmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="thdel" id="thdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="thview" id="thview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="thzt" id="thzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">�ͻ�����</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="serveradd" id="serveradd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="servermod" id="servermod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="serverdel" id="serverdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="serverview" id="serverview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="serverzt" id="serverzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">�ͻ�Ͷ��</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="tsadd" id="tsadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="tsmod" id="tsmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="tsdel" id="tsdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="tsview" id="tsview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="tszt" id="tszt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">ά�޹���</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="wxadd" id="wxadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="wxmod" id="wxmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="wxdel" id="wxdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="wxview" id="wxview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="wxzt" id="wxzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">�г��</font></strong></td>
      <td> <font size="2"> 
        <select name="mactadd" id="mactadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="mactmod" id="mactmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="mactdel" id="mactdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="mactview" id="mactview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="mactzt" id="mactzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">��������</font></strong></td>
      <td> <font size="2"> 
        <select name="jzdsadd" id="jzdsadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="jzdsmod" id="jzdsmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="jzdsdel" id="jzdsdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="jzdsview" id="jzdsview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="jzdszt" id="jzdszt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">֪ʶ��</font></strong></td>
      <td> <font size="2"> 
        <select name="zskadd" id="zskadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="zskmod" id="zskmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="zskdel" id="zskdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="zskview" id="zskview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="zskzt" id="zskzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">���ɷ���</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="flfgadd" id="flfgadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="flfgmod" id="flfgmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="flfgdel" id="flfgdel">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="flfgview" id="flfgview">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="flfgzt" id="flfgzt">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">�������</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="fkhzadd" id="fkhzadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="fkhzmod" id="fkhzmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="fkhzdel" id="fkhzdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="fkhzview" id="fkhzview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="fkhzzt" id="fkhzzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">�տ����</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="skhzadd" id="skhzadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="skhzmod" id="skhzmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="skhzdel" id="skhzdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="skhzview" id="skhzview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="skhzzt" id="skhzzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">����</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="fkadd" id="fkadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="fkmod" id="fkmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="fkdel" id="fkdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="fkview" id="fkview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="fkzt" id="fkzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">�տ�</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="skadd" id="skadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="skmod" id="skmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="skdel" id="skdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="skview" id="skview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="skzt" id="skzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">Ƿ��</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="qkadd" id="qkadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="qkmod" id="qkmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="qkdel" id="qkdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="qkview" id="qkview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="qkzt" id="qkzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">���</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="intadd" id="intadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="intmod" id="intmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="intdel" id="intdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="intview" id="intview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="intzt" id="intzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">����</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="outadd" id="outadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="outmod" id="outmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="outdel" id="outdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="outview" id="outview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="outzt" id="outzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">ϵͳ����</font></strong></td>
      <td> <font size="2"> 
        <select name="sysadd" id="sysadd">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="sysmod" id="sysmod">
          <option>��</option>
          <option>��</option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="sysdel" id="sysdel">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="sysview" id="sysview">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="syszt" id="syszt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">�ͻ���Դת��</font></strong></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><font size="2">&nbsp; </font>&nbsp;</td>
      <td><font size="2"> 
        <select name="custzyzt" id="custzyzt">
          <option><font size="2">��</font></option>
          <option><font size="2">��</font></option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><b><font size="2" color="#000000">��������Զ���</font></b></td>
      <td colspan="5"> <input name="salestc" type="text" id="salestc" value="0" size="3">
        %</td>
    </tr>
    <tr> 
      <td colspan="6"><div align="center"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="ȷ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          ���� </font> 
          <input type="reset" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
        </div></td>
    </tr>
  </table>
  </form>
</body>
<%}}%>
</html>
