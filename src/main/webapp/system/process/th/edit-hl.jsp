<jsp:useBean id="infocrmdb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page import="java.sql.*,java.util.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
<%@ include file="../../../common/checklogin.jsp"%>
<%@ include file="../../../common/checkManageLogin.jsp"%>
<html>
<head>
<title>退货审批流程 修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String id2=request.getParameter("id");
String sql="select  * from thsp where id='"+id2+"'";
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
      <td width="16%"><font size="2" color="#000000">编辑 &gt;&gt; 
        <input type="hidden" name="id" value="<%=id2%>">
        </font>&nbsp;</td>
      <td colspan="3"> <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="保存" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font><font size="2"> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()">
          </font><font size="2" color="#000000"> </font>&nbsp;</div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" bgcolor="#e8ebf5"><font size="2" color="#000000">退货申请部门:</font>&nbsp;</td>
      <td width="24%"><font size="2" face="Arial, Helvetica, sans-serif"> 
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
      <td width="19%" bgcolor="#e8ebf5"><font size="2" color="#000000">退货申请人职位:</font>&nbsp;</td>
      <td width="41%"> <font color="#000000" size="2"> 
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
      <td><font color="#000000">&nbsp;</font>&nbsp;</td>
      <td>&nbsp;</td>
      <td colspan="2"><font size="2" color="#000000">第一审批人: 
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
      <td bgcolor="#e8ebf5"><font size="2" color="#000000">是否需要二审:</font>&nbsp;</td>
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
      <td colspan="2"><font size="2" color="#000000">第二审批人: 
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
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" bgcolor="#e8ebf5"><font size="2" color="#000000">是否需要三审:</font>&nbsp;</td>
      <td><font size="2" color="#000000">
          <select name="firspif" id="firspif">
          <% String firspif1=rs.getString("firspif").trim();
          String[] firspif=new String[]{"是","否"};
          for(int i=0;i<firspif.length;i++)
           {
             if(firspif1.equals(firspif[i]))
               out.println("<option selected>"+firspif[i]+"</option>");
             else
               out.println("<option >"+firspif[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td colspan="2"><font size="2" color="#000000">第三审批人: 
        <select name="firspman" size="1" id="firspman">
          <%
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
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" bgcolor="#e8ebf5"><font size="2" color="#000000">备　　注:</font>&nbsp;</td>
      <td colspan="3"> <textarea name="remark" cols="60"><%=rs.getString("remark")%></textarea>      </td>
    </tr>
  </table>
</form>
</body>
</html>
