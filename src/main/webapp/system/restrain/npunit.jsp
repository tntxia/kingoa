<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="einfodb" scope="page" class="com.tntxia.db.DBConnection" />
<%@ page import="java.sql.*,java.util.*,java.text.*"%> 
<%

String basePath = request.getContextPath();

%>
<html>
<head>
<title>Ȩ���Զ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function isValid(){
    if(form1.restrain_name.value==""){
        alert("������Ȩ����!");
        form1.restrain_name.focus();        
	return false;
    }
    return true;      
    }
</script>

</head>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="<%=basePath %>/system/restrain.dispatch"  onSubmit="return isValid();"> 
<input type="hidden" name="method" value="addRestrain">
  <table width="100%" border="1" cellspacing="0" cellpadding="0" height="789">
    <tr> 
      <td width="17%" height="6" bgcolor="#C1D9FF"><font size="2" color="#000000">����--&gt;&gt;</font></td>
      <td height="6" colspan="5" bgcolor="#C1D9FF"> 
        <div align="right"> </div>      </td>
    </tr>
    <tr> 
      <td height="2" colspan="6"><b></b> 
        <div align="left"><font color="#000000"> </font></div>
        <font color="#000000"><b>Ȩ���� 
        <input name="restrain_name" type="text" id="restrain_name">
        </b></font></td>
    </tr>
    <tr> 
      <td height="19" width="17%"> 
        <div align="center"><font face="����"><strong>ҵ�����</strong></font></div>      </td>
      <td width="19%"> 
        <div align="center"><font face="����"><strong>�Ƿ����</strong></font></div>      </td>
      <td width="10%"> 
        <div align="center"><font face="����"><strong>����Ȩ��</strong></font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="����"><strong>�޸�Ȩ��</strong></font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="����"><strong>ɾ��Ȩ��</strong></font></div>      </td>
      <td width="26%"> 
        <div align="center"><font face="����"><strong>�鿴�����������˵���Ϣ</strong></font></div>      </td>
    </tr>
    <tr bgcolor="#ACCBFF"> 
      <td width="17%" bgcolor="#ACCBFF"><font face="����">�Ƿ�ȫѡ</font></td>
      <td width="19%"> 
        <div align="center"><font face="����"> 
          <input name="allSelect2" type="checkbox"      
		     onclick="javascript:allSelect2_onclick();" value="">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font face="����"> 
          <input type="checkbox" name="allSelect" value=""      
		     onclick="javascript:allSelect_onclick();">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="����"> 
          <input type="checkbox" name="allSelect3" value=""      
		     onclick="javascript:allSelect3_onclick();">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"> <font face="����"> 
          <input type="checkbox" name="allSelect4" value=""      
		     onclick="javascript:allSelect4_onclick();">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"> <font face="����"> 
          <input type="checkbox" name="allSelect5" value=""      
		     onClick="javascript:allSelect5_onclick();">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%" bgcolor="#AAFFAA"><b><font color="#000000" face="����">Ǳ�ڿͻ�</font></b></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="qzzt" type="checkbox" id="qzzt"  onclick="javascript:qzzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="qzadd" type="checkbox" id="qzadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="qzmod" type="checkbox" id="qzmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="qzdel" type="checkbox" id="qzdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="qzview" type="checkbox" id="qzview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><b><font color="#000000" face="����">���пͻ�</font></b></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xhzt" type="checkbox" id="xhzt"  onclick="javascript:xhzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xhadd" type="checkbox" id="xhadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xhmod" type="checkbox" id="xhmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xhdel" type="checkbox" id="xhdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xhview" type="checkbox" id="xhview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><b><font color="#000000" face="����">�� ϵ ��</font></b></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="linkzt" type="checkbox" id="linkzt"  onclick="javascript:linkzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="linkadd" type="checkbox" id="linkadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="linkmod" type="checkbox" id="linkmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="linkdel" type="checkbox" id="linkdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="linkview" type="checkbox" id="linkview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="17%"><b><font color="#000000" face="����">�������</font></b></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="hzzt" type="checkbox" id="hzzt"  onclick="javascript:hzzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="hzadd" type="checkbox" id="hzadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="hzmod" type="checkbox" id="hzmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="hzdel" type="checkbox" id="hzdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="hzview" type="checkbox" id="hzview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFB3FF"> 
      <td width="17%" bgcolor="#FFB3FF"><b><font color="#000000" face="����">�� Ӧ ��</font></b></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="supzt" type="checkbox" id="supzt"  onclick="javascript:supzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="supadd" type="checkbox" id="supadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="supmod" type="checkbox" id="supmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="supdel" type="checkbox" id="supdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="supview" type="checkbox" id="supview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="17%" height="24" bgcolor="#FFD595"><b><font color="#000000" face="����">�����</font></b></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="actzt" type="checkbox" id="actzt"  onclick="javascript:actzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="actadd" type="checkbox" id="r_actadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="actmod" type="checkbox" id="r_actmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="actdel" type="checkbox" id="r_actdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="actview" type="checkbox" id="r_actview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><b><font color="#000000" face="����">�ͻ�����</font></b></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="quotezt" type="checkbox" id="quotezt"  onclick="javascript:quotezt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="quoteadd" type="checkbox" id="quoteadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="quotemod" type="checkbox" id="quotemod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="quotedel" type="checkbox" id="quotedel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="quoteview" type="checkbox" id="quoteview" value="��">
          </font></div>      </td>
    </tr>
    <tr> 
      <td colspan="6" bgcolor="#FFFFB3"> 
        <%String strSQLpro = "select cpro from profl  order  by id asc";
	    ResultSet prs=einfodb.executeQuery(strSQLpro);
        int tmpi=0;
		while(prs.next()){
		String cpro=prs.getString("cpro");
	  %>
        <font size="2"><b><%=cpro%></b></font><b></b><font size="2" face="����">:��(�Ƿ����</font><font size="2"> 
        </font><font size="2" face="����"> 
        <input name="prozt<%=tmpi+1%>" type="checkbox" id="<%=cpro%>" value="��">
        )
        </font><font size="2"> 
        <input type="hidden" name="gp<%=tmpi+1%>" value="<%=cpro%>">
        </font><font size="2" face="����">(����Ȩ��</font><font size="2"> </font><font size="2" face="����"> 
        <input name="proadd<%=tmpi+1%>" type="checkbox" id="proadd" value="��">
        )
        (�޸�Ȩ��</font> <font size="2" face="����"> 
        <input name="promod<%=tmpi+1%>" type="checkbox" id="promod" value="��">
        )(
        ɾ��Ȩ�� 
        <input name="prodel<%=tmpi+1%>" type="checkbox" id="prodel" value="��">
        )
        (��ѯȨ�� 
        <input name="proview<%=tmpi+1%>" type="checkbox" id="prodel" value="��">
        )
        </font> <font size="2" face="����">(��Ӧ�̼��ɱ����۲鿴Ȩ�� 
        <input name="proview_yes<%=tmpi+1%>" type="checkbox" id="prodel" value="��">
        </font>)<br>
        <%tmpi++;}
		  prs.close();
		  %>
        <font size="2"> 
        <input type="hidden" name="i" value="<%=tmpi+1%>">
        </font></td>
    </tr>
    <TR bgcolor="#FFB3FF"> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="����">��Ӧ��ѯ��</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_sup_xj_zt" TYPE="checkbox" ID="r_sup_xj_zt"  ONCLICK="javascript:r_sup_xj_zt_onclick();" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_sup_xj_add" TYPE="checkbox" ID="r_sup_xj_add" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_sup_xj_mod" TYPE="checkbox" ID="cgmod" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_sup_xj_del" TYPE="checkbox" ID="cgdel" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_sup_xj_view" TYPE="checkbox" ID="cgview" VALUE="��">
          </FONT></DIV>      </TD>
    </TR>
    <tr bgcolor="#FFB3FF"> 
      <td width="17%"><strong><font color="#000000" face="����">�ɹ�����</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="cgzt" type="checkbox" id="cgzt"   ONCLICK="javascript:cgzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="cgadd" type="checkbox" id="cgadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="cgmod" type="checkbox" id="cgmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="cgdel" type="checkbox" id="cgdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="cgview" type="checkbox" id="cgview" value="��">
          (</font><font face="����"><strong>����Ȩ��</strong></font><font size="2" face="����"> 
          <input name="cgview_yes" type="checkbox" id="proview" value="��">
          </font>)</div>      </td>
    </tr>
    <tr bgcolor="#FFFFB3"> 
      <td width="17%"><strong><font color="#000000" face="����">���˹���</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="trzt" type="checkbox" id="trzt"  onclick="javascript:trzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="tradd" type="checkbox" id="tradd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="trmod" type="checkbox" id="trmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="trdel" type="checkbox" id="trdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="trview" type="checkbox" id="trview" value="��">
          </font><font face="����"><strong>(����Ȩ��</strong></font><font size="2" face="����"> 
          <input name="trview_yes" type="checkbox" id="proview" value="��">
          </font>)</div>      </td>
    </tr>
    <tr bgcolor="#FFFFB3"> 
      <td width="17%"><strong><font color="#000000" face="����">������˾</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="hdzt" type="checkbox" id="hdzt"  onclick="javascript:hdzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="hdadd" type="checkbox" id="hdadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="hdmod" type="checkbox" id="hdmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="hddel" type="checkbox" id="hddel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="hdview" type="checkbox" id="hdview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="����">�� �� ��</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="workzt" type="checkbox" id="workzt"  onclick="javascript:workzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="workadd" type="checkbox" id="workadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="workmod" type="checkbox" id="workmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="workdel" type="checkbox" id="workdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="workview" type="checkbox" id="workview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="����">�� �� ��</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_jh_zt" type="checkbox" id="r_month_jh_zt"  onclick="javascript:r_month_jh_zt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_jh_add" type="checkbox" id="r_month_jh_add" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_jh_mod" type="checkbox" id="r_month_jh_mod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_jh_del" type="checkbox" id="r_month_jh_del" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_jh_view" type="checkbox" id="r_month_jh_view" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="����">�� �� ��</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_date_r_zt" type="checkbox" id="r_date_r_zt"  onclick="javascript:r_date_r_zt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_date_r_add" type="checkbox" id="r_date_r_add" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_date_r_mod" type="checkbox" id="r_date_r_mod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_date_r_del" type="checkbox" id="r_date_r_del" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_date_r_view" type="checkbox" id="r_date_r_view" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="����">�� �� ��</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_week_r_zt" type="checkbox" id="r_week_r_zt"  onclick="javascript:r_week_r_zt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_week_r_add" type="checkbox" id="r_week_r_add" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_week_r_mod" type="checkbox" id="r_week_r_mod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_week_r_del" type="checkbox" id="r_week_r_del" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_week_r_view" type="checkbox" id="r_week_r_view" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="����">�� �� ��</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_r_zt" type="checkbox" id="r_month_r_zt"  onclick="javascript:r_month_r_zt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_r_add" type="checkbox" id="r_month_r_add" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_r_mod" type="checkbox" id="r_month_r_mod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_r_del" type="checkbox" id="r_month_r_del" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_r_view" type="checkbox" id="r_month_r_view" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="����">��Ŀ����</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xmzt" type="checkbox" id="xmzt"  onclick="javascript:xmzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xmadd" type="checkbox" id="xmadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xmmod" type="checkbox" id="xmmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xmdel" type="checkbox" id="xmdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xmview" type="checkbox" id="xmview" value="��">
          </font></div>      </td>
    </tr>
    <TR bgcolor="#AAFFAA"> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="����">�ͻ�ѯ��</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_cus_xj_zt" TYPE="checkbox" ID="r_cus_xj_zt"  ONCLICK="javascript:r_cus_xj_zt_onclick();" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_cus_xj_add" TYPE="checkbox" ID="xmadd" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_cus_xj_mod" TYPE="checkbox" ID="xmmod" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_cus_xj_del" TYPE="checkbox" ID="xmdel" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_cus_xj_view" TYPE="checkbox" ID="xmview" VALUE="��">
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#AAFFAA" >
      <TD><STRONG><font color="#000000" size="2">��Ʒ����</font></STRONG></TD>
      <TD bordercolor="#CCBE5A"><DIV ALIGN="center"><font size="2">
          <INPUT NAME="r_sam_zt" TYPE="checkbox" ID="r_sam_zt"  ONCLICK="javascript:r_sam_zt_onclick();" VALUE="��">
      </font></DIV></TD>
      <TD bordercolor="#CCBE5A"><DIV ALIGN="center"><font size="2">
          <INPUT NAME="r_sam_add" TYPE="checkbox" ID="subadd" VALUE="��">
      </font></DIV></TD>
      <TD bordercolor="#CCBE5A"><DIV ALIGN="center"><font size="2">
          <INPUT NAME="r_sam_mod" TYPE="checkbox" ID="submod" VALUE="��">
      </font></DIV></TD>
      <TD bordercolor="#CCBE5A"><DIV ALIGN="center"><font size="2">
          <INPUT NAME="r_sam_del" TYPE="checkbox" ID="subdel" VALUE="��">
      </font></DIV></TD>
      <TD bordercolor="#CCBE5A"><DIV ALIGN="center"><font size="2">
          <INPUT NAME="r_sam_view" TYPE="checkbox" ID="subview" VALUE="��">
      </font></DIV></TD>
    </TR>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%" bgcolor="#AAFFAA"><strong><font color="#000000" face="����">��ͬ����</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="subzt" type="checkbox" id="subzt"  onclick="javascript:subzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="subadd" type="checkbox" id="subadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="submod" type="checkbox" id="submod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="subdel" type="checkbox" id="subdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="subview" type="checkbox" id="subview" value="��">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="����">Ա������</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="manzt" type="checkbox" id="manzt"  onclick="javascript:manzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="manadd" type="checkbox" id="manadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="manmod" type="checkbox" id="manmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="mandel" type="checkbox" id="mandel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="manview" type="checkbox" id="manview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="17%"><strong><font color="#000000" face="����">�������</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="rwzt" type="checkbox" id="rwzt"  onclick="javascript:rwzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="rwadd" type="checkbox" id="rwadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="rwmod" type="checkbox" id="rwmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="rwdel" type="checkbox" id="rwdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="rwview" type="checkbox" id="rwview" value="��">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="����">���ù���</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="fyzt" type="checkbox" id="fyzt"  onclick="javascript:fyzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="fyadd" type="checkbox" id="fyadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="fymod" type="checkbox" id="fymod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="fydel" type="checkbox" id="fydel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="fyview" type="checkbox" id="fyview" value="��">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="����">�������</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_jkgl_zt" type="checkbox" id="r_jkgl_zt"  onclick="javascript:r_jkgl_zt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_jkgl_add" type="checkbox" id="r_jkgl_add" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_jkgl_mod" type="checkbox" id="r_jkgl_mod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_jkgl_del" type="checkbox" id="r_jkgl_del" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_jkgl_view" type="checkbox" id="r_jkgl_view" value="��">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="����">��������</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_fksq_zt" type="checkbox" id="r_fksq_zt"  onclick="javascript:r_fksq_zt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_fksq_add" type="checkbox" id="r_fksq_add" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_fksq_mod" type="checkbox" id="r_fksq_mod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_fksq_del" type="checkbox" id="r_fksq_del" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_fksq_view" type="checkbox" id="r_fksq_view" value="��">
          </font></div>      </td>
    </tr>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="����">ת������</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_zzsq_zt" TYPE="checkbox" ID="r_zzsq_zt"  ONCLICK="javascript:r_zzsq_zt_onclick();" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_zzsq_add" TYPE="checkbox" ID="r_fksq_add" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_zzsq_mod" TYPE="checkbox" ID="r_fksq_mod" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_zzsq_del" TYPE="checkbox" ID="r_fksq_del" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_zzsq_view" TYPE="checkbox" ID="r_fksq_view" VALUE="��">
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="����">��������</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_jcsq_zt" TYPE="checkbox" ID="r_jcsq_zt"  ONCLICK="javascript:r_jcsq_zt_onclick();" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_jcsq_add" TYPE="checkbox" ID="r_fksq_add" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_jcsq_mod" TYPE="checkbox" ID="r_fksq_mod" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_jcsq_del" TYPE="checkbox" ID="r_fksq_del" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_jcsq_view" TYPE="checkbox" ID="r_fksq_view" VALUE="��">
          </FONT></DIV>      </TD>
    </TR>
    <TR> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="����">н���춯</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_xzyd_zt" TYPE="checkbox" ID="r_xzyd_zt"  ONCLICK="javascript:r_xzyd_zt_onclick();" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_xzyd_add" TYPE="checkbox" ID="r_fksq_add" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_xzyd_mod" TYPE="checkbox" ID="r_fksq_mod" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_xzyd_del" TYPE="checkbox" ID="r_fksq_del" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_xzyd_view" TYPE="checkbox" ID="r_fksq_view" VALUE="��">
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="����">��������</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_ccsq_zt" TYPE="checkbox" ID="r_ccsq_zt"  ONCLICK="javascript:r_ccsq_zt_onclick();" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_ccsq_add" TYPE="checkbox" ID="r_fksq_add" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_ccsq_mod" TYPE="checkbox" ID="r_fksq_mod" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_ccsq_del" TYPE="checkbox" ID="r_fksq_del" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_ccsq_view" TYPE="checkbox" ID="r_fksq_view" VALUE="��">
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="����">�칫��Ʒ</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_bgyp_zt" TYPE="checkbox" ID="r_bgyp_zt"  ONCLICK="javascript:r_bgyp_zt_onclick();" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_bgyp_add" TYPE="checkbox" ID="r_fksq_add" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_bgyp_mod" TYPE="checkbox" ID="r_fksq_mod" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_bgyp_del" TYPE="checkbox" ID="r_fksq_del" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_bgyp_view" TYPE="checkbox" ID="r_fksq_view" VALUE="��">
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="����">�ڲ�ǩ��</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_nbqc_zt" TYPE="checkbox" ID="r_nbqc_zt"  ONCLICK="javascript:r_nbqc_zt_onclick();" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_nbqc_add" TYPE="checkbox" ID="r_fksq_add" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_nbqc_mod" TYPE="checkbox" ID="r_fksq_mod" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_nbqc_del" TYPE="checkbox" ID="r_fksq_del" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_nbqc_view" TYPE="checkbox" ID="r_fksq_view" VALUE="��">
          </FONT></DIV>      </TD>
    </TR>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="����">�˻�����</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="thzt" type="checkbox" id="thzt"  onclick="javascript:thzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="thadd" type="checkbox" id="r_thadd"  value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="thmod" type="checkbox" id="r_thmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="thdel" type="checkbox" id="r_thdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="thview" type="checkbox" id="r_thview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="����">�ͻ�����</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="serverzt" type="checkbox" id="serverzt"  onclick="javascript:serverzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="serveradd" type="checkbox" id="serveradd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="servermod" type="checkbox" id="servermod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="serverdel" type="checkbox" id="serverdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="serverview" type="checkbox" id="serverview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="����">�ͻ�Ͷ��</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="tszt" type="checkbox" id="tszt"  onclick="javascript:tszt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="tsadd" type="checkbox" id="tsadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="tsmod" type="checkbox" id="tsmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="tsdel" type="checkbox" id="tsdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="tsview" type="checkbox" id="tsview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="����">��ҵ����</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_hyzc_zt" type="checkbox" id="r_hyzc_zt"  onclick="javascript:r_hyzc_zt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_hyzc_add" type="checkbox" id="r_hyzc_add" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_hyzc_mod" type="checkbox" id="r_hyzc_mod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_hyzc_del" type="checkbox" id="r_hyzc_del" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_hyzc_view" type="checkbox" id="r_hyzc_view" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="����">ý������</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_mtxc_zt" type="checkbox" id="r_mtxc_zt"  onclick="javascript:r_mtxc_zt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_mtxc_add" type="checkbox" id="r_mtxc_add" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_mtxc_mod" type="checkbox" id="r_mtxc_mod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_mtxc_del" type="checkbox" id="r_mtxc_del" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_mtxc_view" type="checkbox" id="r_mtxc_view" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="����">�г��</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="mactzt" type="checkbox" id="mactzt"  onclick="javascript:mactzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="mactadd" type="checkbox" id="mactadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="mactmod" type="checkbox" id="mactmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="mactdel" type="checkbox" id="mactdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="mactview" type="checkbox" id="mactview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="����">��������</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="jzdszt" type="checkbox" id="jzdszt"  onclick="javascript:jzdszt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="jzdsadd" type="checkbox" id="jzdsadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="jzdsmod" type="checkbox" id="jzdsmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="jzdsdel" type="checkbox" id="jzdsdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="jzdsview" type="checkbox" id="jzdsview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="17%"><strong><font color="#000000" face="����">֪ ʶ ��</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zskzt" type="checkbox" id="zskzt"  onclick="javascript:zskzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zskadd" type="checkbox" id="zskadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zskmod" type="checkbox" id="zskmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zskdel" type="checkbox" id="zskdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zskview" type="checkbox" id="zskview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="17%"><strong><font color="#000000" face="����">���ɷ���</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="flfgzt" type="checkbox" id="flfgzt"  onclick="javascript:flfgzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="flfgadd" type="checkbox" id="flfgadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="flfgmod" type="checkbox" id="flfgmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="flfgdel" type="checkbox" id="flfgdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="flfgview" type="checkbox" id="flfgview" value="��">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="����">������Ŀ</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_wlz_zt" type="checkbox" id="r_wlz_zt"  onclick="javascript:r_wlz_zt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_wlz_add" type="checkbox" id="r_wlz_add" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_wlz_mod" type="checkbox" id="r_wlz_mod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_wlz_del" type="checkbox" id="r_wlz_del" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_wlz_view" type="checkbox" id="r_wlz_view" value="��">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="����">�ʽ����</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zjzt" type="checkbox" id="zjzt"  onclick="javascript:zjzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zjadd" type="checkbox" id="zjadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zjmod" type="checkbox" id="zjmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zjdel" type="checkbox" id="zjdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zjview" type="checkbox" id="zjview" value="��">
          </font></div>      </td>
    </tr>
    <TR> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="����">���ʹ���</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_wage_zt" TYPE="checkbox" ID="r_wage_zt"  ONCLICK="javascript:r_wage_zt_onclick();" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_wage_add" TYPE="checkbox" ID="zjadd" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_wage_mod" TYPE="checkbox" ID="zjmod" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_wage_del" TYPE="checkbox" ID="zjdel" VALUE="��">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_wage_view" TYPE="checkbox" ID="zjview" VALUE="��">
          </FONT></DIV>      </TD>
    </TR>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="����">�������</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="fkhzzt" type="checkbox" id="fkhzzt"  onclick="javascript:fkhzzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="fkhzadd" type="checkbox" id="fkhzadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="fkhzmod" type="checkbox" id="fkhzmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="fkhzdel" type="checkbox" id="fkhzdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="fkhzview" type="checkbox" id="fkhzview" value="��">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="����">�տ����</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="skhzzt" type="checkbox" id="skhzzt"  onclick="javascript:skhzzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="skhzadd" type="checkbox" id="skhzadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="skhzmod" type="checkbox" id="skhzmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="skhzdel" type="checkbox" id="skhzdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="skhzview" type="checkbox" id="skhzview" value="��">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="����">������Ϣ</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="fkzt" type="checkbox" id="fkzt"  onclick="javascript:fkzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="fkmod" type="checkbox" id="fkmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="fkdel" type="checkbox" id="fkdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="fkview" type="checkbox" id="fkview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="17%"><STRONG><font color="#000000" face="����">���߹�ͨ</font></STRONG></td>
      <td width="19%"> 
        <DIV ALIGN="CENTER"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_wx_gt_zt" TYPE="checkbox" ID="skzt"  ONCLICK="javascript:skzt_onclick();" VALUE="��">
          </FONT></DIV>      </td>
      <td colspan="4"> 
        <DIV ALIGN="CENTER"><FONT SIZE="2" FACE="����"> </FONT></DIV>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><FONT COLOR="#000000" FACE="����">�����տ�</FONT></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="skzt" type="checkbox" id="skzt"  onclick="javascript:skzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_skview" type="checkbox" id="r_skview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="����">�ͻ�Ƿ��</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="qkzt" type="checkbox" id="qkzt"  onclick="javascript:qkzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="qkview" type="checkbox" id="qkview" value="��">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="����">�˻����</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_thje_zt" type="checkbox" id="r_thje_zt"  onclick="javascript:r_thje_zt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_thje_view" type="checkbox" id="r_thje_view" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFFFB3"> 
      <td width="17%"><strong><font color="#000000" face="����">�ֹ����</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="intzt" type="checkbox" id="intzt"  onclick="javascript:intzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input type="checkbox" name="intadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="intmod" type="checkbox" id="intmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="intdel" type="checkbox" id="intdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="intview" type="checkbox" id="intview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFFFB3"> 
      <td width="17%"><strong><font color="#000000" face="����">�ֹܳ���</font></strong></td>
      <td width="19%" bgcolor="#FFFFB3"> 
        <div align="center"><font size="2" face="����"> 
          <input name="outzt" type="checkbox" id="outzt"  onclick="javascript:outzt_onclick();" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="outadd" type="checkbox" id="outadd" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="outmod" type="checkbox" id="outmod" value="��">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="outdel" type="checkbox" id="outdel" value="��">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="outview" type="checkbox" id="outview" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="����">�����ʼ�</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_dzzx_zt" type="checkbox" id="r_dzzx_zt"  value="��">
          </font></div>      </td>
      <td width="10%">&nbsp;</td>
      <td width="14%">&nbsp;</td>
      <td width="14%">&nbsp;</td>
      <td width="26%">&nbsp;</td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%" bgcolor="#AAFFAA"><strong><font color="#000000" face="����">���۲�Ʒ<font size="2"></font></font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_xscp_zt" type="checkbox" id="jcfx" value="��">
          </font></div>      </td>
      <td colspan="4"><font size="2" face="����">(�������пͻ�
          <input name="opadd" type="checkbox" id="opadd" value="��">
)(�����������۵���
          <input name="opmod" type="checkbox" id="opmod" value="��">
)(�������вɹ�����
          <input name="opdel" type="checkbox" id="opdel" value="��">
)</font></td>
    </tr>
    <tr bgcolor="#FFBFBF"> 
      <td width="17%"><strong><font color="#000000" face="����">ϵͳ����</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="syszt" type="checkbox" id="syszt"  value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font face="����">&nbsp;</font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="����">&nbsp;</font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="����">&nbsp;</font></div>      </td>
      <td width="26%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFBFBF"> 
      <td colspan="6"><strong></strong> 
        <div align="center"><font size="2" face="����">���۾��߷����Ƿ���� 
          <input name="jcfxzt" type="checkbox" id="jcfx" value="��">
          ���۾��߷����Ƿ�鿴������ 
          <input name="r_thje_mod" type="checkbox" id="outadd" value="��">
          �ɹ����߷����Ƿ���� 
          <input name="qkmod" type="checkbox" id="outadd" value="��">
          �ɹ����߷����Ƿ�鿴 
          <input name="qkdel" type="checkbox" id="outadd" value="��">
          �ֿ���߷����Ƿ���� 
          <input name="r_thje_del" type="checkbox" id="outadd" value="��">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFBFBF"> 
      <td width="17%"><strong><font color="#000000" face="����">��Դת��</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="custzyzt" type="checkbox" id="custzyzt" value="��">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font face="����">&nbsp;</font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="����">&nbsp;</font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="����">&nbsp;</font></div>      </td>
      <td width="26%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%"><font face="����"><strong></strong></font></td>
      <td width="19%"><font face="����">&nbsp;</font></td>
      <td width="10%">&nbsp;</td>
      <td width="14%"><font face="����">&nbsp;</font></td>
      <td width="14%"><font face="����">&nbsp;</font></td>
      <td width="26%">&nbsp;</td>
    </tr>
    <tr> 
      <td colspan="6"> 
        <div align="center"><font color="#000000" size="2" face="����"> 
          <input type="submit" name="Submit" value="ȷ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; vertical-align: -7; border: 1 groove #C3D9FF">
          ���� </font> <font face="����"> 
          <input type="reset" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; vertical-align: -7; border: 1 groove #C3D9FF">
          </font></div>      </td>
    </tr>
  </table>
  <p><br>
    ��ע:1.�����̵����ģ����Ȩ���ڷǲ���״̬�����䵱ǰ״̬��Լ��. <br>
    �� ��2.�ֿ�Ȩ������˵������ѡ��ĳһ�ֿ⣬Ȼ��ѡ�񡰿��á� ����ʾ��Ȩ������˿��Թ�����ѡ��Ĳֿ⣬���ѡ��ɱ����ۡ��鿴��Ȩ�ޣ���òֿ����Ա���Բ鿴��Ʒ�ɱ����ۣ����ѡ�񡰲鿴��Ȩ�ޣ����Ȩ������˿��Բ鿴���еĲֿ⣻�����ѡ�񡰿��á� 
    Ȩ�ޣ�ͬʱҲ��ѡ�񡰲鿴��Ȩ�ޣ����Ȩ�������ֻ����������Ҫ���ò�Ʒ��Ϣ�ĵط�ֻ�ܲ鿴��ѡ��Ĳֿ�Ĳ�Ʒ����������������������������������������������������������������������������������������������������������������������</p>
  <p>��������.��ɫ����Ϊҵ��ԱȨ�ޣ��Ϻ�ɫΪ�ɹ�Ȩ�ޣ�����ɫΪ�ֹ�Ȩ�ޣ��ۺ�ɫΪ����ģ�飬��ɫΪ������Ա����ɫ���ֵ�Ȩ�ޣ������ط���</p>
