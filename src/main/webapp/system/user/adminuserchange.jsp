<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../../common/checklogin.jsp" %>
<%@ include file="../../common/checkManageLogin.jsp" %> 
<%

String basePath = request.getContextPath();

%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>用户修改</title>
<script language="JavaScript" src="<%=basePath%>/js/config.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/jquery.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/common.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/system/user/change.js"></script>
<style type="text/css">
<!--
body {
	background-color: #ffffff;
}
.STYLE6 {font-size: 13px}
-->
</style></HEAD>
<body>
<%@ page import="java.sql.*,java.util.*"%> <jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" /> 
<%
request.setCharacterEncoding("GB2312");
  String id=request.getParameter("id");
  String name1 = "";
  String sql="select * from username where nameid=" + id;
  
  ResultSet rs = einfodb.executeQuery(sql); 
  String password="";
  String sex1="";
  String department1="";
  String workj1="";
  String email1="";
  String worktel1="";
  int restrainId = 0;
  String restrainName="";
  String yjxs1="";
  String hometel1="";
  String waptel1="";
  String  ipbd="";
  int err=0;
   String  mail_user="";
   String  mail_password="";
   String  mail_smtp="";
   int deptId = 0;
if(rs.next()) {
	name1 = rs.getString("name");
   sex1=rs.getString("sex").trim();
   password=rs.getString("password");
   department1=rs.getString("name_en");
   workj1=rs.getString("workj");
   email1=rs.getString("email");
   worktel1=rs.getString("worktel");
   restrainId = rs.getInt("restrain_id");
   restrainName=rs.getString("userdate");
   yjxs1=rs.getString("yjxs");
   if(yjxs1!=null){
	   yjxs1 = yjxs1.trim();
   }
   
   deptId = rs.getInt("department_id");
   
   hometel1=rs.getString("hometel");
   waptel1=rs.getString("user_ip"); 
   ipbd=rs.getString("ipbd").trim(); 
   err=rs.getInt("err");
   mail_user=rs.getString("mail_user");
   mail_password=rs.getString("mail_password");
   mail_smtp=rs.getString("mail_smtp"); 
  rs.close();
}
%> <CENTER>
  <br />
  <table width="100%" border="0" cellpadding="3" height="50">
    <tr>
      <td><div align="center"><font size="5"><b><font color="#213e9b">个人信息修改</font></b></font></div>
          <hr width="100%" size="1" noshade color="#213e9b">
      </td>
    </tr>
  </table>
  <FORM METHOD="POST" action="do_adminuserchange.jsp" " name="form" onSubmit="return isValid(this);"> 
<INPUT TYPE="hidden" name="name" value="<%= name1%>"> <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1"> 
<tr> <td bgcolor="#e8ebf5"><FONT SIZE="2">姓　　名</font>&nbsp;</td>
<td> <span class="STYLE6">
  <%if(err>=3){out.print(name1); out.print("<font size='2' color='#FF0000'>被锁定</font>");%> 
  <%}else out.print(name1);%>
</span></td>
<td bgcolor="#e8ebf5"><FONT SIZE="2">性　　别</font>&nbsp;</td>
<td> <select name="sex" id="sex" > 
<%
          String[] sex=new String[]{"男","女"};
          for(int i=0;i<sex.length;i++)
           {
             if(sex1.equals(sex[i]))
               out.println("<option selected>"+sex[i]+"</option>");
             else
               out.println("<option >"+sex[i]+"</option>");
           }
        %> </select> </td></tr> <tr> <td bgcolor="#e8ebf5"><FONT SIZE="2">密　　码</font>&nbsp;</td>
<td> <font face="Arial, Helvetica, sans-serif"> 
<input type="password" size='8' maxlength='8' name="password" value="<%=password%>"> 
&nbsp;*</font>&nbsp;</td><td bgcolor="#e8ebf5"><FONT SIZE="2">确　　认</font>&nbsp;</td>
<td> <font face="Arial, Helvetica, sans-serif"> 
<input type="password" size='8' maxlength='8'name="rs_password" value="<%=password%>"> 
&nbsp;*</font>&nbsp;</td></tr> <tr> 
        <td height="23" bgcolor="#e8ebf5"><font size="2">英文名称</font>&nbsp;</td>
        <td> 
          <input name="department" type="text" value="<%=department1%>" size="6"> 
</td><td bgcolor="#e8ebf5"><FONT SIZE="2">职　　位</font>&nbsp;</td>
<td> <font size="2" face="Arial, Helvetica, sans-serif"> 
<select name="workj" size="1" id="workj"> <%
  				 try
            {
            ResultSet hlrs=einfodb.executeQuery("select role_name from role");
            while(hlrs.next())
           {
            String departname=hlrs.getString("role_name");
            if(workj1.equals(departname))
              out.println("<option  selected>"+departname+"</option>");
            else            
              out.println("<option >"+departname+"</option>");
             }
             hlrs.close();
             }catch(Exception e){}
        %> </select> </font>&nbsp;</td></tr> <tr><TD bgcolor="#e8ebf5"><FONT SIZE="2">办公电话</font>&nbsp;</td>
