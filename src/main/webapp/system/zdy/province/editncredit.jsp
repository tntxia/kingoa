<%@ page import="java.sql.*,java.util.*"%>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page contentType="text/html;charset=GB2312"%>
<head>
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
<title>оƬ�̳����޹�˾</title>
<%
String id1=request.getParameter("id");
String sql="select id,province_num,province_name from province where id='"+id1+"'";

ResultSet rs=einfodb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
%>
</head>


<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="doeditcredit.jsp"  onSubmit="return isValid();">
  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="17%" height="26"><font size="2" color="#000000">�༭ &gt;&gt;</font>&nbsp;</td>
      <td width="83%" height="26" colspan="2"> <div align="right"><font size="2"> 
          <input type="hidden" name="id" size="20" style="border: 1 inset #C3D9FF" value="<%=id1%>">
          </font><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="ȷ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="button" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF" onclick=javascript:history.back()>
        </div></td>
    </tr>
    <tr>
      <td bgcolor="#e8ebf5"><font size="2" color="#000000">ʡ�б���:</font>&nbsp;</td>
      <td colspan="2"><font size="2" color="#000000">
        <input name="cre_num" type="text" id="cre_num" value="<%=rs.getString(2)%>" size="6" maxlength="3">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%" bgcolor="#e8ebf5"><font size="2" color="#000000">ʡ������:</font>&nbsp;</td>
      <td colspan="2" width="83%"> <div align="left"><font size="2" color="#000000"> 
          <input type="text" name="cre_name" size="35" value="<%=rs.getString(3)%>">
          </font>&nbsp;</div></td>
    </tr>
  </table>
</form>
</body>
</html>
