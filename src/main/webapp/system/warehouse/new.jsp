<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*,java.text.*"%>
<%

String basePath = request.getContextPath();

%>
<html>
<head>
<title>仓库自定义</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function isValid(){
    var i,j,strTemp;
    strTemp="0123456789";
	var num1=form1.number.value;
    if(form1.cpro.value==""){
        alert("请输入仓库名称!");
        form1.cpro.focus();        
	return false;
    }
   else if(form1.number.value==""){
        alert("请填写编号!");
        form1.number.focus();
	return false;
    }
   else {
         for (i=0;i<num1.length;i++)
        {
        j=strTemp.indexOf(num1.charAt(i));    
        if (j==-1)
        {
            alert("请填写数字格式!");
        form1.number.focus();
        return false;
        }
	    else if((form1.number.value.length!=2)){
        alert("编号必须是2位数字!");
        form1.number.focus();
	return false;
    }
    }
    return true;      
    }
}
</script>

</head>

<body bgcolor="#ffffff" text="#000000" topmargin="0">
<form name="form1" method="post" action="<%=basePath %>/system/warehouse.dispatch" onSubmit="return isValid();">
<input name="method" type="hidden" value="add">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <tr> 
      <td width="26%" bgcolor="#d3d8eb"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif">增加仓库</font>&nbsp;</td>
      <td width="74%" bgcolor="#d3d8eb"> <div align="right"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
          
          <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> <font face="Arial, Helvetica, sans-serif" size="2"> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onclick=history.back()>
          </font>&nbsp;</div></td>
    </tr>
    <tr> 
      <td bgcolor="#e8ebf5"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
        仓库编码</font>&nbsp;</td>
      <td><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
        <input name="number" type="text" id="number" size="6" maxlength="2">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="26%" bgcolor="#e8ebf5"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
        仓库名称</font>&nbsp;</td>
      <td><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
        <input type="text" name="cpro" size="30" maxlength="15">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="26%" bgcolor="#e8ebf5"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif">仓库地点</font>&nbsp;</td>
      <td><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
        <input type="text" name="proflname" size="30" maxlength="35">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="26%" bgcolor="#e8ebf5"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">备　　注</font>&nbsp;</td>
      <td> <div align="left"> <font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
          <textarea name="remark" cols="30"></textarea>
          </font>&nbsp;</div></td>
    </tr>
  </table>
</form>
</body>
</html>
