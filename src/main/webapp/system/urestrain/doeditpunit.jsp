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
<title>芯片商城有限公司</title>
<link rel=stylesheet href="style.css" type="text/css">
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<%
 String id1=request.getParameter("id");
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
  ?※?素<?????????※素瑓楲杮焠潵整楶睥爽煥敵瑳朮瑥慐慲敭整?焢潵整楶睥?※?晩焨潵整楶睥?畮汬笩?畱瑯癥敩???※?素汥敳??焠潵整楶睥∽???卽牴湩?畱瑯穥?敲畱獥?敧側牡浡瑥牥(hzmod="无";
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

 String opview=request.getParameter?※?素<?????????※素瑓楲杮焠潵整楶睥爽煥敵瑳朮瑥慐慲敭整?焢潵整楶睥?※?晩焨潵整楶睥?畮汬笩?畱瑯癥敩???※?素汥敳??焠潵整楶睥∽???卽牴湩?畱瑯穥?敲畱獥?敧側牡浡瑥牥(("opview");
    if(opview!=null){
  opview="有";
    }else
  {
  opview="无";
  }

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

 String serverzt=request.getParameter("serverzt");
    if(serverzt!=null){
  serverzt="有";
    }else
  {
  serverzt="无";
  }

 String proadd=request.getParameter("proadd");
    if(proadd!=null){
  proadd="有";
    }else
  {
  proadd="无";
  }

 String promod=request.getParameter("promod");
    if(promod!=null){
  promod="有";
    }else
  {
  promod="无";
  }

 String prodel=request.getParameter("prodel");
    if(prodel!=null){
  prodel="有";
    }else
  {
  prodel="无";
  }

 String proview=request.getParameter("proview");
    if(proview!=null){
  proview="有";
    }else
  {
  provie?※?素<?????????※素瑓楲杮焠潵整楶睥爽煥敵瑳朮瑥慐慲敭整?焢潵整楶睥?※?晩焨潵整楶睥?畮汬笩?畱瑯癥敩???※?素汥敳??焠潵整楶睥∽???卽牴湩?畱瑯穥?敲畱獥?敧側牡浡瑥牥(w="无";
  }

 String prozt=request.getParameter("prozt");
    if(prozt!=null){
  prozt="有";
    }else
  {
  prozt="无";
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

 String workzt=request.getParameter("workzt");
    if(workzt!=null){
  workzt="有";
    }else
  {
  workzt="无";
  }

 String xmadd=request.getParameter("xmadd");
    if(xmadd!=null){
  xmadd="有";?※?素<?????????※素瑓楲杮焠潵整楶睥爽煥敵瑳朮瑥慐慲敭整?焢潵整楶睥?※?晩焨潵整楶睥?畮汬笩?畱瑯癥敩???※?素汥敳??焠潵整楶睥∽???卽牴湩?畱瑯穥?敲畱獥?敧側牡浡瑥牥(
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
    i?※?素<?????????※素瑓楲杮焠潵整楶睥爽煥敵瑳朮瑥慐慲敭整?焢潵整楶睥?※?晩焨潵整楶睥?畮汬笩?畱瑯癥敩???※?素汥敳??焠潵整楶睥∽???卽牴湩?畱瑯穥?敲畱獥?敧側牡浡瑥牥(f(rwdel!=null){
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

 String tszt=request.getParameter("tszt");
    if(tszt!=null){
  tszt?※?素<?????????※素瑓楲杮焠潵整楶睥爽煥敵瑳朮瑥慐慲敭整?焢潵整楶睥?※?晩焨潵整楶睥?畮汬笩?畱瑯癥敩???※?素汥敳??焠潵整楶睥∽???卽牴湩?畱瑯穥?敲畱獥?敧側牡浡瑥牥(="有";
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
  }?※?素<?????????※素瑓楲杮焠潵整楶睥爽煥敵瑳朮瑥慐慲敭整?焢潵整楶睥?※?晩焨潵整楶睥?畮汬笩?畱瑯癥敩???※?素汥敳??焠潵整楶睥∽???卽牴湩?畱瑯穥?敲畱獥?敧側牡浡瑥牥(

 String zskmod=request.getParameter("zskmod");
    if(zskadd!=null){
  zskadd="有";
    }else
  {
  zskadd="无";
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

 String zjdel=reques?※?素<?????????※素瑓楲杮焠潵整楶睥爽煥敵瑳朮瑥慐慲敭整?焢潵整楶睥?※?晩焨潵整楶睥?畮汬笩?畱瑯癥敩???※?素汥敳??焠潵整楶睥∽???卽牴湩?畱瑯穥?敲畱獥?敧側牡浡瑥牥(t.getParameter("zjdel");
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
  r_skv?※?素<?????????※素瑓楲杮焠潵整楶睥爽煥敵瑳朮瑥慐慲敭整?焢潵整楶睥?※?晩焨潵整楶睥?畮汬笩?畱瑯癥敩???※?素汥敳??焠潵整楶睥∽???卽牴湩?畱瑯穥?敲畱獥?敧側牡浡瑥牥(iew="有";
    }else
  {
  r_skview="无";
  }

 String skzt=request.getParameter("skzt");
    if(skzt!=null){
  skzt="有";
    }else
  {
  skzt="无";
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

 String outzt=request.getParameter("outzt");
    if(outzt!=null){
  outzt="有";
    }else
  {
  outzt="无";
  }

 String r_thadd=request.getParameter("r_thadd");
?※?素<?????????※素瑓楲杮焠潵整楶睥爽煥敵瑳朮瑥慐慲敭整?焢潵整楶睥?※?晩焨潵整楶睥?畮汬笩?畱瑯癥敩???※?素汥敳??焠潵整楶睥∽???卽牴湩?畱瑯穥?敲畱獥?敧側牡浡瑥牥(
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
  r_htgl_?※?素<?????????※素瑓楲杮焠潵整楶睥爽煥敵瑳朮瑥慐慲敭整?焢潵整楶睥?※?晩焨潵整楶睥?畮汬笩?畱瑯癥敩???※?素汥敳??焠潵整楶睥∽???卽牴湩?畱瑯穥?敲畱獥?敧側牡浡瑥牥(add="无";
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

 String r_fksq_zt=request.getParameter("r_fksq_zt");
    if(r_fksq_zt!=null){
  r_fksq_zt="有";
    }else
  {
  r_fksq_zt="无";
  }
 String r_month?※?素<?????????※素瑓楲杮焠潵整楶睥爽煥敵瑳朮瑥慐慲敭整?焢潵整楶睥?※?晩焨潵整楶睥?畮汬笩?畱瑯癥敩???※?素汥敳??焠潵整楶睥∽???卽牴湩?畱瑯穥?敲畱獥?敧側牡浡瑥牥(_jh_add=request.getParameter("r_month_jh_add");
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

 String r_week_?※?素<?????????※素瑓楲杮焠潵整楶睥爽煥敵瑳朮瑥慐慲敭整?焢潵整楶睥?※?晩焨潵整楶睥?畮汬笩?畱瑯癥敩???※?素汥敳??焠潵整楶睥∽???卽牴湩?畱瑯穥?敲畱獥?敧側牡浡瑥牥(r_view=request.getParameter("r_week_r_view");
    if(r_week_r_view!=null){
  r_week_r_view="有";
    }else
  {
  r_week_r_view="无";
  }

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
  r_thje_?※?素<?????????※素瑓楲杮焠潵整楶睥爽煥敵瑳朮瑥慐慲敭整?焢潵整楶睥?※?晩焨潵整楶睥?畮汬笩?畱瑯癥敩???※?素汥敳??焠潵整楶睥∽???卽牴湩?畱瑯穥?敲畱獥?敧側牡浡瑥牥(mod="无";
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

 String r_mtxc_zt=request.getParameter("r_mtxc_zt");
    if(r_mtxc_zt!=null){
  r_mtxc_zt="有";
    }else
  {
  r_mtxc_zt="无";
  }
 String strSQL="update restrain set restrain_name='" + ename + "',xhadd='" + xhadd + "',xhmod='" + xhmod + "',xhdel='" + xhdel + "',xhview='" + xhview + "',xhzt='" + xhzt + "',linkadd='" + linkadd + "',linkmod='" + linkmod + "',linkdel='" + linkdel + "',linkview='" + linkview + "',linkzt='" + linkzt + "',supadd='" + supadd + "',supmod='" + supmod + "',supdel='" + supdel + "',supview='" + supview + "',supzt='" + supzt + "',actadd='" + actadd + "',actmod='" + actmod + "',actdel='" + actdel + "',actview='" + actview + "',actzt='" + actzt + "',opadd='" + opadd + "',opmod='" + opmod + "',opdel='" + opdel + "',opview='" + opview + "',opzt='" + opzt + "',quoteadd='" + quoteadd + "',quotemod='" + quotemod + "',quotedel='" + quotedel + "',quoteview='" + quoteview + "',quotezt='" + quotezt + "',proadd='" + proadd + "',promod='" + promod + "',prodel='" + prodel + "',proview='" + proview + "',prozt='" + prozt + "',cgadd='" + cgadd + "',cgmod='" + cgmod + "',cgdel='" + cgdel + "',cgview='" + cgview + "',cgzt='" + cgzt + "',tradd='" + tradd + "',trmod='" + trmod + "',trdel='" + trdel + "',trview='" + trview + "',trzt='" + trzt + "',hdadd='" + hdadd + "',hdmod='" + hdmod + "',hddel='" + hddel + "',hdview='" + hdview + "',hdzt='" + hdzt + "',workadd='" + workadd + "',workmod='" + workmod + "',workdel='" + workdel + "',workview='" + workview + "',workzt='" + workzt + "',xmadd='" + xmadd + "',xmmod='" + xmmod + "',xmdel='" + xmdel + "',xmview='" + xmview + "',xmzt='" + xmzt + "',subadd='" + subadd + "',submod='" + submod + "',subdel='" + subdel + "',subview='" + subview + "',subzt='" + subzt + "',manadd='" + manadd + "',manmod='" + manmod + "',mandel='" + mandel + "',manview='" + manview + "',manzt='" + manzt + "',rwadd='" + rwadd + "',rwmod='" + rwmod + "',rwdel='" + rwdel + "',rwview='" + rwview + "',rwzt='" + rwzt + "',fyadd='" + fyadd + "',fymod='" + fymod + "',fydel='" + fydel + "',fyview='" + fyview + "',fyzt='" + fyzt + "',thadd='" + thadd + "',thmod='" + thmod + "',thdel='" + thdel + "',thview='" + thview + "',thzt='" + thzt + "',serveradd='" + serveradd + "',servermod='" + servermod + "',serverdel='" + serverdel + "',serverview='" + serverview + "',serverzt='" + serverzt + "',tsadd='" + tsadd + "',tsmod='" + tsmod + "',tsdel='" + tsdel + "',tsview='" + tsview + "',tszt='" + tszt + "',wxadd='" + wxadd + "',wxmod='" + wxmod + "',wxdel='" + wxdel + "',wxview='" + wxview + "',wxzt='" + wxzt + "',mactadd='" + mactadd + "',mactmod='" + mactmod + "',mactdel='" + mactdel + "',mactview='" + mactview + "',mactzt='" + mactzt + "',jzdsadd='" + jzdsadd + "',jzdsmod='" + jzdsmod + "',jzdsdel='" + jzdsdel + "',jzdsview='" + jzdsview + "',jzdszt='" + jzdszt + "',zskadd='" + zskadd + "',zskmod='" + zskmod + "',zskdel='" + zskdel + "',zskview='" + zskview + "',zskzt='" + zskzt + "',flfgadd='" + flfgadd + "',flfgmod='" + flfgmod + "',flfgdel='" + flfgdel + "',flfgview='" + flfgview + "',flfgzt='" + flfgzt + "',fkhzadd='" + fkhzadd + "',fkhzmod='" + fkhzmod + "',fkhzdel='" + fkhzdel + "',fkhzview='" + fkhzview + "',fkhzzt='" + fkhzzt + "',skhzadd='" + skhzadd + "',skhzmod='" + skhzmod + "',skhzdel='" + skhzdel + "',skhzview='" + skhzview + "',skhzzt='" + skhzzt + "',fkadd='" + fkadd + "',fkmod='" + fkmod + "',fkdel='" + fkdel + "',fkview='" + fkview + "',fkzt='" + fkzt + "',skadd='" + skadd + "',skmod='" + skmod + "',skdel='" + skdel + "',skview='" + skview + "',skzt='" + skzt + "',qkadd='" + qkadd + "',qkmod='" + qkmod + "',qkdel='" + qkdel + "',qkview='" + qkview + "',qkzt='" + qkzt + "',intadd='" + intadd + "',intmod='" + intmod + "',intdel='" + intdel + "',intview='" + intview + "',intzt='" + intzt + "',outadd='" + outadd + "',outmod='" + outmod + "',outdel='" + outdel + "',outview='" + outview + "',outzt='" + outzt + "',syszt='" + syszt + "',qzadd='" + qzadd + "',qzmod='" + qzmod + "',qzdel='" + qzdel + "',qzview='" + qzview + "',qzzt='" + qzzt + "',hzadd='" + hzadd + "',hzmod='" + hzmod + "',hzdel='" + hzdel + "',hzview='" + hzview + "',hzzt='" + hzzt + "',zjadd='" + zjadd + "',zjmod='" + zjmod + "',zjdel='" + zjdel + "',zjview='" + zjview + "',zjzt='" + zjzt + "',r_yfgladd='" + r_yfgladd + "',r_yfglmod='" + r_yfglmod + "',r_yfgldel='" + r_yfgldel + "',r_yfglview='" + r_yfglview + "',r_yfglzt='" + r_yfglzt + "',r_month_jh_add='" + r_month_jh_add + "',r_month_jh_mod='" + r_month_jh_mod + "',r_month_jh_del='" + r_month_jh_del + "',r_month_jh_view='" + r_month_jh_view + "',r_month_jh_zt='" + r_month_jh_zt + "',r_date_r_add='" + r_date_r_add + "',r_date_r_mod='" + r_date_r_mod + "',r_date_r_del='" + r_date_r_del + "',r_date_r_view='" + r_date_r_view + "',r_date_r_zt='" + r_date_r_zt + "',r_week_r_add='" + r_week_r_add + "',r_week_r_mod='" + r_week_r_mod + "',r_week_r_del='" + r_week_r_del + "',r_week_r_view='" + r_week_r_view + "',r_week_r_zt='" + r_week_r_zt + "',r_month_r_add='" + r_month_r_add + "',r_month_r_mod='" + r_month_r_mod + "',r_month_r_del='" + r_month_r_del + "',r_month_r_view='" + r_month_r_view + "',r_month_r_zt='" + r_month_r_zt + "',r_htgl_add='" + r_htgl_add + "',r_htgl_mod='" + r_htgl_mod + "',r_htgl_del='" + r_htgl_del + "',r_htgl_view='" + r_htgl_view + "',r_htgl_zt='" + r_htgl_zt + "',r_jkgl_add='" + r_jkgl_add + "',r_jkgl_mod='" + r_jkgl_mod + "',r_jkgl_del='" + r_jkgl_del + "',r_jkgl_view='" + r_jkgl_view + "',r_jkgl_zt='" + r_jkgl_zt + "',r_fksq_add='" + r_fksq_add + "',r_fksq_mod='" + r_fksq_mod + "',r_fksq_del='" + r_fksq_del + "',r_fksq_view='" + r_fksq_view + "',r_fksq_zt='" + r_fksq_zt + "',r_hyzc_add='" + r_hyzc_add + "',r_hyzc_mod='" + r_hyzc_mod + "',r_hyzc_del='" + r_hyzc_del + "',r_hyzc_view='" + r_hyzc_view + "',r_hyzc_zt='" + r_hyzc_zt + "',r_mtxc_add='" + r_mtxc_add + "',r_mtxc_mod='" + r_mtxc_mod + "',r_mtxc_del='" + r_mtxc_del + "',r_mtxc_view='" + r_mtxc_view + "',r_mtxc_zt='" + r_mtxc_zt + "',r_wlz_add='" + r_wlz_add + "',r_wlz_mod='" + r_wlz_mod + "',r_wlz_del='" + r_wlz_del + "',r_wlz_view='" + r_wlz_view + "',r_wlz_zt='" + r_wlz_zt + "',jcfxzt='" + jcfxzt + "',custzyzt='" + custzyzt + "',r_dzzx_zt='" + r_dzzx_zt + "',r_xscp_zt='" + r_xscp_zt + "' where id='" + id1 + "'";
   boolean t= einfodb.executeUpdate(strSQL);
   if(!t)
   {
     out.println("<font size='2' color='#FF0000'>更新失败,你所输入的内容超出系统范围或输入类型不符!</font>");
	 return;
   }
 %>
<body bgcolor="#ffffff">
<div align="center"><br><br><br> <p><img src="../../../images/cg.jpg" width="111" height="111"></p>

    <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=#a9a9a9 size=1>
  <p style="font-size:16px; color: #f00; font-family:'宋体'; letter-spacing:0px; vertical-align:middle;">修改成功!</font></p>
  <p><a href="punit.jsp" style="font-size: 12px">返回</a></p>
</div>
</body>
<%}}%>
</html>