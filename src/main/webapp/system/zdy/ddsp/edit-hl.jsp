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
String sql="select  * from ddsp where id='"+id2+"'";
ResultSet rs=infocrmdb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
%>
<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="doedithl.jsp"> 
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="13%"><font size="2" color="#000000">编辑 &gt;&gt; 
        <input type="hidden" name="id" value="<%=id2%>">
        </font>&nbsp;</td>
      <td colspan="3"> 
        <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="保存" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font><font size="2"> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()">
          </font><font size="2" color="#000000"> </font>&nbsp;</div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">申请部门:</font>&nbsp;</td>
      <td width="25%"><font size="2" face="Arial, Helvetica, sans-serif" color="#000000"> 
        <select size="1" name="dept">
          <%
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
        %>
        </select>
        </font>&nbsp;</td>
      <td width="10%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">申请人职位:</font>&nbsp;</td>
      <td width="52%"> <font size="2" color="#000000"> 
        <select name="role" size="1" id="role">
          <%
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
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <TD WIDTH="13%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">最低金额:</font>&nbsp;</td>
      <TD><font color="#000000"> RMB<font size="2"> 
        <input type="text" name="price_min" size="8" value="<%=rs.getString("price_min")%>">
        </font><FONT SIZE="2"> </FONT></font>&nbsp;</td>
      <TD nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">最高金额:</font>&nbsp;</td>
      <TD><font color="#000000"><font color="#000000">RMB<font size="2"> 
        <input type="text" name="price_max" size="8" value="<%=rs.getString("price_max")%>">
        </font></font></font>&nbsp;</td>
    </TR>
    <tr bgcolor="#FFFFFF"> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">是否需要审批:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <select name="if_sp">
          <% String if_sp1=rs.getString("if_sp").trim();
          String[] if_sp=new String[]{"是","否"};
          for(int i=0;i<if_sp.length;i++)
           {
             if(if_sp1.equals(if_sp[i]))
               out.println("<option selected>"+if_sp[i]+"</option>");
             else
               out.println("<option >"+if_sp[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">审 批 人:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <select size="1" name="dd_man">
          <%
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
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="13%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">是否需要复审:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
        <select name="fif">
          <% String fif1=rs.getString("fif").trim();
          String[] fif=new String[]{"是","否"};
          for(int i=0;i<fif.length;i++)
           {
             if(fif1.equals(fif[i]))
               out.println("<option selected>"+fif[i]+"</option>");
             else
               out.println("<option >"+fif[i]+"</option>");
           }
        %>
        </select>
        　 </font>&nbsp;</td>
      <td nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">复 审 者:</font>&nbsp;</td>
      <td><font size="2" color="#000000">
        <select size="1" name="fspman">
		<option ></option>
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
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">邮件通知出库人:</font>&nbsp;</td>
      <td colspan="3"><font size="2" color="#000000"> 
        <select name="remark" size="1" id="remark">
          <%
		   String remark=rs.getString("remark");
  try
  {
    ResultSet rsw=infocrmdb.executeQuery("select name from username");
    while(rsw.next())
    {
      String name1=rsw.getString("name");
            if(remark.equals(name1))
              out.println("<option  selected>"+name1+"</option>");
            else            
              out.println("<option >"+name1+"</option>");
    }
    rsw.close();
  }catch(Exception e){}
%>
        </select>
        </font>&nbsp;</td>
    </tr>
  </table>
</form>
</body><%}}%>
</html>
