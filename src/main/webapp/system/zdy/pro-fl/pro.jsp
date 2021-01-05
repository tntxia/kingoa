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
<title>EinfoCRM</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<frameset rows="60%,40%" frameborder="YES" border="1" framespacing="1" cols="*"> 
  <frame name="rtop" scrolling="YES" src="/xclient/product/firkind.jsp" >
  <frame name="rbottom" src="/xclient/product/test.htm">
</frameset>
<noframes> 
<body bgcolor="#ffffff" text="#000000">
</body>
</noframes><%}%> 
</html>
