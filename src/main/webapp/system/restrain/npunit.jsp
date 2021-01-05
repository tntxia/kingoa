<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="einfodb" scope="page" class="com.tntxia.db.DBConnection" />
<%@ page import="java.sql.*,java.util.*,java.text.*"%> 
<%

String basePath = request.getContextPath();

%>
<html>
<head>
<title>权限自定义</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function isValid(){
    if(form1.restrain_name.value==""){
        alert("请输入权限组!");
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
      <td width="17%" height="6" bgcolor="#C1D9FF"><font size="2" color="#000000">增加--&gt;&gt;</font></td>
      <td height="6" colspan="5" bgcolor="#C1D9FF"> 
        <div align="right"> </div>      </td>
    </tr>
    <tr> 
      <td height="2" colspan="6"><b></b> 
        <div align="left"><font color="#000000"> </font></div>
        <font color="#000000"><b>权限组 
        <input name="restrain_name" type="text" id="restrain_name">
        </b></font></td>
    </tr>
    <tr> 
      <td height="19" width="17%"> 
        <div align="center"><font face="黑体"><strong>业务对象</strong></font></div>      </td>
      <td width="19%"> 
        <div align="center"><font face="黑体"><strong>是否可用</strong></font></div>      </td>
      <td width="10%"> 
        <div align="center"><font face="黑体"><strong>新增权限</strong></font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="黑体"><strong>修改权限</strong></font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="黑体"><strong>删除权限</strong></font></div>      </td>
      <td width="26%"> 
        <div align="center"><font face="黑体"><strong>查看本部门所有人的信息</strong></font></div>      </td>
    </tr>
    <tr bgcolor="#ACCBFF"> 
      <td width="17%" bgcolor="#ACCBFF"><font face="黑体">是否全选</font></td>
      <td width="19%"> 
        <div align="center"><font face="黑体"> 
          <input name="allSelect2" type="checkbox"      
		     onclick="javascript:allSelect2_onclick();" value="">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font face="黑体"> 
          <input type="checkbox" name="allSelect" value=""      
		     onclick="javascript:allSelect_onclick();">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="黑体"> 
          <input type="checkbox" name="allSelect3" value=""      
		     onclick="javascript:allSelect3_onclick();">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"> <font face="黑体"> 
          <input type="checkbox" name="allSelect4" value=""      
		     onclick="javascript:allSelect4_onclick();">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"> <font face="黑体"> 
          <input type="checkbox" name="allSelect5" value=""      
		     onClick="javascript:allSelect5_onclick();">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%" bgcolor="#AAFFAA"><b><font color="#000000" face="黑体">潜在客户</font></b></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="qzzt" type="checkbox" id="qzzt"  onclick="javascript:qzzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="qzadd" type="checkbox" id="qzadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="qzmod" type="checkbox" id="qzmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="qzdel" type="checkbox" id="qzdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="qzview" type="checkbox" id="qzview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><b><font color="#000000" face="黑体">现有客户</font></b></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xhzt" type="checkbox" id="xhzt"  onclick="javascript:xhzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xhadd" type="checkbox" id="xhadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xhmod" type="checkbox" id="xhmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xhdel" type="checkbox" id="xhdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xhview" type="checkbox" id="xhview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><b><font color="#000000" face="黑体">联 系 人</font></b></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="linkzt" type="checkbox" id="linkzt"  onclick="javascript:linkzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="linkadd" type="checkbox" id="linkadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="linkmod" type="checkbox" id="linkmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="linkdel" type="checkbox" id="linkdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="linkview" type="checkbox" id="linkview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="17%"><b><font color="#000000" face="黑体">合作伙伴</font></b></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="hzzt" type="checkbox" id="hzzt"  onclick="javascript:hzzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="hzadd" type="checkbox" id="hzadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="hzmod" type="checkbox" id="hzmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="hzdel" type="checkbox" id="hzdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="hzview" type="checkbox" id="hzview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFB3FF"> 
      <td width="17%" bgcolor="#FFB3FF"><b><font color="#000000" face="黑体">供 应 商</font></b></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="supzt" type="checkbox" id="supzt"  onclick="javascript:supzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="supadd" type="checkbox" id="supadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="supmod" type="checkbox" id="supmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="supdel" type="checkbox" id="supdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="supview" type="checkbox" id="supview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="17%" height="24" bgcolor="#FFD595"><b><font color="#000000" face="黑体">活动管理</font></b></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="actzt" type="checkbox" id="actzt"  onclick="javascript:actzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="actadd" type="checkbox" id="r_actadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="actmod" type="checkbox" id="r_actmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="actdel" type="checkbox" id="r_actdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="actview" type="checkbox" id="r_actview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><b><font color="#000000" face="黑体">客户报价</font></b></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="quotezt" type="checkbox" id="quotezt"  onclick="javascript:quotezt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="quoteadd" type="checkbox" id="quoteadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="quotemod" type="checkbox" id="quotemod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="quotedel" type="checkbox" id="quotedel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="quoteview" type="checkbox" id="quoteview" value="有">
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
        <font size="2"><b><%=cpro%></b></font><b></b><font size="2" face="黑体">:　(是否可用</font><font size="2"> 
        </font><font size="2" face="黑体"> 
        <input name="prozt<%=tmpi+1%>" type="checkbox" id="<%=cpro%>" value="有">
        )
        </font><font size="2"> 
        <input type="hidden" name="gp<%=tmpi+1%>" value="<%=cpro%>">
        </font><font size="2" face="黑体">(新增权限</font><font size="2"> </font><font size="2" face="黑体"> 
        <input name="proadd<%=tmpi+1%>" type="checkbox" id="proadd" value="有">
        )
        (修改权限</font> <font size="2" face="黑体"> 
        <input name="promod<%=tmpi+1%>" type="checkbox" id="promod" value="有">
        )(
        删除权限 
        <input name="prodel<%=tmpi+1%>" type="checkbox" id="prodel" value="有">
        )
        (查询权限 
        <input name="proview<%=tmpi+1%>" type="checkbox" id="prodel" value="有">
        )
        </font> <font size="2" face="黑体">(供应商及成本单价查看权限 
        <input name="proview_yes<%=tmpi+1%>" type="checkbox" id="prodel" value="有">
        </font>)<br>
        <%tmpi++;}
		  prs.close();
		  %>
        <font size="2"> 
        <input type="hidden" name="i" value="<%=tmpi+1%>">
        </font></td>
    </tr>
    <TR bgcolor="#FFB3FF"> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="黑体">供应商询价</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_sup_xj_zt" TYPE="checkbox" ID="r_sup_xj_zt"  ONCLICK="javascript:r_sup_xj_zt_onclick();" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_sup_xj_add" TYPE="checkbox" ID="r_sup_xj_add" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_sup_xj_mod" TYPE="checkbox" ID="cgmod" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_sup_xj_del" TYPE="checkbox" ID="cgdel" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_sup_xj_view" TYPE="checkbox" ID="cgview" VALUE="有">
          </FONT></DIV>      </TD>
    </TR>
    <tr bgcolor="#FFB3FF"> 
      <td width="17%"><strong><font color="#000000" face="黑体">采购管理</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="cgzt" type="checkbox" id="cgzt"   ONCLICK="javascript:cgzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="cgadd" type="checkbox" id="cgadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="cgmod" type="checkbox" id="cgmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="cgdel" type="checkbox" id="cgdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="cgview" type="checkbox" id="cgview" value="有">
          (</font><font face="黑体"><strong>返回权限</strong></font><font size="2" face="黑体"> 
          <input name="cgview_yes" type="checkbox" id="proview" value="有">
          </font>)</div>      </td>
    </tr>
    <tr bgcolor="#FFFFB3"> 
      <td width="17%"><strong><font color="#000000" face="黑体">发运管理</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="trzt" type="checkbox" id="trzt"  onclick="javascript:trzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="tradd" type="checkbox" id="tradd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="trmod" type="checkbox" id="trmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="trdel" type="checkbox" id="trdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="trview" type="checkbox" id="trview" value="有">
          </font><font face="黑体"><strong>(返回权限</strong></font><font size="2" face="黑体"> 
          <input name="trview_yes" type="checkbox" id="proview" value="有">
          </font>)</div>      </td>
    </tr>
    <tr bgcolor="#FFFFB3"> 
      <td width="17%"><strong><font color="#000000" face="黑体">货代公司</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="hdzt" type="checkbox" id="hdzt"  onclick="javascript:hdzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="hdadd" type="checkbox" id="hdadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="hdmod" type="checkbox" id="hdmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="hddel" type="checkbox" id="hddel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="hdview" type="checkbox" id="hdview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="黑体">周 计 划</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="workzt" type="checkbox" id="workzt"  onclick="javascript:workzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="workadd" type="checkbox" id="workadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="workmod" type="checkbox" id="workmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="workdel" type="checkbox" id="workdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="workview" type="checkbox" id="workview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="黑体">月 计 划</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_jh_zt" type="checkbox" id="r_month_jh_zt"  onclick="javascript:r_month_jh_zt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_jh_add" type="checkbox" id="r_month_jh_add" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_jh_mod" type="checkbox" id="r_month_jh_mod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_jh_del" type="checkbox" id="r_month_jh_del" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_jh_view" type="checkbox" id="r_month_jh_view" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="黑体">日 报 表</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_date_r_zt" type="checkbox" id="r_date_r_zt"  onclick="javascript:r_date_r_zt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_date_r_add" type="checkbox" id="r_date_r_add" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_date_r_mod" type="checkbox" id="r_date_r_mod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_date_r_del" type="checkbox" id="r_date_r_del" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_date_r_view" type="checkbox" id="r_date_r_view" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="黑体">周 报 表</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_week_r_zt" type="checkbox" id="r_week_r_zt"  onclick="javascript:r_week_r_zt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_week_r_add" type="checkbox" id="r_week_r_add" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_week_r_mod" type="checkbox" id="r_week_r_mod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_week_r_del" type="checkbox" id="r_week_r_del" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_week_r_view" type="checkbox" id="r_week_r_view" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="黑体">月 报 表</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_r_zt" type="checkbox" id="r_month_r_zt"  onclick="javascript:r_month_r_zt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_r_add" type="checkbox" id="r_month_r_add" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_r_mod" type="checkbox" id="r_month_r_mod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_r_del" type="checkbox" id="r_month_r_del" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_month_r_view" type="checkbox" id="r_month_r_view" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="黑体">项目管理</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xmzt" type="checkbox" id="xmzt"  onclick="javascript:xmzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xmadd" type="checkbox" id="xmadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xmmod" type="checkbox" id="xmmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xmdel" type="checkbox" id="xmdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="xmview" type="checkbox" id="xmview" value="有">
          </font></div>      </td>
    </tr>
    <TR bgcolor="#AAFFAA"> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="黑体">客户询单</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_cus_xj_zt" TYPE="checkbox" ID="r_cus_xj_zt"  ONCLICK="javascript:r_cus_xj_zt_onclick();" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_cus_xj_add" TYPE="checkbox" ID="xmadd" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_cus_xj_mod" TYPE="checkbox" ID="xmmod" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_cus_xj_del" TYPE="checkbox" ID="xmdel" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_cus_xj_view" TYPE="checkbox" ID="xmview" VALUE="有">
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#AAFFAA" >
      <TD><STRONG><font color="#000000" size="2">样品管理</font></STRONG></TD>
      <TD bordercolor="#CCBE5A"><DIV ALIGN="center"><font size="2">
          <INPUT NAME="r_sam_zt" TYPE="checkbox" ID="r_sam_zt"  ONCLICK="javascript:r_sam_zt_onclick();" VALUE="有">
      </font></DIV></TD>
      <TD bordercolor="#CCBE5A"><DIV ALIGN="center"><font size="2">
          <INPUT NAME="r_sam_add" TYPE="checkbox" ID="subadd" VALUE="有">
      </font></DIV></TD>
      <TD bordercolor="#CCBE5A"><DIV ALIGN="center"><font size="2">
          <INPUT NAME="r_sam_mod" TYPE="checkbox" ID="submod" VALUE="有">
      </font></DIV></TD>
      <TD bordercolor="#CCBE5A"><DIV ALIGN="center"><font size="2">
          <INPUT NAME="r_sam_del" TYPE="checkbox" ID="subdel" VALUE="有">
      </font></DIV></TD>
      <TD bordercolor="#CCBE5A"><DIV ALIGN="center"><font size="2">
          <INPUT NAME="r_sam_view" TYPE="checkbox" ID="subview" VALUE="有">
      </font></DIV></TD>
    </TR>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%" bgcolor="#AAFFAA"><strong><font color="#000000" face="黑体">合同管理</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="subzt" type="checkbox" id="subzt"  onclick="javascript:subzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="subadd" type="checkbox" id="subadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="submod" type="checkbox" id="submod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="subdel" type="checkbox" id="subdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="subview" type="checkbox" id="subview" value="有">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="黑体">员工管理</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="manzt" type="checkbox" id="manzt"  onclick="javascript:manzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="manadd" type="checkbox" id="manadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="manmod" type="checkbox" id="manmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="mandel" type="checkbox" id="mandel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="manview" type="checkbox" id="manview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="17%"><strong><font color="#000000" face="黑体">任务管理</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="rwzt" type="checkbox" id="rwzt"  onclick="javascript:rwzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="rwadd" type="checkbox" id="rwadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="rwmod" type="checkbox" id="rwmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="rwdel" type="checkbox" id="rwdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="rwview" type="checkbox" id="rwview" value="有">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="黑体">费用管理</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="fyzt" type="checkbox" id="fyzt"  onclick="javascript:fyzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="fyadd" type="checkbox" id="fyadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="fymod" type="checkbox" id="fymod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="fydel" type="checkbox" id="fydel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="fyview" type="checkbox" id="fyview" value="有">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="黑体">借款申请</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_jkgl_zt" type="checkbox" id="r_jkgl_zt"  onclick="javascript:r_jkgl_zt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_jkgl_add" type="checkbox" id="r_jkgl_add" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_jkgl_mod" type="checkbox" id="r_jkgl_mod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_jkgl_del" type="checkbox" id="r_jkgl_del" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_jkgl_view" type="checkbox" id="r_jkgl_view" value="有">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="黑体">付款申请</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_fksq_zt" type="checkbox" id="r_fksq_zt"  onclick="javascript:r_fksq_zt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_fksq_add" type="checkbox" id="r_fksq_add" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_fksq_mod" type="checkbox" id="r_fksq_mod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_fksq_del" type="checkbox" id="r_fksq_del" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_fksq_view" type="checkbox" id="r_fksq_view" value="有">
          </font></div>      </td>
    </tr>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="黑体">转正申请</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_zzsq_zt" TYPE="checkbox" ID="r_zzsq_zt"  ONCLICK="javascript:r_zzsq_zt_onclick();" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_zzsq_add" TYPE="checkbox" ID="r_fksq_add" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_zzsq_mod" TYPE="checkbox" ID="r_fksq_mod" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_zzsq_del" TYPE="checkbox" ID="r_fksq_del" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_zzsq_view" TYPE="checkbox" ID="r_fksq_view" VALUE="有">
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="黑体">奖惩申请</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_jcsq_zt" TYPE="checkbox" ID="r_jcsq_zt"  ONCLICK="javascript:r_jcsq_zt_onclick();" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_jcsq_add" TYPE="checkbox" ID="r_fksq_add" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_jcsq_mod" TYPE="checkbox" ID="r_fksq_mod" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_jcsq_del" TYPE="checkbox" ID="r_fksq_del" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_jcsq_view" TYPE="checkbox" ID="r_fksq_view" VALUE="有">
          </FONT></DIV>      </TD>
    </TR>
    <TR> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="黑体">薪资异动</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_xzyd_zt" TYPE="checkbox" ID="r_xzyd_zt"  ONCLICK="javascript:r_xzyd_zt_onclick();" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_xzyd_add" TYPE="checkbox" ID="r_fksq_add" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_xzyd_mod" TYPE="checkbox" ID="r_fksq_mod" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_xzyd_del" TYPE="checkbox" ID="r_fksq_del" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_xzyd_view" TYPE="checkbox" ID="r_fksq_view" VALUE="有">
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="黑体">出差申请</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_ccsq_zt" TYPE="checkbox" ID="r_ccsq_zt"  ONCLICK="javascript:r_ccsq_zt_onclick();" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_ccsq_add" TYPE="checkbox" ID="r_fksq_add" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_ccsq_mod" TYPE="checkbox" ID="r_fksq_mod" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_ccsq_del" TYPE="checkbox" ID="r_fksq_del" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_ccsq_view" TYPE="checkbox" ID="r_fksq_view" VALUE="有">
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="黑体">办公用品</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_bgyp_zt" TYPE="checkbox" ID="r_bgyp_zt"  ONCLICK="javascript:r_bgyp_zt_onclick();" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_bgyp_add" TYPE="checkbox" ID="r_fksq_add" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_bgyp_mod" TYPE="checkbox" ID="r_fksq_mod" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_bgyp_del" TYPE="checkbox" ID="r_fksq_del" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_bgyp_view" TYPE="checkbox" ID="r_fksq_view" VALUE="有">
          </FONT></DIV>      </TD>
    </TR>
    <TR bgcolor="#FFD595"> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="黑体">内部签呈</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_nbqc_zt" TYPE="checkbox" ID="r_nbqc_zt"  ONCLICK="javascript:r_nbqc_zt_onclick();" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_nbqc_add" TYPE="checkbox" ID="r_fksq_add" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_nbqc_mod" TYPE="checkbox" ID="r_fksq_mod" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_nbqc_del" TYPE="checkbox" ID="r_fksq_del" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_nbqc_view" TYPE="checkbox" ID="r_fksq_view" VALUE="有">
          </FONT></DIV>      </TD>
    </TR>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="黑体">退货管理</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="thzt" type="checkbox" id="thzt"  onclick="javascript:thzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="thadd" type="checkbox" id="r_thadd"  value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="thmod" type="checkbox" id="r_thmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="thdel" type="checkbox" id="r_thdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="thview" type="checkbox" id="r_thview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="黑体">客户服务</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="serverzt" type="checkbox" id="serverzt"  onclick="javascript:serverzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="serveradd" type="checkbox" id="serveradd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="servermod" type="checkbox" id="servermod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="serverdel" type="checkbox" id="serverdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="serverview" type="checkbox" id="serverview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="黑体">客户投诉</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="tszt" type="checkbox" id="tszt"  onclick="javascript:tszt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="tsadd" type="checkbox" id="tsadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="tsmod" type="checkbox" id="tsmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="tsdel" type="checkbox" id="tsdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="tsview" type="checkbox" id="tsview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="黑体">行业政策</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_hyzc_zt" type="checkbox" id="r_hyzc_zt"  onclick="javascript:r_hyzc_zt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_hyzc_add" type="checkbox" id="r_hyzc_add" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_hyzc_mod" type="checkbox" id="r_hyzc_mod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_hyzc_del" type="checkbox" id="r_hyzc_del" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_hyzc_view" type="checkbox" id="r_hyzc_view" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="黑体">媒体宣传</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_mtxc_zt" type="checkbox" id="r_mtxc_zt"  onclick="javascript:r_mtxc_zt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_mtxc_add" type="checkbox" id="r_mtxc_add" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_mtxc_mod" type="checkbox" id="r_mtxc_mod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_mtxc_del" type="checkbox" id="r_mtxc_del" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_mtxc_view" type="checkbox" id="r_mtxc_view" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="黑体">市场活动</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="mactzt" type="checkbox" id="mactzt"  onclick="javascript:mactzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="mactadd" type="checkbox" id="mactadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="mactmod" type="checkbox" id="mactmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="mactdel" type="checkbox" id="mactdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="mactview" type="checkbox" id="mactview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="黑体">竞争对手</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="jzdszt" type="checkbox" id="jzdszt"  onclick="javascript:jzdszt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="jzdsadd" type="checkbox" id="jzdsadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="jzdsmod" type="checkbox" id="jzdsmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="jzdsdel" type="checkbox" id="jzdsdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="jzdsview" type="checkbox" id="jzdsview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="17%"><strong><font color="#000000" face="黑体">知 识 库</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zskzt" type="checkbox" id="zskzt"  onclick="javascript:zskzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zskadd" type="checkbox" id="zskadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zskmod" type="checkbox" id="zskmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zskdel" type="checkbox" id="zskdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zskview" type="checkbox" id="zskview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="17%"><strong><font color="#000000" face="黑体">法律法规</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="flfgzt" type="checkbox" id="flfgzt"  onclick="javascript:flfgzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="flfgadd" type="checkbox" id="flfgadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="flfgmod" type="checkbox" id="flfgmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="flfgdel" type="checkbox" id="flfgdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="flfgview" type="checkbox" id="flfgview" value="有">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="黑体">往来帐目</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_wlz_zt" type="checkbox" id="r_wlz_zt"  onclick="javascript:r_wlz_zt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_wlz_add" type="checkbox" id="r_wlz_add" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_wlz_mod" type="checkbox" id="r_wlz_mod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_wlz_del" type="checkbox" id="r_wlz_del" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_wlz_view" type="checkbox" id="r_wlz_view" value="有">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="黑体">资金管理</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zjzt" type="checkbox" id="zjzt"  onclick="javascript:zjzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zjadd" type="checkbox" id="zjadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zjmod" type="checkbox" id="zjmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zjdel" type="checkbox" id="zjdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="zjview" type="checkbox" id="zjview" value="有">
          </font></div>      </td>
    </tr>
    <TR> 
      <TD WIDTH="17%"><STRONG><FONT COLOR="#000000" FACE="黑体">工资管理</FONT></STRONG></TD>
      <TD WIDTH="19%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_wage_zt" TYPE="checkbox" ID="r_wage_zt"  ONCLICK="javascript:r_wage_zt_onclick();" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="10%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_wage_add" TYPE="checkbox" ID="zjadd" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_wage_mod" TYPE="checkbox" ID="zjmod" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="14%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_wage_del" TYPE="checkbox" ID="zjdel" VALUE="有">
          </FONT></DIV>      </TD>
      <TD WIDTH="26%"> 
        <DIV ALIGN="center"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_wage_view" TYPE="checkbox" ID="zjview" VALUE="有">
          </FONT></DIV>      </TD>
    </TR>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="黑体">付款汇总</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="fkhzzt" type="checkbox" id="fkhzzt"  onclick="javascript:fkhzzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="fkhzadd" type="checkbox" id="fkhzadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="fkhzmod" type="checkbox" id="fkhzmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="fkhzdel" type="checkbox" id="fkhzdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="fkhzview" type="checkbox" id="fkhzview" value="有">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="黑体">收款汇总</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="skhzzt" type="checkbox" id="skhzzt"  onclick="javascript:skhzzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="skhzadd" type="checkbox" id="skhzadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="skhzmod" type="checkbox" id="skhzmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="skhzdel" type="checkbox" id="skhzdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="skhzview" type="checkbox" id="skhzview" value="有">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="黑体">付款信息</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="fkzt" type="checkbox" id="fkzt"  onclick="javascript:fkzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="fkmod" type="checkbox" id="fkmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="fkdel" type="checkbox" id="fkdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="fkview" type="checkbox" id="fkview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFD595"> 
      <td width="17%"><STRONG><font color="#000000" face="黑体">在线沟通</font></STRONG></td>
      <td width="19%"> 
        <DIV ALIGN="CENTER"><FONT SIZE="2" FACE="黑体"> 
          <INPUT NAME="r_wx_gt_zt" TYPE="checkbox" ID="skzt"  ONCLICK="javascript:skzt_onclick();" VALUE="有">
          </FONT></DIV>      </td>
      <td colspan="4"> 
        <DIV ALIGN="CENTER"><FONT SIZE="2" FACE="黑体"> </FONT></DIV>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><FONT COLOR="#000000" FACE="黑体">销售收款</FONT></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="skzt" type="checkbox" id="skzt"  onclick="javascript:skzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_skview" type="checkbox" id="r_skview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="黑体">客户欠款</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="qkzt" type="checkbox" id="qkzt"  onclick="javascript:qkzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="qkview" type="checkbox" id="qkview" value="有">
          </font></div>      </td>
    </tr>
    <tr> 
      <td width="17%"><strong><font color="#000000" face="黑体">退货金额</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_thje_zt" type="checkbox" id="r_thje_zt"  onclick="javascript:r_thje_zt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_thje_view" type="checkbox" id="r_thje_view" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFFFB3"> 
      <td width="17%"><strong><font color="#000000" face="黑体">仓管入库</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="intzt" type="checkbox" id="intzt"  onclick="javascript:intzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input type="checkbox" name="intadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="intmod" type="checkbox" id="intmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="intdel" type="checkbox" id="intdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="intview" type="checkbox" id="intview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFFFB3"> 
      <td width="17%"><strong><font color="#000000" face="黑体">仓管出库</font></strong></td>
      <td width="19%" bgcolor="#FFFFB3"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="outzt" type="checkbox" id="outzt"  onclick="javascript:outzt_onclick();" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="outadd" type="checkbox" id="outadd" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="outmod" type="checkbox" id="outmod" value="有">
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="outdel" type="checkbox" id="outdel" value="有">
          </font></div>      </td>
      <td width="26%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="outview" type="checkbox" id="outview" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%"><strong><font color="#000000" face="黑体">电子邮件</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_dzzx_zt" type="checkbox" id="r_dzzx_zt"  value="有">
          </font></div>      </td>
      <td width="10%">&nbsp;</td>
      <td width="14%">&nbsp;</td>
      <td width="14%">&nbsp;</td>
      <td width="26%">&nbsp;</td>
    </tr>
    <tr bgcolor="#AAFFAA"> 
      <td width="17%" bgcolor="#AAFFAA"><strong><font color="#000000" face="黑体">销售产品<font size="2"></font></font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="r_xscp_zt" type="checkbox" id="jcfx" value="有">
          </font></div>      </td>
      <td colspan="4"><font size="2" face="黑体">(查阅所有客户
          <input name="opadd" type="checkbox" id="opadd" value="有">
)(查阅所有销售单价
          <input name="opmod" type="checkbox" id="opmod" value="有">
)(查阅所有采购单价
          <input name="opdel" type="checkbox" id="opdel" value="有">
)</font></td>
    </tr>
    <tr bgcolor="#FFBFBF"> 
      <td width="17%"><strong><font color="#000000" face="黑体">系统管理</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="syszt" type="checkbox" id="syszt"  value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font face="黑体">&nbsp;</font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="黑体">&nbsp;</font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="黑体">&nbsp;</font></div>      </td>
      <td width="26%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFBFBF"> 
      <td colspan="6"><strong></strong> 
        <div align="center"><font size="2" face="黑体">销售决策分析是否可用 
          <input name="jcfxzt" type="checkbox" id="jcfx" value="有">
          销售决策分析是否查看本部门 
          <input name="r_thje_mod" type="checkbox" id="outadd" value="有">
          采购决策分析是否可用 
          <input name="qkmod" type="checkbox" id="outadd" value="有">
          采购决策分析是否查看 
          <input name="qkdel" type="checkbox" id="outadd" value="有">
          仓库决策分析是否可用 
          <input name="r_thje_del" type="checkbox" id="outadd" value="有">
          </font></div>      </td>
    </tr>
    <tr bgcolor="#FFBFBF"> 
      <td width="17%"><strong><font color="#000000" face="黑体">资源转移</font></strong></td>
      <td width="19%"> 
        <div align="center"><font size="2" face="黑体"> 
          <input name="custzyzt" type="checkbox" id="custzyzt" value="有">
          </font></div>      </td>
      <td width="10%"> 
        <div align="center"><font face="黑体">&nbsp;</font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="黑体">&nbsp;</font></div>      </td>
      <td width="14%"> 
        <div align="center"><font face="黑体">&nbsp;</font></div>      </td>
      <td width="26%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%"><font face="黑体"><strong></strong></font></td>
      <td width="19%"><font face="黑体">&nbsp;</font></td>
      <td width="10%">&nbsp;</td>
      <td width="14%"><font face="黑体">&nbsp;</font></td>
      <td width="14%"><font face="黑体">&nbsp;</font></td>
      <td width="26%">&nbsp;</td>
    </tr>
    <tr> 
      <td colspan="6"> 
        <div align="center"><font color="#000000" size="2" face="黑体"> 
          <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; vertical-align: -7; border: 1 groove #C3D9FF">
          　　 </font> <font face="黑体"> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; vertical-align: -7; border: 1 groove #C3D9FF">
          </font></div>      </td>
    </tr>
  </table>
  <p><br>
    备注:1.有流程的软件模块其权限在非草拟状态下受其当前状态的约束. <br>
    　 　2.仓库权限设置说明：当选择某一仓库，然后选择“可用” 即表示该权限组的人可以管理所选择的仓库，如果选择成本单价“查看”权限，则该仓库管理员可以查看产品成本单价，如果选择“查看”权限，则该权限组的人可以查看所有的仓库；如果不选择“可用” 
    权限，同时也不选择“查看”权限，则该权限组的人只能在所以需要调用产品信息的地方只能查看所选择的仓库的产品。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　</p>
  <p>　　　３.绿色部分为业务员权限，紫红色为采购权限，土黄色为仓管权限，桔红色为公用模块，白色为财务人员，红色部分的权限，请慎重分配</p>
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
