<%@ page contentType="text/html;charset=gb2312" %> 
<%@ include file="../../common/checklogin.jsp"%>
<%@ include file="../../common/checkManageLogin.jsp"%>
<%@ page import="java.util.*"%>
<%

List list = (List) request.getAttribute("list");
String basePath = request.getContextPath();

%>
<html> 
<head> 
<title>公告管理</title>
<style type="text/css">
<!--
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
</style>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body bgcolor="#ffffff">
<center>
  <div align="left">
    <center>
      <div align="left"> 
        <div id="bk"> <a href="<%=basePath %>/public/ngz.jsp"><img src="<%=basePath %>/image/new_add.gif" width="87" height="25" border="0" align="middle"></a><font size="2" color="#000000">
          
        </font></div>
        <font size=2><a href="#" style="font-size: 12px"  onClick="window.open('<%=basePath %>/public/ngz.jsp','nw', 'height=500, width=650, top=10, left=70, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')"></a></font><font size="2" color="#000000"></font><br>
        <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
          <%for(int i=0;i<list.size();i++){
        	  Map map = (Map)list.get(i);
  int id=(Integer)map.get("id");
   String titel=(String)map.get("titel");
   String man=(String)map.get("username");
   String fvdate=(String)map.get("fvdate");
   String dept1=(String)map.get("dept");
   String states=(String)map.get("states");
  %>
          <tr height="8"  onMouseOver="this.bgColor='#B5DAFF'" onMouseOut="this.bgColor='#ffffff'" style="cursor:hand;">
            <td height="8">&nbsp;</td>
            <td height="8"><strong>主题</strong></td>
            <td height="8"><strong>发布人</strong></td>
            <td height="8"><strong>发布日期</strong></td>
            <td><strong>阅读部门</strong></td>
            <td height="8"><strong>状态</strong></td>
          </tr>
          <tr height="8"  onMouseOver="this.bgColor='#B5DAFF'" onMouseOut="this.bgColor='#ffffff'" style="cursor:hand;"> 
            <td width="54" height="8"><font size="2" color="#000000"><a href="#" style="font-size: 12px" onClick="javascript:window.open('../public/sgz-view.jsp?id=<%=id%>','nw','height=300,width=750,left=25,top=10,toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')"><%=i+1%> </a>
            <a href="#" style="font-size: 12px" onClick="javascript:window.open('<%=basePath %>/public/spgz-view.jsp?id=<%=id%>','nw','height=300,width=750,left=25,top=10,toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">审批 </a>
            
            </font>&nbsp;</td>
            <td width="570" height="8"> <div align="left"><font size="2" color="#000000"><a href="#" style="font-size: 12px" onClick="javascript:window.open('<%=basePath %>/public/sgz-view.jsp?id=<%=id%>','nw','height=300,width=750,left=25,top=10,toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')"><%=titel%></a></font>&nbsp;</div></td>
            <td width="101" height="8"> <div align="left"><font size="2" color="#000000"><%=man%></font>&nbsp;</div></td>
            <td width="140" height="8"> <div align="left"><font size="2" color="#000000"><%=fvdate%></font></div></td>
            <td width="122"><font size="2" color="#000000"><%=dept1%></font>&nbsp;</td>
            <td width="145" height="8"> <div align="left"><font size="2" color="#000000"><%=states%></font>&nbsp;</div></td>
          </tr>
          <%}
		  
		   %>
        </table>
        <p><font color="#990000" size="2"> </font></p>
      </div>
    </center>
  </div>
</center>
<div align="left"> <font size="2"> </font><font size="2"> </font>&nbsp;</div>
</body> 
</html> 
