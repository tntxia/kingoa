<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../../common/checklogin.jsp"%>
<%@ include file="../../common/checkManageLogin.jsp"%>
<%@ page import="java.sql.*,java.util.*"%>

<jsp:useBean id="infocrmdb" scope="page" class="infocrmdb.infocrmdb" />
<%
java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String currentDate=simple.format(new java.util.Date());
%>
<html>
<head>
<title>新增合同审批流程</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

</script>

</head>
<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="notice.dispatch">
	<input type="hidden" name="method" value="addFlow">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="18%"><font size="2" color="#000000">公告审批流程</font>&nbsp;</td>
      <td colspan="3"> <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
        </div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"><font size="2" color="#000000">申请部门:</font>&nbsp;</td>
      <td width="41%"><font size="2" face="Arial, Helvetica, sans-serif"> 
        <select size="1" name="dept">
          <%
  try
  {
    ResultSet rs=infocrmdb.executeQuery("select departname from department");
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
      <td width="15%"><font size="2" color="#000000">申请人职位:</font>&nbsp;</td>
      <td width="26%"> <font size="2"> 
        <select name="role" size="1" id="role">
          <%
  try
  {
    ResultSet rs=infocrmdb.executeQuery("select role_name from role");
    while(rs.next())
    {
      String name=rs.getString("role_name");
      out.println("<option value='"+name+"'>"+name+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"><font size="2" color="#000000">是否需要审批:</font>&nbsp;</td>
      <td><font size="2">
        <select name="ifsp" id="ifsp">
          <option>是</option>
          <option>否</option>
        </select>
        </font>&nbsp;</td>
      <td><font size="2" color="#000000">审批人:</font>&nbsp;</td>
      <td><font size="2"> 
        <select size="1" name="dd_man">
          <%
  try
  {
    ResultSet rs=infocrmdb.executeQuery("select name from username");
    while(rs.next())
    {
      String name=rs.getString("name");
      out.println("<option value='"+name+"'>"+name+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"><font size="2" color="#000000">备　　注:</font>&nbsp;</td>
      <td colspan="3"> <textarea name="remark" cols="60"></textarea>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"><font size="2" color="#000000">添加日期:</font>&nbsp;</td>
      <td colspan="3"> <div align="left"><font size="2" color="#000000"> </font> 
          <input type="hidden" name="dd_date" value="<%=currentDate%>">
          <%=currentDate%> </div></td>
    </tr>
  </table>
</form>
</body>
</html>

