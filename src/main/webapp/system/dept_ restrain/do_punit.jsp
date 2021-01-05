<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../refuse.jsp"
    </script>
<% } else {    
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>增加增加单位自定义</title>
<link rel=stylesheet href="../client/style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
 String ename=request.getParameter("ename");
 String dept=request.getParameter("dept");
 String qzadd=request.getParameter("qzadd");
 String qzmod=request.getParameter("qzmod");
 String qzdel=request.getParameter("qzdel");
 String qzview=request.getParameter("qzview");
 String qzzt=request.getParameter("qzzt");
 String xhadd=request.getParameter("xhadd");
 String xhmod=request.getParameter("xhmod");
 String xhdel=request.getParameter("xhdel");
 String xhview=request.getParameter("xhview");
 String xhzt=request.getParameter("xhzt");
 String linkadd=request.getParameter("linkadd");
 String linkmod=request.getParameter("linkmod");
 String linkdel=request.getParameter("linkdel");
 String linkview=request.getParameter("linkview");
 String linkzt=request.getParameter("linkzt");
 String supadd=request.getParameter("supadd");
 String supmod=request.getParameter("supmod");
 String supdel=request.getParameter("supdel");
 String supview=request.getParameter("supview");
 String supzt=request.getParameter("supzt");
 String actadd=request.getParameter("actadd");
 String actmod=request.getParameter("actmod");
 String actdel=request.getParameter("actdel");
 String actview=request.getParameter("actview");
 String actzt=request.getParameter("actzt");
 String opadd=request.getParameter("opadd");
 String opmod=request.getParameter("opmod");
 String opdel=request.getParameter("opdel");
 String opview=request.getParameter("opview");
 String opzt=request.getParameter("opzt");
 String quoteadd=request.getParameter("quoteadd");
 String quotemod=request.getParameter("quotemod");
 String quotedel=request.getParameter("quotedel");
String quoteview=request.getParameter("quoteview");
String quotezt=request.getParameter("quotezt");
String serveradd=request.getParameter("serveradd");
 String servermod=request.getParameter("servermod");
 String serverdel=request.getParameter("serverdel");
 String serverview=request.getParameter("serverview");
 String serverzt=request.getParameter("serverzt");
 String proadd=request.getParameter("proadd");
 String promod=request.getParameter("promod");
 String prodel=request.getParameter("prodel");
 String proview=request.getParameter("proview");
 String prozt=request.getParameter("prozt");
 String samadd=request.getParameter("samadd");
 String sammod=request.getParameter("sammod");
 String samdel=request.getParameter("samdel");
 String samview=request.getParameter("samview");
 String samzt=request.getParameter("samzt");
 String psamadd=request.getParameter("psamadd");
 String psammod=request.getParameter("psammod");
 String psamdel=request.getParameter("psamdel");
 String psamview=request.getParameter("psamview");
 String psamzt=request.getParameter("psamzt");
 String cgadd=request.getParameter("cgadd");
 String cgmod=request.getParameter("cgmod");
 String cgdel=request.getParameter("cgdel");
 String cgview=request.getParameter("cgview");
 String cgzt=request.getParameter("cgzt");
 String tradd=request.getParameter("tradd");
 String trmod=request.getParameter("trmod");
 String trdel=request.getParameter("trdel");
 String trview=request.getParameter("trview");
 String trzt=request.getParameter("trzt");
 String hdadd=request.getParameter("hdadd");
 String hdmod=request.getParameter("hdmod");
 String hddel=request.getParameter("hddel");
 String hdview=request.getParameter("hdview");
 String hdzt=request.getParameter("hdzt");
 String workadd=request.getParameter("workadd");
 String workmod=request.getParameter("workmod");
 String workdel=request.getParameter("workdel");
 String workview=request.getParameter("workview");
 String workzt=request.getParameter("workzt");
 String xmadd=request.getParameter("xmadd");
 String xmmod=request.getParameter("xmmod");
 String xmdel=request.getParameter("xmdel");
 String xmview=request.getParameter("xmview");
 String xmzt=request.getParameter("xmzt");
 String subadd=request.getParameter("subadd");
 String submod=request.getParameter("submod");
 String subdel=request.getParameter("subdel");
 String subview=request.getParameter("subview");
 String subzt=request.getParameter("subzt");
 String manadd=request.getParameter("manadd");
 String manmod=request.getParameter("manmod");
 String mandel=request.getParameter("mandel");
 String manview=request.getParameter("manview");
 String manzt=request.getParameter("manzt");
 String rwadd=request.getParameter("rwadd");
 String rwmod=request.getParameter("rwmod");
 String rwdel=request.getParameter("rwdel");
 String rwview=request.getParameter("rwview");
 String rwzt=request.getParameter("rwzt");
 String fyadd=request.getParameter("fyadd");
 String fymod=request.getParameter("fymod");
 String fydel=request.getParameter("fydel");
 String fyview=request.getParameter("fyview");
 String fyzt=request.getParameter("fyzt");
 String hhadd=request.getParameter("hhadd");
 String hhmod=request.getParameter("hhmod");
 String hhdel=request.getParameter("hhdel");
 String hhview=request.getParameter("hhview");
 String hhzt=request.getParameter("hhzt");
 String tsadd=request.getParameter("tsadd");
 String tsmod=request.getParameter("tsmod");
 String tsdel=request.getParameter("tsdel");
 String tsview=request.getParameter("tsview");
 String tszt=request.getParameter("tszt");
 String wxadd=request.getParameter("wxadd");
 String wxmod=request.getParameter("wxmod");
 String wxdel=request.getParameter("wxdel");
 String wxview=request.getParameter("wxview");
 String wxzt=request.getParameter("wxzt");
 String mactadd=request.getParameter("mactadd");
 String mactmod=request.getParameter("mactmod");
 String mactdel=request.getParameter("mactdel");
 String mactview=request.getParameter("mactview");
 String mactzt=request.getParameter("mactzt");
 String jzdsadd=request.getParameter("jzdsadd");
 String jzdsmod=request.getParameter("jzdsmod");
 String jzdsdel=request.getParameter("jzdsdel");
 String jzdsview=request.getParameter("jzdsview");
 String jzdszt=request.getParameter("jzdszt");
 String zskadd=request.getParameter("zskadd");
 String zskmod=request.getParameter("zskmod");
 String zskdel=request.getParameter("zskdel");
 String zskview=request.getParameter("zskview");
 String zskzt=request.getParameter("zskzt");
 String flfgadd=request.getParameter("flfgadd");
 String flfgmod=request.getParameter("flfgmod");
 String flfgdel=request.getParameter("flfgdel");
 String flfgview=request.getParameter("flfgview");
 String flfgzt=request.getParameter("flfgzt");
 String fkhzadd=request.getParameter("fkhzadd");
 String fkhzmod=request.getParameter("fkhzmod");
 String fkhzdel=request.getParameter("fkhzdel");
 String fkhzview=request.getParameter("fkhzview");
 String fkhzzt=request.getParameter("fkhzzt");
 String skhzadd=request.getParameter("skhzadd");
 String skhzmod=request.getParameter("skhzmod");
 String skhzdel=request.getParameter("skhzdel");
 String skhzview=request.getParameter("skhzview");
 String skhzzt=request.getParameter("skhzzt");
 String fkadd=request.getParameter("fkadd");
 String fkmod=request.getParameter("fkmod");
 String fkdel=request.getParameter("fkdel");
 String fkview=request.getParameter("fkview");
 String fkzt=request.getParameter("fkzt");
 String skadd=request.getParameter("skadd");
 String skmod=request.getParameter("skmod");
 String skdel=request.getParameter("skdel");
 String skview=request.getParameter("skview");
 String skzt=request.getParameter("skzt");
 String qkadd=request.getParameter("qkadd");
 String qkmod=request.getParameter("qkmod");
 String qkdel=request.getParameter("qkdel");
 String qkview=request.getParameter("qkview");
 String qkzt=request.getParameter("qkzt");
 String intadd=request.getParameter("intadd");
 String intmod=request.getParameter("intmod");
 String intdel=request.getParameter("intdel");
 String intview=request.getParameter("intview");
 String intzt=request.getParameter("intzt");
 String outadd=request.getParameter("outadd");
 String outmod=request.getParameter("outmod");
 String outdel=request.getParameter("outdel");
 String outview=request.getParameter("outview");
 String outzt=request.getParameter("outzt");
 String thadd=request.getParameter("thadd");
 String thmod=request.getParameter("thmod");
 String thdel=request.getParameter("thdel");
 String thview=request.getParameter("thview");
 String thzt=request.getParameter("thzt");
 String sysadd=request.getParameter("sysadd");
 String sysmod=request.getParameter("sysmod");
 String sysdel=request.getParameter("sysdel");
 String sysview=request.getParameter("sysview");
 String syszt=request.getParameter("syszt");
 String custzyzt=request.getParameter("custzyzt");
 String salestc=request.getParameter("salestc");
  String sql="select  * from department where departname='"+dept+"'";
  ResultSet rs=einfodb.executeQuery(sql);
 if(!rs.next())
  {
    out.println("not have record");
    return;
  }
 int deptjb=rs.getInt("dept_types");

 String strSQL="insert into restrain values('" + ename + "','" + dept + "','" + deptjb + "','" + qzadd + "','" + qzmod + "','" + qzdel + "','" + qzview + "','" + qzzt + "','" + xhadd + "','" + xhmod + "','" + xhdel + "','" + xhview + "','" + xhzt + "','" + linkadd + "','" + linkmod + "','" + linkdel + "','" + linkview + "','" + linkzt + "','" + supadd + "','" + supmod + "','" + supdel + "','" + supview + "','" + supzt + "','" + actadd + "','" + actmod + "','" + actdel + "','" + actview + "','" + actzt + "','" + opadd + "','" + opmod + "','" + opdel + "','" + opview + "','" + opzt + "','" + quoteadd + "','" + quotemod + "','" + quotedel + "','" + quoteview + "','" + quotezt + "','" + proadd + "','" + promod + "','" + prodel + "','" + proview + "','" + prozt + "','" + samadd + "','" + sammod + "','" + samdel + "','" + samview + "','" + samzt + "','" + psamadd + "','" + psammod + "','" + psamdel + "','" + psamview + "','" + psamzt + "','" + cgadd + "','" + cgmod + "','" + cgdel + "','" + cgview + "','" + cgzt + "','" + tradd + "','" + trmod + "','" + trdel + "','" + trview + "','" + trzt + "','" + hdadd + "','" + hdmod + "','" + hddel + "','" + hdview + "','" + hdzt + "','" + workadd + "','" + workmod + "','" + workdel + "','" + workview + "','" + workzt + "','" + xmadd + "','" + xmmod + "','" + xmdel + "','" + xmview + "','" + xmzt + "','" + subadd + "','" + submod + "','" + subdel + "','" + subview + "','" + subzt + "','" + manadd + "','" + manmod + "','" + mandel + "','" + manview + "','" + manzt + "','" + rwadd + "','" + rwmod + "','" + rwdel + "','" + rwview + "','" + rwzt + "','" + fyadd + "','" + fymod + "','" + fydel + "','" + fyview + "','" + fyzt + "','" + hhadd + "','" + hhmod + "','" + hhdel + "','" + hhview + "','" + hhzt + "','" + thadd + "','" + thmod + "','" + thdel + "','" + thview + "','" + thzt + "','" + serveradd + "','" + servermod + "','" + serverdel + "','" + serverview + "','" + serverzt + "','" + tsadd + "','" + tsmod + "','" + tsdel + "','" + tsview + "','" + tszt + "','" + wxadd + "','" + wxmod + "','" + wxdel + "','" + wxview + "','" + wxzt + "','" + mactadd + "','" + mactmod + "','" + mactdel + "','" + mactview + "','" + mactzt + "','" + jzdsadd + "','" + jzdsmod + "','" + jzdsdel + "','" + jzdsview + "','" + jzdszt + "','" + zskadd + "','" + zskmod + "','" + zskdel + "','" + zskview + "','" + zskzt + "','" + flfgadd + "','" + flfgmod + "','" + flfgdel + "','" + flfgview + "','" + flfgzt + "','" + fkhzadd + "','" + fkhzmod + "','" + fkhzdel + "','" + fkhzview + "','" + fkhzzt + "','" + skhzadd + "','" + skhzmod + "','" + skhzdel + "','" + skhzview + "','" + skhzzt + "','" + fkadd + "','" + fkmod + "','" + fkdel + "','" + fkview + "','" + fkzt + "','" + skadd + "','" + skmod + "','" + skdel + "','" + skview + "','" + skzt + "','" + qkadd + "','" + qkmod + "','" + qkdel + "','" + qkview + "','" + qkzt + "','" + intadd + "','" + intmod + "','" + intdel + "','" + intview + "','" + intzt + "','" + outadd + "','" + outmod + "','" + outdel + "','" + outview + "','" + outzt + "','" + sysadd + "','" + sysmod + "','" + sysdel + "','" + sysview + "','" + syszt + "','" + custzyzt + "','" + salestc + "' )";
 out.print(strSQL);
   boolean t= einfodb.executeUpdate(strSQL);
   if(!t)
   {
     out.println("<font size='2' color='#FF0000'>添加失败,你所输入的内容超出系统范围或输入类型不符!</font>");
	 return;
   }
 %>
<body bgcolor="#ffffff">
<div align="center"><br><br><br> <p><img src="../../images/cg.jpg" width="111" height="111"></p>

    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
    <p style="font-size:16px; color: #f00; font-family:'宋体'; letter-spacing:0px; vertical-align:middle;">操作成功!</font></p>
  <p><a href="npunit.jsp" style="font-size: 12px">继续增加</a> </p>
</div>
</body>
<%}}%>
</html>