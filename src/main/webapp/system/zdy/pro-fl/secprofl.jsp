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
String proname1=request.getParameter("proname");
String id=request.getParameter("id");
String firnumber=request.getParameter("firnumber");
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
strSQL = "select count(*) from secprofl ";
sqlRst = RegBean2.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
if(intPage>intPageCount) intPage = intPageCount;
strSQL = "select id,snumber,proflname,price_gk,price_jysj,price_min,price_dljg,price_wf from secprofl  order  by  snumber desc";

sqlRst = RegBean2.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<title>оƬ�̳����޹�˾</title>
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
</style>

</head>

<body TOPMARGIN="0" text="#000000">
<form name="form1" method="post" action=""> 
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <tr bgcolor="#D9E8FF"> 
      <td colspan="5" bgcolor="#FFFFFF">&nbsp;</td>
      <td WIDTH="124" bgcolor="#FFFFFF"> 
        <div align="right"><font color="#000000" size="2"> 
          <input type="button" value="���Ӳ�Ʒ���" name="B22" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('secnprofl.jsp','_self', 'height=200, width=450, top=200, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no')">
          </font>&nbsp;</div>      </td>
    </tr>
    <tr height="8" bgcolor="#d3d8eb"> 
      <td width="226" height="8"> 
        <div align="left"><FONT COLOR="#000000"><font size="2">��Ʒ�������</font></FONT></div>      </td>
      <td width="130" height="8"><FONT SIZE="2" COLOR="#000000">��������</FONT></td>
      <td width="124" height="8"><FONT SIZE="2" COLOR="#000000">�����ۼ�</FONT></td>
      <td width="123" height="8"><FONT SIZE="2" COLOR="#000000">����޼�</FONT></td>
      <td width="116" height="8"><FONT SIZE="2" COLOR="#000000">�����۸�</FONT></td>
      <td width="124" height="8"> 
        <div align="center"><FONT COLOR="#000000"><font size="2">����</font></FONT></div>      </td>
    </tr>
    <%
   i = 0;
   while(i<intPageSize && sqlRst.next()){ %>
    <tr height="8" bgcolor="#d3d8eb"> <%int sid=sqlRst.getInt(1);%>
      <td width="226" height="8" bgcolor="#FFFFFF"> 
        <div align="left"><FONT SIZE="2" COLOR="#000000">* 
          <%
		  String snumber=sqlRst.getString(2);
		  String proname=sqlRst.getString(3);
		  %>
          <%=snumber%>:<%=proname%> </font>&nbsp;</div>      </td>
      <td width="130" height="8" bgcolor="#FFFFFF"><FONT COLOR="#000000"><FONT SIZE="2">�ɱ�����/</FONT><%=sqlRst.getDouble("price_gk")%></font>&nbsp;</td>
      <td width="124" height="8" bgcolor="#FFFFFF"><FONT COLOR="#000000"><FONT SIZE="2">�ɱ�����/</FONT><%=sqlRst.getDouble("price_jysj")%></font>&nbsp;</td>
      <td width="123" height="8" bgcolor="#FFFFFF"><FONT COLOR="#000000"><FONT SIZE="2">�ɱ�����/</FONT><%=sqlRst.getDouble("price_min")%></font>&nbsp;</td>
      <td width="116" height="8" bgcolor="#FFFFFF"><FONT COLOR="#000000"><FONT SIZE="2">�ɱ�����/</FONT><%=sqlRst.getDouble("price_dljg")%></font>&nbsp;</td>
      <td width="124" height="8" bgcolor="#FFFFFF"> 
        <div align="center"><FONT COLOR="#000000" SIZE="2"> 
          <input type="button" value="�༭" name="B222" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('edit-secprofl.jsp?id=<%=sid%>','_self', 'height=200, width=450, top=200, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no')">
          <input type="button" value="ɾ��" name="B2222" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('del-secprofl.jsp?id=<%=sid%>&proname=<%=proname%>','_self', 'height=200, width=450, top=200, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no')">
          </font>&nbsp;</div>      </td>
    </tr>
    <% i++; } %>
    <tr> 
      <td colspan=10 align=center height="22"> 
        <div align="right"><FONT COLOR="#000000" SIZE="2">(�۸��������Ϊ0)��<%=intRowCount%>����Ʒ��� 
          <%if(intPage<intPageCount){%>
          <a href="secprofl.jsp?page=<%=intPage+1%>&id=<%=id%>&proname=<%=proname1%>" style="font-size: 12px">��һҳ</a> 
          <% 
       }

      %>
          <%if(intPage>1){%>
          <a href="secprofl.jsp?page=<%=intPage-1%>&id=<%=id%>&proname=<%=proname1%>" style="font-size: 12px">��һҳ</a> 
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
