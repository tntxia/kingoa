<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../refuse.jsp"
    </script>
<% } else {    
 String getaLoginmessage = (String) session.getValue("adminloginSign");
   if(getaLoginmessage!="admin"){
%>
    <script language=javascript>
    window.location="manageslogin.jsp"
    </script>
<% } else {    
java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String currentDate=simple.format(new java.util.Date());
%>
<html>
<head>
<title>公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="do_ncompany.jsp">
  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <tr> 
      <td colspan="2" height="18" bgcolor="#d3d8eb"><font color="#000000" size="2">公司信息</font>&nbsp;</td>
      <td colspan="2" height="18" bgcolor="#d3d8eb"> 
        <div align="right"> 
          <input type="submit" name="Submit" value=" 保存信息 " style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          <input type="reset" name="Submit5" value="重新填写" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
        </div>
      </td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">公司名称</font>&nbsp;</td>
      <td colspan="3"> <font size="2"> 
        <input type="text" name="companyname" size="65">
        <b></b></font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5">CompanyName</td>
      <td colspan="3"><font size="2"> 
        <input type="text" name="companyname2" size="65">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">公司地址</font>&nbsp;</td>
      <td colspan="3"> <font size="2"> 
        <input type="text" name="companyaddr" size="65">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" height="16" bgcolor="#e8ebf5">CompanyAddr</td>
      <td height="16" colspan="3"><font size="2"> 
        <input type="text" name="companyaddr2" size="65">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" height="16" bgcolor="#e8ebf5"><font size="2">公司电话</font>&nbsp;</td>
      <td height="16" width="33%"> <font size="2"> 
        <input type="text" name="companytel">
        </font>&nbsp;</td>
      <td width="14%" height="16" bgcolor="#e8ebf5"><font size="2">公司传真</font>&nbsp;</td>
      <td height="16" width="38%"> <font size="2"> 
        <input type="text" name="companyfax">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">中文银行</font>&nbsp;</td>
      <td width="33%"> <font size="2"> 
        <input type="text" name="companybank">
        </font>&nbsp;</td>
      <td width="14%" bgcolor="#e8ebf5"><font size="2">英文银行</font>&nbsp;</td>
      <td width="38%"> <font size="2"> 
        <input name="companybank2" type="text" id="companybank2">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td bgcolor="#e8ebf5"><font size="2">开户名称</font>&nbsp;</td>
      <td><font size="2"> 
        <input name="bank_dm" type="text" id="bank_dm">
        </font>&nbsp;</td>
      <td bgcolor="#e8ebf5"><font size="2">开户名称</font>&nbsp;</td>
      <td><font size="2"> 
        <input name="bank_dm2" type="text" id="bank_dm2">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">银行地址</font>&nbsp;</td>
      <td><font size="2"> 
        <input name="companynumber" type="text" id="companynumber">
        </font>&nbsp;</td>
      <td bgcolor="#e8ebf5"><font size="2">银行地址</font></td>
      <td><font size="2"> 
        <input name="companynumber2" type="text" id="companynumber2">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" height="28" bgcolor="#e8ebf5"><font size="2">纳税人识别号</font>&nbsp;</td>
      <td height="28"><font size="2"> 
        <input name="com_bank_code" type="text" id="companynumber">
        </font>&nbsp;</td>
      <td width="15%" height="28" bgcolor="#e8ebf5"><font size="2">银行代码</font>&nbsp;</td>
      <td height="28"><font size="2"> 
        <input name="com_bank_code2" type="text" id="companynumber">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" height="28" bgcolor="#e8ebf5"><font size="2">受益人帐号</font>&nbsp;</td>
      <td height="28"><font size="2"> 
        <input name="com_sy_code" type="text" id="companynumber">
        </font>&nbsp;</td>
      <td width="15%" height="28" bgcolor="#e8ebf5"><font size="2">受益人帐号</font>&nbsp;</td>
      <td height="28"><font size="2"> 
        <input name="com_sy_code2" type="text" id="companynumber">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" height="28" bgcolor="#e8ebf5"><font size="2">受益人名称</font>&nbsp;</td>
      <td height="28"><font size="2"> 
        <input name="com_sy_name" type="text" id="companynumber">
        </font>&nbsp;</td>
      <td width="15%" height="28" bgcolor="#e8ebf5"><font size="2">受益人名称</font>&nbsp;</td>
      <td height="28"><font size="2"> 
        <input name="com_sy_name2" type="text" id="companynumber">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">注册资金</font>&nbsp;</td>
      <td width="33%"> <font size="2"> 
        <input type="text" name="bankroll" size="15">
        </font>&nbsp;</td>
      <td width="14%" bgcolor="#e8ebf5"><font size="2">公司法人</font>&nbsp;</td>
      <td width="38%"> <font size="2"> 
        <input type="text" name="companyman" size="15">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">企业代码</font>&nbsp;</td>
      <td width="33%"> <font size="2"> 
        <input type="text" name="companydm">
        </font>&nbsp;</td>
      <td width="14%" bgcolor="#e8ebf5"><font size="2">税 号</font>&nbsp;</td>
      <td width="38%"> <font size="2"> 
        <input type="text" name="companysh">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">邮政编码</font>&nbsp;</td>
      <td width="33%"> <font size="2"> 
        <input type="text" name="companybm">
        </font>&nbsp;</td>
      <td width="14%" bgcolor="#e8ebf5"><font size="2">联系人</font>&nbsp;</td>
      <td width="38%"> <font size="2"> 
        <input type="text" name="companylxr">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">公司邮件</font>&nbsp;</td>
      <td width="33%"> <font size="2"> 
        <input type="text" name="companyemail">
        </font>&nbsp;</td>
      <td width="14%" bgcolor="#e8ebf5"><font size="2">公司网址</font>&nbsp;</td>
      <td width="38%"> <font size="2"> 
        <input type="text" name="companynet">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">创建人</font>&nbsp;</td>
      <td width="33%"><font size="2" color="#000080"> 
        <% String name1 = (String) session.getValue("username");%>
        <input type="text" name="username" size="10" value="<%=name1%>">
        </font><font size="2">&nbsp;</font>&nbsp;</td>
      <td width="14%" bgcolor="#e8ebf5"><font size="2">创建时间</font>&nbsp;</td>
      <td width="38%"> <font size="2"> 
        <input type="text" name="datetime" size="10" value="<%=currentDate%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">备注</font>&nbsp;</td>
      <td colspan="3"><font size="2"> 
        <textarea name="remark" cols="65"></textarea>
        </font>&nbsp;</td>
    </tr>
  </table>
</form>
<p>&nbsp;</p>
</body>
<%}}%>
</html>

