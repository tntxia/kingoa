<%@ page contentType="text/html;charset=gb2312" %>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../refuse.jsp"
    </script>
<%   }else
 { 
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����</title>
<link rel=stylesheet href="../client/style.css" type="text/css">
<style type="text/css">
<!--
body {
	background-color: #ffffff;
}
.STYLE2 {font-size: 12px}
-->
</style></head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
 String ename=request.getParameter("restrain_name").trim();
 String id1=request.getParameter("id");
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
 String qzview_yes=request.getParameter("qzview_yes");
    if(qzview_yes!=null){
  qzview_yes="��";
    }else
  {
  qzview_yes="��";
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
 String xhview_yes=request.getParameter("xhview_yes");
    if(xhview_yes!=null){
  xhview_yes="��";
    }else
  {
  xhview_yes="��";
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
 String linkview_yes=request.getParameter("linkview_yes");
    if(linkview_yes!=null){
  linkview_yes="��";
    }else
  {
  linkview_yes="��";
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
  hzmod="��";
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

 String hzview_yes=request.getParameter("hzview_yes");
    if(hzview_yes!=null){
  hzview_yes="��";
    }else
  {
  hzview_yes="��";
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
 String supview_yes=request.getParameter("supview_yes");
    if(supview_yes!=null){
  supview_yes="��";
    }else
  {
  supview_yes="��";
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
 String r_actview_yes=request.getParameter("r_actview_yes");
    if(r_actview_yes!=null){
  r_actview_yes="��";
    }else
  {
  r_actview_yes="��";
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

 String opview=request.getParameter("opview");
    if(opview!=null){
  opview="��";
    }else
  {
  opview="��";
  }
 String opview_yes=request.getParameter("opview_yes");
    if(opview_yes!=null){
  opview_yes="��";
    }else
  {
  opview_yes="��";
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
String quoteview_yes=request.getParameter("quoteview_yes");
   if(quoteview_yes!=null){
  quoteview_yes="��";
    }else
  {
  quoteview_yes="��";
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
 String serverview_yes=request.getParameter("serverview_yes");
    if(serverview_yes!=null){
  serverview_yes="��";
    }else
  {
  serverview_yes="��";
  }

 String serverzt=request.getParameter("serverzt");
    if(serverzt!=null){
  serverzt="��";
    }else
  {
  serverzt="��";
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

 String cgview_yes=request.getParameter("cgview_yes");
    if(cgview_yes!=null){
  cgview_yes="��";
    }else
  {
  cgview_yes="��";
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
 String trview_yes=request.getParameter("trview_yes");
    if(trview_yes!=null){
  trview_yes="��";
    }else
  {
  trview_yes="��";
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
 String workview_yes=request.getParameter("workview_yes");
    if(workview_yes!=null){
  workview_yes="��";
    }else
  {
  workview_yes="��";
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
  xmadd="��";
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
 String xmview_yes=request.getParameter("xmview_yes");
    if(xmview_yes!=null){
  xmview_yes="��";
    }else
  {
  xmview_yes="��";
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
   String subview_yes=request.getParameter("subview_yes");
    if(subview_yes!=null){
  subview_yes="��";
    }else
  {
  subview_yes="��";
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
 String manview_yes=request.getParameter("manview_yes");
    if(manview_yes!=null){
  manview_yes="��";
    }else
  {
  manview_yes="��";
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
    if(rwdel!=null){
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
 String rwview_yes=request.getParameter("rwview_yes");
    if(rwview_yes!=null){
  rwview_yes="��";
    }else
  {
  rwview_yes="��";
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
 String fyview_yes=request.getParameter("fyview_yes");
    if(fyview_yes!=null){
  fyview_yes="��";
    }else
  {
  fyview_yes="��";
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
 String hdview_yes=request.getParameter("hdview_yes");
    if(hdview_yes!=null){
  hdview_yes="��";
    }else
  {
  hdview_yes="��";
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
 String tsview_yes=request.getParameter("tsview_yes");
    if(tsview_yes!=null){
  tsview_yes="��";
    }else
  {
  tsview_yes="��";
  }

 String tszt=request.getParameter("tszt");
    if(tszt!=null){
  tszt="��";
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
 String wxview_yes=request.getParameter("wxview_yes");
    if(wxview_yes!=null){
  wxview_yes="��";
    }else
  {
  wxview_yes="��";
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
 String mactview_yes=request.getParameter("mactview_yes");
    if(mactview_yes!=null){
  mactview_yes="��";
    }else
  {
  mactview_yes="��";
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
 String jzdsview_yes=request.getParameter("jzdsview_yes");
    if(jzdsview_yes!=null){
  jzdsview_yes="��";
    }else
  {
  jzdsview_yes="��";
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
  }

 String zskmod=request.getParameter("zskmod");
    if(zskmod!=null){
  zskmod="��";
    }else
  {
  zskmod="��";
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
 String zskview_yes=request.getParameter("zskview_yes");
    if(zskview_yes!=null){
  zskview_yes="��";
    }else
  {
  zskview_yes="��";
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
 String flfgview_yes=request.getParameter("flfgview_yes");
    if(flfgview_yes!=null){
  flfgview_yes="��";
    }else
  {
  flfgview_yes="��";
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

 String fkhzview_yes=request.getParameter("fkhzview_yes");
    if(fkhzview_yes!=null){
  fkhzview_yes="��";
    }else
  {
  fkhzview_yes="��";
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

 String zjdel=request.getParameter("zjdel");
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
 String zjview_yes=request.getParameter("zjview_yes");
    if(zjview_yes!=null){
  zjview_yes="��";
    }else
  {
  zjview_yes="��";
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
 String skhzview_yes=request.getParameter("skhzview_yes");
    if(skhzview_yes!=null){
  skhzview_yes="��";
    }else
  {
  skhzview_yes="��";
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
 String fkview_yes=request.getParameter("fkview_yes");
    if(fkview_yes!=null){
  fkview_yes="��";
    }else
  {
  fkview_yes="��";
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
  r_skview="��";
    }else
  {
  r_skview="��";
  }
 String r_skview_yes=request.getParameter("r_skview_yes");
    if(r_skview_yes!=null){
  r_skview_yes="��";
    }else
  {
  r_skview_yes="��";
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
 String qkview_yes=request.getParameter("qkview_yes");
    if(qkview_yes!=null){
  qkview_yes="��";
    }else
  {
  qkview_yes="��";
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
 String intview_yes=request.getParameter("intview_yes");
    if(intview_yes!=null){
  intview_yes="��";
    }else
  {
  intview_yes="��";
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
 String outview_yes=request.getParameter("outview_yes");
    if(outview_yes!=null){
  outview_yes="��";
    }else
  {
  outview_yes="��";
  }

 String outzt=request.getParameter("outzt");
    if(outzt!=null){
  outzt="��";
    }else
  {
  outzt="��";
  }

 String r_thadd=request.getParameter("r_thadd");
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
 String r_thview_yes=request.getParameter("r_thview_yes");
    if(r_thview_yes!=null){
  r_thview_yes="��";
    }else
  {
  r_thview_yes="��";
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
 String r_yfglview_yes=request.getParameter("r_yfglview_yes");
    if(r_yfglview_yes!=null){
  r_yfglview_yes="��";
    }else
  {
  r_yfglview_yes="��";
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
  r_htgl_add="��";
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
 String r_htgl_view_yes=request.getParameter("r_htgl_view_yes");
    if(r_htgl_view_yes!=null){
  r_htgl_view_yes="��";
    }else
  {
  r_htgl_view_yes="��";
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
 String r_jkgl_view_yes=request.getParameter("r_jkgl_view_yes");
    if(r_jkgl_view_yes!=null){
  r_jkgl_view_yes="��";
    }else
  {
  r_jkgl_view_yes="��";
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
 String r_fksq_view_yes=request.getParameter("r_fksq_view_yes");
    if(r_fksq_view_yes!=null){
  r_fksq_view_yes="��";
    }else
  {
  r_fksq_view_yes="��";
  }

 String r_fksq_zt=request.getParameter("r_fksq_zt");
    if(r_fksq_zt!=null){
  r_fksq_zt="��";
    }else
  {
  r_fksq_zt="��";
  }
 String r_month_jh_add=request.getParameter("r_month_jh_add");
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
 String r_month_jh_view_yes=request.getParameter("r_month_jh_view_yes");
    if(r_month_jh_view_yes!=null){
  r_month_jh_view_yes="��";
    }else
  {
  r_month_jh_view_yes="��";
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
 String r_date_r_view_yes=request.getParameter("r_date_r_view_yes");
    if(r_date_r_view_yes!=null){
  r_date_r_view_yes="��";
    }else
  {
  r_date_r_view_yes="��";
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

 String r_week_r_view=request.getParameter("r_week_r_view");
    if(r_week_r_view!=null){
  r_week_r_view="��";
    }else
  {
  r_week_r_view="��";
  }
 String r_week_r_view_yes=request.getParameter("r_week_r_view_yes");
    if(r_week_r_view_yes!=null){
  r_week_r_view_yes="��";
    }else
  {
  r_week_r_view_yes="��";
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
 String r_month_r_view_yes=request.getParameter("r_month_r_view_yes");
    if(r_month_r_view_yes!=null){
  r_month_r_view_yes="��";
    }else
  {
  r_month_r_view_yes="��";
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
 String r_wlz_view_yes=request.getParameter("r_wlz_view_yes");
    if(r_wlz_view_yes!=null){
  r_wlz_view_yes="��";
    }else
  {
  r_wlz_view_yes="��";
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
  r_thje_mod="��";
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
 String r_thje_view_yes=request.getParameter("r_thje_view_yes");
    if(r_thje_view_yes!=null){
  r_thje_view_yes="��";
    }else
  {
  r_thje_view_yes="��";
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
 String r_hyzc_view_yes=request.getParameter("r_hyzc_view_yes");
    if(r_hyzc_view_yes!=null){
  r_hyzc_view_yes="��";
    }else
  {
  r_hyzc_view_yes="��";
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
 String r_mtxc_view_yes=request.getParameter("r_mtxc_view_yes");
    if(r_mtxc_view_yes!=null){
  r_mtxc_view_yes="��";
    }else
  {
  r_mtxc_view_yes="��";
  }

 String r_mtxc_zt=request.getParameter("r_mtxc_zt");
    if(r_mtxc_zt!=null){
  r_mtxc_zt="��";
    }else
  {
  r_mtxc_zt="��";
  }
   String r_sam_add=request.getParameter("r_sam_add");
    if(r_sam_add!=null){
  r_sam_add="��";
    }else
  {
  r_sam_add="��";
  }

 String r_sam_mod=request.getParameter("r_sam_mod");
    if(r_sam_mod!=null){
  r_sam_mod="��";
    }else
  {
  r_sam_mod="��";
  }

 String r_sam_del=request.getParameter("r_sam_del");
    if(r_sam_del!=null){
  r_sam_del="��";
    }else
  {
  r_sam_del="��";
  }

 String r_sam_view=request.getParameter("r_sam_view");
    if(r_sam_view!=null){
  r_sam_view="��";
    }else
  {
  r_sam_view="��";
  }
 String r_sam_zt=request.getParameter("r_sam_zt");
    if(r_sam_zt!=null){
  r_sam_zt="��";
    }else
  {
  r_sam_zt="��";
  }
 String r_zzsq_add=request.getParameter("r_zzsq_add");
    if(r_zzsq_add!=null){
  r_zzsq_add="��";
    }else
  {
  r_zzsq_add="��";
  }

 String r_zzsq_mod=request.getParameter("r_zzsq_mod");
    if(r_zzsq_mod!=null){
  r_zzsq_mod="��";
    }else
  {
  r_zzsq_mod="��";
  }

 String r_zzsq_del=request.getParameter("r_zzsq_del");
    if(r_zzsq_del!=null){
  r_zzsq_del="��";
    }else
  {
  r_zzsq_del="��";
  }

 String r_zzsq_view=request.getParameter("r_zzsq_view");
    if(r_zzsq_view!=null){
  r_zzsq_view="��";
    }else
  {
  r_zzsq_view="��";
  }
 String r_zzsq_zt=request.getParameter("r_zzsq_zt");
    if(r_zzsq_zt!=null){
  r_zzsq_zt="��";
    }else
  {
  r_zzsq_zt="��";
  }

 String r_jcsq_add=request.getParameter("r_jcsq_add");
    if(r_jcsq_add!=null){
  r_jcsq_add="��";
    }else
  {
  r_jcsq_add="��";
  }

 String r_jcsq_mod=request.getParameter("r_jcsq_mod");
    if(r_jcsq_mod!=null){
  r_jcsq_mod="��";
    }else
  {
  r_jcsq_mod="��";
  }

 String r_jcsq_del=request.getParameter("r_jcsq_del");
    if(r_jcsq_del!=null){
  r_jcsq_del="��";
    }else
  {
  r_jcsq_del="��";
  }

 String r_jcsq_view=request.getParameter("r_jcsq_view");
    if(r_jcsq_view!=null){
  r_jcsq_view="��";
    }else
  {
  r_jcsq_view="��";
  }
 String r_jcsq_zt=request.getParameter("r_jcsq_zt");
    if(r_jcsq_zt!=null){
  r_jcsq_zt="��";
    }else
  {
  r_jcsq_zt="��";
  }

 String r_xzyd_add=request.getParameter("r_xzyd_add");
    if(r_xzyd_add!=null){
  r_xzyd_add="��";
    }else
  {
  r_xzyd_add="��";
  }

 String r_xzyd_mod=request.getParameter("r_xzyd_mod");
    if(r_xzyd_mod!=null){
  r_xzyd_mod="��";
    }else
  {
  r_xzyd_mod="��";
  }

 String r_xzyd_del=request.getParameter("r_xzyd_del");
    if(r_xzyd_del!=null){
  r_xzyd_del="��";
    }else
  {
  r_xzyd_del="��";
  }

 String r_xzyd_view=request.getParameter("r_xzyd_view");
    if(r_xzyd_view!=null){
  r_xzyd_view="��";
    }else
  {
  r_xzyd_view="��";
  }
 String r_xzyd_zt=request.getParameter("r_xzyd_zt");
    if(r_xzyd_zt!=null){
  r_xzyd_zt="��";
    }else
  {
  r_xzyd_zt="��";
  }
  
 String r_ccsq_add=request.getParameter("r_ccsq_add");
    if(r_ccsq_add!=null){
  r_ccsq_add="��";
    }else
  {
  r_ccsq_add="��";
  }

 String r_ccsq_mod=request.getParameter("r_ccsq_mod");
    if(r_ccsq_mod!=null){
  r_ccsq_mod="��";
    }else
  {
  r_ccsq_mod="��";
  }

 String r_ccsq_del=request.getParameter("r_ccsq_del");
    if(r_ccsq_del!=null){
  r_ccsq_del="��";
    }else
  {
  r_ccsq_del="��";
  }

 String r_ccsq_view=request.getParameter("r_ccsq_view");
    if(r_ccsq_view!=null){
  r_ccsq_view="��";
    }else
  {
  r_ccsq_view="��";
  }
 String r_ccsq_zt=request.getParameter("r_ccsq_zt");
    if(r_ccsq_zt!=null){
  r_ccsq_zt="��";
    }else
  {
  r_ccsq_zt="��";
  }
 String r_bgyp_add=request.getParameter("r_bgyp_add");
    if(r_bgyp_add!=null){
  r_bgyp_add="��";
    }else
  {
  r_bgyp_add="��";
  }

 String r_bgyp_mod=request.getParameter("r_bgyp_mod");
    if(r_bgyp_mod!=null){
  r_bgyp_mod="��";
    }else
  {
  r_bgyp_mod="��";
  }

 String r_bgyp_del=request.getParameter("r_bgyp_del");
    if(r_bgyp_del!=null){
  r_bgyp_del="��";
    }else
  {
  r_bgyp_del="��";
  }

 String r_bgyp_view=request.getParameter("r_bgyp_view");
    if(r_bgyp_view!=null){
  r_bgyp_view="��";
    }else
  {
  r_bgyp_view="��";
  }
 String r_bgyp_zt=request.getParameter("r_bgyp_zt");
    if(r_bgyp_zt!=null){
  r_bgyp_zt="��";
    }else
  {
  r_bgyp_zt="��";
  }

 String r_nbqc_add=request.getParameter("r_nbqc_add");
    if(r_nbqc_add!=null){
  r_nbqc_add="��";
    }else
  {
  r_nbqc_add="��";
  }

 String r_nbqc_mod=request.getParameter("r_nbqc_mod");
    if(r_nbqc_mod!=null){
  r_nbqc_mod="��";
    }else
  {
  r_nbqc_mod="��";
  }

 String r_nbqc_del=request.getParameter("r_nbqc_del");
    if(r_nbqc_del!=null){
  r_nbqc_del="��";
    }else
  {
  r_nbqc_del="��";
  }

 String r_nbqc_view=request.getParameter("r_nbqc_view");
    if(r_nbqc_view!=null){
  r_nbqc_view="��";
    }else
  {
  r_nbqc_view="��";
  }
 String r_nbqc_zt=request.getParameter("r_nbqc_zt");
    if(r_nbqc_zt!=null){
  r_nbqc_zt="��";
    }else
  {
  r_nbqc_zt="��";
  }

 String r_yjsq_add=request.getParameter("r_yjsq_add");
    if(r_yjsq_add!=null){
  r_yjsq_add="��";
    }else
  {
  r_yjsq_add="��";
  }

 String r_yjsq_mod=request.getParameter("r_yjsq_mod");
    if(r_yjsq_mod!=null){
  r_yjsq_mod="��";
    }else
  {
  r_yjsq_mod="��";
  }

 String r_yjsq_del=request.getParameter("r_yjsq_del");
    if(r_yjsq_del!=null){
  r_yjsq_del="��";
    }else
  {
  r_yjsq_del="��";
  }

 String r_yjsq_view=request.getParameter("r_yjsq_view");
    if(r_yjsq_view!=null){
  r_yjsq_view="��";
    }else
  {
  r_yjsq_view="��";
  }
 String r_yjsq_zt=request.getParameter("r_yjsq_zt");
    if(r_yjsq_zt!=null){
  r_yjsq_zt="��";
    }else
  {
  r_yjsq_zt="��";
  }

 String r_spbm_add=request.getParameter("r_spbm_add");
    if(r_spbm_add!=null){
  r_spbm_add="��";
    }else
  {
  r_spbm_add="��";
  }

 String r_spbm_mod=request.getParameter("r_spbm_mod");
    if(r_spbm_mod!=null){
  r_spbm_mod="��";
    }else
  {
  r_spbm_mod="��";
  }

 String r_spbm_del=request.getParameter("r_spbm_del");
    if(r_spbm_del!=null){
  r_spbm_del="��";
    }else
  {
  r_spbm_del="��";
  }

 String r_spbm_view=request.getParameter("r_spbm_view");
    if(r_spbm_view!=null){
  r_spbm_view="��";
    }else
  {
  r_spbm_view="��";
  }
 String r_spbm_zt=request.getParameter("r_spbm_zt");
    if(r_spbm_zt!=null){
  r_spbm_zt="��";
    }else
  {
  r_spbm_zt="��";
  }

 String r_xphh_add=request.getParameter("r_xphh_add");
    if(r_xphh_add!=null){
  r_xphh_add="��";
    }else
  {
  r_xphh_add="��";
  }

 String r_xphh_mod=request.getParameter("r_xphh_mod");
    if(r_xphh_mod!=null){
  r_xphh_mod="��";
    }else
  {
  r_xphh_mod="��";
  }

 String r_xphh_del=request.getParameter("r_xphh_del");
    if(r_xphh_del!=null){
  r_xphh_del="��";
    }else
  {
  r_xphh_del="��";
  }

 String r_xphh_view=request.getParameter("r_xphh_view");
    if(r_xphh_view!=null){
  r_xphh_view="��";
    }else
  {
  r_xphh_view="��";
  }
 String r_xphh_zt=request.getParameter("r_xphh_zt");
    if(r_xphh_zt!=null){
  r_xphh_zt="��";
    }else
  {
  r_xphh_zt="��";
  }
 String r_sup_xj_add=request.getParameter("r_sup_xj_add");
    if(r_sup_xj_add!=null){
  r_sup_xj_add="��";
    }else
  {
  r_sup_xj_add="��";
  }

 String r_sup_xj_mod=request.getParameter("r_sup_xj_mod");
    if(r_sup_xj_mod!=null){
  r_sup_xj_mod="��";
    }else
  {
  r_sup_xj_mod="��";
  }

 String r_sup_xj_del=request.getParameter("r_sup_xj_del");
    if(r_sup_xj_del!=null){
  r_sup_xj_del="��";
    }else
  {
  r_sup_xj_del="��";
  }

 String r_sup_xj_view=request.getParameter("r_sup_xj_view");
    if(r_sup_xj_view!=null){
  r_sup_xj_view="��";
    }else
  {
  r_sup_xj_view="��";
  }
 String r_sup_xj_zt=request.getParameter("r_sup_xj_zt");
    if(r_sup_xj_zt!=null){
  r_sup_xj_zt="��";
    }else
  {
  r_sup_xj_zt="��";
  }

 String r_cus_xj_add=request.getParameter("r_cus_xj_add");
    if(r_cus_xj_add!=null){
  r_cus_xj_add="��";
    }else
  {
  r_cus_xj_add="��";
  }

 String r_cus_xj_mod=request.getParameter("r_cus_xj_mod");
    if(r_cus_xj_mod!=null){
  r_cus_xj_mod="��";
    }else
  {
  r_cus_xj_mod="��";
  }

 String r_cus_xj_del=request.getParameter("r_cus_xj_del");
    if(r_cus_xj_del!=null){
  r_cus_xj_del="��";
    }else
  {
  r_cus_xj_del="��";
  }

 String r_cus_xj_view=request.getParameter("r_cus_xj_view");
    if(r_cus_xj_view!=null){
  r_cus_xj_view="��";
    }else
  {
  r_cus_xj_view="��";
  }
 String r_cus_xj_zt=request.getParameter("r_cus_xj_zt");
    if(r_cus_xj_zt!=null){
  r_cus_xj_zt="��";
    }else
  {
  r_cus_xj_zt="��";
  }

 String r_wage_add=request.getParameter("r_wage_add");
    if(r_wage_add!=null){
  r_wage_add="��";
    }else
  {
  r_wage_add="��";
  }

 String r_wage_mod=request.getParameter("r_wage_mod");
    if(r_wage_mod!=null){
  r_wage_mod="��";
    }else
  {
  r_wage_mod="��";
  }

 String r_wage_del=request.getParameter("r_wage_del");
    if(r_wage_del!=null){
  r_wage_del="��";
    }else
  {
  r_wage_del="��";
  }

 String r_wage_view=request.getParameter("r_wage_view");
    if(r_wage_view!=null){
  r_wage_view="��";
    }else
  {
  r_wage_view="��";
  }
 String r_wage_zt=request.getParameter("r_wage_zt");
    if(r_wage_zt!=null){
  r_wage_zt="��";
    }else
  {
  r_wage_zt="��";
  }

 String r_wx_gt_view=request.getParameter("r_wx_gt_view");
    if(r_wx_gt_view!=null){
  r_wx_gt_view="��";
    }else
  {
  r_wx_gt_view="��";
  }
 String r_wx_gt_zt=request.getParameter("r_wx_gt_zt");
    if(r_wx_gt_zt!=null){
  r_wx_gt_zt="��";
    }else
  {
  r_wx_gt_zt="��";
  }

 String profl=request.getParameter("profl");
 int tt=0;
 String i1=request.getParameter("i");
 if(i1!=null)
  tt=Integer.parseInt(i1);
    for(int i=1;i<tt;i++)
    {
 String s="��";
 String prozt=request.getParameter("prozt"+i);
   if(prozt!=null){
  prozt="��";
    }else
  {
  prozt="��";
  }
 String gp=request.getParameter("gp"+i);
 String proadd=request.getParameter("proadd"+i);
  if(proadd!=null){
  proadd="��";
    }else
  {
  proadd="��";
  }
 String promod=request.getParameter("promod"+i);
  if(promod!=null){
  promod="��";
    }else
  {
  promod="��";
  }
 String prodel=request.getParameter("prodel"+i);
  if(prodel!=null){
  prodel="��";
    }else
  {
  prodel="��";
  }
 String proview=request.getParameter("proview"+i);
  if(proview!=null){
  proview="��";
    }else
  {
  proview="��";
  }
 String proview_yes=request.getParameter("proview_yes"+i);
  if(proview_yes!=null){
  proview_yes="��";
    }else
  {
  proview_yes="��";
  }
    String sqlc="select  *  from restrain_gp where restrain_name='"+ename+"' and pro_ck='"+gp+"'";
  ResultSet rsc=einfodb.executeQuery(sqlc);
 if(rsc.next())
  {
   String strSQLgp="update restrain_gp set pro_zt='"+prozt+"',pro_add='"+proadd+"',pro_mod='"+promod+"',pro_del='"+prodel+"',pro_view='"+proview+"',proview_price='"+proview_yes+"' where restrain_name='"+ename+"' and pro_ck='"+gp+"'";
   boolean tgp= einfodb.executeUpdate(strSQLgp);
   if(!tgp)
   {
     out.println("<font size='2' color='#FF0000'>����ʧ��,������������ݳ���ϵͳ��Χ���������Ͳ���!</font>");
	 return;
   }
  }
  else {
   String strSQLgp="insert into restrain_gp values('"+ename+"','"+gp+"','"+prozt+"','"+proadd+"','"+promod+"','"+prodel+"','"+proview+"','"+proview_yes+"')";
   boolean tgp= einfodb.executeUpdate(strSQLgp);
   if(!tgp)
   {
     out.println("<font size='2' color='#FF0000'>����ʧ��,������������ݳ���ϵͳ��Χ���������Ͳ���!</font>");
	 return;
   }}
}

 String strSQL="update restrain set restrain_name='" + ename + "',xhadd='" + xhadd + "',profl='" + profl + "',xhmod='" + xhmod + "',xhdel='" + xhdel + "',xhview='" + xhview + "',xhview_yes='" + xhview_yes + "',xhzt='" + xhzt + "',linkadd='" + linkadd + "',linkmod='" + linkmod + "',linkdel='" + linkdel + "',linkview='" + linkview + "',linkview_yes='" + linkview_yes + "',linkzt='" + linkzt + "',supadd='" + supadd + "',supmod='" + supmod + "',supdel='" + supdel + "',supview='" + supview + "',supview_yes='" + supview_yes + "',supzt='" + supzt + "',actadd='" + r_actadd + "',actmod='" + r_actmod + "',actdel='" + r_actdel + "',actview='" + r_actview + "',actview_yes='" + r_actview_yes + "',actzt='" + actzt + "',opadd='" + opadd + "',opmod='" + opmod + "',opdel='" + opdel + "',opview='" + opview + "',opview_yes='" + opview_yes + "',opzt='" + opzt + "',quoteadd='" + quoteadd + "',quotemod='" + quotemod + "',quotedel='" + quotedel + "',quoteview='" + quoteview + "',quoteview_yes='" + quoteview_yes + "',quotezt='" + quotezt + "',cgadd='" + cgadd + "',cgmod='" + cgmod + "',cgdel='" + cgdel + "',cgview='" + cgview + "',cgview_yes='" + cgview_yes + "',cgzt='" + cgzt + "',tradd='" + tradd + "',trmod='" + trmod + "',trdel='" + trdel + "',trview='" + trview + "',trview_yes='" + trview_yes + "',trzt='" + trzt + "',hdadd='" + hdadd + "',hdmod='" + hdmod + "',hddel='" + hddel + "',hdview='" + hdview + "',hdview_yes='" + hdview_yes + "',hdzt='" + hdzt + "',workadd='" + workadd + "',workmod='" + workmod + "',workdel='" + workdel + "',workview='" + workview + "',workview_yes='" + workview_yes + "',workzt='" + workzt + "',xmadd='" + xmadd + "',xmmod='" + xmmod + "',xmdel='" + xmdel + "',xmview='" + xmview + "',xmview_yes='" + xmview_yes + "',xmzt='" + xmzt + "',subadd='" + subadd + "',submod='" + submod + "',subdel='" + subdel + "',subview='" + subview + "',subview_yes='" + subview_yes + "',subzt='" + subzt + "',manadd='" + manadd + "',manmod='" + manmod + "',mandel='" + mandel + "',manview='" + manview + "',manview_yes='" + manview_yes + "',manzt='" + manzt + "',rwadd='" + rwadd + "',rwmod='" + rwmod + "',rwdel='" + rwdel + "',rwview='" + rwview + "',rwview_yes='" + rwview_yes + "',rwzt='" + rwzt + "',fyadd='" + fyadd + "',fymod='" + fymod + "',fydel='" + fydel + "',fyview='" + fyview + "',fyview_yes='" + fyview_yes + "',fyzt='" + fyzt + "',thadd='" + r_thadd + "',thmod='" + r_thmod + "',thdel='" + r_thdel + "',thview='" + r_thview + "',thview_yes='" + r_thview_yes + "',thzt='" + thzt + "',serveradd='" + serveradd + "',servermod='" + servermod + "',serverdel='" + serverdel + "',serverview='" + serverview + "',serverview_yes='" + serverview_yes + "',serverzt='" + serverzt + "',tsadd='" + tsadd + "',tsmod='" + tsmod + "',tsdel='" + tsdel + "',tsview='" + tsview + "',tsview_yes='" + tsview_yes + "',tszt='" + tszt + "',wxadd='" + wxadd + "',wxmod='" + wxmod + "',wxdel='" + wxdel + "',wxview='" + wxview + "',wxview_yes='" + wxview_yes + "',wxzt='" + wxzt + "',mactadd='" + mactadd + "',mactmod='" + mactmod + "',mactdel='" + mactdel + "',mactview='" + mactview + "',mactview_yes='" + mactview_yes + "',mactzt='" + mactzt + "',jzdsadd='" + jzdsadd + "',jzdsmod='" + jzdsmod + "',jzdsdel='" + jzdsdel + "',jzdsview='" + jzdsview + "',jzdsview_yes='" + jzdsview_yes + "',jzdszt='" + jzdszt + "',zskadd='" + zskadd + "',zskmod='" + zskmod + "',zskdel='" + zskdel + "',zskview='" + zskview + "',zskview_yes='" + zskview_yes + "',zskzt='" + zskzt + "',flfgadd='" + flfgadd + "',flfgmod='" + flfgmod + "',flfgdel='" + flfgdel + "',flfgview='" + flfgview + "',flfgview_yes='" + flfgview_yes + "',flfgzt='" + flfgzt + "',fkhzadd='" + fkhzadd + "',fkhzmod='" + fkhzmod + "',fkhzdel='" + fkhzdel + "',fkhzview='" + fkhzview + "',fkhzview_yes='" + fkhzview_yes + "',fkhzzt='" + fkhzzt + "',skhzadd='" + skhzadd + "',skhzmod='" + skhzmod + "',skhzdel='" + skhzdel + "',skhzview='" + skhzview + "',skhzview_yes='" + skhzview_yes + "',skhzzt='" + skhzzt + "',fkmod='" + fkmod + "',fkdel='" + fkdel + "',fkview='" + fkview + "',fkview_yes='" + fkview_yes + "',fkzt='" + fkzt + "',skmod='" + r_skmod + "',skdel='" + r_skdel + "',skview='" + r_skview + "',skview_yes='" + r_skview_yes + "',skzt='" + skzt + "',qkmod='" + qkmod + "',qkdel='" + qkdel + "',qkview='" + qkview + "',qkview_yes='" + qkview_yes + "',qkzt='" + qkzt + "',intadd='" + intadd + "',intmod='" + intmod + "',intdel='" + intdel + "',intview='" + intview + "',intview_yes='" + intview_yes + "',intzt='" + intzt + "',outadd='" + outadd + "',outmod='" + outmod + "',outdel='" + outdel + "',outview='" + outview + "',outview_yes='" + outview_yes + "',outzt='" + outzt + "',syszt='" + syszt + "',qzadd='" + qzadd + "',qzmod='" + qzmod + "',qzdel='" + qzdel + "',qzview='" + qzview + "',qzview_yes='" + qzview_yes + "',qzzt='" + qzzt + "',hzadd='" + hzadd + "',hzmod='" + hzmod + "',hzdel='" + hzdel + "',hzview='" + hzview + "',hzview_yes='" + hzview_yes + "',hzzt='" + hzzt + "',zjadd='" + zjadd + "',zjmod='" + zjmod + "',zjdel='" + zjdel + "',zjview='" + zjview + "',zjview_yes='" + zjview_yes + "',zjzt='" + zjzt + "',r_yfgladd='" + r_yfgladd + "',r_yfglmod='" + r_yfglmod + "',r_yfgldel='" + r_yfgldel + "',r_yfglview='" + r_yfglview + "',r_yfglview_yes='" + r_yfglview_yes + "',r_yfglzt='" + r_yfglzt + "',r_month_jh_add='" + r_month_jh_add + "',r_month_jh_mod='" + r_month_jh_mod + "',r_month_jh_del='" + r_month_jh_del + "',r_month_jh_view='" + r_month_jh_view + "',r_month_jh_view_yes='" + r_month_jh_view_yes + "',r_month_jh_zt='" + r_month_jh_zt + "',r_date_r_add='" + r_date_r_add + "',r_date_r_mod='" + r_date_r_mod + "',r_date_r_del='" + r_date_r_del + "',r_date_r_view='" + r_date_r_view + "',r_date_r_view_yes='" + r_date_r_view_yes + "',r_date_r_zt='" + r_date_r_zt + "',r_week_r_add='" + r_week_r_add + "',r_week_r_mod='" + r_week_r_mod + "',r_week_r_del='" + r_week_r_del + "',r_week_r_view='" + r_week_r_view + "',r_week_r_view_yes='" + r_week_r_view_yes + "',r_week_r_zt='" + r_week_r_zt + "',r_month_r_add='" + r_month_r_add + "',r_month_r_mod='" + r_month_r_mod + "',r_month_r_del='" + r_month_r_del + "',r_month_r_view='" + r_month_r_view + "',r_month_r_view_yes='" + r_month_r_view_yes + "',r_month_r_zt='" + r_month_r_zt + "',r_htgl_add='" + r_htgl_add + "',r_htgl_mod='" + r_htgl_mod + "',r_htgl_del='" + r_htgl_del + "',r_htgl_view='" + r_htgl_view + "',r_htgl_view_yes='" + r_htgl_view_yes + "',r_htgl_zt='" + r_htgl_zt + "',r_jkgl_add='" + r_jkgl_add + "',r_jkgl_mod='" + r_jkgl_mod + "',r_jkgl_del='" + r_jkgl_del + "',r_jkgl_view='" + r_jkgl_view + "',r_jkgl_view_yes='" + r_jkgl_view_yes + "',r_jkgl_zt='" + r_jkgl_zt + "',r_fksq_add='" + r_fksq_add + "',r_fksq_mod='" + r_fksq_mod + "',r_fksq_del='" + r_fksq_del + "',r_fksq_view='" + r_fksq_view + "',r_fksq_view_yes='" + r_fksq_view_yes + "',r_fksq_zt='" + r_fksq_zt + "',r_hyzc_add='" + r_hyzc_add + "',r_hyzc_mod='" + r_hyzc_mod + "',r_hyzc_del='" + r_hyzc_del + "',r_hyzc_view='" + r_hyzc_view + "',r_hyzc_view_yes='" + r_hyzc_view_yes + "',r_hyzc_zt='" + r_hyzc_zt + "',r_mtxc_add='" + r_mtxc_add + "',r_mtxc_mod='" + r_mtxc_mod + "',r_mtxc_del='" + r_mtxc_del + "',r_mtxc_view='" + r_mtxc_view + "',r_mtxc_view_yes='" + r_mtxc_view_yes + "',r_mtxc_zt='" + r_mtxc_zt + "',r_wlz_add='" + r_wlz_add + "',r_wlz_mod='" + r_wlz_mod + "',r_wlz_del='" + r_wlz_del + "',r_wlz_view='" + r_wlz_view + "',r_wlz_view_yes='" + r_wlz_view_yes + "',r_wlz_zt='" + r_wlz_zt + "',r_thje_mod='" + r_thje_mod + "',r_thje_del='" + r_thje_del + "',r_thje_view='" + r_thje_view + "',r_thje_view_yes='" + r_thje_view_yes + "',r_thje_zt='" + r_thje_zt + "',jcfxzt='" + jcfxzt + "',custzyzt='" + custzyzt + "',r_dzzx_zt='" + r_dzzx_zt + "',r_xscp_zt='" + r_xscp_zt + "',r_sam_add='" + r_sam_add + "',r_sam_mod='" + r_sam_mod + "',r_sam_del='" + r_sam_del + "',r_sam_view='" + r_sam_view + "',r_sam_zt='" + r_sam_zt + "',r_zzsq_add='" + r_zzsq_add + "',r_zzsq_mod='" + r_zzsq_mod + "',r_zzsq_del='" + r_zzsq_del + "',r_zzsq_view='" + r_zzsq_view + "',r_zzsq_zt='" + r_zzsq_zt + "',r_jcsq_add='" + r_jcsq_add + "',r_jcsq_mod='" + r_jcsq_mod + "',r_jcsq_del='" + r_jcsq_del + "',r_jcsq_view='" + r_jcsq_view + "',r_jcsq_zt='" + r_jcsq_zt + "',r_xzyd_add='" + r_xzyd_add + "',r_xzyd_mod='" + r_xzyd_mod + "',r_xzyd_del='" + r_xzyd_del + "',r_xzyd_view='" + r_xzyd_view + "',r_xzyd_zt='" + r_xzyd_zt + "',r_ccsq_add='" + r_ccsq_add + "',r_ccsq_mod='" + r_ccsq_mod + "',r_ccsq_del='" + r_ccsq_del + "',r_ccsq_view='" + r_ccsq_view + "',r_ccsq_zt='" + r_ccsq_zt + "',r_bgyp_add='" + r_bgyp_add + "',r_bgyp_mod='" + r_bgyp_mod + "',r_bgyp_del='" + r_bgyp_del + "',r_bgyp_view='" + r_bgyp_view + "',r_bgyp_zt='" + r_bgyp_zt + "',r_nbqc_add='" + r_nbqc_add + "',r_nbqc_mod='" + r_nbqc_mod + "',r_nbqc_del='" + r_nbqc_del + "',r_nbqc_view='" + r_nbqc_view + "',r_nbqc_zt='" + r_nbqc_zt + "',r_yjsq_add='" + r_yjsq_add + "',r_yjsq_mod='" + r_yjsq_mod + "',r_yjsq_del='" + r_yjsq_del + "',r_yjsq_view='" + r_yjsq_view + "',r_yjsq_zt='" + r_yjsq_zt + "',r_spbm_add='" + r_spbm_add + "',r_spbm_mod='" + r_spbm_mod + "',r_spbm_del='" + r_spbm_del + "',r_spbm_view='" + r_spbm_view + "',r_spbm_zt='" + r_spbm_zt + "',r_xphh_add='" + r_xphh_add + "',r_xphh_mod='" + r_xphh_mod + "',r_xphh_del='" + r_xphh_del + "',r_xphh_view='" + r_xphh_view + "',r_xphh_zt='" + r_xphh_zt + "',r_wage_add='" + r_wage_add + "',r_wage_mod='" + r_wage_mod + "',r_wage_del='" + r_wage_del + "',r_wage_view='" + r_wage_view + "',r_wage_zt='" + r_wage_zt + "',r_cus_xj_add='" + r_cus_xj_add + "',r_cus_xj_mod='" + r_cus_xj_mod + "',r_cus_xj_del='" + r_cus_xj_del + "',r_cus_xj_view='" + r_cus_xj_view + "',r_cus_xj_zt='" + r_cus_xj_zt + "',r_sup_xj_add='" + r_sup_xj_add + "',r_sup_xj_mod='" + r_sup_xj_mod + "',r_sup_xj_del='" + r_sup_xj_del + "',r_sup_xj_view='" + r_sup_xj_view + "',r_sup_xj_zt='" + r_sup_xj_zt + "',r_wx_gt_zt='" + r_wx_gt_zt + "',r_wx_gt_view='" + r_wx_gt_view + "'    where id='" + id1 + "'";
   boolean t= einfodb.executeUpdate(strSQL);
   if(!t)
   {
     out.println("<font size='2' color='#FF0000'>����ʧ��,������������ݳ���ϵͳ��Χ���������Ͳ���!</font>");
	 return;
   }

 %>
<body>
<div align="center"><br><br><br> <p><img src="../../images/cg.jpg" width="111" height="111"></p>

    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
  <p style="font-size:16px; color: #f00; font-family:'����'; letter-spacing:0px; vertical-align:middle;">�����ɹ�!</p>
  <p><span class="STYLE2"><a href="npunit.jsp" style="font-size: 12px">��������</a> <a href="javascript:window.close()" style="font-size: 12px">�ر�</a> 
      <a href="punit.jsp" style="font-size: 12px">����</a> </span></p>
</div>
</body>
<%}%>
</html>