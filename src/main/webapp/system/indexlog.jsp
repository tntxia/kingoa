<jsp:useBean id="einfodb" scope="page" class="bankdb.bankdb" />
<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<html>
<head>
<title>оƬ�̳����޹�˾</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
td {  font-size: 12px}
input {  border: 1px #333333 solid}
-->
</style>
<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->
</script>


</head>
<script language="JavaScript">
function isValid(){
    if(form1.user_id.value==""){
        alert("��¼������Ϊ��!");
        form1.user_id.focus();        
	return false;
    }
    else if((form1.password.value.length<3)||(form1.password.value.length>8)){
        alert("���������3-8λ��ĸ������!");
        form1.password.focus();        
	return false;
    }
    else {
        return true;
    }
}
</script>
<body bgcolor="#ffffff" text="#000000" leftmargin="00" topmargin="00" marginwidth="00" marginheight="00">
<script language="JavaScript">
var isMonth = new
Array("1��","2��","3��","4��","5��","6��","7��","8��","9��","10��","11��","12��");
var isDay = new
Array("������","����һ","���ڶ�","������","������","������","������","������");
today = new Date () ;
Year=today.getYear();
Date=today.getDate();
if (document.all)
document.title="������: "+Year+"��"+isMonth[today.getMonth()]+Date+"��"+isDay[today.getDay()]
</script>
<table width="760" border="0" height="500" cellspacing="0" cellpadding="0" background="images/crm.gif">
  <tr> 
    <td width="470" height="424">&nbsp;</td>
    <td width="290" height="424"> 
   <% 
   String getmessage = (String) session.getValue("login_message");
   if(getmessage==null) getmessage="";
   %>
      <br>
      <%= getmessage %> 
      <form name="form1" method="post" action="login_confirm.jsp" onSubmit="return isValid();" >
      <table width="169" height="55" align="center" border="0">
      <tr> 
            <td> <p>�û���:: <font size="2"> 
                <input name="user_id" type="text" id="user_id" size="12">
                </font></p>
              <p>�ܡ���:: 
                <input type="password" name="password" size="12">
              </p>
              <p align="center"> 
                <input type="image" border="0" name="imageField" src="go.gif" onClick="form1.submit()" width="77" height="20">
              </p>
            </td>
          </tr>
        </table>
      </form>
      <br>
    </td>
        </tr>
        <tr> 
          <td width="470">&nbsp;</td>
          <td width="290">&nbsp;</td>
        </tr>
      </table>
    
<div id="Layer1" style="position:absolute; left:39px; top:100px; width:215px; height:212px; z-index:1"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="247" height="247">
    <param name=movie value="logo.swf">
    <param name=quality value=high>
    <param name="wmode" value="transparent">
    <embed src="logo.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="247" height="247" wmode="transparent">
    </embed> 
  </object></div>
</body>
</html>
