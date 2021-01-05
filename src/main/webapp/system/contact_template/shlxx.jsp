<%@ page contentType="text/html;charset=gb2312"%>
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
strSQL = "select count(*) from ht_mb";
sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select * from ht_mb";
sqlRst = einfodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title>芯片商城有限公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	background-color: #ffffff;
}
-->
</style></head>

<body topmargin="0" text="#000000" background="#ffffff" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="">
<br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">    
    <tr height="8" bgcolor="#d3d8eb"> <td width="360" height="8" bgcolor="#d3d8eb"> 
      <div align="left"><font color="#000000"><font size="2">合同名称</font></font>&nbsp;</div>      </td>
      <td width="333" height="8" bgcolor="#d3d8eb"> 
      <div align="left"><font color="#000000"><font size="2">公司名称</font></font>&nbsp;</div>      </td>
      <td width="114" height="8" bgcolor="#d3d8eb"> 
      <div align="left"><font size="2" color="#000000">日期</font>&nbsp;</div>      </td>
      <td width="161" height="8" bgcolor="#d3d8eb"> 
      <div align="left"><font color="#000000"><font size="2">操作</font></font>&nbsp;</div>      </td>
    </tr>
    <%i = 0;
   while(i<intPageSize && sqlRst.next()){ %>
    <tr height="8"onMouseOver="this.bgColor='#B5DAFF'" onMouseOut="this.bgColor='#ffffff'" style="cursor:hand;"> 
      <%int id=sqlRst.getInt(1);%>
      <td width="360" height="6"> 
        <div align="left"><font size="2"><%=sqlRst.getString("q_name")%></font>&nbsp;</div>      </td>
      <td width="333" height="6"> 
        <div align="left"><font size="2"><%=sqlRst.getString("q_company")%></font>&nbsp;</div>      </td>
      <td width="114" height="6"><font size="2"><%=sqlRst.getDate("q_date")%></font>&nbsp;</td>
      <td width="161" height="6"> 
        <div align="center"><font color="#213e9b" size="2"> 
          <a href="#" style="font-size: 12px" onClick="window.open('hl-view.jsp?id=<%=id%>','_blank', 'height=523, width=955, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">查看</a></font>&nbsp;</div>      </td>
    </tr>
    <% i++; } %>
    <tr> 
      <td colspan=8 align=center height="22"> 
        <div align="right"><font color="#000000" size="2"> </font> <font color="#C1D9FF" size="2"> 
          <%if(intPage<intPageCount){%>
          <a href="shlxx.jsp?page=<%=intPage+1%>" style="font-size: 12px">下一页</a> 
          <% 
       }

      %>
          <%if(intPage>1){%>
          <a href="shlxx.jsp?page=<%=intPage-1%>" style="font-size: 12px">上一页</a> 
          <% 
      }

      %>
          </font>&nbsp;</div>      </td>
    </tr>
  </table>
</form>
</body> 
<%}%>
</html> 

