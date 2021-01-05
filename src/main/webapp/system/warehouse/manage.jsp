<%@ page contentType="text/html;charset=gb2312" %>
<%

String basePath = request.getContextPath();

%>
<html>
<head>
<title>大类自定义</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">

#bk {
	border: 1px solid #909ECD;
	padding-right: 5px;
	padding-left: 5px;
	padding-top: 5px;
	padding-bottom: 5px;
}

td,p,select,input,textarea {font-size:12px}
.l15 {line-height:150%}
.l13 {line-height:130%}
.f10 {font-size:10px}
.f14 {font-size:14.9px}
.bdrclr01{color:#000000; border-color:#000000}
.c03{color:#000000;border-color:#000000;}
A:link {text-decoration:none;color:#0000ff;}
A:visited {text-decoration:none;color:#800080;}
A:active {text-decoration:none;color:#0000ff;}
A:hover {text-decoration:underline;color:#0000ff;}

a {
	padding-left:10px;
}
</style>
<script language="JavaScript" src="<%=basePath%>/js/config.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/jquery.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/tntxia.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/system/warehouse/manage.js"></script>
</head>

<body bgcolor="#ffffff" text="#000000" bgcolor="#ffffff" >
<div id="bk">
  <form id="form1" name="form1" method="post" action="del-warehouse-batch.jsp">
  	<input type="hidden" value="" name="addr" />
    <font size="2"><font size="2" color="#666600">
      <input type="button" value="仓库自定义" name="B223" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('list.jsp','main', 'height=300, width=610, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
      </font></font><br>
    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
    <table id="datagrid" height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
          <tbody>
          
          </tbody>
      
      
    </table>
  </form>
</div>
</body> 
</html> 
