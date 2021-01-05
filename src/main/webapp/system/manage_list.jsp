<%@ page contentType="text/html;charset=gb2312" %>
<%@ page language="java" import="java.sql.*" %>
<%@ include file="../common/checklogin.jsp" %>
<%@ include file="../common/checkManageLogin.jsp" %> 
<jsp:useBean id="UserBean" scope="page" class="infocrmdb.infocrmdb" />
<% 
  String name1="";
  String sex1="";
  String password1="";
  String department1="";
  String workj1="";
  String email1="";
  String worktel1="";
  String userdate1="";
  String yjxs1="";
  String hometel1="";
  String waptel1="";
  String queryName="";
  String strDelete="";
  int err=0;
  String checkInside=(String) session.getValue("insideUserList");
  if (checkInside==null)
     {
       session.putValue("insideUserList","insideUserList");
       String sql="select top 1 * from username";
       ResultSet rs = UserBean.executeQuery(sql); 
       if(rs.next()) { 
   name1=rs.getString("name");
   sex1=rs.getString("sex");
   password1=rs.getString("password");
   department1=rs.getString("name_en");
   workj1=rs.getString("workj");
   email1=rs.getString("email");
   worktel1=rs.getString("worktel");
   userdate1=rs.getString("userdate");
   yjxs1=rs.getString("yjxs");
   hometel1=rs.getString("hometel");
   waptel1=rs.getString("user_ip"); 
   err=rs.getInt("err");
         rs=null;
         UserBean.closeStmt(); 
         queryName=name1;  
       }  
   }
  else{
    queryName =request.getParameter("qName");
    strDelete=request.getParameter("delbutton");
    if (strDelete==null) 
     {
       String sql="select top 1 * from username where name='" + queryName + "'";
       ResultSet rs = UserBean.executeQuery(sql); 
       if(rs.next()) { 
   name1=rs.getString("name");
   sex1=rs.getString("sex");
   password1=rs.getString("password");
   department1=rs.getString("name_en");
   workj1=rs.getString("workj");
   email1=rs.getString("email");
   worktel1=rs.getString("worktel");
   userdate1=rs.getString("userdate");
   yjxs1=rs.getString("yjxs");
   hometel1=rs.getString("hometel");
   waptel1=rs.getString("user_ip"); 
   err=rs.getInt("err");
         rs=null;
         UserBean.closeStmt(); 
        }
     }
     else{         
       String sql1="select top 1 * from username";  
       ResultSet rs = UserBean.executeQuery(sql1);
       if(rs.next()) { 
   name1=rs.getString("name");
   sex1=rs.getString("sex");
   password1=rs.getString("password");
   department1=rs.getString("name_en");
   workj1=rs.getString("workj");
   email1=rs.getString("email");
   worktel1=rs.getString("worktel");
   userdate1=rs.getString("userdate");
   yjxs1=rs.getString("yjxs");
   hometel1=rs.getString("hometel");
   waptel1=rs.getString("user_ip"); 
   err=rs.getInt("err");
         rs=null;
         UserBean.closeStmt(); 
         queryName=name1;  
       }  
     }
  }  
%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>用户信息管理</title>
<script language="javascript">
function changeName(){
  var getName=document.form1.nameSelect.options[document.form1.nameSelect.selectedIndex].text;
  window.location="manage_list.jsp?qName=" + getName;
  return;
}

function delclick(){
 if (confirm("确实要删除吗？")) {
  if(document.form1.nameSelect.length==0)
   { alert("没有记录用于删除！");
      return;
   }
  var getName=document.form1.nameSelect.options[document.form1.nameSelect.selectedIndex].text;
  //window.location="manage_list_deal.jsp?qName=" + getName + "&delbutton=OK";
   document.form1.action="manage_list_deal.jsp?qName=" + getName;
   document.form1.submit();
 }
 return;
}
function modclick(){
 if (confirm("确实要修改吗？")) {
  if(document.form1.nameSelect.length==0)
   { alert("没有记录用于修改！");
      return;
   }
  var getName=document.form1.nameSelect.options[document.form1.nameSelect.selectedIndex].text;
  window.open("adminuserchange.jsp?name="+ getName,"adminwdn", "height=260, width=600, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no");
 }
 return;
}
</script>

