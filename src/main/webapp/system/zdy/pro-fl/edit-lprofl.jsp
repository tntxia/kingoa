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
	var num1=form1.tnumber.value;
    if(form1.cpro.value==""){
        alert("请输入中文名称!");
        form1.cpro.focus();        
	return false;
    }
   else if(form1.tnumber.value==""){
        alert("请填写编号!");
        form1.tnumber.focus();
	return false;
    }
   else {
         for (i=0;i<num1.length;i++)
        {
        j=strTemp.indexOf(num1.charAt(i));    
        if (j==-1)
        {
            alert("请填写数字格式!");
        form1.tnumber.focus();
        return false;
        }
	    else if((form1.tnumber.value.length!=3)){
        alert("编号必须是3位数字!");
        form1.tnumber.focus();
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
String sql="select  id,tnumber,cpro,epro,remark from profll where id='"+id2+"'";
ResultSet rs=infocrmdb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
%>
<body text="#000000" topmargin="0">
<form name="form1" method="post" action="doedit_lprofl.jsp" onSubmit="return isValid();">
  <INPUT TYPE="hidden" name="id" value="<%=id2%>">

  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="15%"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif">编辑 &gt;&gt;</font>&nbsp;</td>
      <td width="85%"> <div align="right"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
          <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font><font size="2" face="Arial, Helvetica, sans-serif"> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="history.back()">
          </font>&nbsp;</div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td bgcolor="#e8ebf5"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif">品牌编码:</font>&nbsp;</td>
      <td><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
        <input name="tnumber" type="text" id="tnumber" value="<%String tnumber=rs.getString(2).trim(); %><%=tnumber%>" size="8" maxlength="6">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif">品牌名称:</font>&nbsp;</td>
      <td><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
        <input type="text" name="cpro" value="<%String cpro=rs.getString(3);%><%=cpro%>" size="50" maxlength="50">
        <INPUT TYPE="hidden" name="ncpro" value="<%=cpro%>">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif">供应商名称:</font>&nbsp;</td>
      <td><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
        <input type="text" name="epro" value="<%=rs.getString(4)%>" size="50" maxlength="50">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" bgcolor="#e8ebf5"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif">说明:</font>&nbsp;</td>
      <td> <div align="left"> <font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
          <textarea name="remark" cols="65" rows="3"><%=rs.getString(5)%></textarea>
          </font>&nbsp;</div></td>
    </tr>
  </table>
</form>
</body><%}%>
</html>
