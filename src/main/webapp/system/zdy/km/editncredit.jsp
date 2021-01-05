<%@ page import="java.sql.*,java.util.*"%>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page contentType="text/html;charset=GB2312"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>芯片商城有限公司</title>
<%
String p=request.getParameter("p");
String xh=request.getParameter("xh");
String id1=request.getParameter("id");
String sql="select * from km where id='"+id1+"'";

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
      <td height="26" width="83%"> 
        <div align="right"><font size="2"> 
          <input type="hidden" name="xh" size="20" style="border: 1 inset #C3D9FF" value="<%=xh%>">
          <INPUT TYPE="hidden" NAME="p" SIZE="20" STYLE="border: 1 inset #C3D9FF" VALUE="<%=p%>">
          <input type="hidden" name="id" size="20" style="border: 1 inset #C3D9FF" value="<%=id1%>">
          </font><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="button" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onclick=javascript:history.back()>
        </div>
      </td>
    </tr>
    <TR BGCOLOR="#d3d8eb"> 
      <td bgcolor="#e8ebf5"><font size="2">科目编号:</font>&nbsp;</td>
      <td bgcolor="#FFFFFF"> 
        <div align="left"><font size="2" color="#000000"> 
          <input name="cre_number" type="text" id="cre_number" value="<%=rs.getString("coun_number")%>" size="35">
          </font>&nbsp;</div>
      </td>
    </tr>
    <TR BGCOLOR="#d3d8eb">
      <td bgcolor="#e8ebf5"><font size="2">余额方向:</font>&nbsp;</td>
      <td bgcolor="#FFFFFF"><font size="2">
        <select name="km_fx">
          <%String km_fx1=rs.getString("km_fx").trim();
          String[] km_fx=new String[]{"贷方","借方"};
          for(int i=0;i<km_fx.length;i++)
           {
             if(km_fx1.equals(km_fx[i]))
               out.println("<option selected>"+km_fx[i]+"</option>");
             else
               out.println("<option >"+km_fx[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <TR BGCOLOR="#d3d8eb"> 
      <td bgcolor="#e8ebf5"><font size="2">科目名称:</font>&nbsp;</td>
      <td bgcolor="#FFFFFF"> 
        <div align="left"><font size="2" color="#000000"> 
          <input type="text" name="cre_name" size="35" value="<%String coun_name=rs.getString("coun_name");out.print(coun_name);%>">
          <font size="2">
          <input type="hidden" name="cre_name_old" size="20" style="border: 1 inset #C3D9FF" value="<%=coun_name%>">
          </font><font color="#0000FF">＊</font> </font>&nbsp;</div>
      </td>
    </tr>
    <TR BGCOLOR="#d3d8eb"> 
      <td bgcolor="#e8ebf5"><font size="2">备注:</font>&nbsp;</td>
      <td bgcolor="#FFFFFF"> 
        <div align="left"><font size="2" color="#000000"> 
          <input name="cre_ename" type="text" id="cre_ename" value="<%=rs.getString("coun_ename")%>" size="35">
          </font>&nbsp;</div>
      </td>
    </tr>
  </table>
</form>
<font size="2">建议在科目名称前面保留与科目编号一致的编号</font> 
</body>
</html>
