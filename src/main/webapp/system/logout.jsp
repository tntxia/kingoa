<%@ page contentType="text/html;charset=gb2312" %> 
<%@ page import="onLineUser,java.util.*" %> 
<jsp:useBean id="onlineuser" class="onLineUser" scope="application"/>
<html> 
<head> 
<title>重新登陆</title>
</head>
<body >
<center>
  <a href="logout.jsp" style="font-size: 12px"></a>
</center><div align="center">
<br><br><br><br>
  <p><img src="../images/cg.jpg" width="111" height="111"></p>

    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
    <p style="font-size:16px; color: #f00; font-family:'宋体'; letter-spacing:0px; vertical-align:middle;">
<% 
   String username=request.getParameter("username");
   if(onlineuser.deleteUser(username))
       out.println(username+":已经被强制退出系统!");
   else
       out.println(username+"没有登陆到系统！");
%> 
<center> 
  <p><a href="../indexlog.jsp" target="firstwn" style="font-size: 12px">重新登陆</a></p>
  <p> </p>
</center> </div>
</body> 
</html>  