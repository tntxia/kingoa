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
%>
<html>
<head>
<title>�޸�����</title>
<script language="JavaScript">
function isValid(){
    if((form1.password.value.length<3)||(form1.password.value.length>20)){
        alert("���������3-20λ��ĸ������!");
	return false;
    }
    else if(form1.password.value!=form1.rs_password.value){
        alert("������������벻��ͬ!");
	return false;
    }
    return true;      
    }
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<jsp:useBean id="AdminChangeBean" scope="page" class="infocrmdb.infocrmdb" /> 
<div align="center"> 
  <p><font color="#FFCC00"><font color="#000000">����Ϣ�ʺ�</font></font></p>
  <form method="post" action="smanagesdo_userchange.jsp"  onSubmit="return isValid();" name="form1">
    <table width="95%" border="0">
      <tr> 
        <td width="26%" bgcolor="#e8ebf5"> 
          <div align="center"><font color="#000000" size="2">����ϢID�ţ�</font>&nbsp;</div>
        </td>
        <td width="21%"> <font size="2"> 
          <%@ page language="java" import="java.sql.*" %>
          <%
			 String  orgid ="";
             String  username="";
             String  userpassword="";
  String sql="select * from messageuser ";
  ResultSet rs = AdminChangeBean.executeQuery(sql); 
  String password="";
  String pwd="";
 if(rs.next()) { 
	orgid = rs.getString("id");
     username=rs.getString("username");
     userpassword=rs.getString("userpassword");
  rs.close();
}
%>
          
          <input type="text" name="id" value="<%=orgid%>">
          </font> 
          <div align="center"></div>
          <div align="center"></div>
        </td>
        <td width="21%" bgcolor="#e8ebf5">
          <div align="center"><font color="#000000" size="2">����Ϣ�ʺţ�</font>&nbsp;</div>
        </td>
        <td width="32%">
          <input type="text" name="username" value="<%=username%>">
        <input name="old_password" type="hidden" id="old_password" value="<%=userpassword%>">        </td>
      </tr>
      <tr> 
        <td width="21%" bgcolor="#e8ebf5"> 
          <div align="center"><font color="#000000" size="2">����Ϣ���룺</font>&nbsp;</div>
        </td>
        <td width="32%"> 
          <div align="left"> <font size="2"> 
            <input name="password" type="password" value="<%=userpassword%>" maxlength="30" >
            </font>&nbsp;</div>
        </td>
        <td width="21%" bgcolor="#e8ebf5"> 
          <div align="center"><font color="#000000" size="2">ȷ�����룺</font>&nbsp;</div>
        </td>
        <td width="32%"> 
          <div align="left"><font face="Arial, Helvetica, sans-serif"> 
            <input name="rs_password" type="password" maxlength="30" value="<%=userpassword%>" >
            </font>&nbsp;</div>
        </td>
      </tr>
      <tr> 
        <td colspan="4" height="9"> 
          <div align="center"> 
            <input type="submit" name="Submit" value="ȷ��">
            <input type="button" name="closebutton" value="�ر�" onClick="javascript:window.close()">
          </div>
          <div align="center"> </div>
        </td>
      </tr>
    </table>
  </form><p>&nbsp;</p></div>
</body>
<%
 AdminChangeBean.closeStmt();
 AdminChangeBean.closeConn();

}}%>
</html>