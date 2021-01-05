<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../refuse.jsp"
    </script>
<% }%> 
<html>
<head>
<title>工资管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<frameset rows="60%,40%" frameborder="YES" border="1" framespacing="1" cols="*"> 
  <frame name="rtop" scrolling="YES" src="test.htm" >
  <frame name="rbottom" src="wagem.jsp">
</frameset>
<noframes> 
<body bgcolor="#ffffff" text="#000000">
</body>
</noframes> 
</html>
