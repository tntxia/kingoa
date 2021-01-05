<jsp:useBean id="infocrmdb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page import="java.sql.*,java.util.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
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
<title>公司信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String id1=request.getParameter("id");
String sql="select  * from company where id='"+id1+"'";
ResultSet rs=infocrmdb.executeQuery(sql);
 if(!rs.next())
  {
    out.println("not have record");
    return;
  }
%>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="do_company.jsp"> <INPUT TYPE="hidden" name="id" value="<%=id1%>"> 
  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <tr> 
      <td colspan="2" height="18" bgcolor="#d3d8eb"><font color="#000000" size="2">公司信息</font>&nbsp;</td>
      <td colspan="2" height="18" bgcolor="#d3d8eb"> 
        <div align="right"><font color="#000000" size="2"> </font><font size="2"><font size="2"><font color="#000000" size="2"> 
          <input type="button" value="上载公司LOG" name="B22343" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('euppic.jsp?id=<%=id1%>','uppic', 'height=350, width=500, top=200, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no')">
          </font></font></font><font color="#000000" size="2"> </font> 
          <input type="submit" name="Submit" value="保存" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          <input type="button" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()">
        </div>
      </td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">公司名称</font>&nbsp;</td>
      <td colspan="3"> <font size="2"> 
        <input type="text" name="companyname" size="65" value="<%=rs.getString(2)%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">CompanyName</font>&nbsp;</td>
      <td colspan="3"><font size="2"> 
        <input type="text" name="companyname2" size="65" value="<%=rs.getString(3)%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">公司地址</font>&nbsp;</td>
      <td colspan="3"><font size="2"> 
        <input type="text" name="companyaddr" size="65" value="<%=rs.getString(4)%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">CompanyAddr</font>&nbsp;</td>
      <td colspan="3"> <font size="2"> 
        <input type="text" name="companyaddr2" size="65" value="<%=rs.getString(5)%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" height="16" bgcolor="#e8ebf5"><font size="2">公司电话</font>&nbsp;</td>
      <td height="16" width="35%"> <font size="2"> 
        <input type="text" name="companytel" value="<%=rs.getString(6)%>">
        </font>&nbsp;</td>
      <td width="12%" height="16" bgcolor="#e8ebf5"><font size="2">公司传真</font>&nbsp;</td>
      <td height="16" width="38%"> <font size="2"> 
        <input type="text" name="companyfax" value="<%=rs.getString(7)%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">中文银行</font>&nbsp;</td>
      <td width="35%"> <font size="2"> 
        <input type="text" name="companybank" value="<%=rs.getString(8)%>">
        </font>&nbsp;</td>
      <td bgcolor="#e8ebf5"><font size="2">英文银行</font>&nbsp;</td>
      <td> <font size="2"> 
        <input name="companybank2" type="text" id="companybank2" value="<%=rs.getString(9)%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td bgcolor="#e8ebf5"><font size="2">开户名称</font>&nbsp;</td>
      <td> <font size="2"> 
        <input name="bank_dm" type="text" id="bank_dm" value="<%=rs.getString(10)%>">
        </font>&nbsp;</td>
      <td bgcolor="#e8ebf5"><font size="2">开户名称</font>&nbsp;</td>
      <td> <font size="2"> 
        <input name="bank_dm2" type="text" id="bank_dm2" value="<%=rs.getString(11)%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td bgcolor="#e8ebf5"><font size="2">银行地址</font>&nbsp;</td>
      <td> <font size="2"> 
        <input type="text" name="companynumber" value="<%=rs.getString(12)%>">
        </font>&nbsp;</td>
      <td bgcolor="#e8ebf5"><font size="2">银行地址</font></td>
      <td> <font size="2"> 
        <input name="companynumber2" type="text" id="companynumber2" value="<%=rs.getString(13)%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" height="28" bgcolor="#e8ebf5"><font size="2">纳税人识别号</font>&nbsp;</td>
      <td height="28"><font size="2"> 
        <input name="com_bank_code" type="text" id="companynumber" value="<%=rs.getString("com_bank_code")%>">
        </font>&nbsp;</td>
      <td width="15%" height="28" bgcolor="#e8ebf5"><font size="2">银行代码</font>&nbsp;</td>
      <td height="28"><font size="2"> 
        <input name="com_bank_code2" type="text" id="companynumber" value="<%=rs.getString("com_bank_code2")%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" height="28" bgcolor="#e8ebf5"><font size="2">受益人帐号</font>&nbsp;</td>
      <td height="28"><font size="2"> 
        <input name="com_sy_code" type="text" id="companynumber" value="<%=rs.getString("com_sy_code")%>">
        </font>&nbsp;</td>
      <td width="15%" height="28" bgcolor="#e8ebf5"><font size="2">受益人帐号</font>&nbsp;</td>
      <td height="28"><font size="2"> 
        <input name="com_sy_code2" type="text" id="companynumber" value="<%=rs.getString("com_sy_code2")%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" height="28" bgcolor="#e8ebf5"><font size="2">受益人名称</font>&nbsp;</td>
      <td height="28"><font size="2"> 
        <input name="com_sy_name" type="text" id="companynumber" value="<%=rs.getString("com_sy_name")%>">
        </font>&nbsp;</td>
      <td width="15%" height="28" bgcolor="#e8ebf5"><font size="2">受益人名称</font>&nbsp;</td>
      <td height="28"><font size="2"> 
        <input name="com_sy_name2" type="text" id="companynumber" value="<%=rs.getString("com_sy_name2")%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">注册资金</font>&nbsp;</td>
      <td width="35%"> <font size="2"> 
        <input type="text" name="bankroll" size="15" value="<%=rs.getString("bankroll")%>">
        </font>&nbsp;</td>
      <td width="12%" bgcolor="#e8ebf5"><font size="2">公司法人</font>&nbsp;</td>
      <td width="38%"> <font size="2"> 
        <input type="text" name="companyman" size="15" value="<%=rs.getString("companyman")%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">企业代码</font>&nbsp;</td>
      <td width="35%"> <font size="2"> 
        <input type="text" name="companydm" value="<%=rs.getString("companydm")%>">
        </font>&nbsp;</td>
      <td width="12%" bgcolor="#e8ebf5"><font size="2">税 号</font>&nbsp;</td>
      <td width="38%"> <font size="2"> 
        <input type="text" name="companysh" value="<%=rs.getString("companysh")%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">邮政编码</font>&nbsp;</td>
      <td width="35%"> <font size="2"> 
        <input type="text" name="companybm" value="<%=rs.getString("companybm")%>">
        </font>&nbsp;</td>
      <td width="12%" bgcolor="#e8ebf5"><font size="2">联系人</font>&nbsp;</td>
      <td width="38%"> <font size="2"> 
        <input type="text" name="companylxr" value="<%=rs.getString("companylxr")%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" height="21" bgcolor="#e8ebf5"><font size="2">公司邮件</font>&nbsp;</td>
      <td width="35%"> <font size="2"> 
        <input type="text" name="companyemail" value="<%=rs.getString("companyemail")%>">
        </font>&nbsp;</td>
      <td width="12%" bgcolor="#e8ebf5"><font size="2">公司网址</font>&nbsp;</td>
      <td width="38%"> <font size="2"> 
        <input type="text" name="companynet" value="<%=rs.getString("companynet")%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">创建人</font>&nbsp;</td>
      <td><font size="2" color="#000080"> 
        <input type="text" name="username" size="10" value="<%=rs.getString("username")%>">
        </font><font size="2">&nbsp;</font>&nbsp;</td>
      <td bgcolor="#e8ebf5"><font size="2">创建时间</font>&nbsp;</td>
      <td> <font size="2"> 
        <input type="text" name="datetime" value="<%=rs.getString("datetime")%>" size="10">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2">备注</font>&nbsp;</td>
      <td colspan="3"> <font size="2"> 
        <textarea name="remark" cols="65"><%=rs.getString("remark")%></textarea>
        </font>&nbsp;</td>
    </tr>
  </table>
<%
  String  picpath=rs.getString("picpath");
  %> <p><font size="2"><img src="../custo_log/<%=picpath%>" width="150" height="85" border="0"></font></p></form><p>&nbsp;</p>
</body>
<%}}%>
</html>
