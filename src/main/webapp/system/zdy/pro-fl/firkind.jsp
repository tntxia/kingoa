<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
%>
<html>
<head>
<title>产品</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<frameset cols="50%,50%" frameborder="NO" border="0" framespacing="0" rows="*"> 
  <frame name="main" src="zjkindf.jsp">
  <frame name="right" scrolling="YES" noresize src="test.htm">
</frameset>
<noframes> 
<body bgcolor="#ffffff" text="#000000">
</body>
</noframes><%}%>
</html>
