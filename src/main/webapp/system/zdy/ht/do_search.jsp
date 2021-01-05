<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
<script language=javascript>
  window.open("../../refuse.jsp","firstwn", "height=500, width=750, top=30, left=10, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no")
</script>
<% }     
%>
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
intPageSize = 7;
strPage = request.getParameter("page");
if(strPage==null){
intPage = 1;
} else{
intPage = java.lang.Integer.parseInt(strPage);
if(intPage<1) intPage = 1; }
     strSQL="select count(*) from company";
sqlRst = einfodb.executeQuery(strSQL);
sqlRst.next();
intRowCount = sqlRst.getInt(1);
sqlRst.close();
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
 if(intPage>intPageCount) intPage = intPageCount;
     strSQL="select companyname,companyaddr,companyman,companybank,companynumber,companytel,companyfax,companysh,companybm from company";
sqlRst =einfodb.executeQuery(strSQL);
i = (intPage-1) * intPageSize;
for(j=0;j<i;j++) sqlRst.next(); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>芯片商城有限公司</title>
<style type="text/css">
<!--
.H1 {font-size:12pt; line-height:15pt; align=center}
.ourfont {font-size:9pt; line-height:15pt; }
.ourfont1 {font-size:8pt; line-height:13pt; }
A{text-transform: none; text-decoration:none;color:#0000ff}
a:hover {text-decoration:underline;color:#0000ff}
-->
</style>

</head>

<body bgcolor="#ffffff">
<table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">  <tr> 
    <td class="ourfont" bgcolor="#d3d8eb" align="center" width="22%"><font color="#000080">&nbsp;</font> 
      <font size="2">公司名称</font></td>
    <td class="ourfont" bgcolor="#d3d8eb" align="center" width="29%">公司地址</td>
    <td class="ourfont" bgcolor="#d3d8eb" align="center" width="12%">电话</td>
    <td class="ourfont" bgcolor="#d3d8eb" align="center" width="15%">法人</td>
  </tr>
  <%
i = 0;

while(i<intPageSize && sqlRst.next()){ 
      String companyname=sqlRst.getString(1);
      String companyaddr=sqlRst.getString(2);
      String companyman=sqlRst.getString(3);    
      String companybank=sqlRst.getString(4);    
      String companynumber=sqlRst.getString(5);
      String companytel=sqlRst.getString(6);
      String companyfax=sqlRst.getString(7);
      String companysh=sqlRst.getString(8);
	  String companybm=sqlRst.getString(9); 
%>
  <tr> 
    <td width="22%"><a style="font-size: 12px" onClick="javascript:aclose('<%=companyname%>','<%=companyaddr%>','<%=companyman%>','<%=companybank%>','<%=companynumber%>','<%=companytel%>','<%=companyfax%>','<%=companysh%>','<%=companybm%>')"><font size="2"><%=companyname%> 
      </font></a></td>
    <td width="29%"><font size="2"><%=companyaddr%></font>&nbsp;</td>
    <td width="12%"><font size="2"><%=companytel%></font>&nbsp;</td>
    <td width="15%"><font size="2"><%=companyman%></font>&nbsp;</td>
  </tr>
  <% i++; } %>
  <tr> 
    <td colspan=4 align=center height="22"> 
      <div align="right"><font color="#000000" size="2"> 共<%=intRowCount%>个公司信息</font> <font color="#C1D9FF" size="2"> 
        <%if(intPage<intPageCount){%>
        <a href="do_ssearch.jsp?page=<%=intPage+1%>" style="font-size: 12px">下一页</a> 
        <% 
        }
        %>
        <%if(intPage>1){%>
        <a href="do_ssearch.jsp?page=<%=intPage-1%>" style="font-size: 12px">上一页</a> 
        <% 
         }
        %>
        </font>&nbsp;</div>
    </td>
  </tr>
</table>
</body> 
 
</html> 
<script language=javascript>
function aclose(name,addr,man,bank,bank_n,tel,fax,sh,bm)
{
opener.form1.q_company.value=name;
opener.form1.q_addr.value=addr;
opener.form1.q_man.value=man;
opener.form1.q_email.value=bank;
opener.form1.q_net.value=bank_n;
opener.form1.q_tel.value=tel;
opener.form1.q_fax.value=fax;
opener.form1.q_number.value=sh;
opener.form1.q_post.value=bm;

window.close();
}
</script>

