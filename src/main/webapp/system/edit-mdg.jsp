<jsp:useBean id="infocrmdb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page import="java.sql.*,java.util.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
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
<title>оƬ�̳����޹�˾</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String id2=request.getParameter("id");
String sql="select  * from department where id='"+id2+"'";
ResultSet rs=infocrmdb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
%>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="doedit_mdg.jsp">
<INPUT TYPE="hidden" name="id" value="<%=id2%>">

  <br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <TR BGCOLOR="#d3d8eb"> 
      <td width="24%"><font size="2" color="#000000">�༭ &gt;&gt;</font>&nbsp;</td>
      <td width="76%"> <div align="right"><font size="2" color="#000000"> 
          <input type="submit" name="Submit" value="����" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
          </font><font size="2"> 
          <input type="reset" name="Submit5" value="ȡ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()">
          </font><font size="2" color="#000000"> </font>&nbsp;</div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="24%"><font size="2" color="#000000">��������:</font>&nbsp;</td>
      <td width="76%"><font size="2" color="#000000"> 
	  <%String dept=rs.getString(2);%>
        <input name="departname" type="text" value="<%=dept%>" size="38">
        <INPUT TYPE="hidden" name="dept" value="<%=dept%>">
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td><font size="2" color="#000000">��������:</font>&nbsp;</td>
      <td><font size="2" color="#000000"> 
		<%int  dept_types=rs.getInt(3);
	   if(dept_types==1)
	   out.print("��������");
     if(dept_types==2)
	   out.print("һ������");
	    if(dept_types==3)
	   out.print("��������");
	     if(dept_types==4)
	   out.print("��������");
	    if(dept_types==5)
	   out.print("�ļ�����");
	    if(dept_types==6)
	   out.print("�弶����");
	   	   %>
        </font>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="24%"><font size="2" color="#000000">���ż��:</font>&nbsp;</td>
      <td width="76%"> <div align="left"><font size="2" color="#000000"> </font> 
          <font size="2" color="#000000"> 
          <input name="remark" type="text" value="<%=rs.getString(5)%>" size="38">
          </font>&nbsp;</div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="24%"><font size="2" color="#000000">���Ÿ�����:</font>&nbsp;</td>
      <td width="76%"> <div align="left"><font size="2" color="#000000"> </font> 
          <font size="2" color="#000000"> 
          <select name="leader"><option value="">��ѡ��</option>
          <%
          String leader = rs.getString("leader");
          ResultSet user_rs = infocrmdb.executeQuery("select name from username where yjxs ='"+dept+"'");
          while(user_rs.next()){
        	  String name = user_rs.getString("name");
        	  if(leader==null) leader = "";
        	  %>
        	  <option value="<%=name %>" <%=name.trim().equals(leader.trim())?"selected":"" %> ><%=name %></option>
        	  <% 
          }
          user_rs.close();
          
          %>
          
          </select>
          </font>&nbsp;</div></td>
    </tr>
  </table>
  </form>
</body>
<%}}%>
</html>
