<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,java.util.*"%>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
 String getaLoginmessage = (String) session.getValue("adminloginSign");
   if(getaLoginmessage!="admin"){
%>
    <script language=javascript>
    window.location="../../manageslogin.jsp"
    </script>
<% } else {%>   

<jsp:useBean id="infocrmdb" scope="page" class="infocrmdb.infocrmdb" />
<%
java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String currentDate=simple.format(new java.util.Date());
%>
<html>
<head>
<title>оƬ�̳����޹�˾</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

</script>

</head>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="do_hlxx.jsp"> 
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="20%"><font size="2" color="#000000">����/�ɹ���ɷ���</font>&nbsp;</td>
      <td width="80%"> 
        <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="ȷ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
        </div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%"><font size="2" color="#000000">������:</font>&nbsp;</td>
      <td width="80%"><font size="2" color="#000000"> 
        <select size="1" name="s_name">
          <%
  try
  {
    ResultSet rs=infocrmdb.executeQuery("select name from username order by name asc");
    while(rs.next())
    {
      String name=rs.getString("name");
      out.println("<option value='"+name+"'>"+name+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%>
        </select>
        <select name="s_types">
          <option>�����۶�</option>
          <option>���ɹ���</option>
          <option>���������</option>
          <option>��ë����</option>
          <option>��������ë����</option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <TD WIDTH="20%"><font size="2" color="#000000">��������������/�ɹ����:</font>&nbsp;</td>
      <TD width="80%"><font size="2" color="#000000">���ٽ��: 
        <INPUT TYPE="text" NAME="s_m_min" SIZE="6" VALUE="0">
        RMB, �����: 
        <INPUT TYPE="text" NAME="s_m_max" SIZE="10" VALUE="100000">
        RMB��</font><font size="2" color="#000000">����ɱ�׼:</font><font size="2" color="#000000"> 
        <input type="text" name="s_m_tc" size="6" value="0">
        % ;Ԥ��:</font><font size="2" color="#000000"> 
        <input type="text" name="s_m_tc2" size="6" value="0">
        % </font>&nbsp;</td>
    </TR>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%"><font size="2" color="#000000">������������:</font>&nbsp;</td>
      <td width="80%"><font size="2" color="#000000"> ��
        <input type="text" name="s_m_rate_min" size="6" value="0">
        % &lt;=�������������� &lt;= 
        <input type="text" name="s_m_rate_max" size="6" value="0">
        % ������ɱ�׼: 
        <input type="text" name="s_m_rate_tc" size="6" value="0">
        % </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="20%"><font size="2" color="#000000">ְλ����ʽ:</font>&nbsp;</td>
      <td width="80%"><font size="2" color="#000000">�� 
        <input type="text" name="s_m_rote_min" size="10" value="0">
        RMB &lt;=�����۶�ɹ���&lt;= 
        <input type="text" name="s_m_rote_max" size="10" value="0">
        RMB ������ְλ�����׼: 
        <input type="text" name="s_m_rote_money" size="6" value="0">
        RMB </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%"><font size="2" color="#000000">��������������/�ɹ����:</font>&nbsp;</td>
      <td width="80%"><font size="2" color="#000000">���ٽ��: 
        <input type="text" name="s_y_min" size="6" value="0">
        RMB, �����: 
        <input type="text" name="s_y_max" size="10" value="1000000">
        RMB��</font><font size="2" color="#000000">����ɱ�׼:</font><font size="2" color="#000000"> 
        <input type="text" name="s_y_tc" size="6" value="0">
        % </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%"><font size="2" color="#000000">������������:</font>&nbsp;</td>
      <td width="80%"><font size="2" color="#000000"> 
        <input type="text" name="s_y_rate_min" size="6" value="0">
        % &lt;=�������������� &lt;= 
        <input type="text" name="s_y_rate_max" size="6" value="0">
        % ������ɱ�׼: 
        <input type="text" name="s_y_rate_tc" size="6" value="0">
        % </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%"><font size="2" color="#000000">������ע:</font>&nbsp;</td>
      <td width="80%"> <font color="#000000"> 
        <textarea name="remark" cols="60"></textarea>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%"><font size="2" color="#000000">�������:</font>&nbsp;</td>
      <td width="80%"> 
        <div align="left"> <font color="#000000"> 
          <input type="hidden" name="s_date" value="<%=currentDate%>">
          <%=currentDate%> </font>&nbsp;</div>
      </td>
    </tr>
  </table>
</form>
</body><%}}%>
</html>

