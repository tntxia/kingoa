<%@ page contentType="text/html;charset=gb2312" %>
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
intPageSize = 100;
strPage = request.getParameter("page");

if(strPage==null){
intPage = 1;
} else{
intPage = java.lang.Integer.parseInt(strPage);
if(intPage<1) intPage = 1; }
String cre_name2=request.getParameter("cre_name");
strSQL = "select count(*) from km  where  coun_number like '4%'";
sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select * from km where  coun_number  like  '4%'  order by coun_number  asc";
sqlRst = einfodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title>��ƿ�Ŀ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF" text="#000000">
<br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
  <TR BGCOLOR="#d3d8eb">
    <td width="525" height="30" bgcolor="#FFFFFF"><font size="2" color="#000000">��ƿ�Ŀ�б�</font><font color="#000000" size="2"> &gt;&gt; �ɱ���</font>&nbsp;</td>
    <td width="182" height="30" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <TR BGCOLOR="#d3d8eb"> 
    <td width="525" height="30"> 
      <div align="left"><font size="2"><a href="credit.jsp" style="font-size: 12px">1�ʲ���</a></font> <font size="2"><a href="credit2.jsp" style="font-size: 12px">2��ծ��</a></font> 
        <font size="2"><a href="credit3.jsp" style="font-size: 12px">3Ȩ����</a></font> <font size="2"><a href="credit4.jsp" style="font-size: 12px">4�ɱ���</a></font> 
        <font size="2"><a href="credit5.jsp" style="font-size: 12px">5������</a></font>&nbsp;</div>
    </td>
    <td height="30" width="182"> 
      <div align="right"> 
        <input type="button" value="��ӳɱ�����ϸ��Ŀ" name="B22" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('ncredit.jsp?xh=4','_self', 'height=200, width=550, top=200, left=200, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')">
      </div>
    </td>
  </tr>
  <%
   i = 0;
   while(i<intPageSize && sqlRst.next()){ %>
  <tr height="8"> 
    <%int id=sqlRst.getInt(1);%>
    <td height="8" width="525"><font size="2"> 
      <%String p=sqlRst.getString("coun_name");out.print(p);%>
      </font>&nbsp;</td>
    <td width="182" height="8"> 
      <div align="center"><a href="editncredit.jsp?id=<%=id%>&p=<%=p%>&xh=4" style="font-size: 12px"><font size="2">�༭</font></a> 
        <font size="2"><a href="del-credit.jsp?id=<%=id%>&p=<%=p%>&xh=4" style="font-size: 12px">ɾ��</a> <a href="../kmmx/credit.jsp?p=<%=p%>" style="font-size: 12px">��Ŀ��ϸ</a> 
        </font>&nbsp;</div>
    </td>
  </tr>
  <% i++; } %>
  <tr> 
    <td colspan=3 align=center height="16"> 
      <div align="right"><font color="#000000" size="2"> </font> <font color="#C1D9FF" size="2"> 
        <%if(intPage>1){%>
        <a href="credit4.jsp?page=<%=intPage-1%>" style="font-size: 12px">��һҳ</a> 
        <%}%>
        <%if(intPage<intPageCount){%>
        <a href="credit4.jsp?page=<%=intPage+1%>" style="font-size: 12px">��һҳ</a> 
        <%}%>
        </font>&nbsp;</div>
    </td>
  </tr>
</table>
</body>
</html>
 <%sqlRst.close();%>
