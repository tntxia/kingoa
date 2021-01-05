<jsp:useBean id="einfodb" scope="page" class="bankdb.bankdb" />
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
String seckind=request.getParameter("seckind");
%>
<html>
<head>
<title>产品管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function isValid(){
    if(form1.profl.value==""){
        alert("暂无小类,请添加小类!");
        form1.profl.focus();        
	return false;
    }
      
    else {
        return true;
    }
}
</script>
</head>


<body bgcolor="#ffffff" text="#000000" background="../../images/main_bg.gif">
<form name="form1" method="post" action="cpro.jsp" onSubmit="return isValid();" target="rbottom">
  <p>
  </p>
  <p><font size="2" color="#000080">中类代码:</font><font size="2" color="#000000"> 
     &gt;&gt;<b><%=seckind%>
    <input type="hidden" name="seckind" value="<%=seckind%>">
    </b></font></p>
  <p><font size="2"> 
    <select size="8" name="profl">
      <%
  try
  {
    ResultSet rs=einfodb.executeQuery("select proflname,codename from profll where seccode='"+seckind+"'");
    while(rs.next())
    {
      String proflname=rs.getString("proflname");
	  String codename=rs.getString("codename");
      out.println("<option value='"+seckind+""+codename+"'>"+proflname+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%>
    </select>
    </font> <font size="2" color="#000000"> 
    <input type="submit" name="Submit" value="显示产品列表" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" >
    </font><font size="2" color="#666600"> </font><font size="2" color="#000000"> 
    <input type="button" name="Submit2" value="返回中类" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onclick=javascript:history.back()>
    </font><font color="#000000"> </font> 
  <p>&nbsp;</p>
  <p><font size="2" color="#666600"> </font></p>
  </form>
</body><%}%>
</html>
