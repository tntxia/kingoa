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
<title>芯片商城有限公司</title>
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
      <td width="13%" bgcolor="#e8ebf5"><font size="2" color="#000000">报价模板</font>&nbsp;</td>
      <td width="87%" bgcolor="#e8ebf5"> 
        <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
        </div>
      </td>
    </tr>
    <tr> 
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">报价主题:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_topic" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">报价公司:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_company" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">公司地址:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_addr" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">公司电话:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_tel" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">公司传真:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_fax" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">公司邮件:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_email" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">公司网址:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_net" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">条　　款:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <textarea name="q_tk" cols="60" rows="5">1．价格：以上价格为 交货，人民币含17%增值税价。
2．报价有效期：从今天至 30天内有效。
3．付款方式：预付30%为定金，余款发货前付清。
4．此报价是根据即日(2003/ / )的 兑 的汇率( 兑 )计算所得。若交货时 兑 的汇率发生上下波动，此报价将作相应调整。
 
  
</textarea>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">备　　注:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <textarea name="remark" cols="60"></textarea>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%"><font size="2" color="#000000">创建日期:</font>&nbsp;</td>
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

