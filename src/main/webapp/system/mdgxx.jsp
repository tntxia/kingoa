<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="RegBean2" scope="page" class="infocrmdb.infocrmdb" />
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../refuse.jsp"
    </script>
<% } else {    
 String getaLoginmessage = (String) session.getAttribute("adminname");
 
   if(getaLoginmessage==null){
%>
    <script language=javascript>
    window.location="manageslogin.jsp";
    
    </script>
<% return;} else {    
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
intPageSize = 200;
strPage = request.getParameter("page");

if(strPage==null){
intPage = 1;
} else{
intPage = java.lang.Integer.parseInt(strPage);
if(intPage<1) intPage = 1; }
strSQL = "select count(*) from department";
sqlRst = RegBean2.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select id,departname,dept_types,dept_code from department  order  by  dept_code  asc";

sqlRst = RegBean2.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title>���Ź���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <tr bgcolor="#FFFFFF"> 
      <td bgcolor="#FFFFFF"><font color="#000000" size="2">���Ź��� &gt;&gt; </font>&nbsp;</td>
      <td colspan="3"> <div align="right"><font size="2" color="#666600"> 
          <input type="button" value="���Ӷ�������" name="B22333233" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('nmdgxx.jsp','bqt', 'height=380, width=650, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
          </font><font color="#000000" size="2"> </font>&nbsp;</div></td>
    </tr>
    <tr height="8" bgcolor="#d3d8eb"> 
      <td width="203" height="8"> <div align="left"><font color="#000000"><font size="2">��������</font></font>&nbsp;</div></td>
      <td width="101"> <div align="left"><font color="#000000"><font size="2">��������</font></font>&nbsp;</div></td>
      <td width="87"> <div align="left"><font color="#000000"><font size="2">���ű��</font></font></div></td>
      <td width="258" height="8"><font color="#000000">&nbsp;</font>&nbsp;</td>
    </tr>
    <%
   i = 0;
   while(i<intPageSize && sqlRst.next()){ %>
    <tr height="8" bgcolor="#FFFFFF"> 
      <%int id=sqlRst.getInt(1);%>
      <td width="203" height="30"> <div align="left"><font size="2" color="#0000FF"> 
          <font color="#000000">
          <%String dept=sqlRst.getString(2);%>
      <%=dept%> </font></font>&nbsp;</div></td>
      <td width="101" height="30"> <div align="left"><font size="2"> 
          <%int  dept_types=sqlRst.getInt(3);
	   if(dept_types==1)
	   out.print("��������");
     if(dept_types==2)
	   out.print("һ������");
	    if(dept_types==3)
	   out.print("��������");
	     if(dept_types==4)
	   out.print("��������");
	    if(dept_types==5)
	   out.print("�ļ�����");
	    if(dept_types==6)
	   out.print("�弶����");
	
	   	   %>
          </font><font color="#000000" size="2"></font>&nbsp;</div></td>
      <td width="87" height="30"> <div align="left"><font size="2"> <%String dept_code=sqlRst.getString(4);%><%=dept_code%> </font><font color="#000000" size="2"></font>&nbsp;</div></td>
      <td width="258" height="30"><font size="2" color="#666600">&nbsp; </font><font size="2" color="#666600">
<input type="button" value="�����¼�����" name="B223332322" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('nnmdgxx.jsp?dept_types=<%=dept_types%>&dept_code=<%=dept_code%>','bqt', 'height=380, width=650, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
        <input type="button" value="�༭" name="B22333232" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('edit-mdg.jsp?id=<%=id%>','bqt', 'height=380, width=650, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
        </font><font size="2" color="#666600"> 
        <input type="button" value="ɾ��" name="B22333232" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('del-mdg.jsp?id=<%=id%>&dept=<%=dept%>&dept_code=<%=dept_code%>','bqt', 'height=380, width=650, top=100, left=50, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
        </font><font size="2" color="#666600"> </font></td>
    </tr>
    <% i++; } %>
    <tr> 
      <td colspan=8 align=center height="22"> <div align="right"><font color="#000000" size="2"> 
          </font> <font color="#C1D9FF" size="2"> 
          <%if(intPage<intPageCount){%>
          <a href="mdgxx.jsp?page=<%=intPage+1%>" style="font-size: 12px">��һҳ</a> 
          <% 
       }

      %>
          <%if(intPage>1){%>
          <a href="mdgxx.jsp?page=<%=intPage-1%>" style="font-size: 12px">��һҳ</a> 
          <% 
      }

      %>
          </font>&nbsp;</div></td>
    </tr>
  </table>
</form>
</body> 
<%}}%></html> 

