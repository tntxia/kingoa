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
<title>оƬ�̳����޹�˾</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function isValid(){
    var i,j,strTemp;
    strTemp="0123456789";
	var num1=form1.snumber.value;
    if(form1.proflname.value==""){
        alert("��������������!");
        form1.proflname.focus();        
	return false;
    }
   else if(form1.snumber.value==""){
        alert("����д���!");
        form1.snumber.focus();
	return false;
    }
   else {
         for (i=0;i<num1.length;i++)
        {
        j=strTemp.indexOf(num1.charAt(i));    
        if (j==-1)
        {
            alert("����д���ָ�ʽ!");
        form1.snumber.focus();
        return false;
        }
	    else if((form1.snumber.value.length!=3)){
        alert("��ű�����3λ����!");
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
      <td width="18%"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif">�༭-&gt;&gt; 
        <input type="hidden" name="id" value="<%=id2%>">
        <input type="hidden" name="firkind" value="<%=rs.getString(2)%>">
        </font>&nbsp;</td>
      <td width="82%" colspan="3"> 
        <div align="right"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
          <input type="submit" name="Submit" value="ȷ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          </font><font size="2" face="Arial, Helvetica, sans-serif"> 
          <input type="button" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF" onClick="history.back()">
          </font>&nbsp;</div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td nowrap bgcolor="#e8ebf5">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">��Ʒ�����</font>&nbsp;</div>
      </td>
      <td colspan="3"><FONT SIZE="2" COLOR="#000000"> 
        <input name="snumber" type="text" id="snumber" value="<%=rs.getString("snumber").trim()%>" size="6" maxlength="4">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" nowrap bgcolor="#e8ebf5">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">��Ʒ�����������</font>&nbsp;</div>
      </td>
      <td colspan="3"><FONT SIZE="2" COLOR="#000000"> 
        <input type="text" name="proflname" value="<%=rs.getString("proflname")%>" size="40" maxlength="45">
        &nbsp;</font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" nowrap bgcolor="#e8ebf5">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">��Ʒ���Ӣ������</font>&nbsp;</div>
      </td>
      <td colspan="3"><FONT SIZE="2" COLOR="#000000"> 
        <input type="text" name="eprofl" value="<%=rs.getString("eprofl")%>" size="40" maxlength="45">
        &nbsp;</font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <TD WIDTH="18%" nowrap bgcolor="#e8ebf5">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">��������=</font>&nbsp;</div>
      </TD>
      <TD><FONT SIZE="2" COLOR="#000000">�ɱ�����/
        <INPUT NAME="price_gk" TYPE="text" ID="snumber" SIZE="6" MAXLENGTH="4" VALUE="<%=rs.getDouble("price_gk")%>">
        (��������Ϊ0)</font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <TD WIDTH="18%" nowrap bgcolor="#e8ebf5">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">�����ۼ�=</font>&nbsp;</div>
      </TD>
      <TD><FONT SIZE="2" COLOR="#000000">�ɱ�����/
        <INPUT NAME="price_jysj" TYPE="text" ID="snumber" SIZE="6" VALUE="<%=rs.getDouble("price_jysj")%>" MAXLENGTH="4">
        (��������Ϊ0)</font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <TD WIDTH="18%" nowrap bgcolor="#e8ebf5">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">����޼�=</font>&nbsp;</div>
      </TD>
      <TD><FONT SIZE="2" COLOR="#000000">�ɱ�����/
        <INPUT NAME="price_min" TYPE="text" ID="snumber" SIZE="6" VALUE="<%=rs.getDouble("price_min")%>" MAXLENGTH="4">
        (��������Ϊ0)</font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <TD WIDTH="18%" nowrap bgcolor="#e8ebf5">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">����۸�=</font>&nbsp;</div>
      </TD>
      <TD><FONT SIZE="2" COLOR="#000000">�ɱ�����/
        <INPUT NAME="price_dljg" TYPE="text" ID="snumber" SIZE="6" MAXLENGTH="4" VALUE="<%=rs.getDouble("price_dljg")%>">
        (��������Ϊ0)</font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" nowrap bgcolor="#e8ebf5">
        <DIV ALIGN="RIGHT"><FONT SIZE="2" COLOR="#000000">˵��</font>&nbsp;</div>
      </td>
      <td colspan="3"> 
        <div align="left"> <FONT SIZE="2" COLOR="#000000"> 
          <textarea name="remark" cols="40"><%=rs.getString("remark")%></textarea>
          (�ö������Ϊ���ۺ�ͬ�������̿�����)</font>&nbsp;</div>
      </td>
    </tr>
  </table>
</form>
</body><%}%>
</html>
