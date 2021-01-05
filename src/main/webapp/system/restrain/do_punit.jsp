<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../../common/checkManageLogin.jsp" %>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>增加</title>
<link rel=stylesheet href="../client/style.css" type="text/css">
<style type="text/css">
<!--
body {
	background-color: #ffffff;
}
.STYLE1 {font-size: 12px}
-->
</style></head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%

request.setCharacterEncoding("gb2312");

 String ename=request.getParameter("restrain_name").trim();
 String qzadd=request.getParameter("qzadd");
  if(qzadd!=null){
  qzadd="有";
    }else
  {
  qzadd="无";
  }

 String qzmod=request.getParameter("qzmod");
   if(qzmod!=null){
  qzmod="有";
    }else
  {
  qzmod="无";
  }
 String qzdel=request.getParameter("qzdel");
   if(qzdel!=null){
  qzdel="有";
    }else
  {
  qzdel="无";
  }

 String qzview=request.getParameter("qzview");
    if(qzview!=null){
  qzview="有";
    }else
  {
  qzview="无";
  }
 String qzview_yes=request.getParameter("qzview_yes");
  qzview_yes="有";
 String qzzt=request.getParameter("qzzt");
    if(qzzt!=null){
  qzzt="有";
    }else
  {
  qzzt="无";
  }

 String xhadd=request.getParameter("xhadd");
    if(xhadd!=null){
  xhadd="有";
    }else
  {
  xhadd="无";
  }

 String xhmod=request.getParameter("xhmod");
    if(xhmod!=null){
  xhmod="有";
    }else
  {
  xhmod="无";
  }

 String xhdel=request.getParameter("xhdel");
    if(xhdel!=null){
  xhdel="有";
    }else
  {
  xhdel="无";
  }

 String xhview=request.getParameter("xhview");
    if(xhview!=null){
  xhview="有";
    }else
  {
  xhview="无";
  }
 String xhview_yes=request.getParameter("xhview_yes");
  xhview_yes="有";
 String xhzt=request.getParameter("xhzt");
    if(xhzt!=null){
  xhzt="有";
    }else
  {
  xhzt="无";
  }

 String linkadd=request.getParameter("linkadd");
    if(linkadd!=null){
  linkadd="有";
    }else
  {
  linkadd="无";
  }

 String linkmod=request.getParameter("linkmod");
    if(linkmod!=null){
  linkmod="有";
    }else
  {
  linkmod="无";
  }

 String linkdel=request.getParameter("linkdel");
    if(linkdel!=null){
  linkdel="有";
    }else
  {
  linkdel="无";
  }

 String linkview=request.getParameter("linkview");
    if(linkview!=null){
  linkview="有";
    }else
  {
  linkview="无";
  }
 String linkview_yes=request.getParameter("linkview_yes");
  linkview_yes="有";
 String linkzt=request.getParameter("linkzt");
    if(linkzt!=null){
  linkzt="有";
    }else
  {
  linkzt="无";
  }

 String hzadd=request.getParameter("hzadd");
    if(hzadd!=null){
  hzadd="有";
    }else
  {
  hzadd="无";
  }

 String hzmod=request.getParameter("hzmod");
    if(hzmod!=null){
  hzmod="有";
    }else
  {
  hzmod="无";
  }

 String hzdel=request.getParameter("hzdel");
    if(hzdel!=null){
  hzdel="有";
    }else
  {
  hzdel="无";
  }

 String hzview=request.getParameter("hzview");
    if(hzview!=null){
  hzview="有";
    }else
  {
  hzview="无";
  }

 String hzview_yes=request.getParameter("hzview_yes");
  hzview_yes="有";
 String hzzt=request.getParameter("hzzt");
    if(hzzt!=null){
  hzzt="有";
    }else
  {
  hzzt="无";
  }

 String supadd=request.getParameter("supadd");
    if(supadd!=null){
  supadd="有";
    }else
  {
  supadd="无";
  }

 String supmod=request.getParameter("supmod");
    if(supmod!=null){
  supmod="有";
    }else
  {
  supmod="无";
  }

 String supdel=request.getParameter("supdel");
    if(supdel!=null){
  supdel="有";
    }else
  {
  supdel="无";
  }

 String supview=request.getParameter("supview");
    if(supview!=null){
  supview="有";
    }else
  {
  supview="无";
  }
 String supview_yes=request.getParameter("supview_yes");
  supview_yes="有";

 String supzt=request.getParameter("supzt");
    if(supzt!=null){
  supzt="有";
    }else
  {
  supzt="无";
  }

 String r_actadd=request.getParameter("r_actadd");
    if(r_actadd!=null){
  r_actadd="有";
    }else
  {
  r_actadd="无";
  }

 String r_actmod=request.getParameter("r_actmod");
    if(r_actmod!=null){
  r_actmod="有";
    }else
  {
  r_actmod="无";
  }

 String r_actdel=request.getParameter("r_actdel");
    if(r_actdel!=null){
  r_actdel="有";
    }else
  {
  r_actdel="无";
  }

 String r_actview=request.getParameter("r_actview");
    if(r_actview!=null){
  r_actview="有";
    }else
  {
  r_actview="无";
  }
 String r_actview_yes=request.getParameter("r_actview_yes");
  r_actview_yes="有";
 String actzt=request.getParameter("actzt");
    if(actzt!=null){
  actzt="有";
    }else
  {
  actzt="无";
  }

 String opadd=request.getParameter("opadd");
    if(opadd!=null){
  opadd="有";
    }else
  {
  opadd="无";
  }

 String opmod=request.getParameter("opmod");
    if(opmod!=null){
  opmod="有";
    }else
  {
  opmod="无";
  }

 String opdel=request.getParameter("opdel");
    if(opdel!=null){
  opdel="有";
    }else
  {
  opdel="无";
  }

 String opview=request.getParameter("opview");
    if(opview!=null){
  opview="有";
    }else
  {
  opview="无";
  }
 String opview_yes=request.getParameter("opview_yes");
  opview_yes="有";
 String opzt=request.getParameter("opzt");
    if(opzt!=null){
  opzt="有";
    }else
  {
  opzt="无";
  }

 String quoteadd=request.getParameter("quoteadd");
    if(quoteadd!=null){
  quoteadd="有";
    }else
  {
  quoteadd="无";
  }

 String quotemod=request.getParameter("quotemod");
    if(quotemod!=null){
  quotemod="有";
    }else
  {
  quotemod="无";
  }

 String quotedel=request.getParameter("quotedel");
    if(quotedel!=null){
  quotedel="有";
    }else
  {
  quotedel="无";
  }

String quoteview=request.getParameter("quoteview");
   if(quoteview!=null){
  quoteview="有";
    }else
  {
  quoteview="无";
  }
String quoteview_yes=request.getParameter("quoteview_yes");
  quoteview_yes="有";
String quotezt=request.getParameter("quotezt");
   if(quotezt!=null){
  quotezt="有";
    }else
  {
  quotezt="无";
  }

