<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../../common/checkManageLogin.jsp"%>
<%   
java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String currentDate=simple.format(new java.util.Date());

String basePath = request.getContextPath();

%>
<html>
<head>
<title>�½���ͬģ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<script language="JavaScript" src="<%=basePath%>/js/config.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/jquery.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/system/contact_template/new.js"></script>
</script>
</head>
<body bgcolor="#ffffff" text="#000000" topmargin="0">
<form name="form1" method="post" action="template.dispatch">
<input type="hidden" name="method" value="add" />
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <tr> 
      <td width="13%" bgcolor="#d3d8eb"><font size="2" color="#000000">��������</font>&nbsp;</td>
      <td width="87%" bgcolor="#d3d8eb"> <div align="right"><font size="2" color="#000000"> 
      	<select name="dept" id="dept"></select>
      </td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#d3d8eb"><font size="2" color="#000000">��ͬģ��</font>&nbsp;</td>
      <td width="87%" bgcolor="#d3d8eb"> <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="ȷ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
        </div></td>
    </tr>
    <tr> 
      <td height="19" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">��ͬ����:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <input name="q_name" type="text" id="q_name" size="60">
        </font><font size="2">&nbsp;</font><font size="2" color="#000000">&nbsp; </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">��ͬ����:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_topic" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">��˾����:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_company" size="50">
        </font><font size="2"><a href="#" style="font-size: 12px" onClick="MM_openBrWindow('do_search.jsp','','scrollbars=yes,width=820,height=420')">
        <img border="0" src="<%=basePath %>/images/search.gif" width="27" height="12"></a></font><font size="2" color="#000000">&nbsp; 
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">��˾��ַ:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_addr" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">��������:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <input name="q_man" type="text" id="q_man" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">��˾�绰:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_tel" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">��˾����:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_fax" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">��������:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_email" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">�����ʺ�:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <input type="text" name="q_net" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">��������:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <input name="q_post" type="text" id="q_post" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">��˰���:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <input name="q_number" type="text" id="q_number" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">��������:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <textarea name="q_tk" cols="95" rows="15"></textarea>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">������ע:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <textarea name="remark" cols="60"></textarea>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">��������:</font>&nbsp;</td>
      <td width="87%"> <div align="left"><font size="2" color="#000000"> </font> 
          <input type="hidden" name="q_date" value="<%=currentDate%>">
          <%=currentDate%> </div></td>
    </tr>
  </table>
</form>
</body>
</html>

