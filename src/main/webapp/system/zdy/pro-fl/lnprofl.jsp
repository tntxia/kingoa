<%@ page contentType="text/html;charset=gb2312" %>
<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
String proname=request.getParameter("proname");
String sid=request.getParameter("sid");
String id=request.getParameter("id");
String snumber=request.getParameter("snumber");

%>
<html>
<head>
<title>оƬ�̳����޹�˾</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function isValid(){
    var i,j,strTemp;
    strTemp="0123456789";
	var num1=form1.tnumber.value;
    if(form1.cpro.value==""){
        alert("��������������!");
        form1.cpro.focus();        
	return false;
    }
   else if(form1.tnumber.value==""){
        alert("����д���!");
        form1.tnumber.focus();
	return false;
    }
   else {
         for (i=0;i<num1.length;i++)
        {
        j=strTemp.indexOf(num1.charAt(i));    
        if (j==-1)
        {
            alert("����д���ָ�ʽ!");
        form1.tnumber.focus();
        return false;
        }
	    else if((form1.tnumber.value.length!=3)){
        alert("��ű�����3λ����!");
        form1.tnumber.focus();
	return false;
    }
    }
    return true;      
    }
}
</script>

</head>

<body text="#000000" topmargin="0">
<form name="form1" method="post" action="do_profll.jsp" onSubmit="return isValid();">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="20%"><font size="2" color="#000000"> &gt;&gt; 
        <input type="hidden" name="sid" size="30" maxlength="35" value="<%=sid%>">
        <input type="hidden" name="id" size="30" maxlength="35" value="<%=id%>">
        <input type="hidden" name="proname" size="30" maxlength="35" value="<%=proname%>">
        <input name="snumber" type="hidden" id="snumber" value="<%=snumber%>" size="30" maxlength="35">
        </font>&nbsp;</td>
      <td> <div align="right"><font size="2" color="#000000"> 
          <% String getmessagefll = (String) session.getValue("profll_message");
   if(getmessagefll==null) getmessagefll="";
   %>
          <%= getmessagefll %> 
          <input type="submit" name="Submit" value="ȷ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF" onclick=javascript:history.back()>
        </div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Ʒ�Ʊ���</font>&nbsp;</td>
      <td>
        <input name="tnumber" type="text" id="tnumber" size="6" maxlength="3">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%"><font size="2" color="#000000">Ʒ������:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <input type="text" name="cpro" maxlength="50" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%"><font size="2" color="#000000">��Ӧ������:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> <font color="#0000FF"> </font></font><font size="2" color="#000000"><font size="2" color="#000000"> 
        <input type="text" name="epro" maxlength="50" size="60">
        </font><font color="#0000FF"> </font></font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%"><font size="2" color="#000000">˵������:</font>&nbsp;</td>
      <td> <div align="left"><font size="2" color="#000000"> </font> <font size="2" color="#000000"> 
          <textarea name="remark" cols="60" rows="3"></textarea>
          </font>&nbsp;</div></td>
    </tr>
  </table>
</form>
</body><%}%>
</html>
