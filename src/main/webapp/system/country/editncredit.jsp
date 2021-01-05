<%@ page import="java.sql.*,java.util.*"%>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page contentType="text/html;charset=GB2312"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>芯片商城有限公司</title>
<%
String id1=request.getParameter("id");
String sql="select * from country where id='"+id1+"'";

ResultSet rs=einfodb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
%>
</head>


<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="doeditcredit.jsp">
  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="17%" height="26"><font size="2" color="#000000">编辑 &gt;&gt;</font>&nbsp;</td>
      <td colspan="2" height="26" width="83%"> 
        <div align="right"><font size="2"> 
          <input type="hidden" name="id" size="20" style="border: 1 inset #C3D9FF" value="<%=id1%>">
          </font><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="button" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onclick=javascript:history.back()>
        </div>
      </td>
    </tr>
    <TR BGCOLOR="#d3d8eb"> 
      <td width="17%" bgcolor="#e8ebf5"><font size="2" color="#000000">国家名称:</font>&nbsp;</td>
      <td width="83%" colspan="2" bgcolor="#FFFFFF"> 
        <div align="left"><font size="2" color="#000000"> 
          <input type="text" name="cre_name" size="35" value="<%=rs.getString("coun_name")%>">
          </font>&nbsp;</div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
