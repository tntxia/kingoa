<%@ page contentType="text/html;charset=gb2312"%>
<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
%>
<jsp:useBean id="RegBean2" scope="page" class="infocrmdb.infocrmdb" />
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
strSQL = "select count(*) from profl";
sqlRst = RegBean2.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select id,number,cpro,proflname,remark from profl";
sqlRst = RegBean2.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title>EinfoCRM</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"><font color="#000000" size="2"> 仓库管理 &gt;&gt; 
        </font>&nbsp;</td>
      <td> <div align="right"><font color="#000000" size="2"> 
          <input type="button" value="增加仓库" name="B22" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('nprofl.jsp','main', 'height=200, width=550, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no')">
          </font></div> </td>
    </tr>
    <tr bgcolor="#d3d8eb" height="8"> 
      <td width="84" height="8"> <div align="left"><font color="#000000"><font size="2">编号</font></font></div> </td>
      <td width="555" height="8"> <div align="left"><font color="#000000"><font size="2">仓库名称</font></font></div> </td>
      <td width="133" height="8"> <div align="center"><font color="#000000"><font size="2">操作</font></font></div> </td>
    </tr>
    <%
   i = 0;
   while(i<intPageSize && sqlRst.next()){ %>
    <tr height="8"> 
      <td width="84" height="8"> <%int id=sqlRst.getInt(1);
		      String number=sqlRst.getString(2);
		%> <div align="left"><font size="2" color="#000000">* 
          <%String cpro=sqlRst.getString(3);%>
          <%=number%> </font></div></td>
      <td width="555" height="8"> <div align="left"><font size="2" color="#000000"><%=cpro%> </font></div> </td>
      <td width="133" height="8"> <div align="center"><font color="#000000" size="2"> 
          <input type="button" value="编辑" name="B222" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('edit-profl.jsp?id=<%=id%>','_self', 'height=200, width=450, top=200, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no')">
          </font><font color="#000000" size="2">
          <input type="button" value="删除" name="B2222" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('del-profl.jsp?id=<%=id%>','_self', 'height=200, width=450, top=200, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no')">
          </font></div> </td>
    </tr>
    <% i++; } %>
    <tr> 
      <td colspan=7 align=center height="22"> <div align="right"><font color="#000000" size="2">共<%=intRowCount%>个仓库</font> <font color="#C1D9FF" size="2"> 
          <%if(intPage<intPageCount){%>
          <a href="profl.jsp?page=<%=intPage+1%>" style="font-size: 12px">下一页</a> 
          <% 
       }

      %>
          <%if(intPage>1){%>
          <a href="profl.jsp?page=<%=intPage-1%>" style="font-size: 12px">上一页</a> 
          <% 
      }

      %>
          </font></div> </td>
    </tr>
  </table>
</form>
</body> 
<%}%>
</html> 

