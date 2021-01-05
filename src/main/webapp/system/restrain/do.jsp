<%@ page contentType="text/html;charset=gb2312" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
</head>

<body>
<%
 String ename=request.getParameter("restrain_name");
 String qzadd=request.getParameter("qzadd");
 out.print(qzadd);
 out.print("kaifa");
  if(qzadd!=null){
  qzadd="有";
  }
  else
  {
  qzadd="无";
  }
 out.print(qzadd);

%>
</body>
</html>
