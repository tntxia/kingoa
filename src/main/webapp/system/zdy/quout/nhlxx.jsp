<%@ page contentType="text/html;charset=gb2312" %>
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
<% } else {    
java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String currentDate=simple.format(new java.util.Date());
%>
<html>
<head>
<title>оƬ�̳����޹�˾</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000"  topmargin="0">
<form name="form1" method="post" action="do_hlxx.jsp">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <tr> 
      <td width="13%" bgcolor="#e8ebf5"><font size="2" color="#000000">����ģ��</font>&nbsp;</td>
      <td width="87%" bgcolor="#e8ebf5"> 
        <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="ȷ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
        </div>
      </td>
    </tr>
    <tr> 
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">��������:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_topic" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">���۹�˾:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_company" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">��˾��ַ:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_addr" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">��˾�绰:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_tel" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">��˾����:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_fax" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">��˾�ʼ�:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_email" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">��˾��ַ:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_net" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">��������:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <textarea name="q_tk" cols="60" rows="5">1���۸����ϼ۸�Ϊ ����������Һ�17%��ֵ˰�ۡ�
2��������Ч�ڣ��ӽ����� 30������Ч��
3�����ʽ��Ԥ��30%Ϊ��������ǰ���塣
4���˱����Ǹ��ݼ���(2003/ / )�� �� �Ļ���( �� )�������á�������ʱ �� �Ļ��ʷ������²������˱��۽�����Ӧ������
 
  
</textarea>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">������ע:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <textarea name="remark" cols="60"></textarea>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">��������:</font>&nbsp;</td>
      <td width="87%"> 
        <div align="left"><font size="2" color="#000000"> </font> 
          <input type="hidden" name="q_date" value="<%=currentDate%>">
          <%=currentDate%> </div>
      </td>
    </tr>
  </table>
</form>
</body><%}}%>
</html>

