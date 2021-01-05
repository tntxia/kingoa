<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../refuse.jsp"
    </script>
<% } else {    
 String getaLoginmessage = (String) session.getValue("adminloginSign");
   if(getaLoginmessage!="admin"){
%>
    <script language=javascript>
    window.location="manageslogin.jsp"
    </script>
<% } else {   
  String dept_types=request.getParameter("dept_types").trim();
 String dept_code=request.getParameter("dept_code");
 String dept_ntypes="";
 String  dept_types_name="";
  if(dept_types.equals("1")){
    dept_ntypes="2";
     dept_types_name="一级部门";
}
  if(dept_types.equals("2")){
    dept_ntypes="3";
     dept_types_name="二级部门";
}
  if(dept_types.equals("3")){
    dept_ntypes="4";
     dept_types_name="三级部门";
}
  if(dept_types.equals("4")){
    dept_ntypes="5";
     dept_types_name="四级部门";
}
  if(dept_types.equals("5")){
    dept_ntypes="6";
     dept_types_name="五级部门";
}
  if(dept_types.equals("6")){
    dept_ntypes="7";
     dept_types_name="六级部门";
}
%>
<html>
<head>
<title>芯片商城有限公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="do_nmdg.jsp">
  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="12%"><table width="90" height="18" border="0" cellspacing="0" cellpadding="0">
        <tr><td><font size="2" color="#000000">增加部门 &gt;&gt;</font></td></tr></table></td>
      <td colspan="3"> <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="保存信息" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="重新填写" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
        </div></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="12%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">部门名称:</font>&nbsp;</td>
      <td colspan="3"><font size="2" color="#000000"> 
        <input name="departname" type="text" size="60">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td nowrap bgcolor="#e8ebf5"><font color="#000000" size="2">部门类型:</font>&nbsp;</td>
      <td width="37%"><%=dept_types_name%>
        <input name="dept_types" type="hidden" id="dept_types" value="<%=dept_ntypes%>">
        <input name="dept_code2" type="hidden" id="dept_code2" value="<%=dept_code%>"></td>
      <td width="9%" nowrap bgcolor="#e8ebf5"><font color="#000000" size="2">部门编号:</font>&nbsp;</td>
      <td width="42%"><font size="2" face="Arial, Helvetica, sans-serif"> <%=dept_code%> 
        <select name="dept_code" id="dept_code">
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">A</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">B</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">C</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">D</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">E</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">F</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">G</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">H</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">I</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">J</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">K</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">L</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">M</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">N</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">O</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">P</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Q</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">R</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">S</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">T</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">U</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">V</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">W</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">X</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Y</font></option>
          <option><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Z</font></option>
        </select>
        </font><font size="5"><b><font size="2" color="#000000">
        <% String getmessage = (String) session.getValue("dept_message");
   if(getmessage==null) getmessage="";
%>
        <%= getmessage %></font></b></font><font color="#000000" size="2">&nbsp; 
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="12%" nowrap bgcolor="#e8ebf5"><font size="2" color="#000000">部门简称:</font>&nbsp;</td>
      <td colspan="3"> <div align="left"><font size="2" color="#000000"> 
          </font> <font size="2" color="#000000"> 
          <input name="remark" type="text" value="" size="45">
          </font>&nbsp;</div></td>
    </tr>
  </table>
  <p><font size="2">说明：部门类型级别高的可查阅级别低的。</font></p>
</form>
</body>
<%}}%>
</html>
