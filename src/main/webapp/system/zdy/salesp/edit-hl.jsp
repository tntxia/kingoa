<jsp:useBean id="infocrmdb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page import="java.sql.*,java.util.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
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

<html>
<head>
<title>оƬ�̳����޹�˾</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String id2=request.getParameter("id");
String sql="select id,s_name,s_types,s_m_min,s_m_max,s_m_tc,s_m_tc2,s_y_min,s_y_max,s_y_tc,remark,s_m_rate_min,s_m_rate_max,s_m_rate_tc,s_m_rote_min,s_m_rote_max,s_m_rote_money,s_y_rate_min,s_y_rate_max,s_y_rate_tc from sale_tc where id='"+id2+"'";
ResultSet rs=infocrmdb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
%>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="doedithl.jsp"> 
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="17%"><font size="2" color="#000000">����/�ɹ���ɷ��� 
        <input type="hidden" name="id" value="<%=id2%>">
        </font>&nbsp;</td>
      <td width="83%"> 
        <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="����" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          </font><font size="2"> 
          <input type="reset" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()">
          </font><font size="2" color="#000000"> </font>&nbsp;</div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"><font size="2" color="#000000">������:</font>&nbsp;</td>
      <td width="83%"><font size="2" face="Arial, Helvetica, sans-serif" color="#000000"> 
        <select size="1" name="s_name">
          <%
		   String dept=rs.getString("s_name").trim();
  				 try
            {
            ResultSet hlrs=infocrmdb.executeQuery("select * from username");
            while(hlrs.next())
           {
            String departname=hlrs.getString("name").trim();
            if(dept.equals(departname))
              out.println("<option  selected>"+departname+"</option>");
            else            
              out.println("<option >"+departname+"</option>");
             }
             hlrs.close();
             }catch(Exception e){}
        %>
        </select>
        <select name="s_types">
          <option><font size="2" color="#000000"><%=rs.getString("s_types").trim()%></font></option>
          <option><font size="2" color="#000000">�����۶�</font></option>
          <option><font size="2" color="#000000">���ɹ���</font></option>
          <option><font size="2" color="#000000">���������</font></option>
          <option>��ë����</option>
          <option>��������ë����</option>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"><font size="2" color="#000000">������/�ɹ����:</font>&nbsp;</td>
      <td width="83%"><font size="2" color="#000000">���ٽ��: 
        <input type="text" name="s_m_min" size="6" value="<%=rs.getInt("s_m_min")%>">
        RMB, �����: 
        <input type="text" name="s_m_max" size="10" value="<%=rs.getInt("s_m_max")%>">
        RMB������ɱ�׼: 
        <input type="text" name="s_m_tc" size="6" value="<%=rs.getString("s_m_tc")%>">
        %; Ԥ������: 
        <input type="text" name="s_m_tc2" size="6" value="<%=rs.getString("s_m_tc2")%>">
        %</font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"><font size="2" color="#000000">������/�ɹ����:</font>&nbsp;</td>
      <td width="83%"><font size="2" color="#000000">���ٽ��: 
        <input type="text" name="s_y_min" size="6" value="<%=rs.getInt("s_y_min")%>">
        RMB, �����: 
        <input type="text" name="s_y_max" size="10" value="<%=rs.getInt("s_y_max")%>">
        RMB��</font><font size="2" color="#000000">����ɱ�׼:</font><font size="2" color="#000000"> 
        <input type="text" name="s_y_tc" size="6" value="<%=rs.getString("s_y_tc")%>">
        %; </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"><font size="2" color="#000000">������ע:</font>&nbsp;</td>
      <td width="83%"> <font color="#000000"> 
        <textarea name="remark" cols="60"><%=rs.getString("remark")%></textarea>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"><font size="2" color="#000000">������������:</font>&nbsp;</td>
      <td width="83%"><font size="2" color="#000000"> �� 
        <input type="text" name="s_m_rate_min" size="6" value="<%=rs.getInt("s_m_rate_min")%>">
        % &lt;=�������������� &lt;= 
        <input type="text" name="s_m_rate_max" size="6" value="<%=rs.getInt("s_m_rate_max")%>">
        % ������ɱ�׼: 
        <input type="text" name="s_m_rate_tc" size="6" value="<%=rs.getInt("s_m_rate_tc")%>">
        % </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"><font size="2" color="#000000">ְλ����ʽ:</font>&nbsp;</td>
      <td width="83%"><font size="2" color="#000000">�� 
        <input type="text" name="s_m_rote_min" size="10" value="<%=rs.getInt("s_m_rote_min")%>">
        RMB &lt;=�����۶�ɹ���&lt;= 
        <input type="text" name="s_m_rote_max" size="10" value="<%=rs.getInt("s_m_rote_max")%>">
        RMB ������ְλ�����׼: 
        <input type="text" name="s_m_rote_money" size="6" value="<%=rs.getInt("s_m_rote_money")%>">
        RMB </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%"><font size="2" color="#000000">������������:</font>&nbsp;</td>
      <td width="80%"><font size="2" color="#000000"> 
        <input type="text" name="s_y_rate_min" size="6" value="<%=rs.getInt("s_y_rate_min")%>">
        % &lt;=�������������� &lt;= 
        <input type="text" name="s_y_rate_max" size="6" value="<%=rs.getInt("s_y_rate_max")%>">
        %������ɱ�׼: 
        <input type="text" name="s_y_rate_tc" size="6" value="<%=rs.getInt("s_y_rate_tc")%>">
        % </font>&nbsp;</td>
    </tr>
  </table>
</form>
</body><%}}%>
</html>
