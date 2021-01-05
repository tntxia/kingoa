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
<%
String id2=request.getParameter("id");
String sql="select  * from secprofl where id='"+id2+"'";
ResultSet rs=infocrmdb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
%>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="doedit_secprofl.jsp"  onSubmit="return isValid();"> 
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="18%"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif">编辑-&gt;&gt; 
        <input type="hidden" name="id" value="<%=id2%>">
        <input type="hidden" name="firkind" value="<%=rs.getString(2)%>">
        </font>&nbsp;</td>
      <td width="82%" colspan="3"> 
        <div align="right"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
          <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font><font size="2" face="Arial, Helvetica, sans-serif"> 
          <input type="button" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="history.back()">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td nowrap bgcolor="#e8ebf5">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">产品类别编号</font>&nbsp;</div>
      </td>
      <td colspan="3"><FONT SIZE="2" COLOR="#000000"> 
        <input name="snumber" type="text" id="snumber" value="<%=rs.getString("snumber").trim()%>" size="6" maxlength="4">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" nowrap bgcolor="#e8ebf5">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">产品类别中文名称</font>&nbsp;</div>
      </td>
      <td colspan="3"><FONT SIZE="2" COLOR="#000000"> 
        <input type="text" name="proflname" value="<%=rs.getString("proflname")%>" size="40" maxlength="45">
        &nbsp;</font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" nowrap bgcolor="#e8ebf5">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">产品类别英文名称</font>&nbsp;</div>
      </td>
      <td colspan="3"><FONT SIZE="2" COLOR="#000000"> 
        <input type="text" name="eprofl" value="<%=rs.getString("eprofl")%>" size="40" maxlength="45">
        &nbsp;</font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <TD WIDTH="18%" nowrap bgcolor="#e8ebf5">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">公开报价=</font>&nbsp;</div>
      </TD>
      <TD><FONT SIZE="2" COLOR="#000000">成本单价/
        <INPUT NAME="price_gk" TYPE="text" ID="snumber" SIZE="6" MAXLENGTH="4" VALUE="<%=rs.getDouble("price_gk")%>">
        (基数不能为0)</font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <TD WIDTH="18%" nowrap bgcolor="#e8ebf5">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">建议售价=</font>&nbsp;</div>
      </TD>
      <TD><FONT SIZE="2" COLOR="#000000">成本单价/
        <INPUT NAME="price_jysj" TYPE="text" ID="snumber" SIZE="6" VALUE="<%=rs.getDouble("price_jysj")%>" MAXLENGTH="4">
        (基数不能为0)</font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <TD WIDTH="18%" nowrap bgcolor="#e8ebf5">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">最低限价=</font>&nbsp;</div>
      </TD>
      <TD><FONT SIZE="2" COLOR="#000000">成本单价/
        <INPUT NAME="price_min" TYPE="text" ID="snumber" SIZE="6" VALUE="<%=rs.getDouble("price_min")%>" MAXLENGTH="4">
        (基数不能为0)</font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <TD WIDTH="18%" nowrap bgcolor="#e8ebf5">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">代理价格=</font>&nbsp;</div>
      </TD>
      <TD><FONT SIZE="2" COLOR="#000000">成本单价/
        <INPUT NAME="price_dljg" TYPE="text" ID="snumber" SIZE="6" MAXLENGTH="4" VALUE="<%=rs.getDouble("price_dljg")%>">
        (基数不能为0)</font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" nowrap bgcolor="#e8ebf5">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">说明</font>&nbsp;</div>
      </td>
      <td colspan="3"> 
        <div align="left"> <FONT SIZE="2" COLOR="#000000"> 
          <textarea name="remark" cols="40"><%=rs.getString("remark")%></textarea>
          (该定义仅作为销售合同审批流程控制用)</font>&nbsp;</div>
      </td>
    </tr>
  </table>
</form>
</body><%}%>
</html>
