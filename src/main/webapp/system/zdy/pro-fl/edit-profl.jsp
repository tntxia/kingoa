<jsp:useBean id="infocrmdb" scope="page" class="infocrmdb.infocrmdb" />
<jsp:useBean id="einfodb" scope="page" class="bankdb.bankdb" />
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
%>
<html>
<head>
<title>芯片商城有限公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String id2=request.getParameter("id");
String sql="select  * from profl where id='"+id2+"'";
ResultSet rs=infocrmdb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
%>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0">
<form name="form1" method="post" action="doedit_profl.jsp">
  <INPUT TYPE="hidden" name="id" value="<%=id2%>">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <tr> 
      <td width="20%" bgcolor="#d3d8eb"><font size="2" color="#000000">编辑 &gt;&gt;</font>&nbsp;</td>
      <td width="80%" bgcolor="#d3d8eb"> <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font><font size="2"> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="history.back()">
          </font><font size="2" color="#000000"> </font>&nbsp;</div></td>
    </tr>
    <tr> 
      <td bgcolor="#e8ebf5"><font color="#000000" size="2">编号</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <input name="number" type="text" id="number" value="<%=rs.getString(2)%>" size="6" maxlength="2">
        </font><font size="2" color="#000000">&nbsp; </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="20%" bgcolor="#e8ebf5"><font size="2" color="#000000">仓库地点</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <input type="text" name="proflname" value="<%=rs.getString(3)%>" size="30" maxlength="10">
        </font><font size="2" color="#000000">&nbsp; </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="20%" bgcolor="#e8ebf5"><font size="2" color="#000000">仓库名称</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <input type="text" name="cpro" value="<%String cpro=rs.getString(4);%><%=cpro%>" size="30" maxlength="10">
        <INPUT name="ocpro" TYPE="hidden" id="ocpro" value="<%=cpro%>">
        </font><font size="2" color="#000000">&nbsp; </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="20%" bgcolor="#e8ebf5"><font size="2" color="#000000">备注</font>&nbsp;</td>
      <td> <div align="left"> <font size="2" color="#000000"> 
          <textarea name="remark" cols="30"><%=rs.getString(5)%></textarea>
          </font>&nbsp;</div></td>
    </tr>
  </table>
</form>
</body><%}%>
</html>
