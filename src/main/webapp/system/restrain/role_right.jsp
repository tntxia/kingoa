<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="com.tntxia.oa.right.*"%>
<jsp:useBean id="einfodb" scope="page" class="com.tntxia.db.DBConnection" />
<jsp:useBean id="rightManager" scope="page" class="com.tntxia.oa.right.RightManager" />
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<%
   //�����޻���
   response.setHeader("progma","no-cache");   
   response.setHeader("Cache-Control","no-cache");   
   response.setDateHeader("Expires",0);
   
   String basePath = request.getContextPath();
   %>

<% String getLoginmessage = (String) session.getValue("loginSign");
String username = (String) session.getAttribute("username");
   if(getLoginmessage !="OK"){
%>
    <script language=javascript>
    window.location="../../refuse.jsp"
    </script>
<% } else {    
 String getaLoginmessage = (String) session.getValue("adminloginSign");
   if(!username.equals("admin") && getaLoginmessage!="admin"){
%>
    <script language=javascript>
    window.location="../manageslogin.jsp"
    </script>
<% } else {
	
String id1=request.getParameter("id");

// ��Ȩ�����ID����ȡȨ�޵���Ϣ
String restrainSql = "select * from restrain where id='"+id1+"'";
ResultSet resRs = einfodb.executeQuery(restrainSql);
if(!resRs.next()){
	out.println("Ȩ�޲�����");
	return;
}

RoleRight roleRight1 = rightManager.getRoleRight(id1,"delete_contact_cg");

RoleRight roleRight2 = rightManager.getRoleRight(id1,"delete_contact_xs");

RoleRight roleRight4 = rightManager.getRoleRight(id1,"excel_out");

ArrayList<Right> rightList = rightManager.getRightList();




%>
<html>
<head>
<title>Ȩ���Զ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">

// �޸�ɾ����ͬ��Ȩ��
function update_delete_contact(type){
	document.form1.right_type.value = "delete_contact_"+type;
	document.form1.submit();
}

// ����Excel��Ȩ��
function update_excel_out(){
	document.form1.right_type.value = "excel_out";
	document.form1.submit();
}

// ����Excel��Ȩ��
function update_role(role_right){
	document.form1.right_type.value = role_right;
	document.form1.submit();
}

// ������ҳ
function backToFrontPage(){
	window.location.href = "<%=basePath%>/einfocrm.jsp";
}

</script>

</head>
<body bgcolor="#ffffff" text="#000000">
<form name="form1" method="post" action="do_role_right.jsp" > 
<input name="right_type" type="hidden">
�����ӹ��ܵ�Ȩ�����ã�

  <table width="100%" border="1" cellspacing="0" cellpadding="0">
    
    <tr> 
      <td height="2" colspan="7"><b></b> 
        <div align="left"><font color="#000000"> </font></div>
        <font color="#000000"><b>Ȩ���飺
        <input readonly="readonly" name="restrain_name" type="text" id="restrain_name" value="<%=resRs.getString("restrain_name").trim()%>">
        <input name="id" type="hidden" id="id" value="<%=id1%>">
        </b></font></td>
    </tr>
    <tr> 
      <td width="15%"> 
        <div align="center"><font size="2"><strong>��������</strong></font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2"><strong>����Ȩ��</strong></font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2"><strong>�޸�Ȩ��</strong></font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2"><strong>ɾ��Ȩ��</strong></font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2"><strong>�鿴�����������˵���Ϣ</strong></font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2"><strong>�Ƿ����</strong></font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2"><strong>����</strong></font></div>      </td>
    </tr>
    
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><b><font size="2">��ɾ��ͬ(�ɹ�����)</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����">
          <input name="delete_contact_cg" disabled="disabled" type="checkbox" id="qzadd" value="1" <%=roleRight1.getRight_add()==1?"checked":""%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="delete_contact_cg" disabled="disabled" type="checkbox" id="qzmod" value="2" <%=roleRight1.getRight_update()==1?"checked":""%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="delete_contact_cg" disabled="disabled" type="checkbox" id="qzdel" value="3"  <%=roleRight1.getRight_delete()==1?"checked":""%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="delete_contact_cg" disabled="disabled" type="checkbox" id="qzview" value="4">
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����">
          <input name="delete_contact_cg" type="checkbox" id="qzzt" value="5" <%=roleRight1.getRight_enable()==1?"checked":""%>>
          </font></div>      </td>
      <td width="12%"> 
        <input type="button" value="����" onclick="update_delete_contact('cg')"></td>
    </tr>
    
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><b><font size="2">��ɾ��ͬ(���۹���)</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����">
          <input name="delete_contact_xs" disabled="disabled" type="checkbox" id="qzadd" value="1" <%=roleRight2.getRight_add()==1?"checked":""%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="delete_contact_xs" disabled="disabled" type="checkbox" id="qzmod" value="2" <%=roleRight2.getRight_update()==1?"checked":""%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="delete_contact_xs" disabled="disabled" type="checkbox" id="qzdel" value="3"  <%=roleRight2.getRight_delete()==1?"checked":""%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="delete_contact_xs" disabled="disabled" type="checkbox" id="qzview" value="4">
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����">
          <input name="delete_contact_xs" type="checkbox" id="qzzt" value="5" <%=roleRight2.getRight_enable()==1?"checked":""%>>
          </font></div>      </td>
      <td width="12%"> 
        <input type="button" value="����" onclick="update_delete_contact('xs')"></td>
    </tr>
    
    <tr bgcolor="#AAFFAA"> 
      <td width="15%"><b><font size="2">Excel����</font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����">
          <input name="excel_out" disabled="disabled" type="checkbox" id="qzadd" value="1" <%=roleRight4.getRight_add()==1?"checked":""%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="excel_out" disabled="disabled" type="checkbox" value="2" <%=roleRight4.getRight_update()==1?"checked":""%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="excel_out" disabled="disabled" type="checkbox" id="qzdel" value="3"  <%=roleRight4.getRight_delete()==1?"checked":""%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="excel_out" disabled="disabled" type="checkbox" value="4">
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����">
          <input name="excel_out" type="checkbox" value="5" <%=roleRight4.getRight_enable()==1?"checked":""%>>
          </font></div>      </td>
      <td width="12%"> 
        <input type="button" value="����" onclick="update_excel_out()"></td>
    </tr>
    
    <%
    for(int i=0;i<rightList.size();i++){
    	Right right = rightList.get(i);
    	RoleRight roleRight = rightManager.getRoleRight(id1,right.getRightName());
    	%>
   	<tr bgcolor="<%=i%2==0?"#AAFFAA":"" %>"> 
      <td width="15%"><b><font size="2"><%=right.getRightDisplay() %></font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����">
          <input name="<%=right.getRightName() %>" disabled="disabled" type="checkbox" id="qzadd" value="1" <%=roleRight.getRight_add()==1?"checked":""%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="<%=right.getRightName() %>" disabled="disabled" type="checkbox" value="2" <%=roleRight.getRight_update()==1?"checked":""%>>
          </font></div>      </td>
      <td width="14%"> 
        <div align="center"><font size="2" face="����"> 
          <input name="<%=right.getRightName() %>" disabled="disabled" type="checkbox" id="qzdel" value="3"  <%=roleRight.getRight_delete()==1?"checked":""%>>
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����"> 
          
          <input name="<%=right.getRightName() %>" disabled="disabled" type="checkbox" value="4">
          </font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����">
          <input name="<%=right.getRightName() %>" type="checkbox" value="5" <%=roleRight.getRight_enable()==1?"checked":""%>>
          </font></div>      </td>
      <td width="12%"> 
        <input type="button" value="����" onclick="update_role('<%=right.getRightName() %>')"></td>
    </tr> 	
   
    	<%
    }
    
    %>
    
  </table>
</form>
</body>
<%}}%>
</html>
<script language=javascript>
function allSelect_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("add") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function allSelect2_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect2.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("zt") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function allSelect3_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect3.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("mod") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function allSelect4_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect4.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("del") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function allSelect5_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect5.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("view") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}
function allSelect6_onclick()
{
   var length = document.form1.elements.length;
   var tocheck = document.form1.allSelect6.checked;
   for (var i=0; i<length; i++)
   {
     if (document.form1.elements[i].name.indexOf("yes") != -1)
	document.form1.elements[i].checked =tocheck;
   }
}

</script>
