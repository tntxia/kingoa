<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../refuse.jsp"
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>оƬ�̳����޹�˾</title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
 String id1=request.getParameter("id");
 String ename=request.getParameter("restrain_name").trim();
 String qzadd=request.getParameter("qzadd");
  if(qzadd!=null){
  qzadd="��";
    }else
  {
  qzadd="��";
  }

 String qzmod=request.getParameter("qzmod");
   if(qzmod!=null){
  qzmod="��";
    }else
  {
  qzmod="��";
  }
 String qzdel=request.getParameter("qzdel");
   if(qzdel!=null){
  qzdel="��";
    }else
  {
  qzdel="��";
  }

 String qzview=request.getParameter("qzview");
    if(qzview!=null){
  qzview="��";
    }else
  {
  qzview="��";
  }

 String qzzt=request.getParameter("qzzt");
    if(qzzt!=null){
  qzzt="��";
    }else
  {
  qzzt="��";
  }

 String xhadd=request.getParameter("xhadd");
    if(xhadd!=null){
  xhadd="��";
    }else
  {
  xhadd="��";
  }

 String xhmod=request.getParameter("xhmod");
    if(xhmod!=null){
  xhmod="��";
    }else
  {
  xhmod="��";
  }

 String xhdel=request.getParameter("xhdel");
    if(xhdel!=null){
  xhdel="��";
    }else
  {
  xhdel="��";
  }

 String xhview=request.getParameter("xhview");
    if(xhview!=null){
  xhview="��";
    }else
  {
  xhview="��";
  }

 String xhzt=request.getParameter("xhzt");
    if(xhzt!=null){
  xhzt="��";
    }else
  {
  xhzt="��";
  }

 String linkadd=request.getParameter("linkadd");
    if(linkadd!=null){
  linkadd="��";
    }else
  {
  linkadd="��";
  }

 String linkmod=request.getParameter("linkmod");
    if(linkmod!=null){
  linkmod="��";
    }else
  {
  linkmod="��";
  }

 String linkdel=request.getParameter("linkdel");
    if(linkdel!=null){
  linkdel="��";
    }else
  {
  linkdel="��";
  }

 String linkview=request.getParameter("linkview");
    if(linkview!=null){
  linkview="��";
    }else
  {
  linkview="��";
  }

 String linkzt=request.getParameter("linkzt");
    if(linkzt!=null){
  linkzt="��";
    }else
  {
  linkzt="��";
  }

 String hzadd=request.getParameter("hzadd");
    if(hzadd!=null){
  hzadd="��";
    }else
  {
  hzadd="��";
  }

 String hzmod=request.getParameter("hzmod");
    if(hzmod!=null){
  hzmod="��";
    }else
  {
  ?��?��<?????????���ج��L�{�n�����P�ˬ�������X���E�`����?�p�����P�?��?���u�����P�?���H��?�����Y��???��?�؛D��??�n�����P�???�u����?�����{?�î���?����ĵ�¬���(hzmod="��";
  }

 String hzdel=request.getParameter("hzdel");
    if(hzdel!=null){
  hzdel="��";
    }else
  {
  hzdel="��";
  }

 String hzview=request.getParameter("hzview");
    if(hzview!=null){
  hzview="��";
    }else
  {
  hzview="��";
  }

 String hzzt=request.getParameter("hzzt");
    if(hzzt!=null){
  hzzt="��";
    }else
  {
  hzzt="��";
  }

 String supadd=request.getParameter("supadd");
    if(supadd!=null){
  supadd="��";
    }else
  {
  supadd="��";
  }

 String supmod=request.getParameter("supmod");
    if(supmod!=null){
  supmod="��";
    }else
  {
  supmod="��";
  }

 String supdel=request.getParameter("supdel");
    if(supdel!=null){
  supdel="��";
    }else
  {
  supdel="��";
  }

 String supview=request.getParameter("supview");
    if(supview!=null){
  supview="��";
    }else
  {
  supview="��";
  }

 String supzt=request.getParameter("supzt");
    if(supzt!=null){
  supzt="��";
    }else
  {
  supzt="��";
  }

 String r_actadd=request.getParameter("r_actadd");
    if(r_actadd!=null){
  r_actadd="��";
    }else
  {
  r_actadd="��";
  }

 String r_actmod=request.getParameter("r_actmod");
    if(r_actmod!=null){
  r_actmod="��";
    }else
  {
  r_actmod="��";
  }

 String r_actdel=request.getParameter("r_actdel");
    if(r_actdel!=null){
  r_actdel="��";
    }else
  {
  r_actdel="��";
  }

 String r_actview=request.getParameter("r_actview");
    if(r_actview!=null){
  r_actview="��";
    }else
  {
  r_actview="��";
  }

 String actzt=request.getParameter("actzt");
    if(actzt!=null){
  actzt="��";
    }else
  {
  actzt="��";
  }

 String opadd=request.getParameter("opadd");
    if(opadd!=null){
  opadd="��";
    }else
  {
  opadd="��";
  }

 String opmod=request.getParameter("opmod");
    if(opmod!=null){
  opmod="��";
    }else
  {
  opmod="��";
  }

 String opdel=request.getParameter("opdel");
    if(opdel!=null){
  opdel="��";
    }else
  {
  opdel="��";
  }

 String opview=request.getParameter?��?��<?????????���ج��L�{�n�����P�ˬ�������X���E�`����?�p�����P�?��?���u�����P�?���H��?�����Y��???��?�؛D��??�n�����P�???�u����?�����{?�î���?����ĵ�¬���(("opview");
    if(opview!=null){
  opview="��";
    }else
  {
  opview="��";
  }

 String opzt=request.getParameter("opzt");
    if(opzt!=null){
  opzt="��";
    }else
  {
  opzt="��";
  }

 String quoteadd=request.getParameter("quoteadd");
    if(quoteadd!=null){
  quoteadd="��";
    }else
  {
  quoteadd="��";
  }

 String quotemod=request.getParameter("quotemod");
    if(quotemod!=null){
  quotemod="��";
    }else
  {
  quotemod="��";
  }

 String quotedel=request.getParameter("quotedel");
    if(quotedel!=null){
  quotedel="��";
    }else
  {
  quotedel="��";
  }

String quoteview=request.getParameter("quoteview");
   if(quoteview!=null){
  quoteview="��";
    }else
  {
  quoteview="��";
  }

String quotezt=request.getParameter("quotezt");
   if(quotezt!=null){
  quotezt="��";
    }else
  {
  quotezt="��";
  }

String serveradd=request.getParameter("serveradd");
   if(serveradd!=null){
  serveradd="��";
    }else
  {
  serveradd="��";
  }

 String servermod=request.getParameter("servermod");
    if(servermod!=null){
  servermod="��";
    }else
  {
  servermod="��";
  }

 String serverdel=request.getParameter("serverdel");
    if(serverdel!=null){
  serverdel="��";
    }else
  {
  serverdel="��";
  }

 String serverview=request.getParameter("serverview");
    if(serverview!=null){
  serverview="��";
    }else
  {
  serverview="��";
  }

 String serverzt=request.getParameter("serverzt");
    if(serverzt!=null){
  serverzt="��";
    }else
  {
  serverzt="��";
  }

 String proadd=request.getParameter("proadd");
    if(proadd!=null){
  proadd="��";
    }else
  {
  proadd="��";
  }

 String promod=request.getParameter("promod");
    if(promod!=null){
  promod="��";
    }else
  {
  promod="��";
  }

 String prodel=request.getParameter("prodel");
    if(prodel!=null){
  prodel="��";
    }else
  {
  prodel="��";
  }

 String proview=request.getParameter("proview");
    if(proview!=null){
  proview="��";
    }else
  {
  provie?��?��<?????????���ج��L�{�n�����P�ˬ�������X���E�`����?�p�����P�?��?���u�����P�?���H��?�����Y��???��?�؛D��??�n�����P�???�u����?�����{?�î���?����ĵ�¬���(w="��";
  }

 String prozt=request.getParameter("prozt");
    if(prozt!=null){
  prozt="��";
    }else
  {
  prozt="��";
  }

 String cgadd=request.getParameter("cgadd");
    if(cgadd!=null){
  cgadd="��";
    }else
  {
  cgadd="��";
  }

 String cgmod=request.getParameter("cgmod");
   if(cgmod!=null){
  cgmod="��";
    }else
  {
  cgmod="��";
  }

 String cgdel=request.getParameter("cgdel");
    if(cgdel!=null){
  cgdel="��";
    }else
  {
  cgdel="��";
  }

 String cgview=request.getParameter("cgview");
    if(cgview!=null){
  cgview="��";
    }else
  {
  cgview="��";
  }

 String cgzt=request.getParameter("cgzt");
    if(cgzt!=null){
  cgzt="��";
    }else
  {
  cgzt="��";
  }

 String tradd=request.getParameter("tradd");
    if(tradd!=null){
  tradd="��";
    }else
  {
  tradd="��";
  }

 String trmod=request.getParameter("trmod");
    if(trmod!=null){
  trmod="��";
    }else
  {
  trmod="��";
  }

 String trdel=request.getParameter("trdel");
    if(trdel!=null){
  trdel="��";
    }else
  {
  trdel="��";
  }

 String trview=request.getParameter("trview");
    if(trview!=null){
  trview="��";
    }else
  {
  trview="��";
  }

 String trzt=request.getParameter("trzt");
    if(trzt!=null){
  trzt="��";
    }else
  {
  trzt="��";
  }

 String workadd=request.getParameter("workadd");
    if(workadd!=null){
  workadd="��";
    }else
  {
  workadd="��";
  }

 String workmod=request.getParameter("workmod");
    if(workmod!=null){
  workmod="��";
    }else
  {
  workmod="��";
  }

 String workdel=request.getParameter("workdel");
    if(workdel!=null){
  workdel="��";
    }else
  {
  workdel="��";
  }

 String workview=request.getParameter("workview");
    if(workview!=null){
  workview="��";
    }else
  {
  workview="��";
  }

 String workzt=request.getParameter("workzt");
    if(workzt!=null){
  workzt="��";
    }else
  {
  workzt="��";
  }

 String xmadd=request.getParameter("xmadd");
    if(xmadd!=null){
  xmadd="��";?��?��<?????????���ج��L�{�n�����P�ˬ�������X���E�`����?�p�����P�?��?���u�����P�?���H��?�����Y��???��?�؛D��??�n�����P�???�u����?�����{?�î���?����ĵ�¬���(
    }else
  {
  xmadd="��";
  }

 String xmmod=request.getParameter("xmmod");
    if(xmmod!=null){
  xmmod="��";
    }else
  {
  xmmod="��";
  }

 String xmdel=request.getParameter("xmdel");
    if(xmdel!=null){
  xmdel="��";
    }else
  {
  xmdel="��";
  }

 String xmview=request.getParameter("xmview");
    if(xmview!=null){
  xmview="��";
    }else
  {
  xmview="��";
  }

 String xmzt=request.getParameter("xmzt");
    if(xmzt!=null){
  xmzt="��";
    }else
  {
  xmzt="��";
  }

 String subadd=request.getParameter("subadd");
    if(subadd!=null){
  subadd="��";
    }else
  {
  subadd="��";
  }

 String submod=request.getParameter("submod");
    if(submod!=null){
  submod="��";
    }else
  {
  submod="��";
  }

 String subdel=request.getParameter("subdel");
    if(subdel!=null){
  subdel="��";
    }else
  {
  subdel="��";
  }


   String subview=request.getParameter("subview");
    if(subview!=null){
  subview="��";
    }else
  {
  subview="��";
  }

 String subzt=request.getParameter("subzt");
    if(subzt!=null){
  subzt="��";
    }else
  {
  subzt="��";
  }

 String manadd=request.getParameter("manadd");
    if(manadd!=null){
  manadd="��";
    }else
  {
  manadd="��";
  }

 String manmod=request.getParameter("manmod");
    if(manmod!=null){
  manmod="��";
    }else
  {
  manmod="��";
  }

 String mandel=request.getParameter("mandel");
    if(mandel!=null){
  mandel="��";
    }else
  {
  mandel="��";
  }

 String manview=request.getParameter("manview");
    if(manview!=null){
  manview="��";
    }else
  {
  manview="��";
  }

 String manzt=request.getParameter("manzt");
    if(manzt!=null){
  manzt="��";
    }else
  {
  manzt="��";
  }

 String rwadd=request.getParameter("rwadd");
    if(rwadd!=null){
  rwadd="��";
    }else
  {
  rwadd="��";
  }

 String rwmod=request.getParameter("rwmod");
    if(rwmod!=null){
  rwmod="��";
    }else
  {
  rwmod="��";
  }

 String rwdel=request.getParameter("rwdel");
    i?��?��<?????????���ج��L�{�n�����P�ˬ�������X���E�`����?�p�����P�?��?���u�����P�?���H��?�����Y��???��?�؛D��??�n�����P�???�u����?�����{?�î���?����ĵ�¬���(f(rwdel!=null){
  rwdel="��";
    }else
  {
  rwdel="��";
  }

 String rwview=request.getParameter("rwview");
    if(rwview!=null){
  rwview="��";
    }else
  {
  rwview="��";
  }

 String rwzt=request.getParameter("rwzt");
    if(rwzt!=null){
  rwzt="��";
    }else
  {
  rwzt="��";
  }

 String fyadd=request.getParameter("fyadd");
    if(fyadd!=null){
  fyadd="��";
    }else
  {
  fyadd="��";
  }

 String fymod=request.getParameter("fymod");
    if(fymod!=null){
  fymod="��";
    }else
  {
  fymod="��";
  }

 String fydel=request.getParameter("fydel");
    if(fydel!=null){
  fydel="��";
    }else
  {
  fydel="��";
  }

 String fyview=request.getParameter("fyview");
    if(fyview!=null){
  fyview="��";
    }else
  {
  fyview="��";
  }

 String fyzt=request.getParameter("fyzt");
    if(fyzt!=null){
  fyzt="��";
    }else
  {
  fyzt="��";
  }

 String hdadd=request.getParameter("hdadd");
    if(hdadd!=null){
  hdadd="��";
    }else
  {
  hdadd="��";
  }

 String hdmod=request.getParameter("hdmod");
    if(hdmod!=null){
  hdmod="��";
    }else
  {
  hdmod="��";
  }

 String hddel=request.getParameter("hddel");
    if(hddel!=null){
  hddel="��";
    }else
  {
  hddel="��";
  }

 String hdview=request.getParameter("hdview");
    if(hdview!=null){
  hdview="��";
    }else
  {
  hdview="��";
  }

 String hdzt=request.getParameter("hdzt");
    if(hdzt!=null){
  hdzt="��";
    }else
  {
  hdzt="��";
  }

 String tsadd=request.getParameter("tsadd");
    if(tsadd!=null){
  tsadd="��";
    }else
  {
  tsadd="��";
  }

 String tsmod=request.getParameter("tsmod");
    if(tsmod!=null){
  tsmod="��";
    }else
  {
  tsmod="��";
  }

 String tsdel=request.getParameter("tsdel");
    if(tsdel!=null){
  tsdel="��";
    }else
  {
  tsdel="��";
  }

 String tsview=request.getParameter("tsview");
    if(tsview!=null){
  tsview="��";
    }else
  {
  tsview="��";
  }

 String tszt=request.getParameter("tszt");
    if(tszt!=null){
  tszt?��?��<?????????���ج��L�{�n�����P�ˬ�������X���E�`����?�p�����P�?��?���u�����P�?���H��?�����Y��???��?�؛D��??�n�����P�???�u����?�����{?�î���?����ĵ�¬���(="��";
    }else
  {
  tszt="��";
  }

 String wxadd=request.getParameter("wxadd");
    if(wxadd!=null){
  wxadd="��";
    }else
  {
  wxadd="��";
  }

 String wxmod=request.getParameter("wxmod");
    if(wxmod!=null){
  wxmod="��";
    }else
  {
  wxmod="��";
  }

 String wxdel=request.getParameter("wxdel");
    if(wxdel!=null){
  wxdel="��";
    }else
  {
  wxdel="��";
  }

 String wxview=request.getParameter("wxview");
    if(wxview!=null){
  wxview="��";
    }else
  {
  wxview="��";
  }

 String wxzt=request.getParameter("wxzt");
    if(wxzt!=null){
  wxzt="��";
    }else
  {
  wxzt="��";
  }

 String mactadd=request.getParameter("mactadd");
    if(mactadd!=null){
  mactadd="��";
    }else
  {
  mactadd="��";
  }

 String mactmod=request.getParameter("mactmod");
    if(mactmod!=null){
  mactmod="��";
    }else
  {
  mactmod="��";
  }

 String mactdel=request.getParameter("mactdel");
    if(mactdel!=null){
  mactdel="��";
    }else
  {
  mactdel="��";
  }

 String mactview=request.getParameter("mactview");
    if(mactview!=null){
  mactview="��";
    }else
  {
  mactview="��";
  }

 String mactzt=request.getParameter("mactzt");
    if(mactzt!=null){
  mactzt="��";
    }else
  {
  mactzt="��";
  }

 String jzdsadd=request.getParameter("jzdsadd");
    if(jzdsadd!=null){
  jzdsadd="��";
    }else
  {
  jzdsadd="��";
  }

 String jzdsmod=request.getParameter("jzdsmod");
    if(jzdsmod!=null){
  jzdsmod="��";
    }else
  {
  jzdsmod="��";
  }

 String jzdsdel=request.getParameter("jzdsdel");
    if(jzdsdel!=null){
  jzdsdel="��";
    }else
  {
  jzdsdel="��";
  }

 String jzdsview=request.getParameter("jzdsview");
    if(jzdsview!=null){
  jzdsview="��";
    }else
  {
  jzdsview="��";
  }

 String jzdszt=request.getParameter("jzdszt");
    if(jzdszt!=null){
  jzdszt="��";
    }else
  {
  jzdszt="��";
  }

 String zskadd=request.getParameter("zskadd");
    if(zskadd!=null){
  zskadd="��";
    }else
  {
  zskadd="��";
  }?��?��<?????????���ج��L�{�n�����P�ˬ�������X���E�`����?�p�����P�?��?���u�����P�?���H��?�����Y��???��?�؛D��??�n�����P�???�u����?�����{?�î���?����ĵ�¬���(

 String zskmod=request.getParameter("zskmod");
    if(zskadd!=null){
  zskadd="��";
    }else
  {
  zskadd="��";
  }

 String zskdel=request.getParameter("zskdel");
    if(zskdel!=null){
  zskdel="��";
    }else
  {
  zskdel="��";
  }

 String zskview=request.getParameter("zskview");
    if(zskview!=null){
  zskview="��";
    }else
  {
  zskview="��";
  }

 String zskzt=request.getParameter("zskzt");
    if(zskzt!=null){
  zskzt="��";
    }else
  {
  zskzt="��";
  }

 String flfgadd=request.getParameter("flfgadd");
    if(flfgadd!=null){
  flfgadd="��";
    }else
  {
  flfgadd="��";
  }

 String flfgmod=request.getParameter("flfgmod");
    if(flfgmod!=null){
  flfgmod="��";
    }else
  {
  flfgmod="��";
  }

 String flfgdel=request.getParameter("flfgdel");
    if(flfgdel!=null){
  flfgdel="��";
    }else
  {
  flfgdel="��";
  }

 String flfgview=request.getParameter("flfgview");
    if(flfgview!=null){
  flfgview="��";
    }else
  {
  flfgview="��";
  }

 String flfgzt=request.getParameter("flfgzt");
    if(flfgzt!=null){
  flfgzt="��";
    }else
  {
  flfgzt="��";
  }

 String fkhzadd=request.getParameter("fkhzadd");
    if(fkhzadd!=null){
  fkhzadd="��";
    }else
  {
  fkhzadd="��";
  }

 String fkhzmod=request.getParameter("fkhzmod");
    if(fkhzmod!=null){
  fkhzmod="��";
    }else
  {
  fkhzmod="��";
  }

 String fkhzdel=request.getParameter("fkhzdel");
    if(fkhzdel!=null){
  fkhzdel="��";
    }else
  {
  fkhzdel="��";
  }

 String fkhzview=request.getParameter("fkhzview");
    if(fkhzview!=null){
  fkhzview="��";
    }else
  {
  fkhzview="��";
  }

 String fkhzzt=request.getParameter("fkhzzt");
    if(fkhzzt!=null){
  fkhzzt="��";
    }else
  {
  fkhzzt="��";
  }

 String zjadd=request.getParameter("zjadd");
    if(zjadd!=null){
  zjadd="��";
    }else
  {
  zjadd="��";
  }

 String zjmod=request.getParameter("zjmod");
    if(zjmod!=null){
  zjmod="��";
    }else
  {
  zjmod="��";
  }

 String zjdel=reques?��?��<?????????���ج��L�{�n�����P�ˬ�������X���E�`����?�p�����P�?��?���u�����P�?���H��?�����Y��???��?�؛D��??�n�����P�???�u����?�����{?�î���?����ĵ�¬���(t.getParameter("zjdel");
    if(zjdel!=null){
  zjdel="��";
    }else
  {
  zjdel="��";
  }

 String zjview=request.getParameter("zjview");
    if(zjview!=null){
  zjview="��";
    }else
  {
  zjview="��";
  }

 String zjzt=request.getParameter("zjzt");
    if(zjzt!=null){
  zjzt="��";
    }else
  {
  zjzt="��";
  }

 String skhzadd=request.getParameter("skhzadd");
    if(skhzadd!=null){
  skhzadd="��";
    }else
  {
  skhzadd="��";
  }

 String skhzmod=request.getParameter("skhzmod");
    if(skhzmod!=null){
  skhzmod="��";
    }else
  {
  skhzmod="��";
  }

 String skhzdel=request.getParameter("skhzdel");
    if(skhzdel!=null){
  skhzdel="��";
    }else
  {
  skhzdel="��";
  }

 String skhzview=request.getParameter("skhzview");
    if(skhzview!=null){
  skhzview="��";
    }else
  {
  skhzview="��";
  }

 String skhzzt=request.getParameter("skhzzt");
    if(skhzzt!=null){
  skhzzt="��";
    }else
  {
  skhzzt="��";
  }

 String fkadd=request.getParameter("fkadd");
    if(fkadd!=null){
  fkadd="��";
    }else
  {
  fkadd="��";
  }

 String fkmod=request.getParameter("fkmod");
    if(fkmod!=null){
  fkmod="��";
    }else
  {
  fkmod="��";
  }

 String fkdel=request.getParameter("fkdel");
    if(fkdel!=null){
  fkdel="��";
    }else
  {
  fkdel="��";
  }

 String fkview=request.getParameter("fkview");
    if(fkview!=null){
  fkview="��";
    }else
  {
  fkview="��";
  }

 String fkzt=request.getParameter("fkzt");
    if(fkzt!=null){
  fkzt="��";
    }else
  {
  fkzt="��";
  }

 String r_skadd=request.getParameter("r_skadd");
    if(r_skadd!=null){
  r_skadd="��";
    }else
  {
  r_skadd="��";
  }

 String r_skmod=request.getParameter("r_skmod");
    if(r_skmod!=null){
  r_skmod="��";
    }else
  {
  r_skmod="��";
  }

 String r_skdel=request.getParameter("r_skdel");
    if(r_skdel!=null){
  r_skdel="��";
    }else
  {
  r_skdel="��";
  }

 String r_skview=request.getParameter("r_skview");
    if(r_skview!=null){
  r_skv?��?��<?????????���ج��L�{�n�����P�ˬ�������X���E�`����?�p�����P�?��?���u�����P�?���H��?�����Y��???��?�؛D��??�n�����P�???�u����?�����{?�î���?����ĵ�¬���(iew="��";
    }else
  {
  r_skview="��";
  }

 String skzt=request.getParameter("skzt");
    if(skzt!=null){
  skzt="��";
    }else
  {
  skzt="��";
  }

 String qkadd=request.getParameter("qkadd");
    if(qkadd!=null){
  qkadd="��";
    }else
  {
  qkadd="��";
  }

 String qkmod=request.getParameter("qkmod");
    if(qkmod!=null){
  qkmod="��";
    }else
  {
  qkmod="��";
  }

 String qkdel=request.getParameter("qkdel");
    if(qkdel!=null){
  qkdel="��";
    }else
  {
  qkdel="��";
  }

 String qkview=request.getParameter("qkview");
    if(qkview!=null){
  qkview="��";
    }else
  {
  qkview="��";
  }

 String qkzt=request.getParameter("qkzt");
    if(qkzt!=null){
  qkzt="��";
    }else
  {
  qkzt="��";
  }

 String intadd=request.getParameter("intadd");
    if(intadd!=null){
  intadd="��";
    }else
  {
  intadd="��";
  }

 String intmod=request.getParameter("intmod");
    if(intmod!=null){
  intmod="��";
    }else
  {
  intmod="��";
  }

 String intdel=request.getParameter("intdel");
    if(intdel!=null){
  intdel="��";
    }else
  {
  intdel="��";
  }

 String intview=request.getParameter("intview");
    if(intview!=null){
  intview="��";
    }else
  {
  intview="��";
  }

 String intzt=request.getParameter("intzt");
    if(intzt!=null){
  intzt="��";
    }else
  {
  intzt="��";
  }

 String outadd=request.getParameter("outadd");
    if(outadd!=null){
  outadd="��";
    }else
  {
  outadd="��";
  }

 String outmod=request.getParameter("outmod");
    if(outmod!=null){
  outmod="��";
    }else
  {
  outmod="��";
  }

 String outdel=request.getParameter("outdel");
    if(outdel!=null){
  outdel="��";
    }else
  {
  outdel="��";
  }

 String outview=request.getParameter("outview");
    if(outview!=null){
  outview="��";
    }else
  {
  outview="��";
  }

 String outzt=request.getParameter("outzt");
    if(outzt!=null){
  outzt="��";
    }else
  {
  outzt="��";
  }

 String r_thadd=request.getParameter("r_thadd");
?��?��<?????????���ج��L�{�n�����P�ˬ�������X���E�`����?�p�����P�?��?���u�����P�?���H��?�����Y��???��?�؛D��??�n�����P�???�u����?�����{?�î���?����ĵ�¬���(
    if(r_thadd!=null){
  r_thadd="��";
    }else
  {
  r_thadd="��";
  }

 String r_thmod=request.getParameter("r_thmod");
    if(r_thmod!=null){
  r_thmod="��";
    }else
  {
  r_thmod="��";
  }

 String r_thdel=request.getParameter("r_thdel");
    if(r_thdel!=null){
  r_thdel="��";
    }else
  {
  r_thdel="��";
  }

 String r_thview=request.getParameter("r_thview");
    if(r_thview!=null){
  r_thview="��";
    }else
  {
  r_thview="��";
  }

 String thzt=request.getParameter("thzt");
    if(thzt!=null){
  thzt="��";
    }else
  {
  thzt="��";
  }
 String r_yfgladd=request.getParameter("r_yfgladd");
    if(r_yfgladd!=null){
  r_yfgladd="��";
    }else
  {
  r_yfgladd="��";
  }

 String r_yfglmod=request.getParameter("r_yfglmod");
    if(r_yfglmod!=null){
  r_yfglmod="��";
    }else
  {
  r_yfglmod="��";
  }

 String r_yfgldel=request.getParameter("r_yfgldel");
    if(r_yfgldel!=null){
  r_yfgldel="��";
    }else
  {
  r_yfgldel="��";
  }

 String r_yfglview=request.getParameter("r_yfglview");
    if(r_yfglview!=null){
  r_yfglview="��";
    }else
  {
  r_yfglview="��";
  }

 String r_yfglzt=request.getParameter("r_yfglzt");
    if(r_yfglzt!=null){
  r_yfglzt="��";
    }else
  {
  r_yfglzt="��";
  }

 String syszt=request.getParameter("syszt");
   if(syszt!=null){
  syszt="��";
    }else
  {
  syszt="��";
  }
 String jcfxzt=request.getParameter("jcfxzt");
   if(jcfxzt!=null){
  jcfxzt="��";
    }else
  {
  jcfxzt="��";
  }

 String custzyzt=request.getParameter("custzyzt");
   if(custzyzt!=null){
  custzyzt="��";
    }else
  {
  custzyzt="��";
  }
 String r_dzzx_zt=request.getParameter("r_dzzx_zt");
   if(r_dzzx_zt!=null){
  r_dzzx_zt="��";
    }else
  {
  r_dzzx_zt="��";
  }
 String r_xscp_zt=request.getParameter("r_xscp_zt");
   if(r_xscp_zt!=null){
  r_xscp_zt="��";
    }else
  {
  r_xscp_zt="��";
  }
 String r_htgl_add=request.getParameter("r_htgl_add");
    if(r_htgl_add!=null){
  r_htgl_add="��";
    }else
  {
  r_htgl_?��?��<?????????���ج��L�{�n�����P�ˬ�������X���E�`����?�p�����P�?��?���u�����P�?���H��?�����Y��???��?�؛D��??�n�����P�???�u����?�����{?�î���?����ĵ�¬���(add="��";
  }

 String r_htgl_mod=request.getParameter("r_htgl_mod");
    if(r_htgl_mod!=null){
  r_htgl_mod="��";
    }else
  {
  r_htgl_mod="��";
  }

 String r_htgl_del=request.getParameter("r_htgl_del");
    if(r_htgl_del!=null){
  r_htgl_del="��";
    }else
  {
  r_htgl_del="��";
  }

 String r_htgl_view=request.getParameter("r_htgl_view");
    if(r_htgl_view!=null){
  r_htgl_view="��";
    }else
  {
  r_htgl_view="��";
  }

 String r_htgl_zt=request.getParameter("r_htgl_zt");
    if(r_htgl_zt!=null){
  r_htgl_zt="��";
    }else
  {
  r_htgl_zt="��";
  }

 String r_jkgl_add=request.getParameter("r_jkgl_add");
    if(r_jkgl_add!=null){
  r_jkgl_add="��";
    }else
  {
  r_jkgl_add="��";
  }

 String r_jkgl_mod=request.getParameter("r_jkgl_mod");
    if(r_jkgl_mod!=null){
  r_jkgl_mod="��";
    }else
  {
  r_jkgl_mod="��";
  }

 String r_jkgl_del=request.getParameter("r_jkgl_del");
    if(r_jkgl_del!=null){
  r_jkgl_del="��";
    }else
  {
  r_jkgl_del="��";
  }

 String r_jkgl_view=request.getParameter("r_jkgl_view");
    if(r_jkgl_view!=null){
  r_jkgl_view="��";
    }else
  {
  r_jkgl_view="��";
  }

 String r_jkgl_zt=request.getParameter("r_jkgl_zt");
    if(r_jkgl_zt!=null){
  r_jkgl_zt="��";
    }else
  {
  r_jkgl_zt="��";
  }
  
 String r_fksq_add=request.getParameter("r_fksq_add");
    if(r_fksq_add!=null){
  r_fksq_add="��";
    }else
  {
  r_fksq_add="��";
  }

 String r_fksq_mod=request.getParameter("r_fksq_mod");
    if(r_fksq_mod!=null){
  r_fksq_mod="��";
    }else
  {
  r_fksq_mod="��";
  }

 String r_fksq_del=request.getParameter("r_fksq_del");
    if(r_fksq_del!=null){
  r_fksq_del="��";
    }else
  {
  r_fksq_del="��";
  }

 String r_fksq_view=request.getParameter("r_fksq_view");
    if(r_fksq_view!=null){
  r_fksq_view="��";
    }else
  {
  r_fksq_view="��";
  }

 String r_fksq_zt=request.getParameter("r_fksq_zt");
    if(r_fksq_zt!=null){
  r_fksq_zt="��";
    }else
  {
  r_fksq_zt="��";
  }
 String r_month?��?��<?????????���ج��L�{�n�����P�ˬ�������X���E�`����?�p�����P�?��?���u�����P�?���H��?�����Y��???��?�؛D��??�n�����P�???�u����?�����{?�î���?����ĵ�¬���(_jh_add=request.getParameter("r_month_jh_add");
    if(r_month_jh_add!=null){
  r_month_jh_add="��";
    }else
  {
  r_month_jh_add="��";
  }

 String r_month_jh_mod=request.getParameter("r_month_jh_mod");
    if(r_month_jh_mod!=null){
  r_month_jh_mod="��";
    }else
  {
  r_month_jh_mod="��";
  }

 String r_month_jh_del=request.getParameter("r_month_jh_del");
    if(r_month_jh_del!=null){
  r_month_jh_del="��";
    }else
  {
  r_month_jh_del="��";
  }

 String r_month_jh_view=request.getParameter("r_month_jh_view");
    if(r_month_jh_view!=null){
  r_month_jh_view="��";
    }else
  {
  r_month_jh_view="��";
  }

 String r_month_jh_zt=request.getParameter("r_month_jh_zt");
    if(r_month_jh_zt!=null){
  r_month_jh_zt="��";
    }else
  {
  r_month_jh_zt="��";
  }
 String r_date_r_add=request.getParameter("r_date_r_add");
    if(r_date_r_add!=null){
  r_date_r_add="��";
    }else
  {
  r_date_r_add="��";
  }

 String r_date_r_mod=request.getParameter("r_date_r_mod");
    if(r_date_r_mod!=null){
  r_date_r_mod="��";
    }else
  {
  r_date_r_mod="��";
  }

 String r_date_r_del=request.getParameter("r_date_r_del");
    if(r_date_r_del!=null){
  r_date_r_del="��";
    }else
  {
  r_date_r_del="��";
  }

 String r_date_r_view=request.getParameter("r_date_r_view");
    if(r_date_r_view!=null){
  r_date_r_view="��";
    }else
  {
  r_date_r_view="��";
  }

 String r_date_r_zt=request.getParameter("r_date_r_zt");
    if(r_date_r_zt!=null){
  r_date_r_zt="��";
    }else
  {
  r_date_r_zt="��";
  }
 String r_week_r_add=request.getParameter("r_week_r_add");
    if(r_week_r_add!=null){
  r_week_r_add="��";
    }else
  {
  r_week_r_add="��";
  }

 String r_week_r_mod=request.getParameter("r_week_r_mod");
    if(r_week_r_mod!=null){
  r_week_r_mod="��";
    }else
  {
  r_week_r_mod="��";
  }

 String r_week_r_del=request.getParameter("r_week_r_del");
    if(r_week_r_del!=null){
  r_week_r_del="��";
    }else
  {
  r_week_r_del="��";
  }

 String r_week_?��?��<?????????���ج��L�{�n�����P�ˬ�������X���E�`����?�p�����P�?��?���u�����P�?���H��?�����Y��???��?�؛D��??�n�����P�???�u����?�����{?�î���?����ĵ�¬���(r_view=request.getParameter("r_week_r_view");
    if(r_week_r_view!=null){
  r_week_r_view="��";
    }else
  {
  r_week_r_view="��";
  }

 String r_week_r_zt=request.getParameter("r_week_r_zt");
    if(r_week_r_zt!=null){
  r_week_r_zt="��";
    }else
  {
  r_week_r_zt="��";
  }
 String r_month_r_add=request.getParameter("r_month_r_add");
    if(r_month_r_add!=null){
  r_month_r_add="��";
    }else
  {
  r_month_r_add="��";
  }

 String r_month_r_mod=request.getParameter("r_month_r_mod");
    if(r_month_r_mod!=null){
  r_month_r_mod="��";
    }else
  {
  r_month_r_mod="��";
  }

 String r_month_r_del=request.getParameter("r_month_r_del");
    if(r_month_r_del!=null){
  r_month_r_del="��";
    }else
  {
  r_month_r_del="��";
  }

 String r_month_r_view=request.getParameter("r_month_r_view");
    if(r_month_r_view!=null){
  r_month_r_view="��";
    }else
  {
  r_month_r_view="��";
  }

 String r_month_r_zt=request.getParameter("r_month_r_zt");
    if(r_month_r_zt!=null){
  r_month_r_zt="��";
    }else
  {
  r_month_r_zt="��";
  }
 String r_wlz_add=request.getParameter("r_wlz_add");
    if(r_wlz_add!=null){
  r_wlz_add="��";
    }else
  {
  r_wlz_add="��";
  }

 String r_wlz_mod=request.getParameter("r_wlz_mod");
    if(r_wlz_mod!=null){
  r_wlz_mod="��";
    }else
  {
  r_wlz_mod="��";
  }

 String r_wlz_del=request.getParameter("r_wlz_del");
    if(r_wlz_del!=null){
  r_wlz_del="��";
    }else
  {
  r_wlz_del="��";
  }

 String r_wlz_view=request.getParameter("r_wlz_view");
    if(r_wlz_view!=null){
  r_wlz_view="��";
    }else
  {
  r_wlz_view="��";
  }

 String r_wlz_zt=request.getParameter("r_wlz_zt");
    if(r_wlz_zt!=null){
  r_wlz_zt="��";
    }else
  {
  r_wlz_zt="��";
  }
 String r_thje_add=request.getParameter("r_thje_add");
    if(r_thje_add!=null){
  r_thje_add="��";
    }else
  {
  r_thje_add="��";
  }

 String r_thje_mod=request.getParameter("r_thje_mod");
    if(r_thje_mod!=null){
  r_thje_mod="��";
    }else
  {
  r_thje_?��?��<?????????���ج��L�{�n�����P�ˬ�������X���E�`����?�p�����P�?��?���u�����P�?���H��?�����Y��???��?�؛D��??�n�����P�???�u����?�����{?�î���?����ĵ�¬���(mod="��";
  }

 String r_thje_del=request.getParameter("r_thje_del");
    if(r_thje_del!=null){
  r_thje_del="��";
    }else
  {
  r_thje_del="��";
  }

 String r_thje_view=request.getParameter("r_thje_view");
    if(r_thje_view!=null){
  r_thje_view="��";
    }else
  {
  r_thje_view="��";
  }

 String r_thje_zt=request.getParameter("r_thje_zt");
    if(r_thje_zt!=null){
  r_thje_zt="��";
    }else
  {
  r_thje_zt="��";
  }
 String r_hyzc_add=request.getParameter("r_hyzc_add");
    if(r_hyzc_add!=null){
  r_hyzc_add="��";
    }else
  {
  r_hyzc_add="��";
  }

 String r_hyzc_mod=request.getParameter("r_hyzc_mod");
    if(r_hyzc_mod!=null){
  r_hyzc_mod="��";
    }else
  {
  r_hyzc_mod="��";
  }

 String r_hyzc_del=request.getParameter("r_hyzc_del");
    if(r_hyzc_del!=null){
  r_hyzc_del="��";
    }else
  {
  r_hyzc_del="��";
  }

 String r_hyzc_view=request.getParameter("r_hyzc_view");
    if(r_hyzc_view!=null){
  r_hyzc_view="��";
    }else
  {
  r_hyzc_view="��";
  }

 String r_hyzc_zt=request.getParameter("r_hyzc_zt");
    if(r_hyzc_zt!=null){
  r_hyzc_zt="��";
    }else
  {
  r_hyzc_zt="��";
  }
 String r_mtxc_add=request.getParameter("r_mtxc_add");
    if(r_mtxc_add!=null){
  r_mtxc_add="��";
    }else
  {
  r_mtxc_add="��";
  }

 String r_mtxc_mod=request.getParameter("r_mtxc_mod");
    if(r_mtxc_mod!=null){
  r_mtxc_mod="��";
    }else
  {
  r_mtxc_mod="��";
  }

 String r_mtxc_del=request.getParameter("r_mtxc_del");
    if(r_mtxc_del!=null){
  r_mtxc_del="��";
    }else
  {
  r_mtxc_del="��";
  }

 String r_mtxc_view=request.getParameter("r_mtxc_view");
    if(r_mtxc_view!=null){
  r_mtxc_view="��";
    }else
  {
  r_mtxc_view="��";
  }

 String r_mtxc_zt=request.getParameter("r_mtxc_zt");
    if(r_mtxc_zt!=null){
  r_mtxc_zt="��";
    }else
  {
  r_mtxc_zt="��";
  }
 String strSQL="update restrain set restrain_name='" + ename + "',xhadd='" + xhadd + "',xhmod='" + xhmod + "',xhdel='" + xhdel + "',xhview='" + xhview + "',xhzt='" + xhzt + "',linkadd='" + linkadd + "',linkmod='" + linkmod + "',linkdel='" + linkdel + "',linkview='" + linkview + "',linkzt='" + linkzt + "',supadd='" + supadd + "',supmod='" + supmod + "',supdel='" + supdel + "',supview='" + supview + "',supzt='" + supzt + "',actadd='" + actadd + "',actmod='" + actmod + "',actdel='" + actdel + "',actview='" + actview + "',actzt='" + actzt + "',opadd='" + opadd + "',opmod='" + opmod + "',opdel='" + opdel + "',opview='" + opview + "',opzt='" + opzt + "',quoteadd='" + quoteadd + "',quotemod='" + quotemod + "',quotedel='" + quotedel + "',quoteview='" + quoteview + "',quotezt='" + quotezt + "',proadd='" + proadd + "',promod='" + promod + "',prodel='" + prodel + "',proview='" + proview + "',prozt='" + prozt + "',cgadd='" + cgadd + "',cgmod='" + cgmod + "',cgdel='" + cgdel + "',cgview='" + cgview + "',cgzt='" + cgzt + "',tradd='" + tradd + "',trmod='" + trmod + "',trdel='" + trdel + "',trview='" + trview + "',trzt='" + trzt + "',hdadd='" + hdadd + "',hdmod='" + hdmod + "',hddel='" + hddel + "',hdview='" + hdview + "',hdzt='" + hdzt + "',workadd='" + workadd + "',workmod='" + workmod + "',workdel='" + workdel + "',workview='" + workview + "',workzt='" + workzt + "',xmadd='" + xmadd + "',xmmod='" + xmmod + "',xmdel='" + xmdel + "',xmview='" + xmview + "',xmzt='" + xmzt + "',subadd='" + subadd + "',submod='" + submod + "',subdel='" + subdel + "',subview='" + subview + "',subzt='" + subzt + "',manadd='" + manadd + "',manmod='" + manmod + "',mandel='" + mandel + "',manview='" + manview + "',manzt='" + manzt + "',rwadd='" + rwadd + "',rwmod='" + rwmod + "',rwdel='" + rwdel + "',rwview='" + rwview + "',rwzt='" + rwzt + "',fyadd='" + fyadd + "',fymod='" + fymod + "',fydel='" + fydel + "',fyview='" + fyview + "',fyzt='" + fyzt + "',thadd='" + thadd + "',thmod='" + thmod + "',thdel='" + thdel + "',thview='" + thview + "',thzt='" + thzt + "',serveradd='" + serveradd + "',servermod='" + servermod + "',serverdel='" + serverdel + "',serverview='" + serverview + "',serverzt='" + serverzt + "',tsadd='" + tsadd + "',tsmod='" + tsmod + "',tsdel='" + tsdel + "',tsview='" + tsview + "',tszt='" + tszt + "',wxadd='" + wxadd + "',wxmod='" + wxmod + "',wxdel='" + wxdel + "',wxview='" + wxview + "',wxzt='" + wxzt + "',mactadd='" + mactadd + "',mactmod='" + mactmod + "',mactdel='" + mactdel + "',mactview='" + mactview + "',mactzt='" + mactzt + "',jzdsadd='" + jzdsadd + "',jzdsmod='" + jzdsmod + "',jzdsdel='" + jzdsdel + "',jzdsview='" + jzdsview + "',jzdszt='" + jzdszt + "',zskadd='" + zskadd + "',zskmod='" + zskmod + "',zskdel='" + zskdel + "',zskview='" + zskview + "',zskzt='" + zskzt + "',flfgadd='" + flfgadd + "',flfgmod='" + flfgmod + "',flfgdel='" + flfgdel + "',flfgview='" + flfgview + "',flfgzt='" + flfgzt + "',fkhzadd='" + fkhzadd + "',fkhzmod='" + fkhzmod + "',fkhzdel='" + fkhzdel + "',fkhzview='" + fkhzview + "',fkhzzt='" + fkhzzt + "',skhzadd='" + skhzadd + "',skhzmod='" + skhzmod + "',skhzdel='" + skhzdel + "',skhzview='" + skhzview + "',skhzzt='" + skhzzt + "',fkadd='" + fkadd + "',fkmod='" + fkmod + "',fkdel='" + fkdel + "',fkview='" + fkview + "',fkzt='" + fkzt + "',skadd='" + skadd + "',skmod='" + skmod + "',skdel='" + skdel + "',skview='" + skview + "',skzt='" + skzt + "',qkadd='" + qkadd + "',qkmod='" + qkmod + "',qkdel='" + qkdel + "',qkview='" + qkview + "',qkzt='" + qkzt + "',intadd='" + intadd + "',intmod='" + intmod + "',intdel='" + intdel + "',intview='" + intview + "',intzt='" + intzt + "',outadd='" + outadd + "',outmod='" + outmod + "',outdel='" + outdel + "',outview='" + outview + "',outzt='" + outzt + "',syszt='" + syszt + "',qzadd='" + qzadd + "',qzmod='" + qzmod + "',qzdel='" + qzdel + "',qzview='" + qzview + "',qzzt='" + qzzt + "',hzadd='" + hzadd + "',hzmod='" + hzmod + "',hzdel='" + hzdel + "',hzview='" + hzview + "',hzzt='" + hzzt + "',zjadd='" + zjadd + "',zjmod='" + zjmod + "',zjdel='" + zjdel + "',zjview='" + zjview + "',zjzt='" + zjzt + "',r_yfgladd='" + r_yfgladd + "',r_yfglmod='" + r_yfglmod + "',r_yfgldel='" + r_yfgldel + "',r_yfglview='" + r_yfglview + "',r_yfglzt='" + r_yfglzt + "',r_month_jh_add='" + r_month_jh_add + "',r_month_jh_mod='" + r_month_jh_mod + "',r_month_jh_del='" + r_month_jh_del + "',r_month_jh_view='" + r_month_jh_view + "',r_month_jh_zt='" + r_month_jh_zt + "',r_date_r_add='" + r_date_r_add + "',r_date_r_mod='" + r_date_r_mod + "',r_date_r_del='" + r_date_r_del + "',r_date_r_view='" + r_date_r_view + "',r_date_r_zt='" + r_date_r_zt + "',r_week_r_add='" + r_week_r_add + "',r_week_r_mod='" + r_week_r_mod + "',r_week_r_del='" + r_week_r_del + "',r_week_r_view='" + r_week_r_view + "',r_week_r_zt='" + r_week_r_zt + "',r_month_r_add='" + r_month_r_add + "',r_month_r_mod='" + r_month_r_mod + "',r_month_r_del='" + r_month_r_del + "',r_month_r_view='" + r_month_r_view + "',r_month_r_zt='" + r_month_r_zt + "',r_htgl_add='" + r_htgl_add + "',r_htgl_mod='" + r_htgl_mod + "',r_htgl_del='" + r_htgl_del + "',r_htgl_view='" + r_htgl_view + "',r_htgl_zt='" + r_htgl_zt + "',r_jkgl_add='" + r_jkgl_add + "',r_jkgl_mod='" + r_jkgl_mod + "',r_jkgl_del='" + r_jkgl_del + "',r_jkgl_view='" + r_jkgl_view + "',r_jkgl_zt='" + r_jkgl_zt + "',r_fksq_add='" + r_fksq_add + "',r_fksq_mod='" + r_fksq_mod + "',r_fksq_del='" + r_fksq_del + "',r_fksq_view='" + r_fksq_view + "',r_fksq_zt='" + r_fksq_zt + "',r_hyzc_add='" + r_hyzc_add + "',r_hyzc_mod='" + r_hyzc_mod + "',r_hyzc_del='" + r_hyzc_del + "',r_hyzc_view='" + r_hyzc_view + "',r_hyzc_zt='" + r_hyzc_zt + "',r_mtxc_add='" + r_mtxc_add + "',r_mtxc_mod='" + r_mtxc_mod + "',r_mtxc_del='" + r_mtxc_del + "',r_mtxc_view='" + r_mtxc_view + "',r_mtxc_zt='" + r_mtxc_zt + "',r_wlz_add='" + r_wlz_add + "',r_wlz_mod='" + r_wlz_mod + "',r_wlz_del='" + r_wlz_del + "',r_wlz_view='" + r_wlz_view + "',r_wlz_zt='" + r_wlz_zt + "',jcfxzt='" + jcfxzt + "',custzyzt='" + custzyzt + "',r_dzzx_zt='" + r_dzzx_zt + "',r_xscp_zt='" + r_xscp_zt + "' where id='" + id1 + "'";
   boolean t= einfodb.executeUpdate(strSQL);
   if(!t)
   {
     out.println("<font size='2' color='#FF0000'>����ʧ��,������������ݳ���ϵͳ��Χ���������Ͳ���!</font>");
	 return;
   }
 %>
<body bgcolor="#ffffff">
<div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p>

    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
  <p style="font-size:16px; color: #f00; font-family:'����'; letter-spacing:0px; vertical-align:middle;">�޸ĳɹ�!</font></p>
  <p><a href="punit.jsp" style="font-size: 12px">����</a></p>
</div>
</body>
<%}}%>
</html>