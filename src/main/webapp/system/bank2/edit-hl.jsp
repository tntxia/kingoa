<jsp:useBean id="infocrmdb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
<script language=javascript>
    window.location="../../refuse.jsp"
    </script>
<% }     
%>
<html>
<head>
<title>芯片商城有限公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String id2=request.getParameter("id");
String sql="select  * from bank where id='"+id2+"'";
ResultSet rs=infocrmdb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
%>
<body bgcolor="#ffffff" text="#000000" topmargin="0" bgcolor="#C1D9FF">
<form name="form1" method="post" action="doedithl.jsp">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="11%"><font size="2" color="#000000">编辑 &gt;&gt; 
        <input type="hidden" name="id" value="<%=id2%>">
        </font>&nbsp;</td>
      <td width="89%"> 
        <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="保存" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font><font size="2"> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()">
          </font><font size="2" color="#000000"> </font>&nbsp;</div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="11%"><font size="2">开户名称:</font>&nbsp;</td>
      <td width="89%"><font size="2" color="#000000"> 
        <input type="text" name="com_bank" value="<%=rs.getString(2)%>" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="11%"><font size="2">开户银行:</font>&nbsp;</td>
      <td width="89%"><font size="2" color="#000000"> 
        <input type="text" name="bank" value="<%=rs.getString(3)%>" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="11%"><font size="2">银行帐号:</font>&nbsp;</td>
      <td width="89%"><font size="2" color="#000000"> 
        <input type="text" name="bank_num" value="<%=rs.getString(4)%>" size="30">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="11%"><font size="2">现有余额:</font>&nbsp;</td>
      <td width="89%"><font size="2" color="#000000"> 
        <input type="text" name="bank_je" value="<%=rs.getString("bank_je")%>" size="15">
        </font><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
        <select name="bank_hb" id="bank_hb" >
          <%String bank_hb=rs.getString("bank_hb");%>
          <option  selected><%=bank_hb%></option>
          <%
  				 try
            {
            ResultSet hlrs=infocrmdb.executeQuery("select * from hltable");
            while(hlrs.next())
           {
            String departname=hlrs.getString(2);
              out.println("<option >"+departname+"</option>");
             }
             hlrs.close();
             }catch(Exception e){}
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="11%"><font size="2">所属部门:</font>&nbsp;</td>
      <td width="89%"><font size="2" face="Arial, Helvetica, sans-serif"> 
        <select size="1" name="dept">
          <%
		  String remark=rs.getString(7);
		  String dept1=rs.getString("dept");
  try
  {
    ResultSet rs1=infocrmdb.executeQuery("select departname from department");
    while(rs1.next())
    {
      String departname=rs1.getString("departname");
       if(dept1.equals(departname))
       out.println("<option  selected  value='"+departname+"'>"+departname+"</option>");
        else            
      out.println("<option value='"+departname+"'>"+departname+"</option>");
    }
    rs1.close();
  }catch(Exception e){}
%>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="11%"><font size="2">备　　注:</font>&nbsp;</td>
      <td width="89%"> 
        <div align="left"><font size="2" color="#000000"> </font> <font size="2" color="#000000"> 
          <textarea name="remark" cols="60"><%=remark%></textarea>
          </font>&nbsp;</div>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
