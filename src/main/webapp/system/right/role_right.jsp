<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="com.tntxia.oa.system.entity.*"%>
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<%
   
   String basePath = request.getContextPath();
   
   List<Right> rightList = (List<Right>)request.getAttribute("rightList");
   
   List<Right> roleRightList = (List<Right>)request.getAttribute("roleRightList");
   
   Restrain restrain = (Restrain) request.getAttribute("restrain");
%>
<html>
<head>
<title>Ȩ���Զ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<script language="JavaScript" src="<%=basePath%>/js/config.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/jquery.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/common.js"></script>
<script language="JavaScript" src="<%=basePath%>/js/system/right/right.js"></script>

</head>
<body bgcolor="#ffffff" text="#000000">
<input name="right_type" type="hidden">
	�����ӹ��ܵ�Ȩ�����ã�<button onclick="changeRight()">ȷ��</button>

  <table width="100%" border="1" cellspacing="0" cellpadding="0">
    
    <tr> 
      <td height="2" colspan="7"><b></b> 
        <div align="left"><font color="#000000"> </font></div>
        <font color="#000000"><b>Ȩ���飺<%=restrain.getName()%>
        <input name="id" type="hidden" id="id" value="<%=restrain.getId()%>">
        </b></font></td>
    </tr>
    <tr> 
      <td width="12%"> 
        <div align="center"><font size="2"><strong>Ȩ������</strong></font></div>      </td>
      <td width="12%"> 
        <div align="center"><font size="2"><strong>�Ƿ����</strong></font></div>      </td>
    </tr>
    
    
    <%
    for(int i=0;i<rightList.size();i++){
    	Right right = rightList.get(i);
    	boolean checked = false;
    	
    	// �鿴Ȩ���Ƿ���� 
    	for(Right r : roleRightList){
    		if(r.getId()==right.getId()){
    			checked = true;
    			break;
    		}
    	}
    	%>
   	<tr bgcolor="<%=i%2==0?"#AAFFAA":"" %>"> 
      <td width="15%"><b><font size="2"><%=right.getRightDisplay() %></font></b></td>
      <td width="12%"> 
        <div align="center"><font size="2" face="����">
          <input value="<%=right.getId() %>" type="checkbox" <%=checked?"checked":""%>>
        </div>      
      </td>
      
    </tr> 	
   
    	<%
    }
    
    %>
    
  </table>
</body>
</html>