</form>
</body>
</html>
<script language=javascript>
function allSelect_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("add") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function allSelect2_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect2.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("zt") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function allSelect3_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect3.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("mod") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function allSelect4_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect4.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("del") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function r_ccsq_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_ccsq_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_ccsq") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function allSelect5_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect5.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("view") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function allSelect6_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect6.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("_yes") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function r_zzsq_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_zzsq_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_zzsq") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function qzzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.qzzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("qz") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function xhzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.xhzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("xh") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function linkzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.linkzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("link") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function hzzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.hzzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("hz") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function  r_jcsq_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_jcsq_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_jcsq") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function  supzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.supzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("sup") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  actzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.actzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_act") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function opzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.opzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("op") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function r_nbqc_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_nbqc_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_nbqc") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function quotezt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.quotezt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("quote") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  prozt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.prozt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("pro") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  cgzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.cgzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("cg") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function trzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.trzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("tr") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function hdzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.hdzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("hd") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function workzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.workzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("work") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  xmzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.xmzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("xm") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function subzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.subzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("sub") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  manzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.manzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("man") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function rwzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.rwzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("rw") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function r_bgyp_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_bgyp_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_bgyp") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}


function r_cus_xj_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_cus_xj_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_cus_xj") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function  r_xzyd_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_xzyd_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_xzyd") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function  r_sam_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_sam_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_sam") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function r_wage_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_wage_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_wage") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function r_xzyd_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_xzyd_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_xzyd") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function fyzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.fyzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("fy") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function thzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.thzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_th") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  serverzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.serverzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("server") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function tszt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.tszt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("ts") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function wxzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.wxzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("wx") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function mactzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.mactzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("mact") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function jzdszt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.jzdszt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("jzds") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function  r_xzyd_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_xzyd_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_xzyd") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function zskzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.zskzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("zsk") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function flfgzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.flfgzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("flfg") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function zjzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.zjzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("zj") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function r_yjsq_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_yjsq_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_yjsq") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function fkhzzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.fkhzzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("fkhz") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function  r_spbm_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_spbm_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_spbm") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function skhzzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.skhzzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("skhz") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}


function r_xphh_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_xphh_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_xphh") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

function fkzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.fkzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("fk") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function skzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.skzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_sk") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function qkzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.qkzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("qk") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function intzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.intzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("int") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  outzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.outzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("out")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_yfglzt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_yfglzt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_yfgl")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_htgl_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_htgl_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_htgl")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_jkgl_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_jkgl_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_jkgl")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_fksq_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_fksq_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_fksq")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_month_jh_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_month_jh_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_month_jh")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_date_r_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_date_r_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_date_r")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_week_r_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_week_r_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_week_r")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_month_r_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_month_r_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_month_r")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_wlz_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_wlz_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_wlz")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_thje_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_thje_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_thje")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_hyzc_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_hyzc_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_hyzc")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_mtxc_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_mtxc_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_mtxc")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function  r_sup_xj_zt_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.r_sup_xj_zt.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("r_sup_xj")!= -1)
	document.form1.elements[i].checked =tocheck;
   }
}


</script>