<TD> 
<INPUT TYPE="text" NAME="worktel" VALUE="<%=worktel1%>"> </TD><td bgcolor="#e8ebf5">&nbsp;</td>
<td>&nbsp;</td></tr> 
<tr> <td bgcolor="#e8ebf5"><div align="left"><FONT SIZE="2">权 限 组</font>&nbsp;</div></td><td> <div align="left"><font face="Arial, Helvetica, sans-serif"> 
</font><font size="2" face="Arial, Helvetica, sans-serif"> 

<select name="restrainId" id="restrainId"> 
<%
  try
  {
    ResultSet rsr=einfodb.executeQuery("select * from restrain");
    while(rsr.next())
    {
      String restrain_name=rsr.getString("restrain_name").trim();
      
      int res_id = rsr.getInt("id");
      
       if(res_id == restrainId)
        out.println("<option value='"+res_id+"' selected='true'>"+restrain_name+"</option>");
	   else
      out.println("<option  value='"+res_id+"' >"+restrain_name+"</option>");
    }
    rsr.close();
  }catch(Exception e){e.printStackTrace();}
%> </select> </font>&nbsp;&nbsp;</div></td><td bgcolor="#e8ebf5"><div align="left"><FONT SIZE="2">所在部门</font>&nbsp;</div></td><td> 
<div align="left">
<select size="1" name="deptId" id="department" onchange="changeDep()"> 
	
 </select> 
 <input type="hidden" name="deptName" id="deptName" value="<%=yjxs1%>"> 
 <input type="hidden" id="defaultDeptId" value="<%=deptId%>">
 &nbsp;</div></td></tr><TR> 
<TD bgcolor="#e8ebf5"><FONT SIZE="2">登 录 ip</font>&nbsp;</td>
<TD> <INPUT TYPE="text" NAME="waptel" VALUE="<%=waptel1%>"> 
</TD><TD bgcolor="#e8ebf5"><FONT SIZE="2">是否邦定</font>&nbsp;</td>
<TD> <FONT SIZE="2" COLOR="#000080" FACE="Arial, Helvetica, sans-serif"> 
<SELECT NAME="ipbd" ID="ipbd" > <%
          String[] item=new String[]{"是","否"};
          for(int i=0;i<item.length;i++)
           {
             if(ipbd.equals(item[i]))
               out.println("<option selected>"+item[i]+"</option>");
             else
               out.println("<option >"+item[i]+"</option>");
           }
        %> </SELECT> </font>&nbsp;</td></TR><TR BGCOLOR="#d3d8eb"><TD COLSPAN="4" bgcolor="#e8ebf5"><FONT SIZE="2">电子促销邮件服务器设置:</font>&nbsp;</td>
</TR><TR><TD WIDTH="20%" bgcolor="#e8ebf5"><FONT SIZE="2">用 
户 名 :</font>&nbsp;</td>
<TD COLSPAN="3"><FONT SIZE="2"><INPUT NAME="mail_user" TYPE="TEXT" ID="user_ip" SIZE="50" VALUE="<%=mail_user%>"></font>&nbsp;</td></TR><TR><TD WIDTH="20%" bgcolor="#e8ebf5"><FONT SIZE="2">密　　码:</font>&nbsp;</td>
<TD COLSPAN="3"><FONT SIZE="2"><INPUT NAME="mail_password" TYPE="PASSWORD" ID="user_ip" SIZE="50" VALUE="<%=mail_password%>"></font>&nbsp;</td></TR><TR><TD WIDTH="20%" bgcolor="#e8ebf5"><FONT SIZE="2">发件邮件:</font>&nbsp;</td>
<TD COLSPAN="3"><INPUT TYPE="text" NAME="email" VALUE="<%=email1%>" SIZE="50"></TD></TR><TR><TD WIDTH="20%" bgcolor="#e8ebf5"><FONT SIZE="2">发件服务器SMTP:</font>&nbsp;</td>
<TD COLSPAN="3"><FONT SIZE="2"><INPUT TYPE="text" NAME="mail_smtp" SIZE="50" VALUE="<%=mail_smtp%>"></font>&nbsp;</td></TR> 
</table><p> <input type="submit" size="4" value=" 确 认 " name="submit"> <input type="button" value=" 关 闭 " onClick="window.close()" name="button"> 
</p></FORM></CENTER>
</BODY>
</HTML>
