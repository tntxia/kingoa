<jsp:useBean id="infocrmdb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page import="java.sql.*,java.util.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
 String getaLoginmessage = (String) session.getValue("adminloginSign");
   if(getaLoginmessage!="admin"){
%>
    <script language=javascript>
    window.location="../../manageslogin.jsp"
    </script>
<% } else {%>   

<html>
<head>
<title>芯片商城有限公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String id2=request.getParameter("id");
String sql="select  * from hhsp where id='"+id2+"'";
ResultSet rs=infocrmdb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
%>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="doedithl.jsp"> <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1"> 
<TR BGCOLOR="#d3d8eb"> <td width="16%"><font size="2" color="#000000">编辑 &gt;&gt; 
<input type="hidden" name="id" value="<%=id2%>"> </font>&nbsp;</td>
<td colspan="3"> 
<div align="right"><font size="2" color="#000000"> 
    <input type="submit" name="Submit" value="保存" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF"> 
    <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()"> 
</font>&nbsp;</div></td>
</tr> <tr bgcolor="#FFFFFF"> 
<td width="16%"><font size="2" color="#000000">申请部门:</font>&nbsp;</td>
<td width="24%"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"> 
<select size="1" name="dept"> <%
		   String dept=rs.getString("dept").trim();
  				 try
            {
            ResultSet hlrs=infocrmdb.executeQuery("select departname from department");
            while(hlrs.next())
           {
            String departname=hlrs.getString("departname").trim();
            if(dept.equals(departname))
              out.println("<option  selected>"+departname+"</option>");
            else            
              out.println("<option >"+departname+"</option>");
             }
             hlrs.close();
             }catch(Exception e){}
        %> </select> </font>&nbsp;</td>
<td width="19%"><font size="2" color="#000000">申请人职位:</font>&nbsp;</td>
<td width="41%"> 
<font color="#000000" size="2"> <select name="role" size="1" id="role"> <%
		   String role=rs.getString("role").trim();
  				 try
            {
            ResultSet hlrs=infocrmdb.executeQuery("select role_name from role");
            while(hlrs.next())
           {
            String departname=hlrs.getString("role_name").trim();
            if(role.equals(departname))
              out.println("<option  selected>"+departname+"</option>");
            else            
              out.println("<option >"+departname+"</option>");
             }
             hlrs.close();
             }catch(Exception e){}
        %> </select> </font>&nbsp;</td>
</tr> <tr bgcolor="#FFFFFF"> <td><FONT SIZE="2" COLOR="#000000">技术部审批人:</font>&nbsp;</td>
<td COLSPAN="3"><font color="#000000" size="2"> 
<select size="1" name="dd_man"> <%
		   String dd_man=rs.getString("dd_man").trim();
  				 try
            {
            ResultSet hlrs=infocrmdb.executeQuery("select name from username");
            while(hlrs.next())
           {
            String departname=hlrs.getString("name").trim();
            if(dd_man.equals(departname))
              out.println("<option  selected>"+departname+"</option>");
            else            
              out.println("<option >"+departname+"</option>");
             }
             hlrs.close();
             }catch(Exception e){}
        %> </select> </font>&nbsp;</td>
</tr> <tr bgcolor="#FFFFFF"> <td><FONT SIZE="2" COLOR="#000000">销售部审批人:</font>&nbsp;</td>
<td COLSPAN="3"><font color="#000000" size="2">
<select size="1" name="fspman"> 
<%
		   String fspman=rs.getString("fspman").trim();
  				 try
            {
            ResultSet hlrs=infocrmdb.executeQuery("select name from username");
            while(hlrs.next())
           {
            String departname=hlrs.getString("name").trim();
            if(fspman.equals(departname))
              out.println("<option  selected>"+departname+"</option>");
            else            
              out.println("<option >"+departname+"</option>");
             }
             hlrs.close();
             }catch(Exception e){}
        %> </select> </font>&nbsp;</td>
</tr> <tr bgcolor="#FFFFFF"> <td><FONT SIZE="2" COLOR="#000000">主管审批人:</font>&nbsp;</td>
<td COLSPAN="3"><font color="#000000" size="2"> 
<select name="firspman" size="1" id="firspman"> <%
		   String firspman=rs.getString("firspman").trim();
  				 try
            {
            ResultSet  fyrs=infocrmdb.executeQuery("select name from username");
            while(fyrs.next())
           {
            String fyspman=fyrs.getString("name").trim();
            if(firspman.equals(fyspman))
              out.println("<option  selected>"+fyspman+"</option>");
            else            
              out.println("<option >"+fyspman+"</option>");
             }
             fyrs.close();
             }catch(Exception e){}
        %> </select> </font>&nbsp;</td>
</tr> <tr bgcolor="#FFFFFF"> <td width="16%"><FONT SIZE="2" COLOR="#000000">OP操作人:</font>&nbsp;</td>
<td COLSPAN="3"> 
<font color="#000000" size="2">
<select name="fourspman" size="1" id="fourspman"> <%
		   String fourspman=rs.getString("fourspman").trim();
  				 try
            {
            ResultSet  payrs=infocrmdb.executeQuery("select name from username");
            while(payrs.next())
           {
            String fourspman1=payrs.getString("name").trim();
            if(fourspman.equals(fourspman1))
              out.println("<option  selected>"+fourspman1+"</option>");
            else            
              out.println("<option >"+fourspman1+"</option>");
             }
             payrs.close();
             }catch(Exception e){}
        %> </select> </font>&nbsp;</td>
</tr> <tr bgcolor="#FFFFFF"> <td width="16%"><font size="2" color="#000000">备　　注:</font>&nbsp;</td>
<td colspan="3"> 
    <font color="#000000">
    <textarea name="remark" cols="60"><%=rs.getString("remark")%></textarea>
    </font>&nbsp;</td>
</tr> 
</table>
</form>
</body><%}}%>
</html>
