<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="RegBean2" scope="page" class="infocrmdb.infocrmdb" />
<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
String id=request.getParameter("id");
String sid=request.getParameter("sid");
String snumber=request.getParameter("snumber");
String proname=request.getParameter("proname");
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
intPageSize = 50;
strPage = request.getParameter("page");
if(strPage==null){
intPage = 1;
} else{
intPage = java.lang.Integer.parseInt(strPage);
if(intPage<1) intPage = 1; }
strSQL = "select count(*) from profll ";
sqlRst = RegBean2.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select id,tnumber,cpro,epro from profll  order  by  id  desc";

sqlRst = RegBean2.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title>芯片商城有限公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body text="#000000" topmargin="0">
<form name="form1" method="post" action="">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb">
      <td colspan="3" bgcolor="#FFFFFF"><font size="2">品牌自定义</font></td>
      <td bgcolor="#FFFFFF"> 
        <div align="right"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"> 
          <input type="button" value="添加品牌" name="B22" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('lnprofl.jsp','_self', 'height=460, width=955, top=50, left=50, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no')">
          </font>&nbsp;</div>      </td>
    </tr>
    <tr height="8" bgcolor="#d3d8eb"> <td width="645" height="8"><font face="Arial, Helvetica, sans-serif" size="2" color="#000000">品牌编号</font></td>
      <td width="645" height="8"> 
        <div align="left"><font color="#000000"><font face="Arial, Helvetica, sans-serif" size="2">品牌</font><font size="2" face="Arial, Helvetica, sans-serif">名称</font></font>&nbsp;</div>      </td>
      <td width="645" height="8"> 
        <div align="left"><font color="#000000"><font face="Arial, Helvetica, sans-serif" size="2">供应商</font><font size="2" face="Arial, Helvetica, sans-serif">名称</font></font>&nbsp;</div>      </td>
      <td width="187" height="8"> 
        <div align="left"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">操作</font>&nbsp;</div>      </td>
    </tr>
    <%
   i = 0;
   while(i<intPageSize && sqlRst.next()){ %>
    <%int tid=sqlRst.getInt(1);%>
    <tr height="8" bgcolor="#d3d8eb"> <td width="645" height="8" bgcolor="#FFFFFF"><%=sqlRst.getString("tnumber")%></td>
      <td width="645" height="8" bgcolor="#FFFFFF"> 
        <div align="left"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif">*
          <%String proname1=sqlRst.getString(3);%>
      <%=proname1%> </font>&nbsp;</div>      </td>
      <td width="645" height="8" bgcolor="#FFFFFF"> 
        <div align="left"><font size="2" color="#000000" face="Arial, Helvetica, sans-serif">*<%=sqlRst.getString(4)%> 
      </font>&nbsp;</div>      </td>
      <td width="187" height="8" bgcolor="#FFFFFF"> 
        <div align="left"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"> 
          <input type="button" value="编辑" name="B222" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('edit-lprofl.jsp?id=<%=tid%>','_self', 'height=598, width=1005, top=50, left=50, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no')">
          <input type="button" value="删除" name="B2222" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('del-lprofl.jsp?id=<%=tid%>&profl=<%=proname1%>&seckind=<%=sid%>','_self', 'height=598, width=1005, top=50, left=50, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no')">
          </font>&nbsp;</div>      </td>
    </tr>
    <% i++; } %>
    <tr> 
      <td colspan=8 align=center height="22"> 
        <div align="right"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">共<%=intRowCount%>个品牌</font> 
          <font color="#C1D9FF" size="2" face="Arial, Helvetica, sans-serif"> 
          <%if(intPage<intPageCount){%>
          <a href="lprofl.jsp?page=<%=intPage+1%>&sid=<%=sid%>&id=<%=id%>&snumber=<%=snumber%>" style="font-size: 12px">下一页</a> 
          <% 
       }

      %>
          <%if(intPage>1){%>
          <a href="lprofl.jsp?page=<%=intPage-1%>&sid=<%=sid%>&id=<%=id%>&snumber=<%=snumber%>" style="font-size: 12px">上一页</a> 
          <% 
      }

      %>
          </font>&nbsp;</div>      </td>
    </tr>
  </table>
</form><%}%>
</body> 
 
</html> 

