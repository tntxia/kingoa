<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
<script language=javascript>
    window.location="../../refuse.jsp"
    </script>
<% }     
java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String currentDate=simple.format(new java.util.Date());
%>
<html>
<head>
<title>芯片商城有限公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body text="#000000" topmargin="0">
<form name="form1" method="post" action="do_hlxx.jsp">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
						
						
						
						
						
    <TR BGCOLOR="#d3d8eb"> 
      <td width="19%"><font size="2" color="#000000">增加银行</font>&nbsp;</td>
      <td width="81%"> 
        <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
        </div>
      </td>
    </tr>
	
	
	<tr bgcolor="#FFFFFF">
	
	 
      <td><font size="2">隐藏该项目:</font>&nbsp;</td>
	  
	  
	  
      <td><font size="2" color="#000000">
	  
<input type="checkbox" name="hiddens" />
	  
	    </font>&nbsp;</td>
		
		
		
    </tr>
	
	
	
	
	
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"><font size="2">开户名称:</font>&nbsp;</td>
      <td width="81%"><font size="2" color="#000000"> 
        <input type="text" name="com_bank" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"><font size="2">开户银行:</font>&nbsp;</td>
      <td width="81%"><font size="2" color="#000000"> 
        <input type="text" name="bank" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"><font size="2">银行帐号:</font>&nbsp;</td>
      <td width="81%"><font size="2" color="#000000"> 
        <input type="text" name="bank_num" size="30">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"><font size="2">现有余额:</font>&nbsp;</td>
      <td width="81%"><font size="2" color="#000000"> 
        <input type="text" name="bank_je" size="10" value="0">
        </font><font size="2" color="#000000" face="Arial, Helvetica, sans-serif"> 
        <select name="bank_hb" id="bank_hb" >
          <%
			try
            {
            ResultSet hlrs=einfodb.executeQuery("select * from hltable");
            while(hlrs.next())
           {
            String currname=hlrs.getString(2);
            out.println("<option >"+currname+"</option>");
             }
             hlrs.close();
             }catch(Exception e){}
             %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"><font size="2">所属部门:</font>&nbsp;</td>
      <td width="81%"><font size="2" face="Arial, Helvetica, sans-serif"> 
        <select size="1" name="dept">
          <%
  try
  {
    ResultSet rs=einfodb.executeQuery("select departname from department");
    while(rs.next())
    {
      String departname=rs.getString("departname");
      out.println("<option value='"+departname+"'>"+departname+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"><font size="2">备　　注:</font>&nbsp;</td>
      <td width="81%"><font size="2" color="#000000"> 
        <textarea name="remark" cols="60"></textarea>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"><font size="2">创建日期:</font>&nbsp;</td>
      <td width="81%"> 
        <div align="left"><font size="2" color="#000000"> </font> 
          <input type="hidden" name="bank_date" value="<%=currentDate%>">
          <%=currentDate%> </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>

