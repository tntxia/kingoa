<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<%@ page import="com.tntxia.oa.util.*"%>
<%    

String basePath = request.getContextPath();

String id = request.getParameter("id");
Map<String,String> resultMap = (Map<String,String>) request.getAttribute("resultMap");
String restrain_name = resultMap.get("restrain_name");
List<Map<String,Object>> warehouseList = (List<Map<String,Object>>) request.getAttribute("warehouseList");

%>
<html>
<head>
<title>Ȩ���Զ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<script language="JavaScript" src="<%=basePath%>/js/config.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/jquery.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/common.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/system/restrain/restrain.js" charset="gb2312"></script>
</head>
<body>
<form id="form1" name="form1" method="post" action="restrain.dispatch"  onSubmit="return isValid();">
	<input name="method" type="hidden" id="method" value="updateRestrainById"> 
  <table width="100%" border="1" cellspacing="0" cellpadding="0" height="286">
    <tr> 
      <td width="15%" height="6" bgcolor="#C1D9FF"><font size="2" color="#000000">����--&gt;&gt;<a href="right/roleRight.dispatch?id=<%=id%>">�¹���Ȩ��</a></font></td>
      <td height="6" colspan="5" bgcolor="#C1D9FF"> 
        <div align="right"> </div>      </td>
    </tr>
    <tr> 
      <td height="2" colspan="6"><b></b> 
        <div align="left"><font color="#000000"> </font></div>
        <font color="#000000"><b>Ȩ���� 
        <input name="restrain_name" type="text" id="restrain_name" value="<%=restrain_name%>">
        <input name="id" type="hidden" id="id" value="<%=id%>">
        </b></font></td>
    </tr>
    <tr> 
      <td width="15%"> 
        <div align="center"><font face="����"><strong>ҵ�����</strong></font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="����"><strong>����Ȩ��</strong></font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="����"><strong>�޸�Ȩ��</strong></font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="����"><strong>ɾ��Ȩ��</strong></font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="����"><strong>�鿴�����������˵���Ϣ</strong></font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="����"><strong>�Ƿ����</strong></font></div>      </td>
    </tr>
    <tr bgcolor="#ACCBFF" > 
      <td width="15%"><font face="����">�Ƿ�ȫѡ</font></td>
      <td width="12%"> 
        <div align="center"><font face="����"> 
          <input name="allSelect" type="checkbox"      
		     onclick="javascript:allSelect_onclick();" value="">
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="����"> 
          <input type="checkbox" name="allSelect3" value=""      
		     onclick="javascript:allSelect3_onclick();">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"> <font face="����"> 
          <input type="checkbox" name="allSelect4" value=""      
		     onclick="javascript:allSelect4_onclick();">
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"> <font face="����"> 
          <input type="checkbox" name="allSelect5" value=""      
		     onclick="javascript:allSelect5_onclick();">
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="����"> 
          <input name="allSelect2" type="checkbox"      
		     onclick="javascript:allSelect2_onclick();" value="">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><b><font color="#000000" face="����">Ǳ�ڿͻ�</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="qzadd" type="checkbox" id="qzadd" value="��"  <%=StringUtils.haveToChecked(resultMap.get("qzadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="qzmod" type="checkbox" id="qzmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("qzmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="qzdel" type="checkbox" id="qzdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("qzdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="qzview" type="checkbox" id="qzview" value="��" <%=StringUtils.haveToChecked(resultMap.get("qzview"))%> >
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="qzzt" type="checkbox" id="qzzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("qzzt"))%> >
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><b><font color="#000000" face="����">���пͻ�</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xhadd" type="checkbox" id="xhadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("xhadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xhmod" type="checkbox" id="xhmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("xhmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xhdel" type="checkbox" id="xhdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("xhdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xhview" type="checkbox" id="xhview" value="��" <%=StringUtils.haveToChecked(resultMap.get("xhview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xhzt" type="checkbox" id="xhzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("xhzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><b><font color="#000000" face="����">�� ϵ ��</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="linkadd" type="checkbox" id="linkadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("linkadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="linkmod" type="checkbox" id="linkmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("linkmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="linkdel" type="checkbox" id="linkdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("linkdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="linkview" type="checkbox" id="linkview" value="��" <%=StringUtils.haveToChecked(resultMap.get("linkview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="linkzt" type="checkbox" id="linkzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("linkzt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%"><b><font color="#000000" face="����">�������</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="hzadd" type="checkbox" id="hzadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("hzadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="hzmod" type="checkbox" id="hzmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("hzmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="hzdel" type="checkbox" id="hzdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("hzdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="hzview" type="checkbox" id="hzview" value="��" <%=StringUtils.haveToChecked(resultMap.get("hzview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="hzzt" type="checkbox" id="hzzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("hzzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFB3FF"> 
      <td width="15%"><b><font color="#000000" face="����">�� Ӧ ��</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
         
          <input name="supadd" type="checkbox" id="supadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("supadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
         
          <input name="supmod" type="checkbox" id="supmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("supmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="supdel" type="checkbox" id="supdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("supdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="supview" type="checkbox" id="supview" value="��" <%=StringUtils.haveToChecked(resultMap.get("supview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="supzt" type="checkbox" id="supzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("supzt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%" height="24"><b><font color="#000000" face="����">�����</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="actadd" type="checkbox" id="actadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("actadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="actmod" type="checkbox" id="actmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("actmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String actdel1= ""; String actdel=resultMap.get("actdel");if(actdel.equals("��")){actdel1="checked";}%>
          <input name="actdel" type="checkbox" id="actdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("actdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String actview1= ""; String actview=resultMap.get("actview");if(actview.equals("��")){actview1="checked";}%>
          <input name="actview" type="checkbox" id="actview" value="��" <%=StringUtils.haveToChecked(resultMap.get("actview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="actzt" type="checkbox" id="actzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("actzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><b><font color="#000000" face="����">�ͻ�����</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="quoteadd" type="checkbox" id="quoteadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("quoteadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="quotemod" type="checkbox" id="quotemod" value="��" <%=StringUtils.haveToChecked(resultMap.get("quotemod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="quotedel" type="checkbox" id="quotedel" value="��" <%=StringUtils.haveToChecked(resultMap.get("quotedel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="quoteview" type="checkbox" id="quoteview" value="��" <%=StringUtils.haveToChecked(resultMap.get("quoteview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="quotezt" type="checkbox" id="quotezt" value="��" <%=StringUtils.haveToChecked(resultMap.get("quotezt"))%>>
          </font></div>      </td>
    </tr>
    <TR> 
      <TD colspan="6" bgcolor="#FFFFB3">
        <%
        int tmpi = 0;
        if(warehouseList!=null){
        	
        
        for(Map<String,Object> gmap : warehouseList){
        	int wid = (Integer) gmap.get("id");
        	String name = (String)gmap.get("name");
        	String pro_zt = (String)gmap.get("pro_zt");
        	int gpid = -1;
        	
        	String proadd = "";
        	String promod = "";
        	String pro_del = "";
        	String pro_view = "";
        	String proview_price = "";
        	if(pro_zt!=null){
        		gpid = (Integer)gmap.get("warehouseRestrainId");
            	proadd = (String)gmap.get("pro_add");
            	promod = (String)gmap.get("pro_mod");
            	pro_del = (String)gmap.get("pro_del");
            	pro_view = (String)gmap.get("pro_view");
            	proview_price = (String)gmap.get("proview_price");
        	}
        	
		 %>
		 
        <table width="100%" border="1" cellspacing="0" cellpadding="0">
          <tr bgcolor="#FFFFB3"> 
            <td><font size="2" face="����"> <b><%=name %></b>:(�Ƿ���� 
              <input name="prozt<%=wid %>" value="Y" type="checkbox" <%=pro_zt%>>
              )
              
              <input type="hidden" name="gpid<%=wid %>" value="<%=gpid%>">
              
              (
              ����Ȩ��</font><font size="2"> </font><font size="2" face="����"> 
              <input name="proadd<%=wid %>" type="checkbox" value="Y" <%=proadd%>>
              )
              (�޸�Ȩ��</font> <font size="2" face="����"> 
              <input name="promod<%=wid %>" type="checkbox" value="Y" <%=promod%>>
              )
              (
              ɾ��Ȩ�� 
              <input name="prodel<%=wid %>" type="checkbox" value="Y" <%=pro_del%>>
              )
              (��ѯȨ�� 
              <input name="proview<%=wid %>" type="checkbox" value="Y" <%=pro_view%>>
              )
              </font> <font size="2" face="����">(��Ӧ�̼��ɱ�/���۵��۲鿴Ȩ�� 
              <input name="proviewprice<%=wid %>" type="checkbox" value="Y" <%=proview_price%>>
              )</font></td>
          </tr>
          <%
		  }
        }
		  %>
        </table>
        </TD>
    </TR>
    <TR bgcolor="#FFB3FF"> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="����">��Ӧ��ѯ��</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_sup_xj_add" TYPE="checkbox" ID="r_sup_xj_add" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_sup_xj_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_sup_xj_mod" TYPE="checkbox" ID="r_sup_xj_mod" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_sup_xj_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_sup_xj_del" TYPE="checkbox" ID="r_sup_xj_del" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_sup_xj_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_sup_xj_view" TYPE="checkbox" ID="r_sup_xj_view" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_sup_xj_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_sup_xj_zt" TYPE="checkbox" ID="r_sup_xj_zt" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_sup_xj_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <tr bgcolor="#FFB3FF"> 
      <td width="15%"><strong><font color="#000000" face="����">�ɹ�����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String cgadd1= ""; String cgadd=resultMap.get("cgadd");if(cgadd.equals("��")){cgadd1="checked";}%>
          <input name="cgadd" type="checkbox" id="cgadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("cgadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="cgmod" type="checkbox" id="cgmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("cgmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="cgdel" type="checkbox" id="cgdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("cgdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="cgview" type="checkbox" id="cgview" value="��" <%=StringUtils.haveToChecked(resultMap.get("cgview"))%>>
          </font><font face="����"><strong>����Ȩ��</strong></font><font size="2" face="����"> 
          <input name="cgview_yes" type="checkbox" id="cgview_yes" value="��" <%=StringUtils.haveToChecked(resultMap.get("cgview_yes"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="cgzt" type="checkbox" id="cgzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("cgzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFFFB3"> 
      <td width="15%"><strong><font color="#000000" face="����">���˹���</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="tradd" type="checkbox" id="tradd" value="��" <%=StringUtils.haveToChecked(resultMap.get("tradd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
         
          <input name="trmod" type="checkbox" id="trmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("trmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="trdel" type="checkbox" id="trdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("trdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="trview" type="checkbox" id="trview" value="��" <%=StringUtils.haveToChecked(resultMap.get("trview"))%>>
          </font><font face="����"><strong>����Ȩ��</strong></font><font size="2" face="����"> 
          
          <input name="trview_yes" type="checkbox" id="trview_yes" value="��" <%=StringUtils.haveToChecked(resultMap.get("trview_yes"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="trzt" type="checkbox" id="trzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("trzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFFFB3"> 
      <td width="15%" bgcolor="#FFFFB3"><strong><font color="#000000" face="����">������˾</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String hdadd1= ""; String hdadd=resultMap.get("hdadd");
          if(hdadd==null) hdadd = "";
          hdadd = hdadd;if(hdadd.equals("��")){hdadd1="checked";}%>
          <input name="hdadd" type="checkbox" id="hdadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("hdadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="hdmod" type="checkbox" id="hdmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("hdmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="hddel" type="checkbox" id="hddel" value="��" <%=StringUtils.haveToChecked(resultMap.get("hddel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="hdview" type="checkbox" id="hdview" value="��" <%=StringUtils.haveToChecked(resultMap.get("hdview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="hdzt" type="checkbox" id="hdzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("hdzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="����">�� �� ��<font size="2"></font></font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="workadd" type="checkbox" id="workadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("workadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="workmod" type="checkbox" id="workmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("workmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="workdel" type="checkbox" id="workdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("workdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="workview" type="checkbox" id="workview" value="��" <%=StringUtils.haveToChecked(resultMap.get("workview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="workzt" type="checkbox" id="workzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("workzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="����">�� �� ��</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_jh_add" type="checkbox" id="r_month_jh_add" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_month_jh_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_jh_mod" type="checkbox" id="r_month_jh_mod" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_month_jh_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="r_month_jh_del" type="checkbox" id="r_month_jh_del" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_month_jh_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_jh_view" type="checkbox" id="r_month_jh_view" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_month_jh_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_jh_zt" type="checkbox" id="r_month_jh_zt" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_month_jh_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="����">�� �� ��</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_date_r_add" type="checkbox" id="r_date_r_add" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_date_r_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_date_r_mod" type="checkbox" id="r_date_r_mod" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_date_r_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_date_r_del" type="checkbox" id="r_date_r_del" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_date_r_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_date_r_view" type="checkbox" id="r_date_r_view" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_date_r_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_date_r_zt" type="checkbox" id="r_date_r_zt" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_date_r_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="����">�� �� ��</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_week_r_add" type="checkbox" id="r_week_r_add" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_week_r_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_week_r_mod" type="checkbox" id="r_week_r_mod" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_week_r_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_week_r_del" type="checkbox" id="r_week_r_del" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_week_r_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_week_r_view" type="checkbox" id="r_week_r_view" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_week_r_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_week_r_zt" type="checkbox" id="r_week_r_zt" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_week_r_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="����">�� �� ��</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_r_add" type="checkbox" id="r_month_r_add" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_month_r_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_r_mod" type="checkbox" id="r_month_r_mod" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_month_r_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_r_del" type="checkbox" id="r_month_r_del" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_month_r_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_r_view" type="checkbox" id="r_month_r_view" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_month_r_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_month_r_zt" type="checkbox" id="r_month_r_zt" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_month_r_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="����">��Ŀ����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xmadd" type="checkbox" id="xmadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("xmadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xmmod" type="checkbox" id="xmmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("xmmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xmdel" type="checkbox" id="xmdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("xmdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xmview" type="checkbox" id="xmview" value="��" <%=StringUtils.haveToChecked(resultMap.get("xmview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="xmzt" type="checkbox" id="xmzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("xmzt"))%>>
          </font></div>      </td>
    </tr>
    <TR bgcolor="#AAFFAA"> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="����">�ͻ�ѯ��</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_cus_xj_add" TYPE="checkbox" ID="r_cus_xj_add" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_cus_xj_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_cus_xj_mod" TYPE="checkbox" ID="r_cus_xj_mod" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_cus_xj_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_cus_xj_del" TYPE="checkbox" ID="r_cus_xj_del" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_cus_xj_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_cus_xj_view" TYPE="checkbox" ID="r_cus_xj_view" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_cus_xj_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_cus_xj_zt" TYPE="checkbox" ID="r_cus_xj_zt" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_cus_xj_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#AAFFAA" >
      <TD><STRONG><FONT COLOR="#000000" FACE="����">��Ʒ����</FONT></STRONG></TD>
      <TD><DIV ALIGN="center"><FONT SIZE="2" FACE="����">
          <INPUT NAME="r_sam_add" TYPE="checkbox" ID="r_sam_add" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_sam_add"))%>>
      </FONT></DIV></TD>
      <TD><DIV ALIGN="center"><FONT SIZE="2" FACE="����">
          <INPUT NAME="r_sam_mod" TYPE="checkbox" ID="r_sam_mod" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_sam_mod"))%>>
      </FONT></DIV></TD>
      <TD><DIV ALIGN="center"><FONT SIZE="2" FACE="����">
          <INPUT NAME="r_sam_del" TYPE="checkbox" ID="r_sam_del" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_sam_del"))%>>
      </FONT></DIV></TD>
      <TD><DIV ALIGN="center"><FONT SIZE="2" FACE="����">
          <INPUT NAME="r_sam_view" TYPE="checkbox" ID="r_sam_view" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_sam_view"))%>>
      </FONT></DIV></TD>
      <TD><DIV ALIGN="center"><FONT SIZE="2" FACE="����">
          <INPUT NAME="r_sam_zt" TYPE="checkbox" ID="r_sam_zt" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_sam_zt"))%>>
      </FONT></DIV></TD>
    </TR>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="����">��ͬ����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="subadd" type="checkbox" id="subadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("subadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="submod" type="checkbox" id="submod" value="��" <%=StringUtils.haveToChecked(resultMap.get("submod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="subdel" type="checkbox" id="subdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("subdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="subview" type="checkbox" id="subview" value="��" <%=StringUtils.haveToChecked(resultMap.get("subview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
         
          <input name="subzt" type="checkbox" id="subzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("subzt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" face="����">Ա������</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="manadd" type="checkbox" id="manadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("manadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="manmod" type="checkbox" id="manmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("manmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
         
          <input name="mandel" type="checkbox" id="mandel" value="��" <%=StringUtils.haveToChecked(resultMap.get("mandel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
         
          <input name="manview" type="checkbox" id="manview" value="��" <%=StringUtils.haveToChecked(resultMap.get("manview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="manzt" type="checkbox" id="manzt" value="��"  <%=StringUtils.haveToChecked(resultMap.get("manzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="15%"><strong><font color="#000000" face="����">�������</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="rwadd" type="checkbox" id="rwadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("rwadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="rwmod" type="checkbox" id="rwmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("rwmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="rwdel" type="checkbox" id="rwdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("rwdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="rwview" type="checkbox" id="rwview" value="��" <%=StringUtils.haveToChecked(resultMap.get("rwview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="rwzt" type="checkbox" id="rwzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("rwzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="15%"><strong><font color="#000000" face="����">���ù���</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="fyadd" type="checkbox" id="fyadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("fyadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="fymod" type="checkbox" id="fymod" value="��" <%=StringUtils.haveToChecked(resultMap.get("fymod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="fydel" type="checkbox" id="fydel" value="��" <%=StringUtils.haveToChecked(resultMap.get("fydel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="fyview" type="checkbox" id="fyview" value="��" <%=StringUtils.haveToChecked(resultMap.get("fyview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="fyzt" type="checkbox" id="fyzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("fyzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="15%"><strong><font color="#000000" face="����">�������</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_jkgl_add" type="checkbox" id="r_jkgl_add" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_jkgl_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_jkgl_mod" type="checkbox" id="r_jkgl_mod" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_jkgl_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_jkgl_del" type="checkbox" id="r_jkgl_del" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_jkgl_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_jkgl_view" type="checkbox" id="r_jkgl_view" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_jkgl_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_jkgl_zt" type="checkbox" id="r_jkgl_zt" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_jkgl_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="15%"><strong><font color="#000000" face="����">��������</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_fksq_add" type="checkbox" id="r_fksq_add" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_fksq_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_fksq_mod" type="checkbox" id="r_fksq_mod" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_fksq_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_fksq_del" type="checkbox" id="r_fksq_del" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_fksq_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_fksq_view" type="checkbox" id="r_fksq_view" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_fksq_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_fksq_zt" type="checkbox" id="r_fksq_zt" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_fksq_zt"))%>>
          </font></div>      </td>
    </tr>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="����">ת������</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_zzsq_add" TYPE="checkbox" ID="r_zzsq_add" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_zzsq_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_zzsq_mod" TYPE="checkbox" ID="r_zzsq_mod" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_zzsq_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_zzsq_del" TYPE="checkbox" ID="r_zzsq_del" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_zzsq_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_zzsq_view" TYPE="checkbox" ID="r_zzsq_view" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_zzsq_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_zzsq_zt" TYPE="checkbox" ID="r_zzsq_zt" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_zzsq_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="����">��������</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_jcsq_add" TYPE="checkbox" ID="r_jcsq_add" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_jcsq_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_jcsq_mod" TYPE="checkbox" ID="r_jcsq_mod" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_jcsq_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_jcsq_del" TYPE="checkbox" ID="r_jcsq_del" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_jcsq_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_jcsq_view" TYPE="checkbox" ID="r_jcsq_view" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_jcsq_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_jcsq_zt" TYPE="checkbox" ID="r_jcsq_zt" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_jcsq_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <TR> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="����">н���춯</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_xzyd_add" TYPE="checkbox" ID="r_xzyd_add" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_xzyd_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_xzyd_mod" TYPE="checkbox" ID="r_xzyd_mod" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_xzyd_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_xzyd_del" TYPE="checkbox" ID="r_xzyd_del" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_xzyd_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_xzyd_view" TYPE="checkbox" ID="r_xzyd_view" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_xzyd_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_xzyd_zt" TYPE="checkbox" ID="r_xzyd_zt" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_xzyd_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="����">��������</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_ccsq_add" TYPE="checkbox" ID="r_ccsq_add" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_ccsq_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_ccsq_mod" TYPE="checkbox" ID="r_ccsq_mod" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_ccsq_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_ccsq_del" TYPE="checkbox" ID="r_ccsq_del" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_ccsq_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_ccsq_view" TYPE="checkbox" ID="r_ccsq_view" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_ccsq_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_ccsq_zt" TYPE="checkbox" ID="r_ccsq_zt" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_ccsq_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <TR> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="����">�칫��Ʒ</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_bgyp_add" TYPE="checkbox" ID="r_bgyp_add" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_bgyp_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_bgyp_mod" TYPE="checkbox" ID="r_bgyp_mod" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_bgyp_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_bgyp_del" TYPE="checkbox" ID="r_bgyp_del" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_bgyp_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_bgyp_view" TYPE="checkbox" ID="r_bgyp_view" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_bgyp_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_bgyp_zt" TYPE="checkbox" ID="r_bgyp_zt" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_bgyp_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="����">�ڲ�ǩ��</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_nbqc_add" TYPE="checkbox" ID="r_nbqc_add" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_nbqc_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_nbqc_mod" TYPE="checkbox" ID="r_nbqc_mod" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_nbqc_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_nbqc_del" TYPE="checkbox" ID="r_nbqc_del" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_nbqc_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_nbqc_view" TYPE="checkbox" ID="r_nbqc_view" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_nbqc_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_nbqc_zt" TYPE="checkbox" ID="r_nbqc_zt" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_nbqc_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="����">�˻�����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="thadd" type="checkbox" value="��" <%=StringUtils.haveToChecked(resultMap.get("thadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="thmod" type="checkbox" value="��" <%=StringUtils.haveToChecked(resultMap.get("thmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="thdel" type="checkbox" value="��" <%=StringUtils.haveToChecked(resultMap.get("thdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="thview" type="checkbox" value="��" <%=StringUtils.haveToChecked(resultMap.get("thview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="thzt" type="checkbox" id="thzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("thzt"))%>>
          </font></div>      </td>
    </tr>
    <TR bgcolor="#AAFFAA"> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="����">��Ʒ����</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_xphh_add" TYPE="checkbox" ID="r_xphh_add" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_xphh_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_xphh_mod" TYPE="checkbox" ID="r_xphh_mod" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_xphh_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_xphh_del" TYPE="checkbox" ID="r_xphh_del" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_xphh_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_xphh_view" TYPE="checkbox" ID="r_xphh_view" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_xphh_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_xphh_zt" TYPE="checkbox" ID="r_xphh_zt" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_xphh_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="����">�ͻ�����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="serveradd" type="checkbox" id="serveradd" value="��" <%=StringUtils.haveToChecked(resultMap.get("serveradd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="servermod" type="checkbox" id="servermod" value="��" <%=StringUtils.haveToChecked(resultMap.get("servermod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="serverdel" type="checkbox" id="serverdel" value="��"  <%=StringUtils.haveToChecked(resultMap.get("serverdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="serverview" type="checkbox" id="serverview" value="��" <%=StringUtils.haveToChecked(resultMap.get("serverview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="serverzt" type="checkbox" id="serverzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("serverzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="����">�ͻ�Ͷ��</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="tsadd" type="checkbox" id="tsadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("tsadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="tsmod" type="checkbox" id="tsmod" value="��"  <%=StringUtils.haveToChecked(resultMap.get("tsmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="tsdel" type="checkbox" id="tsdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("tsdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="tsview" type="checkbox" id="tsview" value="��" <%=StringUtils.haveToChecked(resultMap.get("tsview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="tszt" type="checkbox" id="tszt" value="��" <%=StringUtils.haveToChecked(resultMap.get("tszt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%" bgcolor="#AAFFAA"><strong><font color="#000000" face="����">��ҵ����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_hyzc_add" type="checkbox" id="r_hyzc_add" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_hyzc_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_hyzc_mod" type="checkbox" id="r_hyzc_mod" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_hyzc_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_hyzc_del" type="checkbox" id="r_hyzc_del" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_hyzc_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_hyzc_view" type="checkbox" id="r_hyzc_view" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_hyzc_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_hyzc_zt" type="checkbox" id="r_hyzc_zt" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_hyzc_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="����">ý������</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_mtxc_add" type="checkbox" id="r_mtxc_add" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_mtxc_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_mtxc_mod" type="checkbox" id="r_mtxc_mod" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_mtxc_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_mtxc_del" type="checkbox" id="r_mtxc_del" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_mtxc_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_mtxc_view" type="checkbox" id="r_mtxc_view" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_mtxc_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="r_mtxc_zt" type="checkbox" id="r_mtxc_zt" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_mtxc_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="����">�г��</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="mactadd" type="checkbox" id="mactadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("mactadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="mactmod" type="checkbox" id="mactmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("mactmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="mactdel" type="checkbox" id="mactdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("mactdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="mactview" type="checkbox" id="mactview" value="��" <%=StringUtils.haveToChecked(resultMap.get("mactview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="mactzt" type="checkbox" id="mactzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("mactzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="����">��������</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="jzdsadd" type="checkbox" id="jzdsadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("jzdsadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="jzdsmod" type="checkbox" id="jzdsmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("jzdsmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="jzdsdel" type="checkbox" id="jzdsdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("jzdsdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="jzdsview" type="checkbox" id="jzdsview" value="��" <%=StringUtils.haveToChecked(resultMap.get("jzdsview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="jzdszt" type="checkbox" id="jzdszt" value="��" <%=StringUtils.haveToChecked(resultMap.get("jzdszt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="15%"><strong><font color="#000000" face="����">֪ ʶ ��</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zskadd" type="checkbox" id="zskadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("zskadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zskmod" type="checkbox" id="zskmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("zskmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zskdel" type="checkbox" id="zskdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("zskdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zskview" type="checkbox" id="zskview" value="��" <%=StringUtils.haveToChecked(resultMap.get("zskview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zskzt" type="checkbox" id="zskzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("zskzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="15%" bgcolor="#FFD595"><strong><font color="#000000" face="����">���ɷ���</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="flfgadd" type="checkbox" id="flfgadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("flfgadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="flfgmod" type="checkbox" id="flfgmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("flfgmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="flfgdel" type="checkbox" id="flfgdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("flfgdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="flfgview" type="checkbox" id="flfgview" value="��" <%=StringUtils.haveToChecked(resultMap.get("flfgview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="flfgzt" type="checkbox" id="flfgzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("flfgzt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" face="����">������Ŀ</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_wlz_add1= ""; String r_wlz_add=resultMap.get("r_wlz_add");if(r_wlz_add.equals("��")){r_wlz_add1="checked";}%>
          <input name="r_wlz_add" type="checkbox" id="r_wlz_add" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_wlz_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_wlz_mod1= ""; String r_wlz_mod=resultMap.get("r_wlz_mod");if(r_wlz_mod.equals("��")){r_wlz_mod1="checked";}%>
          <input name="r_wlz_mod" type="checkbox" id="r_wlz_mod" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_wlz_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_wlz_del1= ""; String r_wlz_del=resultMap.get("r_wlz_del");if(r_wlz_del.equals("��")){r_wlz_del1="checked";}%>
          <input name="r_wlz_del" type="checkbox" id="r_wlz_del" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_wlz_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_wlz_view1= ""; String r_wlz_view=resultMap.get("r_wlz_view");if(r_wlz_view.equals("��")){r_wlz_view1="checked";}%>
          <input name="r_wlz_view" type="checkbox" id="r_wlz_view" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_wlz_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_wlz_zt1= ""; String r_wlz_zt=resultMap.get("r_wlz_zt");if(r_wlz_zt.equals("��")){r_wlz_zt1="checked";}%>
          <input name="r_wlz_zt" type="checkbox" id="r_wlz_zt" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_wlz_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" face="����">�ʽ����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zjadd" type="checkbox" id="zjadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("zjadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zjmod" type="checkbox" id="zjmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("zjmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zjdel" type="checkbox" id="zjdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("zjdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zjview" type="checkbox" id="zjview" value="��" <%=StringUtils.haveToChecked(resultMap.get("zjview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="zjzt" type="checkbox" id="zjzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("zjzt"))%>>
          </font></div>      </td>
    </tr>
    <TR> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="����">���ʹ���</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_wage_add" TYPE="checkbox" ID="r_wage_add" VALUE="��"  <%=StringUtils.haveToChecked(resultMap.get("r_wage_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_wage_mod" TYPE="checkbox" ID="r_wage_mod" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_wage_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_wage_del" TYPE="checkbox" ID="r_wage_del" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_wage_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_wage_view" TYPE="checkbox" ID="r_wage_view" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_wage_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <INPUT NAME="r_wage_zt" TYPE="checkbox" ID="r_wage_zt" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_wage_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <tr> 
      <td width="15%"><strong><font color="#000000" face="����">�������</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fkhzadd1= ""; String fkhzadd=resultMap.get("fkhzadd");if(fkhzadd.equals("��")){fkhzadd1="checked";}%>
          <input name="fkhzadd" type="checkbox" id="fkhzadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("fkhzadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fkhzmod1= ""; String fkhzmod=resultMap.get("fkhzmod");if(fkhzmod.equals("��")){fkhzmod1="checked";}%>
          <input name="fkhzmod" type="checkbox" id="fkhzmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("fkhzmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fkhzdel1= ""; String fkhzdel=resultMap.get("fkhzdel");if(fkhzdel.equals("��")){fkhzdel1="checked";}%>
          <input name="fkhzdel" type="checkbox" id="fkhzdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("fkhzdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fkhzview1= ""; String fkhzview=resultMap.get("fkhzview");if(fkhzview.equals("��")){fkhzview1="checked";}%>
          <input name="fkhzview" type="checkbox" id="fkhzview" value="��" <%=StringUtils.haveToChecked(resultMap.get("fkhzview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fkhzzt1= ""; String fkhzzt=resultMap.get("fkhzzt");if(fkhzzt.equals("��")){fkhzzt1="checked";}%>
          <input name="fkhzzt" type="checkbox" id="fkhzzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("fkhzzt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" face="����">�տ����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String skhzadd1= ""; String skhzadd=resultMap.get("skhzadd");if(skhzadd.equals("��")){skhzadd1="checked";}%>
          <input name="skhzadd" type="checkbox" id="skhzadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("skhzadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String skhzmod1= ""; String skhzmod=resultMap.get("skhzmod");if(skhzmod.equals("��")){skhzmod1="checked";}%>
          <input name="skhzmod" type="checkbox" id="skhzmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("skhzmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String skhzdel1= ""; String skhzdel=resultMap.get("skhzdel");if(skhzdel.equals("��")){skhzdel1="checked";}%>
          <input name="skhzdel" type="checkbox" id="skhzdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("skhzdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String skhzview1= ""; String skhzview=resultMap.get("skhzview");if(skhzview.equals("��")){skhzview1="checked";}%>
          <input name="skhzview" type="checkbox" id="skhzview" value="��" <%=StringUtils.haveToChecked(resultMap.get("skhzview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String skhzzt1= ""; String skhzzt=resultMap.get("skhzzt");if(skhzzt.equals("��")){skhzzt1="checked";}%>
          <input name="skhzzt" type="checkbox" id="skhzzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("skhzzt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" face="����">������Ϣ</font></strong></td>
      <td width="12%">&nbsp;</td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fkmod1= ""; String fkmod=resultMap.get("fkmod");if(fkmod.equals("��")){fkmod1="checked";}%>
          <input name="fkmod" type="checkbox" id="fkmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("fkmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fkdel1= ""; String fkdel=resultMap.get("fkdel");if(fkdel.equals("��")){fkdel1="checked";}%>
          <input name="fkdel" type="checkbox" id="fkdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("fkdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fkview1= ""; String fkview=resultMap.get("fkview");if(fkview.equals("��")){fkview1="checked";}%>
          <input name="fkview" type="checkbox" id="fkview" value="��" <%=StringUtils.haveToChecked(resultMap.get("fkview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String fkzt1= ""; String fkzt=resultMap.get("fkzt");if(fkzt.equals("��")){fkzt1="checked";}%>
          <input name="fkzt" type="checkbox" id="fkzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("fkzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <TD WIDTH="15%"><STRONG><font color="#000000" face="����">���߹�ͨ</font></STRONG></TD>
      <td width="12%">&nbsp;</td>
      <td width="12%">&nbsp;</td>
      <td width="14%">&nbsp;</td>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="����"> 
          <% String r_wx_gt_zt1= ""; String r_wx_gt_zt=resultMap.get("r_wx_gt_zt");if(r_wx_gt_zt.equals("��")){r_wx_gt_zt1="checked";}%>
          <INPUT NAME="r_wx_gt_zt" TYPE="checkbox" ID="r_wx_gt_zt" VALUE="��" <%=StringUtils.haveToChecked(resultMap.get("r_wx_gt_zt"))%>>
          </FONT></DIV>      </TD>
    </tr>
    <tr> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="����">�����տ�</FONT></STRONG></TD>
      <td width="12%">&nbsp;</td>
      <td width="12%">&nbsp;</td>
      <td width="14%">&nbsp;</td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String skview1= ""; String skview=resultMap.get("skview");if(skview.equals("��")){skview1="checked";}%>
          <input name="skview" type="checkbox" id="skview" value="��" <%=StringUtils.haveToChecked(resultMap.get("skview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String skzt1= ""; String skzt=resultMap.get("skzt");if(skzt.equals("��")){skzt1="checked";}%>
          <input name="skzt" type="checkbox" id="skzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("skzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="����">�ͻ�Ƿ��</font></strong></td>
      <td width="12%">&nbsp;</td>
      <td width="12%">&nbsp;</td>
      <td width="14%">&nbsp;</td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% 
		  String qkmod1= ""; 
		  String qkdel1= ""; 
		  String qkmod=resultMap.get("qkmod");
		  if(qkmod.equals("��")){qkmod1="checked";}
		  String qkdel=resultMap.get("qkdel");
		  if(qkdel.equals("��")){qkdel1="checked";}
		  String qkview1= ""; 
		  String qkview=resultMap.get("qkview");
		  if(qkview.equals("��")){qkview1="checked";}
		  %>
          <input name="qkview" type="checkbox" id="qkview" value="��" <%=StringUtils.haveToChecked(resultMap.get("qkview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String qkzt1= ""; String qkzt=resultMap.get("qkzt");if(qkzt.equals("��")){qkzt1="checked";}%>
          <input name="qkzt" type="checkbox" id="qkzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("qkzt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" face="����">�˻����<font size="2"></font></font></strong></td>
      <td width="12%">&nbsp;</td>
      <td width="12%">&nbsp;</td>
      <td width="14%">&nbsp;</td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <%
		   String r_thje_del1= ""; 
		   String r_thje_mod1= ""; 
		   String r_thje_view1= ""; 
		   String r_thje_mod=resultMap.get("r_thje_mod");
		   if(r_thje_mod.equals("��")){r_thje_mod1="checked";}
		   String r_thje_del=resultMap.get("r_thje_del");
		   if(r_thje_del.equals("��")){r_thje_del1="checked";}
		   String r_thje_view=resultMap.get("r_thje_view");
		   if(r_thje_view.equals("��")){r_thje_view1="checked";}
		   %>
          <input name="r_thje_view" type="checkbox" id="r_thje_view" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_thje_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_thje_zt1= ""; String r_thje_zt=resultMap.get("r_thje_zt");if(r_thje_zt.equals("��")){r_thje_zt1="checked";}%>
          <input name="r_thje_zt" type="checkbox" id="r_thje_zt" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_thje_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFFFB3"> 
      <td width="15%"><strong><font color="#000000" face="����">�ֹ����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String intadd1= ""; String intadd=resultMap.get("intadd");if(intadd.equals("��")){intadd1="checked";}%>
          <input type="checkbox" name="intadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("intadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String intmod1= ""; String intmod=resultMap.get("intmod");if(intmod.equals("��")){intmod1="checked";}%>
          <input name="intmod" type="checkbox" id="intmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("intmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String intdel1= ""; String intdel=resultMap.get("intdel");if(intdel.equals("��")){intdel1="checked";}%>
          <input name="intdel" type="checkbox" id="intdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("intdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String intview1= ""; String intview=resultMap.get("intview");if(intview.equals("��")){intview1="checked";}%>
          <input name="intview" type="checkbox" id="intview" value="��" <%=StringUtils.haveToChecked(resultMap.get("intview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String intzt1= ""; String intzt=resultMap.get("intzt");if(intzt.equals("��")){intzt1="checked";}%>
          <input name="intzt" type="checkbox" id="intzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("intzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFFFB3"> 
      <td width="15%"><strong><font color="#000000" face="����">�ֹܳ���</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String outadd1= ""; String outadd=resultMap.get("outadd");if(outadd.equals("��")){outadd1="checked";}%>
          <input name="outadd" type="checkbox" id="outadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("outadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String outmod1= ""; String outmod=resultMap.get("outmod");if(outmod.equals("��")){outmod1="checked";}%>
          <input name="outmod" type="checkbox" id="outmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("outmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <% String outdel1= ""; String outdel=resultMap.get("outdel");if(outdel.equals("��")){outdel1="checked";}%>
          <input name="outdel" type="checkbox" id="outdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("outdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String outview1= ""; String outview=resultMap.get("outview");if(outview.equals("��")){outview1="checked";}%>
          <input name="outview" type="checkbox" id="outview" value="��" <%=StringUtils.haveToChecked(resultMap.get("outview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String outzt1= ""; String outzt=resultMap.get("outzt");if(outzt.equals("��")){outzt1="checked";}%>
          <input name="outzt" type="checkbox" id="outzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("outzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="����">�����ʼ�</font></strong></td>
      <td width="12%"> 
        <div align="center"><font face="����">&nbsp;</font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="����">&nbsp;</font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="����">&nbsp;</font></div>      </td>
      <td width="12%">&nbsp;</td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String r_dzzx_zt1= ""; String r_dzzx_zt=resultMap.get("r_dzzx_zt");if(r_dzzx_zt.equals("��")){r_dzzx_zt1="checked";}%>
          <input name="r_dzzx_zt" type="checkbox" id="r_dzzx_zt" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_dzzx_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="����">���۲�Ʒ</font></strong></td>
      <td colspan="5"><div align="center"><font size="2" face="����">(�Ƿ����
            <% String r_xscp_zt1= ""; String r_xscp_zt=resultMap.get("r_xscp_zt");if(r_xscp_zt.equals("��")){r_xscp_zt1="checked";}%>
          <input name="r_xscp_zt" type="checkbox" id="r_xscp_zt" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_xscp_zt"))%>>
      </font>)<font size="2" face="����">(�������пͻ�
      <input name="opadd" type="checkbox" id="opadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("opadd"))%>>
)(�����������۵���
<input name="opmod" type="checkbox" id="opmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("opmod"))%>>
)(�������вɹ�����
<input name="opdel" type="checkbox" id="opdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("opdel"))%>>
)</font></div></td>
    </tr>
    <tr bgcolor="#FFBFBF"> 
      <td width="15%"><strong><font color="#000000" face="����">ϵͳ����</font></strong></td>
      <td width="12%"> 
        <div align="center"><font face="����">&nbsp;</font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="����">&nbsp;</font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="����">&nbsp;</font></div>      </td>
      <td width="12%">&nbsp;</td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String syszt1= ""; String syszt=resultMap.get("syszt");if(syszt.equals("��")){syszt1="checked";}%>
          <input name="syszt" type="checkbox" id="syszt" value="��" <%=StringUtils.haveToChecked(resultMap.get("syszt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFBFBF"> 
      <td colspan="6"><strong></strong> <font size="2" face="����">���۾��߷����Ƿ����</font><font face="����">&nbsp;</font> 
        <font size="2" face="����">
        <% String jcfxzt1= ""; String jcfxzt=resultMap.get("jcfxzt");if(jcfxzt.equals("��")){jcfxzt1="checked";}%>
        <input name="jcfxzt" type="checkbox" id="jcfxzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("jcfxzt"))%>>
        ���۾��߷����Ƿ�鿴������ 
        <input name="r_thje_mod" type="checkbox" id="outadd" value="��" <%=StringUtils.haveToChecked(resultMap.get("outadd"))%>>
        �ɹ����߷����Ƿ���� 
        <input name="qkmod" type="checkbox" id="qkmod" value="��" <%=StringUtils.haveToChecked(resultMap.get("qkmod"))%>>
        �ɹ����߷����Ƿ�鿴 
        <input name="qkdel" type="checkbox" id="qkdel" value="��" <%=StringUtils.haveToChecked(resultMap.get("qkdel"))%>>
        �ֿ���߷����Ƿ���� 
        <input name="r_thje_del" type="checkbox" id="r_thje_del" value="��" <%=StringUtils.haveToChecked(resultMap.get("r_thje_del"))%>>
        </font></td>
    </tr>
    <tr bgcolor="#FFBFBF"> 
      <td width="15%"><strong><font color="#000000" face="����">��Դת��</font></strong></td>
      <td width="12%"> 
        <div align="center"><font face="����">&nbsp;</font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="����">&nbsp;</font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="����">&nbsp;</font></div>      </td>
      <td width="12%">&nbsp;</td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          <% String custzyzt1= ""; String custzyzt=resultMap.get("custzyzt");if(custzyzt.equals("��")){custzyzt1="checked";}%>
          <input name="custzyzt" type="checkbox" id="custzyzt" value="��" <%=StringUtils.haveToChecked(resultMap.get("custzyzt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%"><font face="����"><strong></strong></font></td>
      <td width="12%">&nbsp;</td>
      <td width="12%"><font face="����">&nbsp;</font></td>
      <td width="14%"><font face="����">&nbsp;</font></td>
      <td width="12%">&nbsp;</td>
      <td width="12%"><font size="2" face="����">&nbsp; </font></td>
    </tr>
    <tr> 
      <td colspan="6"> 
        <div align="center">
        	<font color="#000000" size="2" face="����"> 
          		<input type="button" name="Submit" value="ȷ��" class="commonnButton" onclick="saveRestrain()">
          ����		</font> 
       		<font face="����"> 
          		<input type="reset" name="Submit5" value="����" class="commonnButton">
          	</font>
         </div>
      </td>
    </tr>
  </table>
</form>
</body>

</html>

