<%@ page contentType="text/html;charset=gb2312"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="com.tntxia.oa.system.*"%>
<%@ page language="java" import="com.tntxia.oa.system.entity.*"%>
<%
	String basePath = request.getContextPath();
	String username = (String) session.getAttribute("username");
	String adminname = (String) session.getAttribute("adminname");
	List<ManageItem> manageItemList = SystemCache.manageItemList;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>ϵͳ���� - ��ҳ</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/admin/manageIndex.css" />
<script type="text/javascript"
	src="<%=basePath%>/js/system/managerIndex.js"></script>
</head>
<body topmargin="0">
	<div align="center"></div>
	<table width="98%" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td><p align="left">
					<font face="����" size="2"><br> </font><font size="2"
						color="#213e9b"><strong>ϵͳ�������</strong></font> <font face="����"
						size="2">&nbsp;&nbsp;����Ա:<%=adminname == null ? username : adminname%>
					</font>
				</p>
				<hr class="line" color=#a9a9a9 size=1></td>
		</tr>
	</table>
	<br>
	<table width="98%" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<%
			for (int i=0;i<manageItemList.size();i++) {
				ManageItem item = manageItemList.get(i);
			%>
				<td><input type="button" value="<%=item.getName()%>"
					class="manageButton" onClick="window.open('<%=item.getUrl()%>',
					'<%=item.getTarget() %>','<%=item.getWinOpt() %>')" /></td>
				
				<%
				if((i+1)%5==0){
				%></tr>
				
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr><%
				}
			
			}
			%>
		</tr>

		<tr>
			<td colspan="5"><BR>
				<hr
					style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted"
					color=#a9a9a9 size=1> <BR></td>
		</tr>
		<tr>
			<td><font size="2" color="#666600"> <input type="button"
					value="��˾������Ϣ" class="manageButton"
					onClick="window.open('companym.jsp','nw', 'height=500, width=955, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <input type="button"
					value="���ü���" class="manageButton"
					onClick="window.open('zdy/xyjb/hlxx.jsp','gnw', 'height=260, width=560, top=200, left=200, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><input type="button" value="��ҵ����" class="manageButton"
				onClick="window.open('../xclient/hylx.jsp','nw', 'height=360, width=460, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</td>
			<td><font size="2" color="#666600"> <input type="button"
					value="���ʹ���" class="manageButton"
					onClick="window.open('hl/hlxx.jsp','nw', 'height=360, width=560, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <input type="button"
					value="�����" class="manageButton"
					onClick="window.open('zdy/activity/activity.jsp','pronw', 'height=300, width=650, top=200, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><font size="2" color="#666600"> <input type="button"
					value="������λ" class="manageButton"
					onClick="window.open('punit/punit.jsp','adminwd', 'height=360, width=560, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><input type="button" value="�տ�����" class="manageButton"
				onClick="window.open('bank/hlxx.jsp','nw', 'height=360, width=660, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</td>
			<td><font size="2" color="#666600"> <input type="button"
					value="��Ʒ���" class="manageButton"
					onClick="window.open('zdy/pro-fl/secprofl.jsp','_blank', 'height=300, width=780, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <input type="button"
					value="Ʒ���Զ���" class="manageButton"
					onClick="window.open('zdy/pro-fl/lprofl.jsp','_blank', 'height=300, width=610, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <input type="button"
					value="֪ʶ������" class="manageButton"
					onClick="window.open('knowledge/knowledge.dispatch?method=typeList','_blank', 'height=360, width=650, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><b><font color="#000080"> <input type="button"
						value="�����Զ���" name="B2233333"
						style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
						onClick="window.open('zdy/country/credit.jsp','gnw', 'height=300, width=560, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
				</font></b></td>
			<td><b><font color="#000080"> <input type="button"
						value="ʡ���Զ���" name="B22333332"
						style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
						onClick="window.open('zdy/province/credit.jsp','gnw', 'height=300, width=560, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
				</font></b></td>
			<td><font size="2" color="#666600"> <input type="button"
					value="���ʽ" name="B223333"
					style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
					onClick="window.open('zdy/gather/hlxx.jsp','gnw', 'height=300, width=560, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <INPUT TYPE="button"
					VALUE="�����Ŀ����" NAME="B22333333"
					STYLE="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
					ONCLICK="window.open('zdy/km/credit.jsp','gnw', 'height=300, width=560, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <INPUT TYPE="button"
					VALUE="���ÿ�Ŀ����" NAME="B223333332"
					STYLE="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
					ONCLICK="window.open('zdy/fkm/credit.jsp','gnw', 'height=300, width=560, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><FONT SIZE="2" COLOR="#666600"> <INPUT TYPE="button"
					VALUE="��ͬģ������" NAME="B2233325" class="manageButton"
					ONCLICK="window.open('contact_template/template.dispatch?method=list','gnw', 'height=520, width=955, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<TD><FONT SIZE="2" COLOR="#666600"> <input type="button"
					value="����ģ���Զ���" name="B2233332323"
					style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
					onClick="window.open('zdy/wage/wagem.jsp','adminw', 'height=500, width=650, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<TD><font size="2" color="#666600"> <input type="button"
					value="��������" name="B22333323232"
					style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
					onClick="window.open('../checkwork/checktime/checktime_main.jsp','adminw', 'height=500, width=650, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><FONT SIZE="2" COLOR="#666600"> <input type="button"
					value="���ڷ�Χ" name="B22333323233"
					style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
					onClick="window.open('../checkwork/checkman/checkman_main.jsp','adminw', 'height=500, width=650, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <input type="button"
					value="�ɹ����ʽ" name="B223333"
					style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
					onClick="window.open('zdy/payment_cg/hlxx.jsp','gnw', 'height=300, width=560, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
		</tr>
		<tr>
			<td colspan="5"><BR>
				<hr
					style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted"
					color=#a9a9a9 size=1> <BR></td>
		</tr>
		<tr>
			<td><font size="2" color="#666600"> <input type="button"
					value="�ɹ���������" name="B223333232"
					style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
					onClick="window.open('zdy/cgsp/hlxx.jsp','adminw', 'height=500, width=650, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <input type="button"
					value="��Ʒ��������" name="B223333242"
					style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
					onClick="window.open('zdy/ypsp/hlxx.jsp','adminw', 'height=500, width=650, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <input type="button"
					value="��ͬ��������" name="B2233332"
					style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
					onClick="window.open('zdy/ddsp/hlxx.jsp','adminw', 'height=500, width=650, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <input type="button"
					value="������Ŀ��������" name="B223333225"
					style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
					onClick="window.open('zdy/swoutsp/hlxx.jsp','_balnk', 'height=450, width=920, top=100, left=20, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"><b><font size="2"
						color="#666600"> <input type="button" value="������������"
							class="manageButton"
							onClick="window.open('notice/sp.jsp','adminw', 'height=450, width=920, top=100, left=20, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
					</font><font color="#000080"> </font></b></font></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><font size="2" color="#666600"><b><font
						color="#000080"> <input type="button" value="�˻���������"
							name="B22333324" class="manageButton"
							onClick="window.open('process/th/hlxx.jsp','adminw', 'height=500, width=955, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
					</font></b></font></td>
			<td><font size="2" color="#666600"> <input type="button"
					value="������������" name="B22333322"
					style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
					onClick="window.open('zdy/fysp/hlxx.jsp','adminw', 'height=450, width=920, top=100, left=20, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <b><font
						color="#000080"> <input type="button" value="�����������"
							name="B223333222"
							style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
							onClick="window.open('zdy/jksp/hlxx.jsp','adminw', 'height=450, width=920, top=100, left=20, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
					</font></b></font></td>
			<td><b><font size="2" color="#666600"> </font><font size="2"
					color="#666600"> <input type="button" value="������������"
						name="B223333223"
						style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
						onClick="window.open('zdy/paysp/hlxx.jsp','adminw', 'height=450, width=920, top=100, left=20, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
				</font><font color="#000080"> </font></b></td>
			<td><font size="2" color="#666600"><b><font size="2"
						color="#666600"> <input type="button" value="ǩ����������"
							name="B2233332322"
							style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
							onClick="window.open('zdy/qcsp/hlxx.jsp','adminw', 'height=500, width=650, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
					</font></b> </font></td>
		</tr>
		<tr>
			<td><b><font color="#000080"> </font></b></td>
			<td><font size="2" color="#666600">&nbsp; </font></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><font size="2" color="#666600"> <input type="button"
					value="�칫��Ʒ����" name="B22333322422222"
					style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
					onClick="window.open('zdy/cg_osp/hlxx.jsp','_blank', 'height=450, width=920, top=100, left=20, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <input type="button"
					value="ת����������" name="B2233332242"
					style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
					onClick="window.open('zdy/zzsp/hlxx.jsp','adminw', 'height=450, width=920, top=100, left=20, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <input type="button"
					value="������������" name="B223333224"
					style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
					onClick="window.open('zdy/jcsp/hlxx.jsp','adminw', 'height=450, width=920, top=100, left=20, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <input type="button"
					value="������������" name="B22333322422"
					style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
					onClick="window.open('zdy/ccsp/hlxx.jsp','adminw', 'height=450, width=920, top=100, left=20, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <input type="button"
					value="н����������" name="B223333224222"
					style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF"
					onClick="window.open('zdy/xzsp/hlxx.jsp','adminw', 'height=450, width=920, top=100, left=20, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><font size="2" color="#666600"><b><font
						color="#000080"> <input type="button" value="������������"
							class="manageButton"
							onClick="window.open('zdy/dhsp/hlxx.jsp','adminw', 'height=500, width=955, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
					</font></b></font></td>
			<td><font size="2" color="#666600"><b><font
						color="#000080"> <input type="button" value="�ɹ��˻���������"
							class="manageButton"
							onClick="window.open('zdy/thsp_cg/hlxx.jsp','adminw', 'height=500, width=955, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
					</font></b></font></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="5"><BR>
				<hr
					style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted"
					color=#a9a9a9 size=1> <BR></td>
		</tr>
		<tr>
			<td><font size="2" color="#666600"> <input type="button"
					value="��˾�������" class="manageButton"
					onClick="window.open('notice/notice.dispatch?method=list','nww', 'height=500, width=955, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=yes, status=no')">
			</font></td>
			<td width="14%"><font size="2" color="#666600"> <input
					type="button" value="��ϵͳ�����û�" class="manageButton"
					onClick="window.open('username.jsp','adminwd', 'height=360, width=660, top=200, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=yes, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <input type="button"
					value="�޸�ϵͳ����" class="manageButton"
					onClick="window.open('manageschange.jsp','adminwd', 'height=250, width=600, top=200, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <input type="button"
					value="�ڲ��ʼ�����" class="manageButton"
					onClick="window.open('../webmail/minfomail.jsp','mail', 'height=500, width=750, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td><font size="2" color="#666600"> <input type="button"
					value="�û�̸����ʷ" class="manageButton"
					onClick="window.open('../ally_talk.jsp','_blank', 'height=500, width=750, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><font size="2" color="#666600"> <input type="button"
					value="�û���½��־" class="manageButton"
					onClick="window.open('log.jsp','aqt', 'height=500, width=750, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=yes, status=no')">
			</font></td>
			<td width="14%"><font size="2" color="#666600"> <input
					type="button" value="�����û���Ϣ" class="manageButton"
					onClick="window.open('onlineuser.jsp','qt', 'height=500, width=750, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td width="14%"><font size="2" color="#666600"> <input
					type="button" value="�ͻ���Ϣ" class="manageButton"
					onClick="window.open('../xclient/clist.jsp','_blank', 'height=500, width=750, top=100, left=50, toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td width="14%"><font size="2" color="#666600"> <input
					type="button" value="��ʷ���ݴ���" class="manageButton"
					onClick="window.open('../sale/ddgl/wally.jsp','_blank', 'height=500, width=750, top=100, left=50, toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
			<td width="14%"><font size="2" color="#666600"> <input
					type="button" value="�����ʺ�" class="manageButton"
					onClick="window.open('smanageschange.jsp','_blank', 'height=500, width=750, top=100, left=50, toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes,location=no, status=no')">
			</font></td>
		</tr>
		<tr>
			<TD WIDTH="14%">&nbsp;</TD>
			<TD WIDTH="14%">&nbsp;</TD>
			<TD>&nbsp;</TD>
			<TD>&nbsp;</TD>
			<TD>&nbsp;</TD>
		</tr>

		<tr>
			<td colspan="5"><BR>
				<hr
					style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted"
					color=#a9a9a9 size=1></td>
		</tr>
	</table>
	<p align="left">
		<font size="2" color="#666600"> </font>
	</p>

</body>

</html>
