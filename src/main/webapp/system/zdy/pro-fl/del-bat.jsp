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
strSQL = "select count(batch_no) from warehouse  group by batch_no ";
sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select  batch_no from warehouse group by batch_no order by batch_no desc";
sqlRst = einfodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
 %>

<html>
<head>
<title>所有批号</title>
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
<script type="text/javascript">
function del(batch_no){
	if(confirm("是否确认删除这一批产品")){
		window.open('do_del-bat.jsp?batch_no='+batch_no,'_blank','height=540,width=820,left=25,top=25,toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
	}
	
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000" bgcolor="#ffffff" >
<div id="bk">
  <form name="form1" method="post" action="">
    <font size="2"><font size="2" color="#666600">
      
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
        <%
	    String batch_no=sqlRst.getString("batch_no");
        if(batch_no == null || batch_no.trim().length()==0){
        	continue;
        }
	   %>
        <td width="100%" height="2"><p><b>＊</b><font size="2" face="Arial, Helvetica, sans-serif"></font><font size="2"><font size="2" color="#666600"> </font><font color="#000000" size="2"> 批号：<%=batch_no %>
        <a href="#" style="font-size: 12px" onClick="javascript:window.open('warehouseList.jsp?batch_no=<%=batch_no%>','_blank','height=540,width=820,left=25,top=25,toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">查看产品</a> 
        <a href="#" style="font-size: 12px" onClick="javascript:del('<%=batch_no %>')">删除</a>
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
