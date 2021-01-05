<%@ page contentType="text/html;charset=gb2312" %>
<%
 String id=request.getParameter("id");
 %>
<html>
<head>
<title>图片上载</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin: 0px;
	margin: 0px;
	text-align: center;
	background-color: #FFFFFF;
}
#xhx {
	height: 26px;
	width: 98%;
	margin-right: auto;
	margin-left: auto;
	margin-top: 10px;
}
#img {
	background-image: url(../../logo.gif);
	background-repeat: no-repeat;
	float: left;
	height: 100px;
	width: 192px;
}
#rigl {
	height: 26px;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #213e9b;
	text-align: left;
	}
.txb {
	line-height: 1.5;
	margin-top: 20px;
	padding-right: 20px;
	padding-left: 20px;
	text-align: left;
}
	</style>
</head>

<body bgcolor="#ffffff" text="#000000" topmargin="0" marginwidth="0" marginheight="0">
<div id="xhx">
<div id="img"></div>
<div id="rigl"><span style="line-height: 26px;margin-top:5px; width:200px;vertical-align: middle;font-weight: bold;font-size:15px; font-family:'宋体'; letter-spacing: 3px; color: #213e9b; vertical-align: bottom;"><img src="../../images/arr3.gif">&nbsp;上载logo</span></div>
</div><div class="txb"><form name="form1" method="post" action="do_euppic.jsp" enctype="multipart/form-data">
  <div align="left">
    <input type="hidden" name="id" value="<%=id%>">
    <font size="2" color="#000000"> 
    <% String getpath = (String) session.getValue("picpath_message1");
         if(getpath==null) getpath="";
         %>
    <%= getpath %></font><br>
  </div>
  <p align="left"> <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1></p>

    <input type="FILE" name="FILE1" size="50">
    <br><br>
    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1></p>

    <input type="submit" value="现在上载" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" name="SUBMIT">
    <font size="2" color="#666600"> 
    <input type="button" value="暂不上载" name="B223" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()">
    </font><font color="#000000"></font></p>
  <p align="left"><font size="2">说明:1.图片名称必须是英文字母、数字等；</font></p>
  <p align="left"><font size="2"> 　 　2.图片大小为150*85象素最佳.</font></p>
  <p>&nbsp;</p>
</form></div>
<p>&nbsp;</p></body>
</html>
