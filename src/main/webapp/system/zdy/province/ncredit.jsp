<%@ page contentType="text/html;charset=gb2312" %>

<html>
<head>
<title>ʡ���Զ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function isValid(){
    var i,j,strTemp;
    strTemp="0123456789";
	var num1=form1.cre_num.value;
    if(form1.cre_num.value==""){
        alert("���������!");
        form1.cre_num.focus();        
	return false;
    }
    if(form1.cre_name.value==""){
        alert("������ʡ��!");
        form1.cre_name.focus();        
	return false;
    }
   else {
         for (i=0;i<num1.length;i++)
        {
        j=strTemp.indexOf(num1.charAt(i));    
        if (j==-1)
        {
            alert("����д���ָ�ʽ!");
        form1.cre_num.focus();
        return false;
        }
	    else if((form1.cre_num.value.length!=3)){
        alert("���������3λ����!");
        form1.cre_num.focus();
	return false;
    }

    }
    return true;      
    }
}
</script>

</head>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="do_credit.jsp"  onSubmit="return isValid();">
  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="17%" height="26"><font size="2" color="#000000">���ʡ�� &gt;&gt;</font>&nbsp;</td>
      <td width="83%" height="26"> <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="ȷ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
        </div></td>
    </tr>
    <tr> 
      <td bgcolor="#e8ebf5"><font size="2" color="#000000">ʡ�б���:</font>&nbsp;</td>
      <td> <div align="left"><font size="2" color="#000000"> 
          <input name="cre_num" type="text" id="cre_num" size="6" maxlength="3">
          </font>&nbsp;</div></td>
    </tr>
    <tr> 
      <td width="17%" bgcolor="#e8ebf5"><font size="2" color="#000000">ʡ������:</font>&nbsp;</td>
      <td width="83%"> <div align="left"><font size="2" color="#000000"> 
          <input type="text" name="cre_name" size="50">
          </font>&nbsp;</div></td>
    </tr>
  </table>
</form>
</body>
</html>