String serveradd=request.getParameter("serveradd");
   if(serveradd!=null){
  serveradd="有";
    }else
  {
  serveradd="无";
  }

 String servermod=request.getParameter("servermod");
    if(servermod!=null){
  servermod="有";
    }else
  {
  servermod="无";
  }

 String serverdel=request.getParameter("serverdel");
    if(serverdel!=null){
  serverdel="有";
    }else
  {
  serverdel="无";
  }

 String serverview=request.getParameter("serverview");
    if(serverview!=null){
  serverview="有";
    }else
  {
  serverview="无";
  }
 String serverview_yes=request.getParameter("serverview_yes");
  serverview_yes="有";
 String serverzt=request.getParameter("serverzt");
    if(serverzt!=null){
  serverzt="有";
    }else
  {
  serverzt="无";
  }

 String cgadd=request.getParameter("cgadd");
    if(cgadd!=null){
  cgadd="有";
    }else
  {
  cgadd="无";
  }

 String cgmod=request.getParameter("cgmod");
   if(cgmod!=null){
  cgmod="有";
    }else
  {
  cgmod="无";
  }

 String cgdel=request.getParameter("cgdel");
    if(cgdel!=null){
  cgdel="有";
    }else
  {
  cgdel="无";
  }

 String cgview=request.getParameter("cgview");
    if(cgview!=null){
  cgview="有";
    }else
  {
  cgview="无";
  }

 String cgview_yes=request.getParameter("cgview_yes");
     if(cgview_yes!=null){
  cgview_yes="有";
    }else
  {
  cgview_yes="无";
  }
 String cgzt=request.getParameter("cgzt");
    if(cgzt!=null){
  cgzt="有";
    }else
  {
  cgzt="无";
  }

 String tradd=request.getParameter("tradd");
    if(tradd!=null){
  tradd="有";
    }else
  {
  tradd="无";
  }

 String trmod=request.getParameter("trmod");
    if(trmod!=null){
  trmod="有";
    }else
  {
  trmod="无";
  }

 String trdel=request.getParameter("trdel");
    if(trdel!=null){
  trdel="有";
    }else
  {
  trdel="无";
  }

 String trview=request.getParameter("trview");
    if(trview!=null){
  trview="有";
    }else
  {
  trview="无";
  }
 String trview_yes=request.getParameter("trview_yes");
    if(trview_yes!=null){
  trview_yes="有";
    }else
  {
  trview_yes="无";
  }
 String trzt=request.getParameter("trzt");
    if(trzt!=null){
  trzt="有";
    }else
  {
  trzt="无";
  }

 String workadd=request.getParameter("workadd");
    if(workadd!=null){
  workadd="有";
    }else
  {
  workadd="无";
  }

 String workmod=request.getParameter("workmod");
    if(workmod!=null){
  workmod="有";
    }else
  {
  workmod="无";
  }

 String workdel=request.getParameter("workdel");
    if(workdel!=null){
  workdel="有";
    }else
  {
  workdel="无";
  }

 String workview=request.getParameter("workview");
    if(workview!=null){
  workview="有";
    }else
  {
  workview="无";
  }
 String workview_yes=request.getParameter("workview_yes");
  workview_yes="有";
 String workzt=request.getParameter("workzt");
    if(workzt!=null){
  workzt="有";
    }else
  {
  workzt="无";
  }

 String xmadd=request.getParameter("xmadd");
    if(xmadd!=null){
  xmadd="有";
    }else
  {
  xmadd="无";
  }

 String xmmod=request.getParameter("xmmod");
    if(xmmod!=null){
  xmmod="有";
    }else
  {
  xmmod="无";
  }

 String xmdel=request.getParameter("xmdel");
    if(xmdel!=null){
  xmdel="有";
    }else
  {
  xmdel="无";
  }

 String xmview=request.getParameter("xmview");
    if(xmview!=null){
  xmview="有";
    }else
  {
  xmview="无";
  }
 String xmview_yes=request.getParameter("xmview_yes");
  xmview_yes="有";
 String xmzt=request.getParameter("xmzt");
    if(xmzt!=null){
  xmzt="有";
    }else
  {
  xmzt="无";
  }

 String subadd=request.getParameter("subadd");
    if(subadd!=null){
  subadd="有";
    }else
  {
  subadd="无";
  }

 String submod=request.getParameter("submod");
    if(submod!=null){
  submod="有";
    }else
  {
  submod="无";
  }

 String subdel=request.getParameter("subdel");
    if(subdel!=null){
  subdel="有";
    }else
  {
  subdel="无";
  }
   String subview=request.getParameter("subview");
    if(subview!=null){
  subview="有";
    }else
  {
  subview="无";
  }
   String subview_yes=request.getParameter("subview_yes");
  if(subview_yes!=null){
  subview_yes="有";
    }else
  {
  subview_yes="无";
  }
 String subzt=request.getParameter("subzt");
    if(subzt!=null){
  subzt="有";
    }else
  {
  subzt="无";
  }

 String manadd=request.getParameter("manadd");
    if(manadd!=null){
  manadd="有";
    }else
  {
  manadd="无";
  }

 String manmod=request.getParameter("manmod");
    if(manmod!=null){
  manmod="有";
    }else
  {
  manmod="无";
  }

 String mandel=request.getParameter("mandel");
    if(mandel!=null){
  mandel="有";
    }else
  {
  mandel="无";
  }

 String manview=request.getParameter("manview");
    if(manview!=null){
  manview="有";
    }else
  {
  manview="无";
  }
 String manview_yes=request.getParameter("manview_yes");
  manview_yes="有";
 String manzt=request.getParameter("manzt");
    if(manzt!=null){
  manzt="有";
    }else
  {
  manzt="无";
  }

 String rwadd=request.getParameter("rwadd");
    if(rwadd!=null){
  rwadd="有";
    }else
  {
  rwadd="无";
  }

 String rwmod=request.getParameter("rwmod");
    if(rwmod!=null){
  rwmod="有";
    }else
  {
  rwmod="无";
  }

 String rwdel=request.getParameter("rwdel");
    if(rwdel!=null){
  rwdel="有";
    }else
  {
  rwdel="无";
  }

 String rwview=request.getParameter("rwview");
    if(rwview!=null){
  rwview="有";
    }else
  {
  rwview="无";
  }
 String rwview_yes=request.getParameter("rwview_yes");
  rwview_yes="有";
 String rwzt=request.getParameter("rwzt");
    if(rwzt!=null){
  rwzt="有";
    }else
  {
  rwzt="无";
  }

 String fyadd=request.getParameter("fyadd");
    if(fyadd!=null){
  fyadd="有";
    }else
  {
  fyadd="无";
  }

 String fymod=request.getParameter("fymod");
    if(fymod!=null){
  fymod="有";
    }else
  {
  fymod="无";
  }

 String fydel=request.getParameter("fydel");
    if(fydel!=null){
  fydel="有";
    }else
  {
  fydel="无";
  }

 String fyview=request.getParameter("fyview");
    if(fyview!=null){
  fyview="有";
    }else
  {
  fyview="无";
  }
 String fyview_yes=request.getParameter("fyview_yes");
  fyview_yes="有";
 String fyzt=request.getParameter("fyzt");
    if(fyzt!=null){
  fyzt="有";
    }else
  {
  fyzt="无";
  }

 String hdadd=request.getParameter("hdadd");
    if(hdadd!=null){
  hdadd="有";
    }else
  {
  hdadd="无";
  }

 String hdmod=request.getParameter("hdmod");
    if(hdmod!=null){
  hdmod="有";
    }else
  {
  hdmod="无";
  }

 String hddel=request.getParameter("hddel");
    if(hddel!=null){
  hddel="有";
    }else
  {
  hddel="无";
  }

 String hdview=request.getParameter("hdview");
    if(hdview!=null){
  hdview="有";
    }else
  {
  hdview="无";
  }
 String hdview_yes=request.getParameter("hdview_yes");
  hdview_yes="有";
 String hdzt=request.getParameter("hdzt");
    if(hdzt!=null){
  hdzt="有";
    }else
  {
  hdzt="无";
  }

 String tsadd=request.getParameter("tsadd");
    if(tsadd!=null){
  tsadd="有";
    }else
  {
  tsadd="无";
  }

 String tsmod=request.getParameter("tsmod");
    if(tsmod!=null){
  tsmod="有";
    }else
  {
  tsmod="无";
  }

 String tsdel=request.getParameter("tsdel");
    if(tsdel!=null){
  tsdel="有";
    }else
  {
  tsdel="无";
  }

 String tsview=request.getParameter("tsview");
    if(tsview!=null){
  tsview="有";
    }else
  {
  tsview="无";
  }
 String tsview_yes=request.getParameter("tsview_yes");
  tsview_yes="有";
 String tszt=request.getParameter("tszt");
    if(tszt!=null){
  tszt="有";
    }else
  {
  tszt="无";
  }

 String wxadd=request.getParameter("wxadd");
    if(wxadd!=null){
  wxadd="有";
    }else
  {
  wxadd="无";
  }

 String wxmod=request.getParameter("wxmod");
    if(wxmod!=null){
  wxmod="有";
    }else
  {
  wxmod="无";
  }

 String wxdel=request.getParameter("wxdel");
    if(wxdel!=null){
  wxdel="有";
    }else
  {
  wxdel="无";
  }

 String wxview=request.getParameter("wxview");
    if(wxview!=null){
  wxview="有";
    }else
  {
  wxview="无";
  }
 String wxview_yes=request.getParameter("wxview_yes");
  wxview_yes="有";
 String wxzt=request.getParameter("wxzt");
    if(wxzt!=null){
  wxzt="有";
    }else
  {
  wxzt="无";
  }

 String mactadd=request.getParameter("mactadd");
    if(mactadd!=null){
  mactadd="有";
    }else
  {
  mactadd="无";
  }

 String mactmod=request.getParameter("mactmod");
    if(mactmod!=null){
  mactmod="有";
    }else
  {
  mactmod="无";
  }

 String mactdel=request.getParameter("mactdel");
    if(mactdel!=null){
  mactdel="有";
    }else
  {
  mactdel="无";
  }

 String mactview=request.getParameter("mactview");
    if(mactview!=null){
  mactview="有";
    }else
  {
  mactview="无";
  }
 String mactview_yes=request.getParameter("mactview_yes");
  mactview_yes="有";
 String mactzt=request.getParameter("mactzt");
    if(mactzt!=null){
  mactzt="有";
    }else
  {
  mactzt="无";
  }

 String jzdsadd=request.getParameter("jzdsadd");
    if(jzdsadd!=null){
  jzdsadd="有";
    }else
  {
  jzdsadd="无";
  }

 String jzdsmod=request.getParameter("jzdsmod");
    if(jzdsmod!=null){
  jzdsmod="有";
    }else
  {
  jzdsmod="无";
  }

 String jzdsdel=request.getParameter("jzdsdel");
    if(jzdsdel!=null){
  jzdsdel="有";
    }else
  {
  jzdsdel="无";
  }

 String jzdsview=request.getParameter("jzdsview");
    if(jzdsview!=null){
  jzdsview="有";
    }else
  {
  jzdsview="无";
  }
 String jzdsview_yes=request.getParameter("jzdsview_yes");
  jzdsview_yes="有";
 String jzdszt=request.getParameter("jzdszt");
    if(jzdszt!=null){
  jzdszt="有";
    }else
  {
  jzdszt="无";
  }

 String zskadd=request.getParameter("zskadd");
    if(zskadd!=null){
  zskadd="有";
    }else
  {
  zskadd="无";
  }

 String zskmod=request.getParameter("zskmod");
    if(zskmod!=null){
  zskmod="有";
    }else
  {
  zskmod="无";
  }

 String zskdel=request.getParameter("zskdel");
    if(zskdel!=null){
  zskdel="有";
    }else
  {
  zskdel="无";
  }

 String zskview=request.getParameter("zskview");
    if(zskview!=null){
  zskview="有";
    }else
  {
  zskview="无";
  }
 String zskview_yes=request.getParameter("zskview_yes");
  zskview_yes="有";
 String zskzt=request.getParameter("zskzt");
    if(zskzt!=null){
  zskzt="有";
    }else
  {
  zskzt="无";
  }

 String flfgadd=request.getParameter("flfgadd");
    if(flfgadd!=null){
  flfgadd="有";
    }else
  {
  flfgadd="无";
  }

 String flfgmod=request.getParameter("flfgmod");
    if(flfgmod!=null){
  flfgmod="有";
    }else
  {
  flfgmod="无";
  }

 String flfgdel=request.getParameter("flfgdel");
    if(flfgdel!=null){
  flfgdel="有";
    }else
  {
  flfgdel="无";
  }

 String flfgview=request.getParameter("flfgview");
    if(flfgview!=null){
  flfgview="有";
    }else
  {
  flfgview="无";
  }
 String flfgview_yes=request.getParameter("flfgview_yes");
  flfgview_yes="有";
 String flfgzt=request.getParameter("flfgzt");
    if(flfgzt!=null){
  flfgzt="有";
    }else
  {
  flfgzt="无";
  }

 String fkhzadd=request.getParameter("fkhzadd");
    if(fkhzadd!=null){
  fkhzadd="有";
    }else
  {
  fkhzadd="无";
  }

 String fkhzmod=request.getParameter("fkhzmod");
    if(fkhzmod!=null){
  fkhzmod="有";
    }else
  {
  fkhzmod="无";
  }

 String fkhzdel=request.getParameter("fkhzdel");
    if(fkhzdel!=null){
  fkhzdel="有";
    }else
  {
  fkhzdel="无";
  }

 String fkhzview=request.getParameter("fkhzview");
    if(fkhzview!=null){
  fkhzview="有";
    }else
  {
  fkhzview="无";
  }

 String fkhzview_yes=request.getParameter("fkhzview_yes");
  fkhzview_yes="有";
 String fkhzzt=request.getParameter("fkhzzt");
    if(fkhzzt!=null){
  fkhzzt="有";
    }else
  {
  fkhzzt="无";
  }

 String zjadd=request.getParameter("zjadd");
    if(zjadd!=null){
  zjadd="有";
    }else
  {
  zjadd="无";
  }

 String zjmod=request.getParameter("zjmod");
    if(zjmod!=null){
  zjmod="有";
    }else
  {
  zjmod="无";
  }

 String zjdel=request.getParameter("zjdel");
    if(zjdel!=null){
  zjdel="有";
    }else
  {
  zjdel="无";
  }

 String zjview=request.getParameter("zjview");
    if(zjview!=null){
  zjview="有";
    }else
  {
  zjview="无";
  }
 String zjview_yes=request.getParameter("zjview_yes");
  zjview_yes="有";
 String zjzt=request.getParameter("zjzt");
    if(zjzt!=null){
  zjzt="有";
    }else
  {
  zjzt="无";
  }

 String skhzadd=request.getParameter("skhzadd");
    if(skhzadd!=null){
  skhzadd="有";
    }else
  {
  skhzadd="无";
  }

 String skhzmod=request.getParameter("skhzmod");
    if(skhzmod!=null){
  skhzmod="有";
    }else
  {
  skhzmod="无";
  }

 String skhzdel=request.getParameter("skhzdel");
    if(skhzdel!=null){
  skhzdel="有";
    }else
  {
  skhzdel="无";
  }

 String skhzview=request.getParameter("skhzview");
    if(skhzview!=null){
  skhzview="有";
    }else
  {
  skhzview="无";
  }
 String skhzview_yes=request.getParameter("skhzview_yes");
  skhzview_yes="有";
 String skhzzt=request.getParameter("skhzzt");
    if(skhzzt!=null){
  skhzzt="有";
    }else
  {
  skhzzt="无";
  }

 String fkadd=request.getParameter("fkadd");
    if(fkadd!=null){
  fkadd="有";
    }else
  {
  fkadd="无";
  }

 String fkmod=request.getParameter("fkmod");
    if(fkmod!=null){
  fkmod="有";
    }else
  {
  fkmod="无";
  }

 String fkdel=request.getParameter("fkdel");
    if(fkdel!=null){
  fkdel="有";
    }else
  {
  fkdel="无";
  }

 String fkview=request.getParameter("fkview");
    if(fkview!=null){
  fkview="有";
    }else
  {
  fkview="无";
  }
 String fkview_yes=request.getParameter("fkview_yes");
  fkview_yes="有";
 String fkzt=request.getParameter("fkzt");
    if(fkzt!=null){
  fkzt="有";
    }else
  {
  fkzt="无";
  }

 String r_skadd=request.getParameter("r_skadd");
    if(r_skadd!=null){
  r_skadd="有";
    }else
  {
  r_skadd="无";
  }

 String r_skmod=request.getParameter("r_skmod");
    if(r_skmod!=null){
  r_skmod="有";
    }else
  {
  r_skmod="无";
  }

 String r_skdel=request.getParameter("r_skdel");
    if(r_skdel!=null){
  r_skdel="有";
    }else
  {
  r_skdel="无";
  }

 String r_skview=request.getParameter("r_skview");
    if(r_skview!=null){
  r_skview="有";
    }else
  {
  r_skview="无";
  }
 String r_skview_yes=request.getParameter("r_skview_yes");
  r_skview_yes="有";
 String skzt=request.getParameter("skzt");
    if(skzt!=null){
  skzt="有";
    }else
  {
  skzt="无";
  }
 String skmod=request.getParameter("skmod");
    if(skmod!=null){
  skmod="有";
    }else
  {
  skmod="无";
  }
 String qkadd=request.getParameter("qkadd");
    if(qkadd!=null){
  qkadd="有";
    }else
  {
  qkadd="无";
  }

 String qkmod=request.getParameter("qkmod");
    if(qkmod!=null){
  qkmod="有";
    }else
  {
  qkmod="无";
  }

 String qkdel=request.getParameter("qkdel");
    if(qkdel!=null){
  qkdel="有";
    }else
  {
  qkdel="无";
  }

 String qkview=request.getParameter("qkview");
    if(qkview!=null){
  qkview="有";
    }else
  {
  qkview="无";
  }
 String qkview_yes=request.getParameter("qkview_yes");
  qkview_yes="有";
 String qkzt=request.getParameter("qkzt");
    if(qkzt!=null){
  qkzt="有";
    }else
  {
  qkzt="无";
  }

 String intadd=request.getParameter("intadd");
    if(intadd!=null){
  intadd="有";
    }else
  {
  intadd="无";
  }

 String intmod=request.getParameter("intmod");
    if(intmod!=null){
  intmod="有";
    }else
  {
  intmod="无";
  }

 String intdel=request.getParameter("intdel");
    if(intdel!=null){
  intdel="有";
    }else
  {
  intdel="无";
  }

 String intview=request.getParameter("intview");
    if(intview!=null){
  intview="有";
    }else
  {
  intview="无";
  }
 String intview_yes=request.getParameter("intview_yes");
  intview_yes="有";
 String intzt=request.getParameter("intzt");
    if(intzt!=null){
  intzt="有";
    }else
  {
  intzt="无";
  }

 String outadd=request.getParameter("outadd");
    if(outadd!=null){
  outadd="有";
    }else
  {
  outadd="无";
  }

 String outmod=request.getParameter("outmod");
    if(outmod!=null){
  outmod="有";
    }else
  {
  outmod="无";
  }

 String outdel=request.getParameter("outdel");
    if(outdel!=null){
  outdel="有";
    }else
  {
  outdel="无";
  }

 String outview=request.getParameter("outview");
    if(outview!=null){
  outview="有";
    }else
  {
  outview="无";
  }
 String outview_yes=request.getParameter("outview_yes");
  outview_yes="有";
 String outzt=request.getParameter("outzt");
    if(outzt!=null){
  outzt="有";
    }else
  {
  outzt="无";
  }

 String r_thadd=request.getParameter("r_thadd");
    if(r_thadd!=null){
  r_thadd="有";
    }else
  {
  r_thadd="无";
  }

 String r_thmod=request.getParameter("r_thmod");
    if(r_thmod!=null){
  r_thmod="有";
    }else
  {
  r_thmod="无";
  }

 String r_thdel=request.getParameter("r_thdel");
    if(r_thdel!=null){
  r_thdel="有";
    }else
  {
  r_thdel="无";
  }

 String r_thview=request.getParameter("r_thview");
    if(r_thview!=null){
  r_thview="有";
    }else
  {
  r_thview="无";
  }
 String r_thview_yes=request.getParameter("r_thview_yes");
  r_thview_yes="有";
 String thzt=request.getParameter("thzt");
    if(thzt!=null){
  thzt="有";
    }else
  {
  thzt="无";
  }
 String r_yfgladd=request.getParameter("r_yfgladd");
    if(r_yfgladd!=null){
  r_yfgladd="有";
    }else
  {
  r_yfgladd="无";
  }

 String r_yfglmod=request.getParameter("r_yfglmod");
    if(r_yfglmod!=null){
  r_yfglmod="有";
    }else
  {
  r_yfglmod="无";
  }

 String r_yfgldel=request.getParameter("r_yfgldel");
    if(r_yfgldel!=null){
  r_yfgldel="有";
    }else
  {
  r_yfgldel="无";
  }

 String r_yfglview=request.getParameter("r_yfglview");
    if(r_yfglview!=null){
  r_yfglview="有";
    }else
  {
  r_yfglview="无";
  }
 String r_yfglview_yes=request.getParameter("r_yfglview_yes");
  r_yfglview_yes="有";
 String r_yfglzt=request.getParameter("r_yfglzt");
    if(r_yfglzt!=null){
  r_yfglzt="有";
    }else
  {
  r_yfglzt="无";
  }

 String syszt=request.getParameter("syszt");
   if(syszt!=null){
  syszt="有";
    }else
  {
  syszt="无";
  }
 String jcfxzt=request.getParameter("jcfxzt");
   if(jcfxzt!=null){
  jcfxzt="有";
    }else
  {
  jcfxzt="无";
  }

 String custzyzt=request.getParameter("custzyzt");
   if(custzyzt!=null){
  custzyzt="有";
    }else
  {
  custzyzt="无";
  }
 String r_dzzx_zt=request.getParameter("r_dzzx_zt");
   if(r_dzzx_zt!=null){
  r_dzzx_zt="有";
    }else
  {
  r_dzzx_zt="无";
  }
 String r_xscp_zt=request.getParameter("r_xscp_zt");
   if(r_xscp_zt!=null){
  r_xscp_zt="有";
    }else
  {
  r_xscp_zt="无";
  }
 String r_htgl_add=request.getParameter("r_htgl_add");
    if(r_htgl_add!=null){
  r_htgl_add="有";
    }else
  {
  r_htgl_add="无";
  }

 String r_htgl_mod=request.getParameter("r_htgl_mod");
    if(r_htgl_mod!=null){
  r_htgl_mod="有";
    }else
  {
  r_htgl_mod="无";
  }

 String r_htgl_del=request.getParameter("r_htgl_del");
    if(r_htgl_del!=null){
  r_htgl_del="有";
    }else
  {
  r_htgl_del="无";
  }

 String r_htgl_view=request.getParameter("r_htgl_view");
    if(r_htgl_view!=null){
  r_htgl_view="有";
    }else
  {
  r_htgl_view="无";
  }
 String r_htgl_view_yes=request.getParameter("r_htgl_view_yes");
  r_htgl_view_yes="有";
 String r_htgl_zt=request.getParameter("r_htgl_zt");
    if(r_htgl_zt!=null){
  r_htgl_zt="有";
    }else
  {
  r_htgl_zt="无";
  }

 String r_jkgl_add=request.getParameter("r_jkgl_add");
    if(r_jkgl_add!=null){
  r_jkgl_add="有";
    }else
  {
  r_jkgl_add="无";
  }

 String r_jkgl_mod=request.getParameter("r_jkgl_mod");
    if(r_jkgl_mod!=null){
  r_jkgl_mod="有";
    }else
  {
  r_jkgl_mod="无";
  }

 String r_jkgl_del=request.getParameter("r_jkgl_del");
    if(r_jkgl_del!=null){
  r_jkgl_del="有";
    }else
  {
  r_jkgl_del="无";
  }

 String r_jkgl_view=request.getParameter("r_jkgl_view");
    if(r_jkgl_view!=null){
  r_jkgl_view="有";
    }else
  {
  r_jkgl_view="无";
  }
 String r_jkgl_view_yes=request.getParameter("r_jkgl_view_yes");
  r_jkgl_view_yes="有";
 String r_jkgl_zt=request.getParameter("r_jkgl_zt");
    if(r_jkgl_zt!=null){
  r_jkgl_zt="有";
    }else
  {
  r_jkgl_zt="无";
  }
  
 String r_fksq_add=request.getParameter("r_fksq_add");
    if(r_fksq_add!=null){
  r_fksq_add="有";
    }else
  {
  r_fksq_add="无";
  }

 String r_fksq_mod=request.getParameter("r_fksq_mod");
    if(r_fksq_mod!=null){
  r_fksq_mod="有";
    }else
  {
  r_fksq_mod="无";
  }

 String r_fksq_del=request.getParameter("r_fksq_del");
    if(r_fksq_del!=null){
  r_fksq_del="有";
    }else
  {
  r_fksq_del="无";
  }

 String r_fksq_view=request.getParameter("r_fksq_view");
    if(r_fksq_view!=null){
  r_fksq_view="有";
    }else
  {
  r_fksq_view="无";
  }
 String r_fksq_view_yes=request.getParameter("r_fksq_view_yes");
  r_fksq_view_yes="有";
 String r_fksq_zt=request.getParameter("r_fksq_zt");
    if(r_fksq_zt!=null){
  r_fksq_zt="有";
    }else
  {
  r_fksq_zt="无";
  }
 String r_month_jh_add=request.getParameter("r_month_jh_add");
    if(r_month_jh_add!=null){
  r_month_jh_add="有";
    }else
  {
  r_month_jh_add="无";
  }

 String r_month_jh_mod=request.getParameter("r_month_jh_mod");
    if(r_month_jh_mod!=null){
  r_month_jh_mod="有";
    }else
  {
  r_month_jh_mod="无";
  }

 String r_month_jh_del=request.getParameter("r_month_jh_del");
    if(r_month_jh_del!=null){
  r_month_jh_del="有";
    }else
  {
  r_month_jh_del="无";
  }

 String r_month_jh_view=request.getParameter("r_month_jh_view");
    if(r_month_jh_view!=null){
  r_month_jh_view="有";
    }else
  {
  r_month_jh_view="无";
  }
 String r_month_jh_view_yes=request.getParameter("r_month_jh_view_yes");
  r_month_jh_view_yes="有";
 String r_month_jh_zt=request.getParameter("r_month_jh_zt");
    if(r_month_jh_zt!=null){
  r_month_jh_zt="有";
    }else
  {
  r_month_jh_zt="无";
  }
 String r_date_r_add=request.getParameter("r_date_r_add");
    if(r_date_r_add!=null){
  r_date_r_add="有";
    }else
  {
  r_date_r_add="无";
  }

 String r_date_r_mod=request.getParameter("r_date_r_mod");
    if(r_date_r_mod!=null){
  r_date_r_mod="有";
    }else
  {
  r_date_r_mod="无";
  }

 String r_date_r_del=request.getParameter("r_date_r_del");
    if(r_date_r_del!=null){
  r_date_r_del="有";
    }else
  {
  r_date_r_del="无";
  }

 String r_date_r_view=request.getParameter("r_date_r_view");
    if(r_date_r_view!=null){
  r_date_r_view="有";
    }else
  {
  r_date_r_view="无";
  }
 String r_date_r_view_yes=request.getParameter("r_date_r_view_yes");
  r_date_r_view_yes="有";
 String r_date_r_zt=request.getParameter("r_date_r_zt");
    if(r_date_r_zt!=null){
  r_date_r_zt="有";
    }else
  {
  r_date_r_zt="无";
  }
 String r_week_r_add=request.getParameter("r_week_r_add");
    if(r_week_r_add!=null){
  r_week_r_add="有";
    }else
  {
  r_week_r_add="无";
  }

 String r_week_r_mod=request.getParameter("r_week_r_mod");
    if(r_week_r_mod!=null){
  r_week_r_mod="有";
    }else
  {
  r_week_r_mod="无";
  }

 String r_week_r_del=request.getParameter("r_week_r_del");
    if(r_week_r_del!=null){
  r_week_r_del="有";
    }else
  {
  r_week_r_del="无";
  }

 String r_week_r_view=request.getParameter("r_week_r_view");
    if(r_week_r_view!=null){
  r_week_r_view="有";
    }else
  {
  r_week_r_view="无";
  }
 String r_week_r_view_yes=request.getParameter("r_week_r_view_yes");
  r_week_r_view_yes="有";
 String r_week_r_zt=request.getParameter("r_week_r_zt");
    if(r_week_r_zt!=null){
  r_week_r_zt="有";
    }else
  {
  r_week_r_zt="无";
  }
 String r_month_r_add=request.getParameter("r_month_r_add");
    if(r_month_r_add!=null){
  r_month_r_add="有";
    }else
  {
  r_month_r_add="无";
  }

 String r_month_r_mod=request.getParameter("r_month_r_mod");
    if(r_month_r_mod!=null){
  r_month_r_mod="有";
    }else
  {
  r_month_r_mod="无";
  }

 String r_month_r_del=request.getParameter("r_month_r_del");
    if(r_month_r_del!=null){
  r_month_r_del="有";
    }else
  {
  r_month_r_del="无";
  }

 String r_month_r_view=request.getParameter("r_month_r_view");
    if(r_month_r_view!=null){
  r_month_r_view="有";
    }else
  {
  r_month_r_view="无";
  }
 String r_month_r_view_yes=request.getParameter("r_month_r_view_yes");
  r_month_r_view_yes="有";
 String r_month_r_zt=request.getParameter("r_month_r_zt");
    if(r_month_r_zt!=null){
  r_month_r_zt="有";
    }else
  {
  r_month_r_zt="无";
  }
 String r_wlz_add=request.getParameter("r_wlz_add");
    if(r_wlz_add!=null){
  r_wlz_add="有";
    }else
  {
  r_wlz_add="无";
  }

 String r_wlz_mod=request.getParameter("r_wlz_mod");
    if(r_wlz_mod!=null){
  r_wlz_mod="有";
    }else
  {
  r_wlz_mod="无";
  }

 String r_wlz_del=request.getParameter("r_wlz_del");
    if(r_wlz_del!=null){
  r_wlz_del="有";
    }else
  {
  r_wlz_del="无";
  }

 String r_wlz_view=request.getParameter("r_wlz_view");
    if(r_wlz_view!=null){
  r_wlz_view="有";
    }else
  {
  r_wlz_view="无";
  }
 String r_wlz_view_yes=request.getParameter("r_wlz_view_yes");
  r_wlz_view_yes="有";
 String r_wlz_zt=request.getParameter("r_wlz_zt");
    if(r_wlz_zt!=null){
  r_wlz_zt="有";
    }else
  {
  r_wlz_zt="无";
  }
 String r_thje_add=request.getParameter("r_thje_add");
    if(r_thje_add!=null){
  r_thje_add="有";
    }else
  {
  r_thje_add="无";
  }

 String r_thje_mod=request.getParameter("r_thje_mod");
    if(r_thje_mod!=null){
  r_thje_mod="有";
    }else
  {
  r_thje_mod="无";
  }

 String r_thje_del=request.getParameter("r_thje_del");
    if(r_thje_del!=null){
  r_thje_del="有";
    }else
  {
  r_thje_del="无";
  }

 String r_thje_view=request.getParameter("r_thje_view");
    if(r_thje_view!=null){
  r_thje_view="有";
    }else
  {
  r_thje_view="无";
  }
 String r_thje_view_yes=request.getParameter("r_thje_view_yes");
  r_thje_view_yes="有";
 String r_thje_zt=request.getParameter("r_thje_zt");
    if(r_thje_zt!=null){
  r_thje_zt="有";
    }else
  {
  r_thje_zt="无";
  }
 String r_hyzc_add=request.getParameter("r_hyzc_add");
    if(r_hyzc_add!=null){
  r_hyzc_add="有";
    }else
  {
  r_hyzc_add="无";
  }

 String r_hyzc_mod=request.getParameter("r_hyzc_mod");
    if(r_hyzc_mod!=null){
  r_hyzc_mod="有";
    }else
  {
  r_hyzc_mod="无";
  }

 String r_hyzc_del=request.getParameter("r_hyzc_del");
    if(r_hyzc_del!=null){
  r_hyzc_del="有";
    }else
  {
  r_hyzc_del="无";
  }

 String r_hyzc_view=request.getParameter("r_hyzc_view");
    if(r_hyzc_view!=null){
  r_hyzc_view="有";
    }else
  {
  r_hyzc_view="无";
  }
 String r_hyzc_view_yes=request.getParameter("r_hyzc_view_yes");
  r_hyzc_view_yes="有";

 String r_hyzc_zt=request.getParameter("r_hyzc_zt");
    if(r_hyzc_zt!=null){
  r_hyzc_zt="有";
    }else
  {
  r_hyzc_zt="无";
  }
 String r_mtxc_add=request.getParameter("r_mtxc_add");
    if(r_mtxc_add!=null){
  r_mtxc_add="有";
    }else
  {
  r_mtxc_add="无";
  }

 String r_mtxc_mod=request.getParameter("r_mtxc_mod");
    if(r_mtxc_mod!=null){
  r_mtxc_mod="有";
    }else
  {
  r_mtxc_mod="无";
  }

 String r_mtxc_del=request.getParameter("r_mtxc_del");
    if(r_mtxc_del!=null){
  r_mtxc_del="有";
    }else
  {
  r_mtxc_del="无";
  }

 String r_mtxc_view=request.getParameter("r_mtxc_view");
    if(r_mtxc_view!=null){
  r_mtxc_view="有";
    }else
  {
  r_mtxc_view="无";
  }
 String r_mtxc_view_yes=request.getParameter("r_mtxc_view_yes");
    if(r_mtxc_view_yes!=null){
  r_mtxc_view_yes="有";
    }else
  {
  r_mtxc_view_yes="有";
  }

 String r_mtxc_zt=request.getParameter("r_mtxc_zt");
    if(r_mtxc_zt!=null){
  r_mtxc_zt="有";
    }else
  {
  r_mtxc_zt="无";
  }
 String r_sam_add=request.getParameter("r_sam_add");
    if(r_sam_add!=null){
  r_sam_add="有";
    }else
  {
  r_sam_add="无";
  }

 String r_sam_mod=request.getParameter("r_sam_mod");
    if(r_sam_mod!=null){
  r_sam_mod="有";
    }else
  {
  r_sam_mod="无";
  }

 String r_sam_del=request.getParameter("r_sam_del");
    if(r_sam_del!=null){
  r_sam_del="有";
    }else
  {
  r_sam_del="无";
  }

 String r_sam_view=request.getParameter("r_sam_view");
    if(r_sam_view!=null){
  r_sam_view="有";
    }else
  {
  r_sam_view="无";
  }
 String r_sam_zt=request.getParameter("r_sam_zt");
    if(r_sam_zt!=null){
  r_sam_zt="有";
    }else
  {
  r_sam_zt="无";
  }
 String r_zzsq_add=request.getParameter("r_zzsq_add");
    if(r_zzsq_add!=null){
  r_zzsq_add="有";
    }else
  {
  r_zzsq_add="无";
  }

 String r_zzsq_mod=request.getParameter("r_zzsq_mod");
    if(r_zzsq_mod!=null){
  r_zzsq_mod="有";
    }else
  {
  r_zzsq_mod="无";
  }

 String r_zzsq_del=request.getParameter("r_zzsq_del");
    if(r_zzsq_del!=null){
  r_zzsq_del="有";
    }else
  {
  r_zzsq_del="无";
  }

 String r_zzsq_view=request.getParameter("r_zzsq_view");
    if(r_zzsq_view!=null){
  r_zzsq_view="有";
    }else
  {
  r_zzsq_view="无";
  }
 String r_zzsq_zt=request.getParameter("r_zzsq_zt");
    if(r_zzsq_zt!=null){
  r_zzsq_zt="有";
    }else
  {
  r_zzsq_zt="无";
  }

 String r_jcsq_add=request.getParameter("r_jcsq_add");
    if(r_jcsq_add!=null){
  r_jcsq_add="有";
    }else
  {
  r_jcsq_add="无";
  }

 String r_jcsq_mod=request.getParameter("r_jcsq_mod");
    if(r_jcsq_mod!=null){
  r_jcsq_mod="有";
    }else
  {
  r_jcsq_mod="无";
  }

 String r_jcsq_del=request.getParameter("r_jcsq_del");
    if(r_jcsq_del!=null){
  r_jcsq_del="有";
    }else
  {
  r_jcsq_del="无";
  }

 String r_jcsq_view=request.getParameter("r_jcsq_view");
    if(r_jcsq_view!=null){
  r_jcsq_view="有";
    }else
  {
  r_jcsq_view="无";
  }
 String r_jcsq_zt=request.getParameter("r_jcsq_zt");
    if(r_jcsq_zt!=null){
  r_jcsq_zt="有";
    }else
  {
  r_jcsq_zt="无";
  }

 String r_xzyd_add=request.getParameter("r_xzyd_add");
    if(r_xzyd_add!=null){
  r_xzyd_add="有";
    }else
  {
  r_xzyd_add="无";
  }

 String r_xzyd_mod=request.getParameter("r_xzyd_mod");
    if(r_xzyd_mod!=null){
  r_xzyd_mod="有";
    }else
  {
  r_xzyd_mod="无";
  }

 String r_xzyd_del=request.getParameter("r_xzyd_del");
    if(r_xzyd_del!=null){
  r_xzyd_del="有";
    }else
  {
  r_xzyd_del="无";
  }

 String r_xzyd_view=request.getParameter("r_xzyd_view");
    if(r_xzyd_view!=null){
  r_xzyd_view="有";
    }else
  {
  r_xzyd_view="无";
  }
 String r_xzyd_zt=request.getParameter("r_xzyd_zt");
    if(r_xzyd_zt!=null){
  r_xzyd_zt="有";
    }else
  {
  r_xzyd_zt="无";
  }
  
 String r_ccsq_add=request.getParameter("r_ccsq_add");
    if(r_ccsq_add!=null){
  r_ccsq_add="有";
    }else
  {
  r_ccsq_add="无";
  }

 String r_ccsq_mod=request.getParameter("r_ccsq_mod");
    if(r_ccsq_mod!=null){
  r_ccsq_mod="有";
    }else
  {
  r_ccsq_mod="无";
  }

 String r_ccsq_del=request.getParameter("r_ccsq_del");
    if(r_ccsq_del!=null){
  r_ccsq_del="有";
    }else
  {
  r_ccsq_del="无";
  }

 String r_ccsq_view=request.getParameter("r_ccsq_view");
    if(r_ccsq_view!=null){
  r_ccsq_view="有";
    }else
  {
  r_ccsq_view="无";
  }
 String r_ccsq_zt=request.getParameter("r_ccsq_zt");
    if(r_ccsq_zt!=null){
  r_ccsq_zt="有";
    }else
  {
  r_ccsq_zt="无";
  }
 String r_bgyp_add=request.getParameter("r_bgyp_add");
    if(r_bgyp_add!=null){
  r_bgyp_add="有";
    }else
  {
  r_bgyp_add="无";
  }

 String r_bgyp_mod=request.getParameter("r_bgyp_mod");
    if(r_bgyp_mod!=null){
  r_bgyp_mod="有";
    }else
  {
  r_bgyp_mod="无";
  }

 String r_bgyp_del=request.getParameter("r_bgyp_del");
    if(r_bgyp_del!=null){
  r_bgyp_del="有";
    }else
  {
  r_bgyp_del="无";
  }

 String r_bgyp_view=request.getParameter("r_bgyp_view");
    if(r_bgyp_view!=null){
  r_bgyp_view="有";
    }else
  {
  r_bgyp_view="无";
  }
 String r_bgyp_zt=request.getParameter("r_bgyp_zt");
    if(r_bgyp_zt!=null){
  r_bgyp_zt="有";
    }else
  {
  r_bgyp_zt="无";
  }

 String r_nbqc_add=request.getParameter("r_nbqc_add");
    if(r_nbqc_add!=null){
  r_nbqc_add="有";
    }else
  {
  r_nbqc_add="无";
  }

 String r_nbqc_mod=request.getParameter("r_nbqc_mod");
    if(r_nbqc_mod!=null){
  r_nbqc_mod="有";
    }else
  {
  r_nbqc_mod="无";
  }

 String r_nbqc_del=request.getParameter("r_nbqc_del");
    if(r_nbqc_del!=null){
  r_nbqc_del="有";
    }else
  {
  r_nbqc_del="无";
  }

 String r_nbqc_view=request.getParameter("r_nbqc_view");
    if(r_nbqc_view!=null){
  r_nbqc_view="有";
    }else
  {
  r_nbqc_view="无";
  }
 String r_nbqc_zt=request.getParameter("r_nbqc_zt");
    if(r_nbqc_zt!=null){
  r_nbqc_zt="有";
    }else
  {
  r_nbqc_zt="无";
  }

 String r_yjsq_add=request.getParameter("r_yjsq_add");
    if(r_yjsq_add!=null){
  r_yjsq_add="有";
    }else
  {
  r_yjsq_add="无";
  }

 String r_yjsq_mod=request.getParameter("r_yjsq_mod");
    if(r_yjsq_mod!=null){
  r_yjsq_mod="有";
    }else
  {
  r_yjsq_mod="无";
  }

 String r_yjsq_del=request.getParameter("r_yjsq_del");
    if(r_yjsq_del!=null){
  r_yjsq_del="有";
    }else
  {
  r_yjsq_del="无";
  }

 String r_yjsq_view=request.getParameter("r_yjsq_view");
    if(r_yjsq_view!=null){
  r_yjsq_view="有";
    }else
  {
  r_yjsq_view="无";
  }
 String r_yjsq_zt=request.getParameter("r_yjsq_zt");
    if(r_yjsq_zt!=null){
  r_yjsq_zt="有";
    }else
  {
  r_yjsq_zt="无";
  }

 String r_spbm_add=request.getParameter("r_spbm_add");
    if(r_spbm_add!=null){
  r_spbm_add="有";
    }else
  {
  r_spbm_add="无";
  }

 String r_spbm_mod=request.getParameter("r_spbm_mod");
    if(r_spbm_mod!=null){
  r_spbm_mod="有";
    }else
  {
  r_spbm_mod="无";
  }

 String r_spbm_del=request.getParameter("r_spbm_del");
    if(r_spbm_del!=null){
  r_spbm_del="有";
    }else
  {
  r_spbm_del="无";
  }

 String r_spbm_view=request.getParameter("r_spbm_view");
    if(r_spbm_view!=null){
  r_spbm_view="有";
    }else
  {
  r_spbm_view="无";
  }
 String r_spbm_zt=request.getParameter("r_spbm_zt");
    if(r_spbm_zt!=null){
  r_spbm_zt="有";
    }else
  {
  r_spbm_zt="无";
  }

 String r_xphh_add=request.getParameter("r_xphh_add");
    if(r_xphh_add!=null){
  r_xphh_add="有";
    }else
  {
  r_xphh_add="无";
  }

 String r_xphh_mod=request.getParameter("r_xphh_mod");
    if(r_xphh_mod!=null){
  r_xphh_mod="有";
    }else
  {
  r_xphh_mod="无";
  }

 String r_xphh_del=request.getParameter("r_xphh_del");
    if(r_xphh_del!=null){
  r_xphh_del="有";
    }else
  {
  r_xphh_del="无";
  }

 String r_xphh_view=request.getParameter("r_xphh_view");
    if(r_xphh_view!=null){
  r_xphh_view="有";
    }else
  {
  r_xphh_view="无";
  }
 String r_xphh_zt=request.getParameter("r_xphh_zt");
    if(r_xphh_zt!=null){
  r_xphh_zt="有";
    }else
  {
  r_xphh_zt="无";
  }

 String r_sup_xj_add=request.getParameter("r_sup_xj_add");
    if(r_sup_xj_add!=null){
  r_sup_xj_add="有";
    }else
  {
  r_sup_xj_add="无";
  }

 String r_sup_xj_mod=request.getParameter("r_sup_xj_mod");
    if(r_sup_xj_mod!=null){
  r_sup_xj_mod="有";
    }else
  {
  r_sup_xj_mod="无";
  }

 String r_sup_xj_del=request.getParameter("r_sup_xj_del");
    if(r_sup_xj_del!=null){
  r_sup_xj_del="有";
    }else
  {
  r_sup_xj_del="无";
  }

 String r_sup_xj_view=request.getParameter("r_sup_xj_view");
    if(r_sup_xj_view!=null){
  r_sup_xj_view="有";
    }else
  {
  r_sup_xj_view="无";
  }
 String r_sup_xj_zt=request.getParameter("r_sup_xj_zt");
    if(r_sup_xj_zt!=null){
  r_sup_xj_zt="有";
    }else
  {
  r_sup_xj_zt="无";
  }

 String r_cus_xj_add=request.getParameter("r_cus_xj_add");
    if(r_cus_xj_add!=null){
  r_cus_xj_add="有";
    }else
  {
  r_cus_xj_add="无";
  }

 String r_cus_xj_mod=request.getParameter("r_cus_xj_mod");
    if(r_cus_xj_mod!=null){
  r_cus_xj_mod="有";
    }else
  {
  r_cus_xj_mod="无";
  }

 String r_cus_xj_del=request.getParameter("r_cus_xj_del");
    if(r_cus_xj_del!=null){
  r_cus_xj_del="有";
    }else
  {
  r_cus_xj_del="无";
  }

 String r_cus_xj_view=request.getParameter("r_cus_xj_view");
    if(r_cus_xj_view!=null){
  r_cus_xj_view="有";
    }else
  {
  r_cus_xj_view="无";
  }
 String r_cus_xj_zt=request.getParameter("r_cus_xj_zt");
    if(r_cus_xj_zt!=null){
  r_cus_xj_zt="有";
    }else
  {
  r_cus_xj_zt="无";
  }

 String r_wage_add=request.getParameter("r_wage_add");
    if(r_wage_add!=null){
  r_wage_add="有";
    }else
  {
  r_wage_add="无";
  }

 String r_wage_mod=request.getParameter("r_wage_mod");
    if(r_wage_mod!=null){
  r_wage_mod="有";
    }else
  {
  r_wage_mod="无";
  }

 String r_wage_del=request.getParameter("r_wage_del");
    if(r_wage_del!=null){
  r_wage_del="有";
    }else
  {
  r_wage_del="无";
  }

 String r_wage_view=request.getParameter("r_wage_view");
    if(r_wage_view!=null){
  r_wage_view="有";
    }else
  {
  r_wage_view="无";
  }
 String r_wage_zt=request.getParameter("r_wage_zt");
    if(r_wage_zt!=null){
  r_wage_zt="有";
    }else
  {
  r_wage_zt="无";
  }

 String r_wx_gt_view=request.getParameter("r_wx_gt_view");
    if(r_wx_gt_view!=null){
  r_wx_gt_view="有";
    }else
  {
  r_wx_gt_view="无";
  }
 String r_wx_gt_zt=request.getParameter("r_wx_gt_zt");
    if(r_wx_gt_zt!=null){
  r_wx_gt_zt="有";
    }else
  {
  r_wx_gt_zt="无";
  }

 String profl=request.getParameter("profl");


 String strSQL1="delete from restrain where restrain_name='" + ename + "'";
 einfodb.executeUpdate(strSQL1);
  String strSQL2="delete from restrain_gp where restrain_name='" + ename + "'";
 einfodb.executeUpdate(strSQL2);
 int tt=0;
 String i1=request.getParameter("i");
 if(i1!=null)
  tt=Integer.parseInt(i1);
    for(int i=1;i<tt;i++)
    {
 String s="无";
 String prozt=request.getParameter("prozt"+i);
   if(prozt!=null){
  prozt="有";
    }else
  {
  prozt="无";
  }
 String gp=request.getParameter("gp"+i);
 String proadd=request.getParameter("proadd"+i);
  if(proadd!=null){
  proadd="有";
    }else
  {
  proadd="无";
  }
 String promod=request.getParameter("promod"+i);
  if(promod!=null){
  promod="有";
    }else
  {
  promod="无";
  }
 String prodel=request.getParameter("prodel"+i);
  if(prodel!=null){
  prodel="有";
    }else
  {
  prodel="无";
  }
 String proview=request.getParameter("proview"+i);
  if(proview!=null){
  proview="有";
    }else
  {
  proview="无";
  }
 String proview_yes=request.getParameter("proview_yes"+i);
  if(proview_yes!=null){
  proview_yes="有";
    }else
  {
  proview_yes="无";
  }
   String strSQLgp="insert into restrain_gp values('"+ename+"','"+gp+"','"+prozt+"','"+proadd+"','"+promod+"','"+prodel+"','"+proview+"','"+proview_yes+"')";
   boolean tgp= einfodb.executeUpdate(strSQLgp);
   if(!tgp)
   {
     out.println("<font size='2' color='#FF0000'>更新失败,你所输入的内容超出系统范围或输入类型不符!</font>");
	 return;
   }
}

 String strSQL="insert into restrain([restrain_name],[qzadd],[qzmod],[qzdel],[qzview],[qzview_yes],[qzzt],[xhadd],[xhmod],[xhdel],[xhview],[xhview_yes],[xhzt],[linkadd],"
		 +"[linkmod],[linkdel],[linkview],[linkview_yes],[linkzt],[hzadd],[hzmod],[hzdel],[hzview],[hzview_yes],[hzzt],[supadd],[supmod],[supdel],[supview],[supview_yes],"
		 +"[supzt],[actadd],[actmod],[actdel],[actview],[actview_yes],[actzt],[opadd],[opmod],[opdel],[opview],[opview_yes],[opzt],[quoteadd],[quotemod],[quotedel],"
		 +"[quoteview],[quoteview_yes],[quotezt],[profl],[proadd],[promod],[prodel],[proview],[proview_yes],[prozt],[r_sup_xj_add],[r_sup_xj_mod],[r_sup_xj_del],"
		 +"[r_sup_xj_view],[r_sup_xj_zt],[cgadd],[cgmod],[cgdel],[cgview],[cgview_yes],[cgzt]"
				 +
		 ") values('"
 + ename + "','" + qzadd + "','" + qzmod + "','" + qzdel + "','" + qzview + "','" + qzview_yes 
		 + "','" + qzzt + "','" + xhadd + "','" + xhmod + "','" + xhdel + "','" + xhview + "','" + xhview_yes + "','" + xhzt + "','" + linkadd 
		 + "','" + linkmod + "','" + linkdel + "','" + linkview + "','" + linkview_yes + "','" + linkzt + "','" + hzadd + "','" + hzmod + "','" + hzdel
		 + "','" + hzview + "','" + hzview_yes + "','" + hzzt + "','" + supadd + "','" + supmod + "','" + supdel + "','" + supview + "','" + supview_yes + "','" 
		 + supzt + "','" + r_actadd + "','" + r_actmod + "','" + r_actdel + "','" + r_actview + "','" + r_actview_yes + "','" + actzt + "','" + opadd 
		 + "','" + opmod + "','" + opdel + "','" + opview + "','" + opview_yes + "','" + opzt + "','" + quoteadd + "','" + quotemod + "','"
		 + quotedel + "','" + quoteview + "','" + quoteview_yes + "','" + quotezt + "','','','','','','','','" + r_sup_xj_add + "','"
		 + r_sup_xj_mod + "','" + r_sup_xj_del + "','" + r_sup_xj_view + "','" + r_sup_xj_zt + "','" + cgadd + "','" + cgmod + "','" + cgdel + "','" + cgview + "','" 
		 + cgview_yes + "' ,'" + cgzt + "'"
		 + ")";
		//,'" + tradd + "','" + trmod + "','" + trdel + "','" + trview + "','" + trview_yes + "','" + trzt + "','" + hdadd + "','" + hdmod + "','" + hddel + "','" + hdview + "','" + hdview_yes + "','" + hdzt + "','" + r_yfgladd + "','" + r_yfglmod + "','" + r_yfgldel + "','" + r_yfglview + "','" + r_yfglview_yes + "','" + r_yfglzt + "','" + workadd + "','" + workmod + "','" + workdel + "','" + workview + "','" + workview_yes + "','" + workzt + "','" + r_month_jh_add + "','" + r_month_jh_mod + "','" + r_month_jh_del + "','" + r_month_jh_view + "','" + r_month_jh_view_yes + "','" + r_month_jh_zt + "','" + r_date_r_add + "','" + r_date_r_mod + "','" + r_date_r_del + "','" + r_date_r_view + "','" + r_date_r_view_yes + "','" + r_date_r_zt + "','" + r_week_r_add + "','" + r_week_r_mod + "','" + r_week_r_del + "','" + r_week_r_view + "','" + r_week_r_view_yes + "','" + r_week_r_zt + "','" + r_month_r_add + "','" + r_month_r_mod + "','" + r_month_r_del + "','" + r_month_r_view + "','" + r_month_r_view_yes + "','" + r_month_r_zt + "','" + xmadd + "','" + xmmod + "','" + xmdel + "','" + xmview + "','" + xmview_yes + "','" + xmzt + "','" + r_cus_xj_add + "','" + r_cus_xj_mod + "','" + r_cus_xj_del + "','" + r_cus_xj_view + "','" + r_cus_xj_zt + "','" + r_htgl_add + "','" + r_htgl_mod + "','" + r_htgl_del + "','" + r_htgl_view + "','" + r_htgl_view_yes + "','" + r_htgl_zt + "','" + r_sam_add + "','" + r_sam_mod + "','" + r_sam_del + "','" + r_sam_view + "','" + r_sam_zt + "','" + subadd + "','" + submod + "','" + subdel + "','" + subview + "','" + subview_yes + "','" + subzt + "','" + manadd + "','" + manmod + "','" + mandel + "','" + manview + "','" + manview_yes + "','" + manzt + "','" + rwadd + "','" + rwmod + "','" + rwdel + "','" + rwview + "','" + rwview_yes + "','" + rwzt + "','" + fyadd + "','" + fymod + "','" + fydel + "','" + fyview + "','" + fyview_yes + "','" + fyzt + "','" + r_jkgl_add + "','" + r_jkgl_mod + "','" + r_jkgl_del + "','" + r_jkgl_view + "','" + r_jkgl_view_yes + "','" + r_jkgl_zt + "','" + r_fksq_add + "','" + r_fksq_mod + "','" + r_fksq_del + "','" + r_fksq_view + "','" + r_fksq_view_yes + "','" + r_fksq_zt + "','" + r_zzsq_add + "','" + r_zzsq_mod + "','" + r_zzsq_del + "','" + r_zzsq_view + "','" + r_zzsq_zt + "','" + r_jcsq_add + "','" + r_jcsq_mod + "','" + r_jcsq_del + "','" + r_jcsq_view + "','" + r_jcsq_zt + "','" + r_xzyd_add + "','" + r_xzyd_mod + "','" + r_xzyd_del + "','" + r_xzyd_view + "','" + r_xzyd_zt + "','" + r_ccsq_add + "','" + r_ccsq_mod + "','" + r_ccsq_del + "','" + r_ccsq_view + "','" + r_ccsq_zt + "','" + r_bgyp_add + "','" + r_bgyp_mod + "','" + r_bgyp_del + "','" + r_bgyp_view + "','" + r_bgyp_zt + "','" + r_nbqc_add + "','" + r_nbqc_mod + "','" + r_nbqc_del + "','" + r_nbqc_view + "','" + r_nbqc_zt + "','" + r_yjsq_add + "','" + r_yjsq_mod + "','" + r_yjsq_del + "','" + r_yjsq_view + "','" + r_yjsq_zt + "','" + r_spbm_add + "','" + r_spbm_mod + "','" + r_spbm_del + "','" + r_spbm_view + "','" + r_spbm_zt + "','" + r_thadd + "','" + r_thmod + "','" + r_thdel + "','" + r_thview + "','" + r_thview_yes + "','" + thzt + "','" + r_xphh_add + "','" + r_xphh_mod + "','" + r_xphh_del + "','" + r_xphh_view + "','" + r_xphh_zt + "','" + serveradd + "','" + servermod + "','" + serverdel + "','" + serverview + "','" + serverview_yes + "','" + serverzt + "','" + tsadd + "','" + tsmod + "','" + tsdel + "','" + tsview + "','" + tsview_yes + "','" + tszt + "','" + wxadd + "','" + wxmod + "','" + wxdel + "','" + wxview + "','" + wxview_yes + "','" + wxzt + "','" + r_hyzc_add + "','" + r_hyzc_mod + "','" + r_hyzc_del + "','" + r_hyzc_view + "','" + r_hyzc_view_yes + "','" + r_hyzc_zt + "','" + r_mtxc_add + "','" + r_mtxc_mod + "','" + r_mtxc_del + "','" + r_mtxc_view + "','" + r_mtxc_view_yes + "','" + r_mtxc_zt + "','" + mactadd + "','" + mactmod + "','" + mactdel + "','" + mactview + "','" + mactview_yes + "','" + mactzt + "','" + jzdsadd + "','" + jzdsmod + "','" + jzdsdel + "','" + jzdsview + "','" + jzdsview_yes + "','" + jzdszt + "','" + zskadd + "','" + zskmod + "','" + zskdel + "','" + zskview + "','" + zskview_yes + "','" + zskzt + "','" + flfgadd + "','" + flfgmod + "','" + flfgdel + "','" + flfgview + "','" + flfgview_yes + "','" + flfgzt + "','" + zjadd + "','" + zjmod + "','" + zjdel + "','" + zjview + "','" + zjview_yes + "','" + zjzt + "','" + r_wage_add + "','" + r_wage_mod + "','" + r_wage_del + "','" + r_wage_view + "','" + r_wage_zt + "','" + r_wlz_add + "','" + r_wlz_mod + "','" + r_wlz_del + "','" + r_wlz_view + "','" + r_wlz_view_yes + "','" + r_wlz_zt + "','" + fkhzadd + "','" + fkhzmod + "','" + fkhzdel + "','" + fkhzview + "','" + fkhzview_yes + "','" + fkhzzt + "','" + skhzadd + "','" + skhzmod + "','" + skhzdel + "','" + skhzview + "','" + skhzview_yes + "','" + skhzzt + "','" + fkmod + "','" + fkdel + "','" + fkview + "','" + fkview_yes + "','" + fkzt + "','" + r_wx_gt_view + "','" + r_wx_gt_zt + "','" + skmod + "','" + r_skdel + "','" + r_skview + "','" + r_skview_yes + "','" + skzt + "','" + qkmod + "','" + qkdel + "','" + qkview + "','" + qkview_yes + "','" + qkzt + "','" + r_thje_mod + "','" + r_thje_del + "','" + r_thje_view + "','" + r_thje_view_yes + "','" + r_thje_zt + "','" + intadd + "','" + intmod + "','" + intdel + "','" + intview + "','" + intview_yes + "','" + intzt + "','" + outadd + "','" + outmod + "','" + outdel + "','" + outview + "','" + outview_yes + "','" + outzt + "','" + r_dzzx_zt + "','" + r_xscp_zt + "','" + syszt + "','"+jcfxzt+"','" + custzyzt + "')";
   boolean t= einfodb.executeUpdate(strSQL);
   if(!t)
   {
     out.println("<font size='2' color='#FF0000'>添加失败,你所输入的内容超出系统范围或输入类型不符!</font>");
	 return;
   }

 %>
<body>
<div align="center"><br><br><br> <p><img src="../../images/cg.jpg" width="111" height="111"></p>

    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
  <p style="font-size:16px; color: #f00; font-family:'宋体'; letter-spacing:0px; vertical-align:middle;">操作成功!</font></p>
  <p><span class="STYLE1"><a href="npunit.jsp" style="font-size: 12px">继续增加</a> <a href="javascript:window.close()" style="font-size: 12px">关闭</a> 
      <a href="punit.jsp" style="font-size: 12px">返回</a></span> </p>
</div>
</body>
</html>