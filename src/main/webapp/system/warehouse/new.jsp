<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*,java.text.*"%>
<%

String basePath = request.getContextPath();

%>
<html>
<head>
<title>�ֿ��Զ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function isValid(){
    var i,j,strTemp;
    strTemp="0123456789";
	var num1=form1.number.value;
    if(form1.cpro.value==""){
        alert("������ֿ�����!");
        form1.cpro.focus();        
	return false;
    }
   else if(form1.number.value==""){
        alert("����д���!");
        form1.number.focus();
	return false;
    }
   else {
         for (i=0;i<num1.length;i++)
        {
        j=strTemp.indexOf(num1.charAt(i));    
        if (j==-1)
        {
            alert("����д���ָ�ʽ!");
        form1.number.focus();
        return false;
        }
	    else if((form1.number.value.length!=2)){
        alert("��ű�����2λ����!");
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
      <td width="26%" bgcolor="#d3d8eb"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif">���Ӳֿ�</font>&nbsp;</td>
      <td width="74%" bgcolor="#d3d8eb"> <div align="right"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
          
          <input type="submit" name="Submit" value="ȷ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> <font face="Arial, Helvetica, sans-serif" size="2"> 
          <input type="reset" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF" onclick=history.back()>
          </font>&nbsp;</div></td>
    </tr>
    <tr> 
      <td bgcolor="#e8ebf5"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
        �ֿ����</font>&nbsp;</td>
      <td><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
        <input name="number" type="text" id="number" size="6" maxlength="2">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="26%" bgcolor="#e8ebf5"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
        �ֿ�����</font>&nbsp;</td>
      <td><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
        <input type="text" name="cpro" size="30" maxlength="15">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="26%" bgcolor="#e8ebf5"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif">�ֿ�ص�</font>&nbsp;</td>
      <td><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
        <input type="text" name="proflname" size="30" maxlength="35">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="26%" bgcolor="#e8ebf5"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">������ע</font>&nbsp;</td>
      <td> <div align="left"> <font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
          <textarea name="remark" cols="30"></textarea>
          </font>&nbsp;</div></td>
    </tr>
  </table>
</form>
</body>
</html>
