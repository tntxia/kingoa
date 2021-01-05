<jsp:useBean id="infocrmdb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page import="java.sql.*,java.util.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="infocrmdb.DealString" %>
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
String sql="select  * from ht_mb where id='"+id2+"'";
ResultSet rs=infocrmdb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
%>
<body bgcolor="#ffffff" text="#000000" topmargin="0" >
<form name="form1" method="post" action="doedithl.jsp">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="20%"><font size="2" color="#000000">编辑 &gt;&gt; 
        <input type="hidden" name="id" value="<%=id2%>">
        </font>&nbsp;</td>
      <td width="80%"> 
        <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="保存" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font><font size="2"> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()">
          </font><font size="2" color="#000000"> </font>&nbsp;</div>
      </td>
    </tr>
  </table>
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <tr> 
      <td height="18" bgcolor="#e8ebf5"><font size="2" color="#000000">合同名称:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <input name="q_name" type="text" id="q_name" value="<%=rs.getString(2)%>" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#e8ebf5"><font size="2" color="#000000">合同标题:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_topic" size="60" value="<%=rs.getString(3)%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#e8ebf5"><font size="2" color="#000000">公司名称:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_company" size="60" value="<%=rs.getString(4)%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#e8ebf5"><font size="2" color="#000000">公司地址:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_addr" size="60" value="<%=rs.getString(5)%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td bgcolor="#e8ebf5"><font size="2" color="#000000">法定代表:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <input name="q_man" type="text" id="q_man" value="<%=rs.getString(6)%>" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#e8ebf5"><font size="2" color="#000000">公司电话:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_tel" size="60" value="<%=rs.getString(7)%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#e8ebf5"><font size="2" color="#000000">公司传真:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_fax" size="60" value="<%=rs.getString(8)%>">
        </font>&nbsp;</td>
    </tr>
    <tr>
      <td width="13%" bgcolor="#e8ebf5"><font size="2" color="#000000">开户银行:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <input type="text" name="q_email" size="60" value="<%=rs.getString(9)%>">
        </font>&nbsp;</td>
    </tr>
    <tr>
      <td bgcolor="#e8ebf5"><font size="2" color="#000000">银行帐号:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <input type="text" name="q_net" size="60" value="<%=rs.getString(10)%>">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td bgcolor="#e8ebf5"><font size="2" color="#000000">邮政编码:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <input name="q_post" type="text" id="q_post" value="<%=rs.getString(11)%>" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td bgcolor="#e8ebf5"><font size="2" color="#000000">纳税编号:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <input name="q_number" type="text" id="q_number" value="<%=rs.getString(12)%>" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#e8ebf5"><font size="2" color="#000000">条　　款:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <textarea name="q_tk" cols="120" rows="13"><%=DealString.unHtmlEncode(rs.getString(13))%></textarea>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#e8ebf5"><font size="2" color="#000000">备　　注:</font>&nbsp;</td>
      <td width="87%"><font size="2" color="#000000"> 
        <textarea name="remark" cols="95"><%=rs.getString(14)%></textarea>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#e8ebf5"><font size="2" color="#000000">创建日期:</font>&nbsp;</td>
      <td width="87%"> <div align="left"><font size="2" color="#000000"> </font> 
          <%=rs.getDate(15)%> </div></td>
    </tr>
  </table>
</form>
</body><%}%>
</html>
