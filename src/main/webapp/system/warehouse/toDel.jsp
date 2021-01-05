<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*,java.text.*,com.tntxia.oa.warehouse.*"%>
<%

Map<String,Object> result = (Map<String,Object>) request.getAttribute("result");
List<Warehouse> list = (List<Warehouse>) result.get("list");
int intPage = (Integer)result.get("pageNo");
int intPageCount = (Integer)result.get("totalPage");
%>
<html>
<head>
<title>查看无图片的产品</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
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
.STYLE2 {font-weight: bold}
</style>
<script type="text/javascript">
function delWarehouse(id){
	window.location = "del-warehouse.jsp?id="+id;
}

</script>
</head>
<body bgcolor="#ffffff" text="#000000" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="warehouseList.jsp"> <DIV ALIGN="LEFT">
    <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
      <br>
      <TR bgcolor="#d3d8eb"> 
        <TD HEIGHT="17"> 
          <div align="left"><font size="2">产品型号</font></div></TD>
        <TD HEIGHT="17"> 
          <div align="left"><font size="2">封装</font></div></TD>
        <td height="17"> 
          <div align="left"><font size="2">批号</font> </div></td>
        <td height="17"> 
          <div align="left"><font size="2">品牌</font> </div></td>
        <td height="17"> 
          <div align="left"><font size="2">货期</font></div></td>
        <td height="17"> 
          <div align="left"><font size="2">当前库存</font> </div></td>
        <TD HEIGHT="17"> 
          <div align="left"><FONT SIZE="2">仓库名称</font>&nbsp; </div></TD>
        <TD> 
          <div align="left">备注</div></TD>
        <TD> 
          <div align="left">删除</div></TD>
      </TR>
      <%
   int i = 0;
   for(Warehouse warehouse : list){ 
	   int id=warehouse.getId();
	   String promodel=warehouse.getPro_model();
	   String pro_gg = warehouse.getPro_gg();
	   String pro_name1=warehouse.getPro_name();
	   String pro_sup_number = warehouse.getPro_sup_number();
	   String yqdate = warehouse.getYqdate();
	   String pro_addr1=warehouse.getPro_addr();
	String pro_remark=warehouse.getPro_remark();
	String th_number = warehouse.getTh_number();
	int dqnum = warehouse.getPro_num();
	   %>
      <TR STYLE="cursor:hand;"  ONMOUSEOVER="this.bgColor='#B5DAFF'" ONMOUSEOUT="this.bgColor='<%if ((i % 2)==0) out.print("#eeeeee");
        	       else out.print("#ffffff");%>'" HEIGHT="8" BGCOLOR="<%if ((i % 2)==0) out.print("#eeeeee");
        	       else out.print("#ffffff");%>"> 
        <TD HEIGHT="9"> 
          <DIV ALIGN="LEFT"><font size="2"><a href="#" onClick="javascript:window.open('pro-view.jsp?id=<%=id%>','_blank','height=5210,width=955,left=25,top=25,toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
            <%=promodel%>
          </a></font></DIV>        </TD>
        <TD HEIGHT="9"> 
          <DIV ALIGN="LEFT"><FONT SIZE="2"><A HREF="#" ONCLICK="javascript:window.open('pro-view.jsp?id=<%=id%>','_blank','height=5210,width=955,left=25,top=25,toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')"><%=pro_gg%></A> 
            </FONT>&nbsp;</DIV>        </TD>
        <td height="9"> 
          <div align="LEFT"><font size="2"><a href="#" onClick="javascript:window.open('pro-view.jsp?id=<%=id%>','_blank','height=5210,width=955,left=25,top=25,toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
            <%=pro_name1%>
            </a>&nbsp; </font></div> </td>
    <td height="9"> 
     <div align="left"><font size="2"><%=pro_sup_number%></font>&nbsp;</div>        </td>
        <td height="9"> 
   <div align="left"><font size="2"><%=yqdate%></font><font size="2"> 
         
        <td height="9"> 
          <div align="left"><font size="2"> <%=dqnum%></font> <font size="2"></font>&nbsp;</div>        </td>
        <TD HEIGHT="9"> 
          <div align="left"><FONT SIZE="2"><%=pro_addr1%></FONT>&nbsp;</div></TD>
        <TD><div align="left"><FONT SIZE="2"><%=pro_remark%>　</FONT></div></TD>
        <TD><a href="javascript:delWarehouse(<%=id%>)">删除</a></TD>
      </TR>
      <% 
	  
	  } %>
      
    </TABLE>
  </DIV></form><form name="form2" method="post" action="cwarehousem.jsp">
    <div align="left"><font color="#000000"><font size="2"> 当前是第<%=intPage%>页,共<%=intPageCount%>页,</font></font>
      
          <font color="#CCCCCC" size="2"> 
  <%if(intPage>1){%>
  <a href="warehouse.dispatch?method=viewWarehouseProductNoUse&pageNo=<%=intPage-1%>">上一页</a> 
  <% } %>
  <%if(intPage<intPageCount){%>
  <a href="warehouse.dispatch?method=viewWarehouseProductNoUse&pageNo=<%=intPage+1%>">下一页</a> 
  <%}%>
          </font><font color="#000000"><font size="2">
          </font></font> 
      
          <font color="#CCCCCC" size="2">
          </font>
      
    </div>
  </form>
</body> 
</html> 

