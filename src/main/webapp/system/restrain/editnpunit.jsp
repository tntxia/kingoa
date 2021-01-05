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
<title>权限自定义</title>
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
      <td width="15%" height="6" bgcolor="#C1D9FF"><font size="2" color="#000000">增加--&gt;&gt;<a href="right/roleRight.dispatch?id=<%=id%>">新功能权限</a></font></td>
      <td height="6" colspan="5" bgcolor="#C1D9FF"> 
        <div align="right"> </div>      </td>
    </tr>
    <tr> 
      <td height="2" colspan="6"><b></b> 
        <div align="left"><font color="#000000"> </font></div>
        <font color="#000000"><b>权限组 
        <input name="restrain_name" type="text" id="restrain_name" value="<%=restrain_name%>">
        <input name="id" type="hidden" id="id" value="<%=id%>">
        </b></font></td>
    </tr>
    <tr> 
      <td width="15%"> 
        <div align="center"><font face="黑体"><strong>业务对象</strong></font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="黑体"><strong>新增权限</strong></font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="黑体"><strong>修改权限</strong></font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="黑体"><strong>删除权限</strong></font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="黑体"><strong>查看本部门所有人的信息</strong></font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="黑体"><strong>是否可用</strong></font></div>      </td>
    </tr>
    <tr bgcolor="#ACCBFF" > 
      <td width="15%"><font face="黑体">是否全选</font></td>
      <td width="12%"> 
        <div align="center"><font face="黑体"> 
          <input name="allSelect" type="checkbox"      
		     onclick="javascript:allSelect_onclick();" value="">
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="黑体"> 
          <input type="checkbox" name="allSelect3" value=""      
		     onclick="javascript:allSelect3_onclick();">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"> <font face="黑体"> 
          <input type="checkbox" name="allSelect4" value=""      
		     onclick="javascript:allSelect4_onclick();">
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"> <font face="黑体"> 
          <input type="checkbox" name="allSelect5" value=""      
		     onclick="javascript:allSelect5_onclick();">
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="黑体"> 
          <input name="allSelect2" type="checkbox"      
		     onclick="javascript:allSelect2_onclick();" value="">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><b><font color="#000000" face="黑体">潜在客户</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="qzadd" type="checkbox" id="qzadd" value="有"  <%=StringUtils.haveToChecked(resultMap.get("qzadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="qzmod" type="checkbox" id="qzmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("qzmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="qzdel" type="checkbox" id="qzdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("qzdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="qzview" type="checkbox" id="qzview" value="有" <%=StringUtils.haveToChecked(resultMap.get("qzview"))%> >
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="qzzt" type="checkbox" id="qzzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("qzzt"))%> >
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><b><font color="#000000" face="黑体">现有客户</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xhadd" type="checkbox" id="xhadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("xhadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xhmod" type="checkbox" id="xhmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("xhmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xhdel" type="checkbox" id="xhdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("xhdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xhview" type="checkbox" id="xhview" value="有" <%=StringUtils.haveToChecked(resultMap.get("xhview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xhzt" type="checkbox" id="xhzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("xhzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><b><font color="#000000" face="黑体">联 系 人</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="linkadd" type="checkbox" id="linkadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("linkadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="linkmod" type="checkbox" id="linkmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("linkmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="linkdel" type="checkbox" id="linkdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("linkdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="linkview" type="checkbox" id="linkview" value="有" <%=StringUtils.haveToChecked(resultMap.get("linkview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="linkzt" type="checkbox" id="linkzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("linkzt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%"><b><font color="#000000" face="黑体">合作伙伴</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="hzadd" type="checkbox" id="hzadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("hzadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="hzmod" type="checkbox" id="hzmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("hzmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="hzdel" type="checkbox" id="hzdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("hzdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="hzview" type="checkbox" id="hzview" value="有" <%=StringUtils.haveToChecked(resultMap.get("hzview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="hzzt" type="checkbox" id="hzzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("hzzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFB3FF"> 
      <td width="15%"><b><font color="#000000" face="黑体">供 应 商</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
         
          <input name="supadd" type="checkbox" id="supadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("supadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
         
          <input name="supmod" type="checkbox" id="supmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("supmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="supdel" type="checkbox" id="supdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("supdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="supview" type="checkbox" id="supview" value="有" <%=StringUtils.haveToChecked(resultMap.get("supview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="supzt" type="checkbox" id="supzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("supzt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%" height="24"><b><font color="#000000" face="黑体">活动管理</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="actadd" type="checkbox" id="actadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("actadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="actmod" type="checkbox" id="actmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("actmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String actdel1= ""; String actdel=resultMap.get("actdel");if(actdel.equals("有")){actdel1="checked";}%>
          <input name="actdel" type="checkbox" id="actdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("actdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String actview1= ""; String actview=resultMap.get("actview");if(actview.equals("有")){actview1="checked";}%>
          <input name="actview" type="checkbox" id="actview" value="有" <%=StringUtils.haveToChecked(resultMap.get("actview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="actzt" type="checkbox" id="actzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("actzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><b><font color="#000000" face="黑体">客户报价</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="quoteadd" type="checkbox" id="quoteadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("quoteadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="quotemod" type="checkbox" id="quotemod" value="有" <%=StringUtils.haveToChecked(resultMap.get("quotemod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="quotedel" type="checkbox" id="quotedel" value="有" <%=StringUtils.haveToChecked(resultMap.get("quotedel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="quoteview" type="checkbox" id="quoteview" value="有" <%=StringUtils.haveToChecked(resultMap.get("quoteview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="quotezt" type="checkbox" id="quotezt" value="有" <%=StringUtils.haveToChecked(resultMap.get("quotezt"))%>>
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
            <td><font size="2" face="黑体"> <b><%=name %></b>:(是否可用 
              <input name="prozt<%=wid %>" value="Y" type="checkbox" <%=pro_zt%>>
              )
              
              <input type="hidden" name="gpid<%=wid %>" value="<%=gpid%>">
              
              (
              新增权限</font><font size="2"> </font><font size="2" face="黑体"> 
              <input name="proadd<%=wid %>" type="checkbox" value="Y" <%=proadd%>>
              )
              (修改权限</font> <font size="2" face="黑体"> 
              <input name="promod<%=wid %>" type="checkbox" value="Y" <%=promod%>>
              )
              (
              删除权限 
              <input name="prodel<%=wid %>" type="checkbox" value="Y" <%=pro_del%>>
              )
              (查询权限 
              <input name="proview<%=wid %>" type="checkbox" value="Y" <%=pro_view%>>
              )
              </font> <font size="2" face="黑体">(供应商及成本/销售单价查看权限 
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
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="黑体">供应商询价</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_sup_xj_add" TYPE="checkbox" ID="r_sup_xj_add" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_sup_xj_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_sup_xj_mod" TYPE="checkbox" ID="r_sup_xj_mod" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_sup_xj_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_sup_xj_del" TYPE="checkbox" ID="r_sup_xj_del" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_sup_xj_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_sup_xj_view" TYPE="checkbox" ID="r_sup_xj_view" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_sup_xj_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_sup_xj_zt" TYPE="checkbox" ID="r_sup_xj_zt" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_sup_xj_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <tr bgcolor="#FFB3FF"> 
      <td width="15%"><strong><font color="#000000" face="黑体">采购管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String cgadd1= ""; String cgadd=resultMap.get("cgadd");if(cgadd.equals("有")){cgadd1="checked";}%>
          <input name="cgadd" type="checkbox" id="cgadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("cgadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="cgmod" type="checkbox" id="cgmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("cgmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="cgdel" type="checkbox" id="cgdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("cgdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="cgview" type="checkbox" id="cgview" value="有" <%=StringUtils.haveToChecked(resultMap.get("cgview"))%>>
          </font><font face="黑体"><strong>返回权限</strong></font><font size="2" face="黑体"> 
          <input name="cgview_yes" type="checkbox" id="cgview_yes" value="有" <%=StringUtils.haveToChecked(resultMap.get("cgview_yes"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="cgzt" type="checkbox" id="cgzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("cgzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFFFB3"> 
      <td width="15%"><strong><font color="#000000" face="黑体">发运管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="tradd" type="checkbox" id="tradd" value="有" <%=StringUtils.haveToChecked(resultMap.get("tradd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
         
          <input name="trmod" type="checkbox" id="trmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("trmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="trdel" type="checkbox" id="trdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("trdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="trview" type="checkbox" id="trview" value="有" <%=StringUtils.haveToChecked(resultMap.get("trview"))%>>
          </font><font face="黑体"><strong>返回权限</strong></font><font size="2" face="黑体"> 
          
          <input name="trview_yes" type="checkbox" id="trview_yes" value="有" <%=StringUtils.haveToChecked(resultMap.get("trview_yes"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="trzt" type="checkbox" id="trzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("trzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFFFB3"> 
      <td width="15%" bgcolor="#FFFFB3"><strong><font color="#000000" face="黑体">货代公司</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String hdadd1= ""; String hdadd=resultMap.get("hdadd");
          if(hdadd==null) hdadd = "";
          hdadd = hdadd;if(hdadd.equals("有")){hdadd1="checked";}%>
          <input name="hdadd" type="checkbox" id="hdadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("hdadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="hdmod" type="checkbox" id="hdmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("hdmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="hddel" type="checkbox" id="hddel" value="有" <%=StringUtils.haveToChecked(resultMap.get("hddel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="hdview" type="checkbox" id="hdview" value="有" <%=StringUtils.haveToChecked(resultMap.get("hdview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="hdzt" type="checkbox" id="hdzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("hdzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="黑体">周 计 划<font size="2"></font></font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="workadd" type="checkbox" id="workadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("workadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="workmod" type="checkbox" id="workmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("workmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="workdel" type="checkbox" id="workdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("workdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="workview" type="checkbox" id="workview" value="有" <%=StringUtils.haveToChecked(resultMap.get("workview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="workzt" type="checkbox" id="workzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("workzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="黑体">月 计 划</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_jh_add" type="checkbox" id="r_month_jh_add" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_month_jh_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_jh_mod" type="checkbox" id="r_month_jh_mod" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_month_jh_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="r_month_jh_del" type="checkbox" id="r_month_jh_del" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_month_jh_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_jh_view" type="checkbox" id="r_month_jh_view" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_month_jh_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_jh_zt" type="checkbox" id="r_month_jh_zt" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_month_jh_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="黑体">日 报 表</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_date_r_add" type="checkbox" id="r_date_r_add" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_date_r_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_date_r_mod" type="checkbox" id="r_date_r_mod" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_date_r_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_date_r_del" type="checkbox" id="r_date_r_del" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_date_r_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_date_r_view" type="checkbox" id="r_date_r_view" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_date_r_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_date_r_zt" type="checkbox" id="r_date_r_zt" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_date_r_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="黑体">周 报 表</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_week_r_add" type="checkbox" id="r_week_r_add" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_week_r_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_week_r_mod" type="checkbox" id="r_week_r_mod" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_week_r_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_week_r_del" type="checkbox" id="r_week_r_del" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_week_r_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_week_r_view" type="checkbox" id="r_week_r_view" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_week_r_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_week_r_zt" type="checkbox" id="r_week_r_zt" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_week_r_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="黑体">月 报 表</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_r_add" type="checkbox" id="r_month_r_add" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_month_r_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_r_mod" type="checkbox" id="r_month_r_mod" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_month_r_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_r_del" type="checkbox" id="r_month_r_del" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_month_r_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_r_view" type="checkbox" id="r_month_r_view" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_month_r_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_r_zt" type="checkbox" id="r_month_r_zt" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_month_r_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="黑体">项目管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xmadd" type="checkbox" id="xmadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("xmadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xmmod" type="checkbox" id="xmmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("xmmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xmdel" type="checkbox" id="xmdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("xmdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xmview" type="checkbox" id="xmview" value="有" <%=StringUtils.haveToChecked(resultMap.get("xmview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xmzt" type="checkbox" id="xmzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("xmzt"))%>>
          </font></div>      </td>
    </tr>
    <TR bgcolor="#AAFFAA"> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="黑体">客户询价</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_cus_xj_add" TYPE="checkbox" ID="r_cus_xj_add" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_cus_xj_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_cus_xj_mod" TYPE="checkbox" ID="r_cus_xj_mod" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_cus_xj_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_cus_xj_del" TYPE="checkbox" ID="r_cus_xj_del" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_cus_xj_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_cus_xj_view" TYPE="checkbox" ID="r_cus_xj_view" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_cus_xj_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_cus_xj_zt" TYPE="checkbox" ID="r_cus_xj_zt" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_cus_xj_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#AAFFAA" >
      <TD><STRONG><FONT COLOR="#000000" FACE="黑体">样品管理</FONT></STRONG></TD>
      <TD><DIV ALIGN="center"><FONT SIZE="2" FACE="黑体">
          <INPUT NAME="r_sam_add" TYPE="checkbox" ID="r_sam_add" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_sam_add"))%>>
      </FONT></DIV></TD>
      <TD><DIV ALIGN="center"><FONT SIZE="2" FACE="黑体">
          <INPUT NAME="r_sam_mod" TYPE="checkbox" ID="r_sam_mod" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_sam_mod"))%>>
      </FONT></DIV></TD>
      <TD><DIV ALIGN="center"><FONT SIZE="2" FACE="黑体">
          <INPUT NAME="r_sam_del" TYPE="checkbox" ID="r_sam_del" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_sam_del"))%>>
      </FONT></DIV></TD>
      <TD><DIV ALIGN="center"><FONT SIZE="2" FACE="黑体">
          <INPUT NAME="r_sam_view" TYPE="checkbox" ID="r_sam_view" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_sam_view"))%>>
      </FONT></DIV></TD>
      <TD><DIV ALIGN="center"><FONT SIZE="2" FACE="黑体">
          <INPUT NAME="r_sam_zt" TYPE="checkbox" ID="r_sam_zt" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_sam_zt"))%>>
      </FONT></DIV></TD>
    </TR>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="黑体">合同管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="subadd" type="checkbox" id="subadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("subadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="submod" type="checkbox" id="submod" value="有" <%=StringUtils.haveToChecked(resultMap.get("submod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="subdel" type="checkbox" id="subdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("subdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="subview" type="checkbox" id="subview" value="有" <%=StringUtils.haveToChecked(resultMap.get("subview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
         
          <input name="subzt" type="checkbox" id="subzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("subzt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" face="黑体">员工管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="manadd" type="checkbox" id="manadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("manadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="manmod" type="checkbox" id="manmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("manmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
         
          <input name="mandel" type="checkbox" id="mandel" value="有" <%=StringUtils.haveToChecked(resultMap.get("mandel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
         
          <input name="manview" type="checkbox" id="manview" value="有" <%=StringUtils.haveToChecked(resultMap.get("manview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="manzt" type="checkbox" id="manzt" value="有"  <%=StringUtils.haveToChecked(resultMap.get("manzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="15%"><strong><font color="#000000" face="黑体">任务管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="rwadd" type="checkbox" id="rwadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("rwadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="rwmod" type="checkbox" id="rwmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("rwmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="rwdel" type="checkbox" id="rwdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("rwdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="rwview" type="checkbox" id="rwview" value="有" <%=StringUtils.haveToChecked(resultMap.get("rwview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="rwzt" type="checkbox" id="rwzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("rwzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="15%"><strong><font color="#000000" face="黑体">费用管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="fyadd" type="checkbox" id="fyadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("fyadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          
          <input name="fymod" type="checkbox" id="fymod" value="有" <%=StringUtils.haveToChecked(resultMap.get("fymod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="fydel" type="checkbox" id="fydel" value="有" <%=StringUtils.haveToChecked(resultMap.get("fydel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="fyview" type="checkbox" id="fyview" value="有" <%=StringUtils.haveToChecked(resultMap.get("fyview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="fyzt" type="checkbox" id="fyzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("fyzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="15%"><strong><font color="#000000" face="黑体">借款申请</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_jkgl_add" type="checkbox" id="r_jkgl_add" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_jkgl_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_jkgl_mod" type="checkbox" id="r_jkgl_mod" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_jkgl_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_jkgl_del" type="checkbox" id="r_jkgl_del" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_jkgl_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_jkgl_view" type="checkbox" id="r_jkgl_view" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_jkgl_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_jkgl_zt" type="checkbox" id="r_jkgl_zt" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_jkgl_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="15%"><strong><font color="#000000" face="黑体">付款申请</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_fksq_add" type="checkbox" id="r_fksq_add" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_fksq_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_fksq_mod" type="checkbox" id="r_fksq_mod" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_fksq_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_fksq_del" type="checkbox" id="r_fksq_del" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_fksq_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_fksq_view" type="checkbox" id="r_fksq_view" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_fksq_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_fksq_zt" type="checkbox" id="r_fksq_zt" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_fksq_zt"))%>>
          </font></div>      </td>
    </tr>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="黑体">转正申请</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_zzsq_add" TYPE="checkbox" ID="r_zzsq_add" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_zzsq_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_zzsq_mod" TYPE="checkbox" ID="r_zzsq_mod" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_zzsq_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_zzsq_del" TYPE="checkbox" ID="r_zzsq_del" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_zzsq_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_zzsq_view" TYPE="checkbox" ID="r_zzsq_view" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_zzsq_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_zzsq_zt" TYPE="checkbox" ID="r_zzsq_zt" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_zzsq_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="黑体">奖惩申请</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_jcsq_add" TYPE="checkbox" ID="r_jcsq_add" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_jcsq_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_jcsq_mod" TYPE="checkbox" ID="r_jcsq_mod" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_jcsq_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_jcsq_del" TYPE="checkbox" ID="r_jcsq_del" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_jcsq_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_jcsq_view" TYPE="checkbox" ID="r_jcsq_view" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_jcsq_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_jcsq_zt" TYPE="checkbox" ID="r_jcsq_zt" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_jcsq_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <TR> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="黑体">薪资异动</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_xzyd_add" TYPE="checkbox" ID="r_xzyd_add" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_xzyd_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_xzyd_mod" TYPE="checkbox" ID="r_xzyd_mod" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_xzyd_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_xzyd_del" TYPE="checkbox" ID="r_xzyd_del" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_xzyd_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_xzyd_view" TYPE="checkbox" ID="r_xzyd_view" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_xzyd_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_xzyd_zt" TYPE="checkbox" ID="r_xzyd_zt" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_xzyd_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="黑体">出差申请</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_ccsq_add" TYPE="checkbox" ID="r_ccsq_add" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_ccsq_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_ccsq_mod" TYPE="checkbox" ID="r_ccsq_mod" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_ccsq_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_ccsq_del" TYPE="checkbox" ID="r_ccsq_del" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_ccsq_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_ccsq_view" TYPE="checkbox" ID="r_ccsq_view" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_ccsq_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_ccsq_zt" TYPE="checkbox" ID="r_ccsq_zt" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_ccsq_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <TR> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="黑体">办公用品</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_bgyp_add" TYPE="checkbox" ID="r_bgyp_add" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_bgyp_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_bgyp_mod" TYPE="checkbox" ID="r_bgyp_mod" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_bgyp_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_bgyp_del" TYPE="checkbox" ID="r_bgyp_del" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_bgyp_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_bgyp_view" TYPE="checkbox" ID="r_bgyp_view" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_bgyp_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_bgyp_zt" TYPE="checkbox" ID="r_bgyp_zt" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_bgyp_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="黑体">内部签呈</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_nbqc_add" TYPE="checkbox" ID="r_nbqc_add" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_nbqc_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_nbqc_mod" TYPE="checkbox" ID="r_nbqc_mod" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_nbqc_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_nbqc_del" TYPE="checkbox" ID="r_nbqc_del" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_nbqc_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_nbqc_view" TYPE="checkbox" ID="r_nbqc_view" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_nbqc_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_nbqc_zt" TYPE="checkbox" ID="r_nbqc_zt" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_nbqc_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="黑体">退货管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="thadd" type="checkbox" value="有" <%=StringUtils.haveToChecked(resultMap.get("thadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="thmod" type="checkbox" value="有" <%=StringUtils.haveToChecked(resultMap.get("thmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="thdel" type="checkbox" value="有" <%=StringUtils.haveToChecked(resultMap.get("thdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="thview" type="checkbox" value="有" <%=StringUtils.haveToChecked(resultMap.get("thview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="thzt" type="checkbox" id="thzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("thzt"))%>>
          </font></div>      </td>
    </tr>
    <TR bgcolor="#AAFFAA"> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="黑体">新品换货</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_xphh_add" TYPE="checkbox" ID="r_xphh_add" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_xphh_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_xphh_mod" TYPE="checkbox" ID="r_xphh_mod" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_xphh_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_xphh_del" TYPE="checkbox" ID="r_xphh_del" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_xphh_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_xphh_view" TYPE="checkbox" ID="r_xphh_view" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_xphh_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_xphh_zt" TYPE="checkbox" ID="r_xphh_zt" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_xphh_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="黑体">客户服务</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="serveradd" type="checkbox" id="serveradd" value="有" <%=StringUtils.haveToChecked(resultMap.get("serveradd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="servermod" type="checkbox" id="servermod" value="有" <%=StringUtils.haveToChecked(resultMap.get("servermod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="serverdel" type="checkbox" id="serverdel" value="有"  <%=StringUtils.haveToChecked(resultMap.get("serverdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="serverview" type="checkbox" id="serverview" value="有" <%=StringUtils.haveToChecked(resultMap.get("serverview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="serverzt" type="checkbox" id="serverzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("serverzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="黑体">客户投诉</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="tsadd" type="checkbox" id="tsadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("tsadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="tsmod" type="checkbox" id="tsmod" value="有"  <%=StringUtils.haveToChecked(resultMap.get("tsmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="tsdel" type="checkbox" id="tsdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("tsdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="tsview" type="checkbox" id="tsview" value="有" <%=StringUtils.haveToChecked(resultMap.get("tsview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="tszt" type="checkbox" id="tszt" value="有" <%=StringUtils.haveToChecked(resultMap.get("tszt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%" bgcolor="#AAFFAA"><strong><font color="#000000" face="黑体">行业政策</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_hyzc_add" type="checkbox" id="r_hyzc_add" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_hyzc_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_hyzc_mod" type="checkbox" id="r_hyzc_mod" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_hyzc_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_hyzc_del" type="checkbox" id="r_hyzc_del" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_hyzc_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_hyzc_view" type="checkbox" id="r_hyzc_view" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_hyzc_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_hyzc_zt" type="checkbox" id="r_hyzc_zt" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_hyzc_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="黑体">媒体宣传</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_mtxc_add" type="checkbox" id="r_mtxc_add" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_mtxc_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_mtxc_mod" type="checkbox" id="r_mtxc_mod" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_mtxc_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_mtxc_del" type="checkbox" id="r_mtxc_del" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_mtxc_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_mtxc_view" type="checkbox" id="r_mtxc_view" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_mtxc_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_mtxc_zt" type="checkbox" id="r_mtxc_zt" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_mtxc_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="黑体">市场活动</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="mactadd" type="checkbox" id="mactadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("mactadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="mactmod" type="checkbox" id="mactmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("mactmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="mactdel" type="checkbox" id="mactdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("mactdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="mactview" type="checkbox" id="mactview" value="有" <%=StringUtils.haveToChecked(resultMap.get("mactview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="mactzt" type="checkbox" id="mactzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("mactzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="黑体">竞争对手</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="jzdsadd" type="checkbox" id="jzdsadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("jzdsadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="jzdsmod" type="checkbox" id="jzdsmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("jzdsmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="jzdsdel" type="checkbox" id="jzdsdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("jzdsdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="jzdsview" type="checkbox" id="jzdsview" value="有" <%=StringUtils.haveToChecked(resultMap.get("jzdsview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="jzdszt" type="checkbox" id="jzdszt" value="有" <%=StringUtils.haveToChecked(resultMap.get("jzdszt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="15%"><strong><font color="#000000" face="黑体">知 识 库</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zskadd" type="checkbox" id="zskadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("zskadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zskmod" type="checkbox" id="zskmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("zskmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zskdel" type="checkbox" id="zskdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("zskdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zskview" type="checkbox" id="zskview" value="有" <%=StringUtils.haveToChecked(resultMap.get("zskview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zskzt" type="checkbox" id="zskzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("zskzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="15%" bgcolor="#FFD595"><strong><font color="#000000" face="黑体">法律法规</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="flfgadd" type="checkbox" id="flfgadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("flfgadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="flfgmod" type="checkbox" id="flfgmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("flfgmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="flfgdel" type="checkbox" id="flfgdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("flfgdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="flfgview" type="checkbox" id="flfgview" value="有" <%=StringUtils.haveToChecked(resultMap.get("flfgview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="flfgzt" type="checkbox" id="flfgzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("flfgzt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" face="黑体">往来帐目</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String r_wlz_add1= ""; String r_wlz_add=resultMap.get("r_wlz_add");if(r_wlz_add.equals("有")){r_wlz_add1="checked";}%>
          <input name="r_wlz_add" type="checkbox" id="r_wlz_add" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_wlz_add"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String r_wlz_mod1= ""; String r_wlz_mod=resultMap.get("r_wlz_mod");if(r_wlz_mod.equals("有")){r_wlz_mod1="checked";}%>
          <input name="r_wlz_mod" type="checkbox" id="r_wlz_mod" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_wlz_mod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String r_wlz_del1= ""; String r_wlz_del=resultMap.get("r_wlz_del");if(r_wlz_del.equals("有")){r_wlz_del1="checked";}%>
          <input name="r_wlz_del" type="checkbox" id="r_wlz_del" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_wlz_del"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String r_wlz_view1= ""; String r_wlz_view=resultMap.get("r_wlz_view");if(r_wlz_view.equals("有")){r_wlz_view1="checked";}%>
          <input name="r_wlz_view" type="checkbox" id="r_wlz_view" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_wlz_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String r_wlz_zt1= ""; String r_wlz_zt=resultMap.get("r_wlz_zt");if(r_wlz_zt.equals("有")){r_wlz_zt1="checked";}%>
          <input name="r_wlz_zt" type="checkbox" id="r_wlz_zt" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_wlz_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" face="黑体">资金管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zjadd" type="checkbox" id="zjadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("zjadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zjmod" type="checkbox" id="zjmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("zjmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zjdel" type="checkbox" id="zjdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("zjdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zjview" type="checkbox" id="zjview" value="有" <%=StringUtils.haveToChecked(resultMap.get("zjview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zjzt" type="checkbox" id="zjzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("zjzt"))%>>
          </font></div>      </td>
    </tr>
    <TR> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="黑体">工资管理</FONT></STRONG></TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_wage_add" TYPE="checkbox" ID="r_wage_add" VALUE="有"  <%=StringUtils.haveToChecked(resultMap.get("r_wage_add"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_wage_mod" TYPE="checkbox" ID="r_wage_mod" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_wage_mod"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_wage_del" TYPE="checkbox" ID="r_wage_del" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_wage_del"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_wage_view" TYPE="checkbox" ID="r_wage_view" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_wage_view"))%>>
          </FONT></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_wage_zt" TYPE="checkbox" ID="r_wage_zt" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_wage_zt"))%>>
          </FONT></DIV>      </TD>
    </TR>
    <tr> 
      <td width="15%"><strong><font color="#000000" face="黑体">付款汇总</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String fkhzadd1= ""; String fkhzadd=resultMap.get("fkhzadd");if(fkhzadd.equals("有")){fkhzadd1="checked";}%>
          <input name="fkhzadd" type="checkbox" id="fkhzadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("fkhzadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String fkhzmod1= ""; String fkhzmod=resultMap.get("fkhzmod");if(fkhzmod.equals("有")){fkhzmod1="checked";}%>
          <input name="fkhzmod" type="checkbox" id="fkhzmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("fkhzmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String fkhzdel1= ""; String fkhzdel=resultMap.get("fkhzdel");if(fkhzdel.equals("有")){fkhzdel1="checked";}%>
          <input name="fkhzdel" type="checkbox" id="fkhzdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("fkhzdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String fkhzview1= ""; String fkhzview=resultMap.get("fkhzview");if(fkhzview.equals("有")){fkhzview1="checked";}%>
          <input name="fkhzview" type="checkbox" id="fkhzview" value="有" <%=StringUtils.haveToChecked(resultMap.get("fkhzview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String fkhzzt1= ""; String fkhzzt=resultMap.get("fkhzzt");if(fkhzzt.equals("有")){fkhzzt1="checked";}%>
          <input name="fkhzzt" type="checkbox" id="fkhzzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("fkhzzt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" face="黑体">收款汇总</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String skhzadd1= ""; String skhzadd=resultMap.get("skhzadd");if(skhzadd.equals("有")){skhzadd1="checked";}%>
          <input name="skhzadd" type="checkbox" id="skhzadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("skhzadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String skhzmod1= ""; String skhzmod=resultMap.get("skhzmod");if(skhzmod.equals("有")){skhzmod1="checked";}%>
          <input name="skhzmod" type="checkbox" id="skhzmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("skhzmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String skhzdel1= ""; String skhzdel=resultMap.get("skhzdel");if(skhzdel.equals("有")){skhzdel1="checked";}%>
          <input name="skhzdel" type="checkbox" id="skhzdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("skhzdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String skhzview1= ""; String skhzview=resultMap.get("skhzview");if(skhzview.equals("有")){skhzview1="checked";}%>
          <input name="skhzview" type="checkbox" id="skhzview" value="有" <%=StringUtils.haveToChecked(resultMap.get("skhzview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String skhzzt1= ""; String skhzzt=resultMap.get("skhzzt");if(skhzzt.equals("有")){skhzzt1="checked";}%>
          <input name="skhzzt" type="checkbox" id="skhzzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("skhzzt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" face="黑体">付款信息</font></strong></td>
      <td width="12%">&nbsp;</td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String fkmod1= ""; String fkmod=resultMap.get("fkmod");if(fkmod.equals("有")){fkmod1="checked";}%>
          <input name="fkmod" type="checkbox" id="fkmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("fkmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String fkdel1= ""; String fkdel=resultMap.get("fkdel");if(fkdel.equals("有")){fkdel1="checked";}%>
          <input name="fkdel" type="checkbox" id="fkdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("fkdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String fkview1= ""; String fkview=resultMap.get("fkview");if(fkview.equals("有")){fkview1="checked";}%>
          <input name="fkview" type="checkbox" id="fkview" value="有" <%=StringUtils.haveToChecked(resultMap.get("fkview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String fkzt1= ""; String fkzt=resultMap.get("fkzt");if(fkzt.equals("有")){fkzt1="checked";}%>
          <input name="fkzt" type="checkbox" id="fkzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("fkzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <TD WIDTH="15%"><STRONG><font color="#000000" face="黑体">在线沟通</font></STRONG></TD>
      <td width="12%">&nbsp;</td>
      <td width="12%">&nbsp;</td>
      <td width="14%">&nbsp;</td>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"></DIV>      </TD>
      <TD WIDTH="12%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <% String r_wx_gt_zt1= ""; String r_wx_gt_zt=resultMap.get("r_wx_gt_zt");if(r_wx_gt_zt.equals("有")){r_wx_gt_zt1="checked";}%>
          <INPUT NAME="r_wx_gt_zt" TYPE="checkbox" ID="r_wx_gt_zt" VALUE="有" <%=StringUtils.haveToChecked(resultMap.get("r_wx_gt_zt"))%>>
          </FONT></DIV>      </TD>
    </tr>
    <tr> 
      <TD WIDTH="15%"><STRONG><FONT COLOR="#000000" FACE="黑体">销售收款</FONT></STRONG></TD>
      <td width="12%">&nbsp;</td>
      <td width="12%">&nbsp;</td>
      <td width="14%">&nbsp;</td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String skview1= ""; String skview=resultMap.get("skview");if(skview.equals("有")){skview1="checked";}%>
          <input name="skview" type="checkbox" id="skview" value="有" <%=StringUtils.haveToChecked(resultMap.get("skview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String skzt1= ""; String skzt=resultMap.get("skzt");if(skzt.equals("有")){skzt1="checked";}%>
          <input name="skzt" type="checkbox" id="skzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("skzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="黑体">客户欠款</font></strong></td>
      <td width="12%">&nbsp;</td>
      <td width="12%">&nbsp;</td>
      <td width="14%">&nbsp;</td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% 
		  String qkmod1= ""; 
		  String qkdel1= ""; 
		  String qkmod=resultMap.get("qkmod");
		  if(qkmod.equals("有")){qkmod1="checked";}
		  String qkdel=resultMap.get("qkdel");
		  if(qkdel.equals("有")){qkdel1="checked";}
		  String qkview1= ""; 
		  String qkview=resultMap.get("qkview");
		  if(qkview.equals("有")){qkview1="checked";}
		  %>
          <input name="qkview" type="checkbox" id="qkview" value="有" <%=StringUtils.haveToChecked(resultMap.get("qkview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String qkzt1= ""; String qkzt=resultMap.get("qkzt");if(qkzt.equals("有")){qkzt1="checked";}%>
          <input name="qkzt" type="checkbox" id="qkzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("qkzt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%"><strong><font color="#000000" face="黑体">退货金额<font size="2"></font></font></strong></td>
      <td width="12%">&nbsp;</td>
      <td width="12%">&nbsp;</td>
      <td width="14%">&nbsp;</td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <%
		   String r_thje_del1= ""; 
		   String r_thje_mod1= ""; 
		   String r_thje_view1= ""; 
		   String r_thje_mod=resultMap.get("r_thje_mod");
		   if(r_thje_mod.equals("有")){r_thje_mod1="checked";}
		   String r_thje_del=resultMap.get("r_thje_del");
		   if(r_thje_del.equals("有")){r_thje_del1="checked";}
		   String r_thje_view=resultMap.get("r_thje_view");
		   if(r_thje_view.equals("有")){r_thje_view1="checked";}
		   %>
          <input name="r_thje_view" type="checkbox" id="r_thje_view" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_thje_view"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String r_thje_zt1= ""; String r_thje_zt=resultMap.get("r_thje_zt");if(r_thje_zt.equals("有")){r_thje_zt1="checked";}%>
          <input name="r_thje_zt" type="checkbox" id="r_thje_zt" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_thje_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFFFB3"> 
      <td width="15%"><strong><font color="#000000" face="黑体">仓管入库</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String intadd1= ""; String intadd=resultMap.get("intadd");if(intadd.equals("有")){intadd1="checked";}%>
          <input type="checkbox" name="intadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("intadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String intmod1= ""; String intmod=resultMap.get("intmod");if(intmod.equals("有")){intmod1="checked";}%>
          <input name="intmod" type="checkbox" id="intmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("intmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String intdel1= ""; String intdel=resultMap.get("intdel");if(intdel.equals("有")){intdel1="checked";}%>
          <input name="intdel" type="checkbox" id="intdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("intdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String intview1= ""; String intview=resultMap.get("intview");if(intview.equals("有")){intview1="checked";}%>
          <input name="intview" type="checkbox" id="intview" value="有" <%=StringUtils.haveToChecked(resultMap.get("intview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String intzt1= ""; String intzt=resultMap.get("intzt");if(intzt.equals("有")){intzt1="checked";}%>
          <input name="intzt" type="checkbox" id="intzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("intzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFFFB3"> 
      <td width="15%"><strong><font color="#000000" face="黑体">仓管出库</font></strong></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String outadd1= ""; String outadd=resultMap.get("outadd");if(outadd.equals("有")){outadd1="checked";}%>
          <input name="outadd" type="checkbox" id="outadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("outadd"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String outmod1= ""; String outmod=resultMap.get("outmod");if(outmod.equals("有")){outmod1="checked";}%>
          <input name="outmod" type="checkbox" id="outmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("outmod"))%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String outdel1= ""; String outdel=resultMap.get("outdel");if(outdel.equals("有")){outdel1="checked";}%>
          <input name="outdel" type="checkbox" id="outdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("outdel"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String outview1= ""; String outview=resultMap.get("outview");if(outview.equals("有")){outview1="checked";}%>
          <input name="outview" type="checkbox" id="outview" value="有" <%=StringUtils.haveToChecked(resultMap.get("outview"))%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String outzt1= ""; String outzt=resultMap.get("outzt");if(outzt.equals("有")){outzt1="checked";}%>
          <input name="outzt" type="checkbox" id="outzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("outzt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="黑体">电子邮件</font></strong></td>
      <td width="12%"> 
        <div align="center"><font face="黑体">&nbsp;</font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="黑体">&nbsp;</font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="黑体">&nbsp;</font></div>      </td>
      <td width="12%">&nbsp;</td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String r_dzzx_zt1= ""; String r_dzzx_zt=resultMap.get("r_dzzx_zt");if(r_dzzx_zt.equals("有")){r_dzzx_zt1="checked";}%>
          <input name="r_dzzx_zt" type="checkbox" id="r_dzzx_zt" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_dzzx_zt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><strong><font color="#000000" face="黑体">销售产品</font></strong></td>
      <td colspan="5"><div align="center"><font size="2" face="黑体">(是否可用
            <% String r_xscp_zt1= ""; String r_xscp_zt=resultMap.get("r_xscp_zt");if(r_xscp_zt.equals("有")){r_xscp_zt1="checked";}%>
          <input name="r_xscp_zt" type="checkbox" id="r_xscp_zt" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_xscp_zt"))%>>
      </font>)<font size="2" face="黑体">(查阅所有客户
      <input name="opadd" type="checkbox" id="opadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("opadd"))%>>
)(查阅所有销售单价
<input name="opmod" type="checkbox" id="opmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("opmod"))%>>
)(查阅所有采购单价
<input name="opdel" type="checkbox" id="opdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("opdel"))%>>
)</font></div></td>
    </tr>
    <tr bgcolor="#FFBFBF"> 
      <td width="15%"><strong><font color="#000000" face="黑体">系统管理</font></strong></td>
      <td width="12%"> 
        <div align="center"><font face="黑体">&nbsp;</font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="黑体">&nbsp;</font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="黑体">&nbsp;</font></div>      </td>
      <td width="12%">&nbsp;</td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String syszt1= ""; String syszt=resultMap.get("syszt");if(syszt.equals("有")){syszt1="checked";}%>
          <input name="syszt" type="checkbox" id="syszt" value="有" <%=StringUtils.haveToChecked(resultMap.get("syszt"))%>>
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFBFBF"> 
      <td colspan="6"><strong></strong> <font size="2" face="黑体">销售决策分析是否可用</font><font face="黑体">&nbsp;</font> 
        <font size="2" face="黑体">
        <% String jcfxzt1= ""; String jcfxzt=resultMap.get("jcfxzt");if(jcfxzt.equals("有")){jcfxzt1="checked";}%>
        <input name="jcfxzt" type="checkbox" id="jcfxzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("jcfxzt"))%>>
        销售决策分析是否查看本部门 
        <input name="r_thje_mod" type="checkbox" id="outadd" value="有" <%=StringUtils.haveToChecked(resultMap.get("outadd"))%>>
        采购决策分析是否可用 
        <input name="qkmod" type="checkbox" id="qkmod" value="有" <%=StringUtils.haveToChecked(resultMap.get("qkmod"))%>>
        采购决策分析是否查看 
        <input name="qkdel" type="checkbox" id="qkdel" value="有" <%=StringUtils.haveToChecked(resultMap.get("qkdel"))%>>
        仓库决策分析是否可用 
        <input name="r_thje_del" type="checkbox" id="r_thje_del" value="有" <%=StringUtils.haveToChecked(resultMap.get("r_thje_del"))%>>
        </font></td>
    </tr>
    <tr bgcolor="#FFBFBF"> 
      <td width="15%"><strong><font color="#000000" face="黑体">资源转移</font></strong></td>
      <td width="12%"> 
        <div align="center"><font face="黑体">&nbsp;</font></div>      </td>
      <td width="12%"> 
        <div align="center"><font face="黑体">&nbsp;</font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="黑体">&nbsp;</font></div>      </td>
      <td width="12%">&nbsp;</td>
      <td width="12%"> 
        <div align="center"><font size="2" face="黑体"> 
          <% String custzyzt1= ""; String custzyzt=resultMap.get("custzyzt");if(custzyzt.equals("有")){custzyzt1="checked";}%>
          <input name="custzyzt" type="checkbox" id="custzyzt" value="有" <%=StringUtils.haveToChecked(resultMap.get("custzyzt"))%>>
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="15%"><font face="黑体"><strong></strong></font></td>
      <td width="12%">&nbsp;</td>
      <td width="12%"><font face="黑体">&nbsp;</font></td>
      <td width="14%"><font face="黑体">&nbsp;</font></td>
      <td width="12%">&nbsp;</td>
      <td width="12%"><font size="2" face="黑体">&nbsp; </font></td>
    </tr>
    <tr> 
      <td colspan="6"> 
        <div align="center">
        	<font color="#000000" size="2" face="黑体"> 
          		<input type="button" name="Submit" value="确定" class="commonnButton" onclick="saveRestrain()">
          　　		</font> 
       		<font face="黑体"> 
          		<input type="reset" name="Submit5" value="重置" class="commonnButton">
          	</font>
         </div>
      </td>
    </tr>
  </table>
</form>
</body>

</html>

