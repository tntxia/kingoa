<%@ page contentType="text/html;charset=gb2312"%>
<%@ page language="java" import="java.sql.*"%>
<%@ include file="../../common/checkManageLogin.jsp"%>
<%
String basePath = request.getContextPath();

%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�û���Ϣ����</title>
<script language="JavaScript" src="<%=basePath%>/js/config.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/jquery.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/common.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/js/system/user/list.js"></script>

<style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
-->
</style>
</HEAD>
<style type="text/css">
<!--
.H1 {
	font-size: 12pt;
	line-height: 15pt;
	align:"center"
}

.ourfont {
	font-size: 9pt;
	line-height: 15pt;
}

.ourfont1 {
	font-size: 8pt;
	line-height: 13pt;
}

A {
	text-transform: none;
	text-decoration: none;
	color: #0000ff
}

a:hover {
	text-decoration: underline;
	color: #0000ff
}
-->
</style>

<body topmargin="0" marginwidth="0" marginheight="0">
	<CENTER>
		<form name="form1" method="post">
			<table width="100%" border="0" cellpadding="3" height="50">
				<tr>
					<td><div align="center">
							<font size="5"><b><font color="#213e9b">�û���Ϣ����</font>
							</b>
							</font>
						</div>
						<hr width="100%" size="1" noshade color="#213e9b"></td>
				</tr>
			</table>

			<table height=8 width="100%" bordercolor="#CCBE5A" cellspacing="0"
				bordercolordark="#ffffff" cellpadding="3" align="center"
				bgcolor="#ffffff" bordercolorlight="#7f9db9" border="1">
				<TR>
					<TD width="17%" rowspan='5' align='left' valign="top"><FONT
						FACE="����" COLOR="#000000" size="2">��¼����</FONT><br> <select
						name="nameSelect" id="nameSelect" size="12"
						onChange="changeName()">
					</select></TD>
					<TD width="7%" align='left' nowrap bgcolor="#e8ebf5"><FONT
						COLOR="#000000" size="2" FACE="����">�� ¼ ��: </font>&nbsp;</td>
					<TD width="35%" align='left'><FONT COLOR="#000000" size="2"
						FACE="����"> 
						<span id="name"></span>
					</font>&nbsp;</td>
					<TD colspan="2" align='left'>&nbsp;</TD>
				</TR>
				<TR>
					<TD align='left' nowrap bgcolor="#e8ebf5"><font
						color="#000000" size="2" face="����">Ӣ������:</font>&nbsp;</td>
					<TD align='left'><font color="#000000" size="2" face="����">
						<span id="name_en"></span>
					</font>&nbsp;</td>
					<TD width="7%" align='left' nowrap bgcolor="#e8ebf5"><FONT
						COLOR="#000000" size="2" FACE="����">Ȩ���飺</font>&nbsp;</td>
					<TD width="34%" align='left'><FONT COLOR="#000000" size="2"
						FACE="����">
						<span id="restrainName"></span>
					 </font>&nbsp;</td>
				</TR>
				<TR>
					<TD align='left' nowrap bgcolor="#e8ebf5"><FONT
						COLOR="#000000" size="2" FACE="����">ְ λ:</font>&nbsp;</td>
					<TD align='left'><FONT COLOR="#000000" size="2" FACE="����">
						<span id="position"></span>
					</font>&nbsp;</td>
					<TD align='left' nowrap bgcolor="#e8ebf5"><FONT
						COLOR="#000000" size="2" FACE="����">�� ����&nbsp; </FONT></TD>
					<TD align='left'><FONT COLOR="#000000" size="2" FACE="����">
							<span id="tel"></span>
					</FONT></TD>
				</TR>
				<tr>
					<td colspan='4' align='center'><input type="button"
						value="�����û�" name="B223"
						style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
						onClick="window.open('register.jsp','adminwdn', 'height=436, width=900, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
						<input type="button" value=" �޸��û�" name="B223"
						style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
						onClick="userChange()">
						<input type="button" name="delbutton" value="ɾ���û�"
						style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
						onClick="delclick()"> <input type="reset" name="Submit5"
						value=" �� �� "
						style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
						onClick="window.close()"></td>
				</TR>
			</TABLE>
		</form>
	</CENTER>
</BODY>
</HTML>