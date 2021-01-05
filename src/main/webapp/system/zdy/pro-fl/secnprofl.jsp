<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="einfodb" scope="page" class="bankdb.bankdb" />
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
String id=request.getParameter("id");
String firnumber=request.getParameter("firnumber");
String proname1=request.getParameter("proname");
%>
<html>
<head>
<title>芯片商城有限公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function isValid(){
    var i,j,strTemp;
    strTemp="0123456789";
	var num1=form1.snumber.value;
    if(form1.proflname.value==""){
        alert("请输入中文名称!");
        form1.proflname.focus();        
	return false;
    }
   else if(form1.snumber.value==""){
        alert("请填写编号!");
        form1.snumber.focus();
	return false;
    }
   else {
         for (i=0;i<num1.length;i++)
        {
        j=strTemp.indexOf(num1.charAt(i));    
        if (j==-1)
        {
            alert("请填写数字格式!");
        form1.snumber.focus();
        return false;
        }
	    else if((form1.snumber.value.length!=3)){
        alert("编号必须是3位数字!");
        form1.snumber.focus();
	return false;
    }
    }
    return true;      
    }
}
</script>

</head>

<body bgcolor="#ffffff" text="#000000" topmargin="0">
<form name="form1" method="post" action="do_secprofl.jsp"  onSubmit="return isValid();"> 
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="26%"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif">&nbsp; 
        </font><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
        <input type="hidden" name="id" value="<%=id%>">
        <input type="hidden" name="proname" value="<%=proname1%>">
        <input name="firnumber" type="hidden" id="firnumber" value="<%=firnumber%>">
        产品类别</font>&nbsp;</td>
      <td width="74%"> 
        <div align="right"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
          <% String getmessageflsec = (String) session.getValue("secprofl_message");
   if(getmessageflsec==null) getmessageflsec="";
   %>
          <%= getmessageflsec %> 
          <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> <font size="2" face="Arial, Helvetica, sans-serif"> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onclick=history.back()>
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td>
        <DIV ALIGN="RIGHT"><FONT COLOR="#000000" SIZE="2">产品类别编码</font>&nbsp;</div>
      </td>
      <td> <FONT SIZE="2" COLOR="#000000">
        <input name="snumber" type="text" id="snumber" size="6" maxlength="3">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="26%">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">产品类别中文名称</font>&nbsp;</div>
      </td>
      <td><FONT SIZE="2" COLOR="#000000"> 
        <input type="text" name="proflname" size="45" maxlength="45">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="26%">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">产品类别英文名称</font>&nbsp;</div>
      </td>
      <td><FONT SIZE="2" COLOR="#000000"> 
        <input type="text" name="eprofl" size="45" maxlength="45">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="26%">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">公开报价=</font>&nbsp;</div>
      </td>
      <td><FONT SIZE="2" COLOR="#000000">成本单价/
        <INPUT NAME="price_gk" TYPE="text" ID="snumber" SIZE="6" MAXLENGTH="4" VALUE="1">
        (基数不能为0)</font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <TD WIDTH="26%">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">建议售价=</font>&nbsp;</div>
      </TD>
      <TD><FONT SIZE="2" COLOR="#000000">成本单价/
        <INPUT NAME="price_jysj" TYPE="text" ID="snumber" SIZE="6" MAXLENGTH="4" VALUE="1">
        (基数不能为0)</font>&nbsp;</td>
    </TR>
    <tr bgcolor="#FFFFFF">
      <TD WIDTH="26%">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">最低限价=</font>&nbsp;</div>
      </TD>
      <TD><FONT SIZE="2" COLOR="#000000">成本单价/
        <INPUT NAME="price_min" TYPE="text" ID="snumber" SIZE="6" MAXLENGTH="4" VALUE="1">
        (基数不能为0)</font>&nbsp;</td>
    </TR>
    <tr bgcolor="#FFFFFF">
      <TD WIDTH="26%">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">代理价格=</font>&nbsp;</div>
      </TD>
      <TD bgcolor="#FFFFFF"><FONT SIZE="2" COLOR="#000000">成本单价/
        <INPUT NAME="price_dljg" TYPE="text" ID="snumber" SIZE="6" MAXLENGTH="4" VALUE="1">
        (基数不能为0)</font>&nbsp;</td>
    </TR>
    <tr bgcolor="#FFFFFF"> 
      <td width="26%">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">说明</font>&nbsp;</div>
      </td>
      <td> 
        <div align="left"> <FONT SIZE="2" COLOR="#000000"> 
          <textarea name="remark" cols="45"></textarea>
          (该定义仅作为销售合同审批流程控制用)</font>&nbsp;</div>
      </td>
    </tr>
  </table>
</form>
</body><%}%>
</html>