<style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
-->
</style></HEAD>
<style type="text/css">
<!--
.H1 {font-size:12pt; line-height:15pt; align=center}
.ourfont {font-size:9pt; line-height:15pt; }
.ourfont1 {font-size:8pt; line-height:13pt; }
A{text-transform: none; text-decoration:none;color:#0000ff}
a:hover {text-decoration:underline;color:#0000ff}
-->
</style>

<body topmargin="0" marginwidth="0" marginheight="0">
<CENTER>  <form name="form1" method="post"> 
  <table width="100%" border="0" cellpadding="3" height="50">
    <tr>
      <td><div align="center"><font size="5"><b><font color="#213e9b">用户信息管理</font></b></font></div>
          <hr width="100%" size="1" noshade color="#213e9b">
      </td>
    </tr>
  </table>

<table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
<TR> <TD width="17%" rowspan='5' align='left' valign="top"><FONT FACE="宋体" COLOR="#000000" size="2">登录名：</FONT><br> 
<select name="nameSelect" size="12" onChange="changeName()"> <%
  String strSQL="select distinct name from username"; 
  ResultSet rs = UserBean.executeQuery(strSQL); 
  String name2="";
  while (rs.next()){
     name2=rs.getString("name");
     out.print("<option");
     if (name2.equals(queryName))
        out.print(" selected>");
     else
        out.print( ">");
     out.print(name2); 
     out.print("</option>");
   }
%> </select> </TD><TD width="7%" align='left' nowrap bgcolor="#e8ebf5"><FONT COLOR="#000000" size="2" FACE="宋体">登 
录 名: 
</font>&nbsp;</td>
<TD width="35%" align='left'><FONT COLOR="#000000" size="2" FACE="宋体">
    <%if(err>=3){out.print(name1); out.print("<font size='2' color='#FF0000'>被锁定</font>");}else out.print(name1);%> 　
</font>&nbsp;</td>
<TD colspan="2" align='left'>　</TD>
</TR> <TR> 
        <TD align='left' nowrap bgcolor="#e8ebf5"><font color="#000000" size="2" face="宋体">英文名称:</font>&nbsp;</td>
        <TD align='left'><font color="#000000" size="2" face="宋体"><%= department1%>　</font>&nbsp;</td>
        <TD width="7%" align='left' nowrap bgcolor="#e8ebf5"><FONT COLOR="#000000" size="2" FACE="宋体">权限组：</font>&nbsp;</td>
        <TD width="34%" align='left'><FONT COLOR="#000000" size="2" FACE="宋体"><%= userdate1%>　</font>&nbsp;</td>
</TR> 
<TR> <TD align='left' nowrap bgcolor="#e8ebf5"><FONT COLOR="#000000" size="2" FACE="宋体">职　　位:</font>&nbsp;</td>
    <TD align='left'><FONT COLOR="#000000" size="2" FACE="宋体"><%= workj1%>　</font>&nbsp;</td>
    <TD align='left' nowrap bgcolor="#e8ebf5"><FONT COLOR="#000000" size="2" FACE="宋体">电　话：&nbsp; 
</FONT>    
    <TD align='left'><FONT COLOR="#000000" size="2" FACE="宋体"><%= worktel1%></FONT> 　    
</TR> <tr> <td colspan='4' align='center'> <input type="button" value="增加用户" name="B223" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('user/register.jsp','adminwdn', 'height=436, width=900, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')"> 
<input type="button" value=" 修改用户" name="B223" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('user/adminuserchange.jsp?name=<%=name1%>','adminwdn', 'height=436, width=900, top=100, left=100, toolbar=yes, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no')"> 
<input type="button" name="delbutton" value="删除用户" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="delclick()"> 
<input type="reset" name="Submit5" value=" 关 闭 " style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()"> 
</td></TR> </TABLE>
</form></CENTER><script language="javascript">
   document.form1.nameSelect.focus();
 </script> 
</BODY>
</HTML>