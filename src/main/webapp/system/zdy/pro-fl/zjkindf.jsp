<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
%>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
java.sql.Connection sqlCon;
java.sql.Statement sqlStmt;
java.sql.ResultSet sqlRst;
java.lang.String strCon;
java.lang.String strSQL;
int intPageSize; 
int intRowCount; 
int intPageCount;
int intPage; 
java.lang.String strPage;
int i,j,k; 
intPageSize = 20;
strPage = request.getParameter("page");

if(strPage==null){
intPage = 1;
} else{
intPage = java.lang.Integer.parseInt(strPage);
if(intPage<1) intPage = 1; }
strSQL = "select count(*) from profl ";
sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select  id,number,cpro from profl  order by cpro desc";
sqlRst = einfodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>

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
</style>
<script type="text/javascript" src="../../../js/jquery.js"></script>
<script type="text/javascript">
function deleteNoUse(addr){
	$("#form1").attr("action","del-warehouse-batch.jsp");
	$("#form1 input[name=addr]").val(addr);
	$("#form1").submit();
}

function viewNoUse(addr){
	$("#form1").attr("action","warehouseListToDel.jsp");
	$("#form1 input[name=addr]").val(addr);
	$("#form1").submit();
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000" bgcolor="#ffffff" >
<div id="bk">
  <form id="form1" name="form1" method="post" action="del-warehouse-batch.jsp">
  	<input type="hidden" value="" name="addr" />
    <font size="2"><font size="2" color="#666600">
      <input type="button" value="仓库自定义" name="B223" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('profl.jsp','main', 'height=300, width=610, top=50, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
      </font></font><br>
    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
    <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
      <%i = 0;
    while(i<intPageSize && sqlRst.next()){ %>
      <tr height="8">
        <%int id=sqlRst.getInt("id");
	    String firnumber=sqlRst.getString("number");
	  String proname=sqlRst.getString("cpro"); %>
        <td width="100%" height="2"><p><b>＊</b><font size="2" face="Arial, Helvetica, sans-serif"><%=firnumber%><%=proname%></font><font size="2"><font size="2" color="#666600"> </font><font color="#000000" size="2"> 
        <a href="#" style="font-size: 12px" onClick="javascript:window.open('del-ally.jsp?id=<%=proname%>','_blank','height=540,width=820,left=25,top=25,toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">删除<%=proname%>所有产品</a> 
        <a href="#" style="font-size: 12px" onClick="javascript:window.open('del-bat.jsp','_blank','height=540,width=820,left=25,top=25,toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">按批号对产品进行删除</a>
        <a href="#" style="font-size: 12px" onClick="javascript:deleteNoUse('<%=proname%>')">删除无用的仓库产品</a>
        <a href="#" style="font-size: 12px" onClick="javascript:viewNoUse('<%=proname%>')">查看为零而且无图片的仓库产品</a>
        </font></font></p></td>
      </tr>
      <% i++; } %>
      <tr>
        <td align=center height="22"><div align="right"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"> </font> <font color="#C1D9FF" size="2" face="Arial, Helvetica, sans-serif">
          <%if(intPage<intPageCount){%>
          <a href="zjkindf.jsp?page=<%=intPage+1%>" style="font-size: 12px">下一页</a>
          <% 
}

%>
          <%if(intPage>1){%>
          <a href="zjkindf.jsp?page=<%=intPage-1%>" style="font-size: 12px">上一页</a>
          <% 
}

%>
        </font>&nbsp;</div></td>
      </tr>
    </table>
  </form>
</div>
</body> 
<%}%>
</html> 
