<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,java.util.*,java.text.*,com.tntxia.oa.system.entity.*"%>
<%
   //�����޻���
   response.setHeader("progma","no-cache");   
   response.setHeader("Cache-Control","no-cache");   
   response.setDateHeader("Expires",0);
   
   String basePath = request.getContextPath();
   List<Right> rightList = (List<Right>)request.getAttribute("rightList");
   
%>
<html>
<head>
<title>Ȩ�޹���</title>
<script type="text/javascript" src="<%=basePath%>/js/config.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.js"></script>
<script type="text/javascript">
function addRight(){
	window.location.href = "rightAdd.jsp";
}

function updateRight(id){
	
	var name = $("#name"+id).val();
	var display = $("#display"+id).val();
	var data = {
		id:id,
		name:name,
		display:display
	};
	$.ajax({
		url:'rightUpdate.dispatch',
		type:'post',
		data:data,
		dataType:'json',
		success:function(data){
			if(data.success){
				alert("�����ɹ�");
			}else{
				alert("����ʧ��");
			}
		}
	});
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
</head>
<body bgcolor="#ffffff">

<input type="button" onclick="addRight()" value="����" />

  <table width="100%" border="1" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="15%"> 
        <div align="center"><font size="2"><strong>id</strong></font></div></td>
      <td width="12%"> 
        <div align="center"><font size="2"><strong>����</strong></font></div></td>
      <td width="12%"> 
        <div align="center"><font size="2"><strong>��ʾ����</strong></font></div></td>
      <td width="12%"> 
        <div align="center"><font size="2"><strong>����</strong></font></div></td>
    </tr>
    <%
    for(int i=0;i<rightList.size();i++){
    	Right right = rightList.get(i);
    	int id = right.getId();
    	%>
   	<tr bgcolor="<%=i%2==0?"#AAFFAA":"" %>"> 
      <td width="15%"><b><font size="2"><%=id %></font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����">
          <input name="name" value="<%=right.getRightName() %>" id="name<%=id %>" />
          </font></div>      </td>
      <td width="12%"> 
          <input name="display" value="<%=right.getRightDisplay() %>"  id="display<%=id %>"/>
      </td>
      <td><button onclick='updateRight(<%=id %>)'>�޸�</button><button>ɾ��</button></td>
      
    </tr> 	
   
    	<%
    }
    
    %>
    
  </table>
</body>
</html>