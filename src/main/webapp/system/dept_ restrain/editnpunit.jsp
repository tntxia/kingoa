<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="einfodb" scope="page" class="bankdb.bankdb" />
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../refuse.jsp"
    </script>
<% } else {    
String id1=request.getParameter("id");
String sql="select * from restrain where id='"+id1+"'";
ResultSet rs=einfodb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
%>
<html>
<head>
<title>权限自定义</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
<!--
function isValid(){
    var i,j,strTemp;
    strTemp="0123456789";
	var num1=form1.salestc.value;
    if (form1.salestc.value==""){
        alert("请您输入销售提成!");
        form1.salestc.focus();
	return false;
    }
   else {
         for (i=0;i<num1.length;i++)
        {
        j=strTemp.indexOf(num1.charAt(i));    
        if (j==-1)
        {
            alert("请填写数字格式!");
        form1.salestc.focus();
        return false;
        }
    }
    return true;      
    }
}
</script>
</head>
<body topmargin="0" text="#000000" bgcolor="#ffffff" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="doeditpunit.jsp" onSubmit="return isValid();">
  <table width="100%" border="1" cellspacing="0" cellpadding="0" height="953">
    <tr> 
      <td width="17%" height="6" bgcolor="#C1D9FF"><font size="2" color="#000000">编辑 &gt;&gt;</font>&nbsp;</td>
      <td height="6" colspan="5" bgcolor="#C1D9FF"> <div align="right"><font size="2" color="#000000"> 
          <input type="hidden" name="id" value="<%=id1%>">
          <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
          </font> 
          <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
        </div></td>
    </tr>
    <tr> 
      <td width="17%" height="2"><b><font size="2" color="#000080">当前用户</font></b></td>
      <td height="2" colspan="3"><font size="2">&nbsp; </font> <div align="left"><font size="2"> 
          <strong><%=rs.getString("ename")%> </strong></font>&nbsp;</div>
        <b></b></td>
      <td><b><font color="#000080" size="2">所在部门</font></b></td>
      <td height="2"><font size="2" face="Arial, Helvetica, sans-serif">&nbsp; 
        </font><font size="2"><strong></strong></font><font size="2" face="Arial, Helvetica, sans-serif"> 
        <%String dept=rs.getString("dept"); %>
        <%=dept%> </font><font size="2" color="#000000">&nbsp; </font><font size="2" face="Arial, Helvetica, sans-serif">&nbsp; 
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><div align="center"><strong><font size="2">功能模块</font></strong></div></td>
      <td><div align="center"><strong><font size="2">新增权限</font></strong></div></td>
      <td><div align="center"><strong><font size="2">修改权限</font></strong></div></td>
      <td><div align="center"><strong><font size="2">删除权限</font></strong></div></td>
      <td><div align="center"><strong><font size="2">查看权限</font></strong></div></td>
      <td><div align="center"><strong><font size="2">可视权限</font></strong></div></td>
    </tr>
    <tr> 
      <td width="17%"><b><font size="2" color="#000080">潜在客户</font></b></td>
      <td width="16%"> <font size="2"> 
        <select name="qzadd" id="qzadd">
          <%String qzadd1=rs.getString("qzadd").trim();
          String[] number=new String[]{"无","有"};
          for(int i=0;i<number.length;i++)
           {
             if(qzadd1.equals(number[i]))
               out.println("<option selected>"+number[i]+"</option>");
             else
               out.println("<option >"+number[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="qzmod">
          <%
		   String qzmod1=rs.getString("qzmod").trim();
          String[] qzmod=new String[]{"有","无"};
          for(int i=0;i<qzmod.length;i++)
           {
             if(qzmod1.equals(qzmod[i]))
               out.println("<option selected>"+qzmod[i]+"</option>");
             else
               out.println("<option >"+qzmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="qzdel">
          <%String qzdel1=rs.getString("qzdel").trim();
          String[] qzdel=new String[]{"有","无"};
          for(int i=0;i<qzdel.length;i++)
           {
             if(qzdel1.equals(qzdel[i]))
               out.println("<option selected>"+qzdel[i]+"</option>");
             else
               out.println("<option >"+qzdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="qzview" id="qzview">
          <%String qzview1=rs.getString("qzview").trim();
          String[] qzview=new String[]{"有","无"};
          for(int i=0;i<qzview.length;i++)
           {
             if(qzview1.equals(qzview[i]))
               out.println("<option selected>"+qzview[i]+"</option>");
             else
               out.println("<option >"+qzview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="qzzt" id="qzzt">
          <%String qzzt1=rs.getString("qzzt").trim();
          String[] qzzt=new String[]{"有","无"};
          for(int i=0;i<qzzt.length;i++)
           {
             if(qzzt1.equals(qzzt[i]))
               out.println("<option selected>"+qzzt[i]+"</option>");
             else
               out.println("<option >"+qzzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%"><b><font size="2" color="#000080">现有客户</font></b></td>
      <td width="16%"> <font size="2"> 
        <select name="xhadd" id="xhadd">
          <% String xhadd1=rs.getString("xhadd").trim();
          String[] xhadd=new String[]{"有","无"};
          for(int i=0;i<xhadd.length;i++)
           {
             if(xhadd1.equals(xhadd[i]))
               out.println("<option selected>"+xhadd[i]+"</option>");
             else
               out.println("<option >"+xhadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="xhmod" id="xhmod">
          <%
		   String xhmod1=rs.getString("xhmod").trim();
          String[] xhmod=new String[]{"有","无"};
          for(int i=0;i<xhmod.length;i++)
           {
             if(xhmod1.equals(xhmod[i]))
               out.println("<option selected>"+xhmod[i]+"</option>");
             else
               out.println("<option >"+xhmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="xhdel" id="xhdel">
          <%
		   String xhdel1=rs.getString("xhdel").trim();
          String[] xhdel=new String[]{"有","无"};
          for(int i=0;i<xhdel.length;i++)
           {
             if(xhdel1.equals(xhdel[i]))
               out.println("<option selected>"+xhdel[i]+"</option>");
             else
               out.println("<option >"+xhdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="xhview" id="xhview">
          <%
		   String xhview1=rs.getString("xhview").trim();
          String[] xhview=new String[]{"有","无"};
          for(int i=0;i<xhview.length;i++)
           {
             if(xhview1.equals(xhview[i]))
               out.println("<option selected>"+xhview[i]+"</option>");
             else
               out.println("<option >"+xhview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="xhzt" id="select10">
          <%
		   String xhzt1=rs.getString("xhzt").trim();
          String[] xhzt=new String[]{"有","无"};
          for(int i=0;i<xhzt.length;i++)
           {
             if(xhzt1.equals(xhzt[i]))
               out.println("<option selected>"+xhzt[i]+"</option>");
             else
               out.println("<option >"+xhzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%"><b><font size="2" color="#000080">联系人</font></b></td>
      <td width="16%"> <font size="2"> 
        <select name="linkadd" id="linkadd">
          <%
		   String linkadd1=rs.getString("linkadd").trim();
          String[] linkadd=new String[]{"有","无"};
          for(int i=0;i<linkadd.length;i++)
           {
             if(linkadd1.equals(linkadd[i]))
               out.println("<option selected>"+linkadd[i]+"</option>");
             else
               out.println("<option >"+linkadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="linkmod" id="linkmod">
          <%
		   String linkmod1=rs.getString("linkmod").trim();
          String[] linkmod=new String[]{"有","无"};
          for(int i=0;i<linkmod.length;i++)
           {
             if(linkmod1.equals(linkmod[i]))
               out.println("<option selected>"+linkmod[i]+"</option>");
             else
               out.println("<option >"+linkmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="linkdel" id="linkdel">
          <%
		   String linkdel1=rs.getString("linkdel").trim();
          String[] linkdel=new String[]{"有","无"};
          for(int i=0;i<linkdel.length;i++)
           {
             if(linkdel1.equals(linkdel[i]))
               out.println("<option selected>"+linkdel[i]+"</option>");
             else
               out.println("<option >"+linkdel[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="linkview" id="linkview">
          <%
		   String linkview1=rs.getString("linkview").trim();
          String[] linkview=new String[]{"有","无"};
          for(int i=0;i<linkview.length;i++)
           {
             if(linkview1.equals(linkview[i]))
               out.println("<option selected>"+linkview[i]+"</option>");
             else
               out.println("<option >"+linkview[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="linkzt" id="linkzt">
          <%
		   String linkzt1=rs.getString("linkzt").trim();
          String[] linkzt=new String[]{"有","无"};
          for(int i=0;i<linkzt.length;i++)
           {
             if(linkzt1.equals(linkzt[i]))
               out.println("<option selected>"+linkzt[i]+"</option>");
             else
               out.println("<option >"+linkzt[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%"><b><font size="2" color="#000080">供应商</font></b></td>
      <td width="16%"> <font size="2"> 
        <select name="supadd" id="supadd">
          <%
		   String  supadd1=rs.getString("supadd").trim();
          String[] supadd=new String[]{"有","无"};
          for(int i=0;i<supadd.length;i++)
           {
             if(supadd1.equals(supadd[i]))
               out.println("<option selected>"+supadd[i]+"</option>");
             else
               out.println("<option >"+supadd[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="supmod" id="supmod">
          <%
		   String  supmod1=rs.getString("supmod").trim();
          String[] supmod=new String[]{"有","无"};
          for(int i=0;i<supmod.length;i++)
           {
             if(supmod1.equals(supmod[i]))
               out.println("<option selected>"+supmod[i]+"</option>");
             else
               out.println("<option >"+supmod[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="supdel" id="supdel">
          <%
		   String  supdel1=rs.getString("supdel").trim();
          String[] supdel=new String[]{"有","无"};
          for(int i=0;i<supdel.length;i++)
           {
             if(supdel1.equals(supdel[i]))
               out.println("<option selected>"+supdel[i]+"</option>");
             else
               out.println("<option >"+supdel[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="supview" id="supview">
          <%
		   String  supview1=rs.getString("supview").trim();
          String[] supview=new String[]{"有","无"};
          for(int i=0;i<supview.length;i++)
           {
             if(supview1.equals(supview[i]))
               out.println("<option selected>"+supview[i]+"</option>");
             else
               out.println("<option >"+supview[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="supzt" id="supzt">
          <%
		   String supzt1=rs.getString("supzt").trim();
          String[] supzt=new String[]{"有","无"};
          for(int i=0;i<supzt.length;i++)
           {
             if(supzt1.equals(supzt[i]))
               out.println("<option selected>"+supzt[i]+"</option>");
             else
               out.println("<option >"+supzt[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%" height="24"><b><font size="2" color="#000080">活动</font></b></td>
      <td width="16%"> <font size="2"> 
        <select name="actadd" id="actadd">
          <%
		   String actadd1=rs.getString("actadd").trim();
          String[] actadd=new String[]{"有","无"};
          for(int i=0;i<actadd.length;i++)
           {
             if(actadd1.equals(actadd[i]))
               out.println("<option selected>"+actadd[i]+"</option>");
             else
               out.println("<option >"+actadd[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="actmod" id="actmod">
          <%
		   String actmod1=rs.getString("actmod").trim();
          String[] actmod=new String[]{"有","无"};
          for(int i=0;i<actmod.length;i++)
           {
             if(actmod1.equals(actmod[i]))
               out.println("<option selected>"+actmod[i]+"</option>");
             else
               out.println("<option >"+actmod[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="actdel" id="actdel">
          <%
		   String actdel1=rs.getString("actdel").trim();
          String[] actdel=new String[]{"有","无"};
          for(int i=0;i<actdel.length;i++)
           {
             if(actdel1.equals(actdel[i]))
               out.println("<option selected>"+actdel[i]+"</option>");
             else
               out.println("<option >"+actdel[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="actview" id="actview">
          <%
		   String actview1=rs.getString("actview").trim();
          String[] actview=new String[]{"有","无"};
          for(int i=0;i<actview.length;i++)
           {
             if(actview1.equals(actview[i]))
               out.println("<option selected>"+actview[i]+"</option>");
             else
               out.println("<option >"+actview[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="actzt" id="actzt">
          <%
		   String actzt1=rs.getString("actzt").trim();
          String[] actzt=new String[]{"有","无"};
          for(int i=0;i<actzt.length;i++)
           {
             if(actzt1.equals(actzt[i]))
               out.println("<option selected>"+actzt[i]+"</option>");
             else
               out.println("<option >"+actzt[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%"><b><font size="2" color="#000080">销售机会</font></b></td>
      <td width="16%"> <font size="2"> 
        <select name="opadd" id="opadd">
          <%
		   String opadd1=rs.getString("opadd").trim();
          String[] opadd=new String[]{"有","无"};
          for(int i=0;i<opadd.length;i++)
           {
             if(opadd1.equals(opadd[i]))
               out.println("<option selected>"+opadd[i]+"</option>");
             else
               out.println("<option >"+opadd[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="opmod" id="opmod">
          <%
		   String opmod1=rs.getString("opmod").trim();
          String[] opmod=new String[]{"有","无"};
          for(int i=0;i<opmod.length;i++)
           {
             if(opmod1.equals(opmod[i]))
               out.println("<option selected>"+opmod[i]+"</option>");
             else
               out.println("<option >"+opmod[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="opdel" id="opdel">
          <%
		   String opdel1=rs.getString("opdel").trim();
          String[] opdel=new String[]{"有","无"};
          for(int i=0;i<opdel.length;i++)
           {
             if(opdel1.equals(opdel[i]))
               out.println("<option selected>"+opmod[i]+"</option>");
             else
               out.println("<option >"+opdel[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="opview" id="opview">
          <%
		   String opview1=rs.getString("opview").trim();
          String[] opview=new String[]{"有","无"};
          for(int i=0;i<opview.length;i++)
           {
             if(opview1.equals(opview[i]))
               out.println("<option selected>"+opview[i]+"</option>");
             else
               out.println("<option >"+opview[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="opzt" id="opzt">
          <%
		   String opzt1=rs.getString("opzt").trim();
          String[] opzt=new String[]{"有","无"};
          for(int i=0;i<opzt.length;i++)
           {
             if(opzt1.equals(opzt[i]))
               out.println("<option selected>"+opzt[i]+"</option>");
             else
               out.println("<option >"+opzt[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%"><b><font size="2" color="#000080">报价</font></b></td>
      <td width="16%"> <font size="2"> 
        <select name="quoteadd" id="quoteadd">
          <%
		   String quoteadd1=rs.getString("quoteadd").trim();
          String[] quoteadd=new String[]{"有","无"};
          for(int i=0;i<quoteadd.length;i++)
           {
             if(quoteadd1.equals(quoteadd[i]))
               out.println("<option selected>"+quoteadd[i]+"</option>");
             else
               out.println("<option >"+quoteadd[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="quotemod" id="quotemod">
          <%
		   String quotemod1=rs.getString("quotemod").trim();
          String[] quotemod=new String[]{"有","无"};
          for(int i=0;i<quotemod.length;i++)
           {
             if(quotemod1.equals(quotemod[i]))
               out.println("<option selected>"+quotemod[i]+"</option>");
             else
               out.println("<option >"+quotemod[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="quotedel" id="quotedel">
          <%
		   String quotedel1=rs.getString("quotedel").trim();
          String[] quotedel=new String[]{"有","无"};
          for(int i=0;i<quotedel.length;i++)
           {
             if(quotedel1.equals(quotedel[i]))
               out.println("<option selected>"+quotedel[i]+"</option>");
             else
               out.println("<option >"+quotedel[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="quoteview" id="quoteview">
          <%
		   String quoteview1=rs.getString("quoteview").trim();
          String[] quoteview=new String[]{"有","无"};
          for(int i=0;i<quoteview.length;i++)
           {
             if(quoteview1.equals(quoteview[i]))
               out.println("<option selected>"+quoteview[i]+"</option>");
             else
               out.println("<option >"+quoteview[i]+"</option>");
           }
		      %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="quotezt" id="quotezt">
          <%String quotezt1=rs.getString("quotezt").trim();
          String[] quotezt=new String[]{"有","无"};
          for(int i=0;i<quotezt.length;i++)
           {
             if(quotezt1.equals(qzdel[i]))
               out.println("<option selected>"+quotezt[i]+"</option>");
             else
               out.println("<option >"+quotezt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><b><font size="2" color="#000080">产品</font></b></td>
      <td> <font size="2"> 
        <select name="proadd" id="proadd">
          <%String proadd1=rs.getString("proadd").trim();
          String[] proadd=new String[]{"有","无"};
          for(int i=0;i<proadd.length;i++)
           {
             if(proadd1.equals(proadd[i]))
               out.println("<option selected>"+proadd[i]+"</option>");
             else
               out.println("<option >"+proadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="promod" id="promod">
          <%String promod1=rs.getString("promod").trim();
          String[] promod=new String[]{"有","无"};
          for(int i=0;i<promod.length;i++)
           {
             if(promod1.equals(promod[i]))
               out.println("<option selected>"+promod[i]+"</option>");
             else
               out.println("<option >"+promod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="prodel" id="prodel">
          <%String prodel1=rs.getString("prodel").trim();
          String[] prodel=new String[]{"有","无"};
          for(int i=0;i<prodel.length;i++)
           {
             if(prodel1.equals(prodel[i]))
               out.println("<option selected>"+prodel[i]+"</option>");
             else
               out.println("<option >"+prodel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="proview" id="proview">
          <%String proview1=rs.getString("proview").trim();
          String[] proview=new String[]{"有","无"};
          for(int i=0;i<proview.length;i++)
           {
             if(proview1.equals(proview[i]))
               out.println("<option selected>"+proview[i]+"</option>");
             else
               out.println("<option >"+proview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="prozt" id="prozt">
          <%String prozt1=rs.getString("prozt").trim();
          String[] prozt=new String[]{"有","无"};
          for(int i=0;i<prozt.length;i++)
           {
             if(prozt1.equals(prozt[i]))
               out.println("<option selected>"+prozt[i]+"</option>");
             else
               out.println("<option >"+prozt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">采购</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="cgadd" id="cgadd">
          <%String cgadd1=rs.getString("cgadd").trim();
          String[] cgadd=new String[]{"有","无"};
          for(int i=0;i<cgadd.length;i++)
           {
             if(cgadd1.equals(cgadd[i]))
               out.println("<option selected>"+cgadd[i]+"</option>");
             else
               out.println("<option >"+cgadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="cgmod" id="cgmod">
          <%String cgmod1=rs.getString("cgmod").trim();
          String[] cgmod=new String[]{"有","无"};
          for(int i=0;i<cgmod.length;i++)
           {
             if(cgmod1.equals(cgmod[i]))
               out.println("<option selected>"+cgmod[i]+"</option>");
             else
               out.println("<option >"+cgmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="cgdel" id="cgdel">
          <%String cgdel1=rs.getString("cgdel").trim();
          String[] cgdel=new String[]{"有","无"};
          for(int i=0;i<cgdel.length;i++)
           {
             if(cgdel1.equals(cgdel[i]))
               out.println("<option selected>"+cgdel[i]+"</option>");
             else
               out.println("<option >"+cgdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="cgview" id="cgview">
          <%String cgview1=rs.getString("cgview").trim();
          String[] cgview=new String[]{"有","无"};
          for(int i=0;i<cgview.length;i++)
           {
             if(cgview1.equals(cgview[i]))
               out.println("<option selected>"+cgview[i]+"</option>");
             else
               out.println("<option >"+cgview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="cgzt" id="cgzt">
          <%String cgzt1=rs.getString("cgzt").trim();
          String[] cgzt=new String[]{"有","无"};
          for(int i=0;i<cgzt.length;i++)
           {
             if(cgzt1.equals(cgzt[i]))
               out.println("<option selected>"+cgzt[i]+"</option>");
             else
               out.println("<option >"+cgzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">发运</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="tradd" id="tradd">
          <%String tradd1=rs.getString("tradd").trim();
          String[] tradd=new String[]{"有","无"};
          for(int i=0;i<tradd.length;i++)
           {
             if(tradd1.equals(tradd[i]))
               out.println("<option selected>"+tradd[i]+"</option>");
             else
               out.println("<option >"+tradd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="trmod" id="trmod">
          <%String trmod1=rs.getString("trmod").trim();
          String[] trmod=new String[]{"有","无"};
          for(int i=0;i<trmod.length;i++)
           {
             if(trmod1.equals(trmod[i]))
               out.println("<option selected>"+trmod[i]+"</option>");
             else
               out.println("<option >"+trmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="trdel" id="trdel">
          <%String trdel1=rs.getString("trdel").trim();
          String[] trdel=new String[]{"有","无"};
          for(int i=0;i<trdel.length;i++)
           {
             if(trdel1.equals(trdel[i]))
               out.println("<option selected>"+trdel[i]+"</option>");
             else
               out.println("<option >"+trdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="trview" id="trview">
          <%String trview1=rs.getString("trview").trim();
          String[] trview=new String[]{"有","无"};
          for(int i=0;i<trview.length;i++)
           {
             if(trview1.equals(trview[i]))
               out.println("<option selected>"+trview[i]+"</option>");
             else
               out.println("<option >"+trview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="trzt" id="trzt">
          <%String trzt1=rs.getString("trzt").trim();
          String[] trzt=new String[]{"有","无"};
          for(int i=0;i<trzt.length;i++)
           {
             if(trzt1.equals(trzt[i]))
               out.println("<option selected>"+trzt[i]+"</option>");
             else
               out.println("<option >"+trzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">货代公司</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="hdadd" id="hdadd">
          <%String hdadd1=rs.getString("hdadd").trim();
          String[] hdadd=new String[]{"有","无"};
          for(int i=0;i<hdadd.length;i++)
           {
             if(hdadd1.equals(hdadd[i]))
               out.println("<option selected>"+hdadd[i]+"</option>");
             else
               out.println("<option >"+hdadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="hdmod" id="hdmod">
          <%String hdmod1=rs.getString("hdmod").trim();
          String[] hdmod=new String[]{"有","无"};
          for(int i=0;i<hdmod.length;i++)
           {
             if(hdmod1.equals(hdmod[i]))
               out.println("<option selected>"+hdmod[i]+"</option>");
             else
               out.println("<option >"+hdmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="hddel" id="hddel">
          <%String hddel1=rs.getString("hddel").trim();
          String[] hddel=new String[]{"有","无"};
          for(int i=0;i<hddel.length;i++)
           {
             if(hddel1.equals(hddel[i]))
               out.println("<option selected>"+hddel[i]+"</option>");
             else
               out.println("<option >"+hddel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="hdview" id="hdview">
          <%String hdview1=rs.getString("hdview").trim();
          String[] hdview=new String[]{"有","无"};
          for(int i=0;i<hdview.length;i++)
           {
             if(hdview1.equals(hdview[i]))
               out.println("<option selected>"+hdview[i]+"</option>");
             else
               out.println("<option >"+hdview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="hdzt" id="hdzt">
          <%String hdzt1=rs.getString("hdzt").trim();
          String[] hdzt=new String[]{"有","无"};
          for(int i=0;i<hdzt.length;i++)
           {
             if(hdzt1.equals(hdzt[i]))
               out.println("<option selected>"+hdzt[i]+"</option>");
             else
               out.println("<option >"+hdzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">工作汇报</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="workadd" id="workadd">
          <%String workadd1=rs.getString("workadd").trim();
          String[] workadd=new String[]{"有","无"};
          for(int i=0;i<workadd.length;i++)
           {
             if(workadd1.equals(workadd[i]))
               out.println("<option selected>"+workadd[i]+"</option>");
             else
               out.println("<option >"+workadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="workmod" id="workmod">
          <%String workmod1=rs.getString("workmod").trim();
          String[] workmod=new String[]{"有","无"};
          for(int i=0;i<workmod.length;i++)
           {
             if(workmod1.equals(workmod[i]))
               out.println("<option selected>"+workmod[i]+"</option>");
             else
               out.println("<option >"+workmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="workdel" id="workdel">
          <%String workdel1=rs.getString("workdel").trim();
          String[] workdel=new String[]{"有","无"};
          for(int i=0;i<workdel.length;i++)
           {
             if(workdel1.equals(workdel[i]))
               out.println("<option selected>"+workdel[i]+"</option>");
             else
               out.println("<option >"+workdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="workview" id="workview">
          <%String workview1=rs.getString("workview").trim();
          String[] workview=new String[]{"有","无"};
          for(int i=0;i<workview.length;i++)
           {
             if(workview1.equals(workview[i]))
               out.println("<option selected>"+workview[i]+"</option>");
             else
               out.println("<option >"+workview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="workzt" id="workzt">
          <%String workzt1=rs.getString("workzt").trim();
          String[] workzt=new String[]{"有","无"};
          for(int i=0;i<workzt.length;i++)
           {
             if(workzt1.equals(workzt[i]))
               out.println("<option selected>"+workzt[i]+"</option>");
             else
               out.println("<option >"+workzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">项目</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="xmadd" id="xmadd">
          <%String xmadd1=rs.getString("xmadd").trim();
          String[] xmadd=new String[]{"有","无"};
          for(int i=0;i<xmadd.length;i++)
           {
             if(xmadd1.equals(xmadd[i]))
               out.println("<option selected>"+xmadd[i]+"</option>");
             else
               out.println("<option >"+xmadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="xmmod" id="xmmod">
          <%String xmmod1=rs.getString("xmmod").trim();
          String[] xmmod=new String[]{"有","无"};
          for(int i=0;i<xmmod.length;i++)
           {
             if(xmmod1.equals(xmmod[i]))
               out.println("<option selected>"+xmmod[i]+"</option>");
             else
               out.println("<option >"+xmmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="xmdel" id="xmdel">
          <%String xmdel1=rs.getString("xmdel").trim();
          String[] xmdel=new String[]{"有","无"};
          for(int i=0;i<xmdel.length;i++)
           {
             if(xmdel1.equals(xmdel[i]))
               out.println("<option selected>"+xmdel[i]+"</option>");
             else
               out.println("<option >"+xmdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="xmview" id="xmview">
          <%String xmview1=rs.getString("xmview").trim();
          String[] xmview=new String[]{"有","无"};
          for(int i=0;i<xmview.length;i++)
           {
             if(xmview1.equals(xmview[i]))
               out.println("<option selected>"+xmview[i]+"</option>");
             else
               out.println("<option >"+xmview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="xmzt" id="xmzt">
          <%String xmzt1=rs.getString("xmzt").trim();
          String[] xmzt=new String[]{"有","无"};
          for(int i=0;i<xmzt.length;i++)
           {
             if(xmzt1.equals(xmzt[i]))
               out.println("<option selected>"+xmzt[i]+"</option>");
             else
               out.println("<option >"+xmzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">订单</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="subadd" id="subadd">
          <%String subadd1=rs.getString("subadd").trim();
          String[] subadd=new String[]{"有","无"};
          for(int i=0;i<subadd.length;i++)
           {
             if(subadd1.equals(subadd[i]))
               out.println("<option selected>"+subadd[i]+"</option>");
             else
               out.println("<option >"+subadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="submod" id="submod">
          <%String submod1=rs.getString("submod").trim();
          String[] submod=new String[]{"有","无"};
          for(int i=0;i<submod.length;i++)
           {
             if(submod1.equals(submod[i]))
               out.println("<option selected>"+submod[i]+"</option>");
             else
               out.println("<option >"+submod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="subdel" id="subdel">
          <%String subdel1=rs.getString("subdel").trim();
          String[] subdel=new String[]{"有","无"};
          for(int i=0;i<subdel.length;i++)
           {
             if(subdel1.equals(subdel[i]))
               out.println("<option selected>"+subdel[i]+"</option>");
             else
               out.println("<option >"+subdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="subview" id="subview">
          <%String subview1=rs.getString("subview").trim();
          String[] subview=new String[]{"有","无"};
          for(int i=0;i<subview.length;i++)
           {
             if(subview1.equals(subview[i]))
               out.println("<option selected>"+subview[i]+"</option>");
             else
               out.println("<option >"+subview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="subzt" id="subzt">
          <%String subzt1=rs.getString("subzt").trim();
          String[] subzt=new String[]{"有","无"};
          for(int i=0;i<subzt.length;i++)
           {
             if(subzt1.equals(subzt[i]))
               out.println("<option selected>"+subzt[i]+"</option>");
             else
               out.println("<option >"+subzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">员工</font></strong></td>
      <td> <font size="2"> 
        <select name="manadd" id="manadd">
          <%String manadd1=rs.getString("manadd").trim();
          String[] manadd=new String[]{"有","无"};
          for(int i=0;i<manadd.length;i++)
           {
             if(manadd1.equals(manadd[i]))
               out.println("<option selected>"+manadd[i]+"</option>");
             else
               out.println("<option >"+manadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="manmod" id="manmod">
          <%String manmod1=rs.getString("manmod").trim();
          String[] manmod=new String[]{"有","无"};
          for(int i=0;i<manmod.length;i++)
           {
             if(manmod1.equals(manmod[i]))
               out.println("<option selected>"+manmod[i]+"</option>");
             else
               out.println("<option >"+manmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="mandel" id="mandel">
          <%String mandel1=rs.getString("mandel").trim();
          String[] mandel=new String[]{"有","无"};
          for(int i=0;i<mandel.length;i++)
           {
             if(mandel1.equals(mandel[i]))
               out.println("<option selected>"+mandel[i]+"</option>");
             else
               out.println("<option >"+mandel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="manview" id="manview">
          <%String manview1=rs.getString("manview").trim();
          String[] manview=new String[]{"有","无"};
          for(int i=0;i<manview.length;i++)
           {
             if(manview1.equals(manview[i]))
               out.println("<option selected>"+manview[i]+"</option>");
             else
               out.println("<option >"+manview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="manzt" id="manzt">
          <%String manzt1=rs.getString("manzt").trim();
          String[] manzt=new String[]{"有","无"};
          for(int i=0;i<manzt.length;i++)
           {
             if(manzt1.equals(manzt[i]))
               out.println("<option selected>"+manzt[i]+"</option>");
             else
               out.println("<option >"+manzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">任务</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="rwadd" id="rwadd">
          <%String rwadd1=rs.getString("rwadd").trim();
          String[] rwadd=new String[]{"有","无"};
          for(int i=0;i<rwadd.length;i++)
           {
             if(rwadd1.equals(rwadd[i]))
               out.println("<option selected>"+rwadd[i]+"</option>");
             else
               out.println("<option >"+rwadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="rwmod" id="rwmod">
          <%String rwmod1=rs.getString("rwmod").trim();
          String[] rwmod=new String[]{"有","无"};
          for(int i=0;i<rwmod.length;i++)
           {
             if(rwmod1.equals(rwmod[i]))
               out.println("<option selected>"+rwmod[i]+"</option>");
             else
               out.println("<option >"+rwmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="rwdel" id="rwdel">
          <%String rwdel1=rs.getString("rwdel").trim();
          String[] rwdel=new String[]{"有","无"};
          for(int i=0;i<rwdel.length;i++)
           {
             if(rwdel1.equals(rwdel[i]))
               out.println("<option selected>"+rwdel[i]+"</option>");
             else
               out.println("<option >"+rwdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="rwview" id="rwview">
          <%String rwview1=rs.getString("rwview").trim();
          String[] rwview=new String[]{"有","无"};
          for(int i=0;i<rwview.length;i++)
           {
             if(rwview1.equals(rwview[i]))
               out.println("<option selected>"+rwview[i]+"</option>");
             else
               out.println("<option >"+rwview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="rwzt" id="rwzt">
          <%String rwzt1=rs.getString("rwzt").trim();
          String[] rwzt=new String[]{"有","无"};
          for(int i=0;i<rwzt.length;i++)
           {
             if(rwzt1.equals(rwzt[i]))
               out.println("<option selected>"+rwzt[i]+"</option>");
             else
               out.println("<option >"+rwzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">费用</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="fyadd" id="fyadd">
          <%String fyadd1=rs.getString("fyadd").trim();
          String[] fyadd=new String[]{"有","无"};
          for(int i=0;i<fyadd.length;i++)
           {
             if(fyadd1.equals(fyadd[i]))
               out.println("<option selected>"+fyadd[i]+"</option>");
             else
               out.println("<option >"+fyadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="fymod" id="fymod">
          <%String fymod1=rs.getString("fymod").trim();
          String[] fymod=new String[]{"有","无"};
          for(int i=0;i<fymod.length;i++)
           {
             if(fymod1.equals(fymod[i]))
               out.println("<option selected>"+fymod[i]+"</option>");
             else
               out.println("<option >"+fymod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="fydel" id="fydel">
          <%String fydel1=rs.getString("fydel").trim();
          String[] fydel=new String[]{"有","无"};
          for(int i=0;i<fydel.length;i++)
           {
             if(fydel1.equals(fydel[i]))
               out.println("<option selected>"+fydel[i]+"</option>");
             else
               out.println("<option >"+fydel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="fyview" id="fyview">
          <%String fyview1=rs.getString("fyview").trim();
          String[] fyview=new String[]{"有","无"};
          for(int i=0;i<fyview.length;i++)
           {
             if(fyview1.equals(fyview[i]))
               out.println("<option selected>"+fyview[i]+"</option>");
             else
               out.println("<option >"+fyview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="fyzt" id="fyzt">
          <%String fyzt1=rs.getString("fyzt").trim();
          String[] fyzt=new String[]{"有","无"};
          for(int i=0;i<fyzt.length;i++)
           {
             if(fyzt1.equals(fyzt[i]))
               out.println("<option selected>"+fyzt[i]+"</option>");
             else
               out.println("<option >"+fyzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">换货</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="hhadd" id="hhadd">
          <%String hhadd1=rs.getString("hhadd").trim();
          String[] hhadd=new String[]{"有","无"};
          for(int i=0;i<hhadd.length;i++)
           {
             if(hhadd1.equals(hhadd[i]))
               out.println("<option selected>"+hhadd[i]+"</option>");
             else
               out.println("<option >"+hhadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="hhmod" id="hhmod">
          <%String hhmod1=rs.getString("hhmod").trim();
          String[] hhmod=new String[]{"有","无"};
          for(int i=0;i<hhmod.length;i++)
           {
             if(hhmod1.equals(hhmod[i]))
               out.println("<option selected>"+hhmod[i]+"</option>");
             else
               out.println("<option >"+hhmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="hhdel" id="hhdel">
          <%String hhdel1=rs.getString("hhdel").trim();
          String[] hhdel=new String[]{"有","无"};
          for(int i=0;i<hhdel.length;i++)
           {
             if(hhdel1.equals(hhdel[i]))
               out.println("<option selected>"+hhdel[i]+"</option>");
             else
               out.println("<option >"+hhdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="hhview" id="hhview">
          <%String hhview1=rs.getString("hhview").trim();
          String[] hhview=new String[]{"有","无"};
          for(int i=0;i<hhview.length;i++)
           {
             if(hhview1.equals(hhview[i]))
               out.println("<option selected>"+hhview[i]+"</option>");
             else
               out.println("<option >"+hhview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="hhzt" id="hhzt">
          <%String hhzt1=rs.getString("hhzt").trim();
          String[] hhzt=new String[]{"有","无"};
          for(int i=0;i<hhzt.length;i++)
           {
             if(hhzt1.equals(hhzt[i]))
               out.println("<option selected>"+hhzt[i]+"</option>");
             else
               out.println("<option >"+hhzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">退货</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="thadd" id="thadd">
          <%String thadd1=rs.getString("thadd").trim();
          String[] thadd=new String[]{"有","无"};
          for(int i=0;i<thadd.length;i++)
           {
             if(thadd1.equals(thadd[i]))
               out.println("<option selected>"+thadd[i]+"</option>");
             else
               out.println("<option >"+thadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="thmod" id="thmod">
          <%String thmod1=rs.getString("thmod").trim();
          String[] thmod=new String[]{"有","无"};
          for(int i=0;i<thmod.length;i++)
           {
             if(thmod1.equals(thmod[i]))
               out.println("<option selected>"+thmod[i]+"</option>");
             else
               out.println("<option >"+thmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="thdel" id="thdel">
          <%String thdel1=rs.getString("thdel").trim();
          String[] thdel=new String[]{"有","无"};
          for(int i=0;i<thdel.length;i++)
           {
             if(thdel1.equals(thdel[i]))
               out.println("<option selected>"+thdel[i]+"</option>");
             else
               out.println("<option >"+thdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="thview" id="thview">
          <%String thview1=rs.getString("thview").trim();
          String[] thview=new String[]{"有","无"};
          for(int i=0;i<thview.length;i++)
           {
             if(thview1.equals(thview[i]))
               out.println("<option selected>"+thview[i]+"</option>");
             else
               out.println("<option >"+thview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="thzt" id="thzt">
          <%String thzt1=rs.getString("thzt").trim();
          String[] thzt=new String[]{"有","无"};
          for(int i=0;i<thzt.length;i++)
           {
             if(thzt1.equals(thzt[i]))
               out.println("<option selected>"+thzt[i]+"</option>");
             else
               out.println("<option >"+thzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">客户服务</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="serveradd" id="serveradd">
          <%String serveradd1=rs.getString("serveradd").trim();
          String[] serveradd=new String[]{"有","无"};
          for(int i=0;i<serveradd.length;i++)
           {
             if(serveradd1.equals(serveradd[i]))
               out.println("<option selected>"+serveradd[i]+"</option>");
             else
               out.println("<option >"+serveradd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="servermod" id="servermod">
          <%String servermod1=rs.getString("servermod").trim();
          String[] servermod=new String[]{"有","无"};
          for(int i=0;i<servermod.length;i++)
           {
             if(servermod1.equals(servermod[i]))
               out.println("<option selected>"+servermod[i]+"</option>");
             else
               out.println("<option >"+servermod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="serverdel" id="serverdel">
          <%String serverdel1=rs.getString("serverdel").trim();
          String[] serverdel=new String[]{"有","无"};
          for(int i=0;i<serverdel.length;i++)
           {
             if(serverdel1.equals(serverdel[i]))
               out.println("<option selected>"+serverdel[i]+"</option>");
             else
               out.println("<option >"+serverdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="serverview" id="serverview">
          <%String serverview1=rs.getString("serverview").trim();
          String[] serverview=new String[]{"有","无"};
          for(int i=0;i<serverview.length;i++)
           {
             if(serverview1.equals(serverview[i]))
               out.println("<option selected>"+serverview[i]+"</option>");
             else
               out.println("<option >"+serverview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="serverzt" id="serverzt">
          <%String serverzt1=rs.getString("serverzt").trim();
          String[] serverzt=new String[]{"有","无"};
          for(int i=0;i<serverzt.length;i++)
           {
             if(serverzt1.equals(serverzt[i]))
               out.println("<option selected>"+serverzt[i]+"</option>");
             else
               out.println("<option >"+serverzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">客户投诉</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="tsadd" id="tsadd">
          <%String tsadd1=rs.getString("tsadd").trim();
          String[] tsadd=new String[]{"有","无"};
          for(int i=0;i<tsadd.length;i++)
           {
             if(tsadd1.equals(tsadd[i]))
               out.println("<option selected>"+tsadd[i]+"</option>");
             else
               out.println("<option >"+tsadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="tsmod" id="tsmod">
          <%String tsmod1=rs.getString("tsmod").trim();
          String[] tsmod=new String[]{"有","无"};
          for(int i=0;i<tsmod.length;i++)
           {
             if(tsmod1.equals(tsmod[i]))
               out.println("<option selected>"+tsmod[i]+"</option>");
             else
               out.println("<option >"+tsmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="tsdel" id="tsdel">
          <%String tsdel1=rs.getString("tsdel").trim();
          String[] tsdel=new String[]{"有","无"};
          for(int i=0;i<tsdel.length;i++)
           {
             if(tsdel1.equals(tsdel[i]))
               out.println("<option selected>"+tsdel[i]+"</option>");
             else
               out.println("<option >"+tsdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="tsview" id="tsview">
          <%String tsview1=rs.getString("tsview").trim();
          String[] tsview=new String[]{"有","无"};
          for(int i=0;i<tsview.length;i++)
           {
             if(tsview1.equals(tsview[i]))
               out.println("<option selected>"+tsview[i]+"</option>");
             else
               out.println("<option >"+tsview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="tszt" id="tszt">
          <%String tszt1=rs.getString("tszt").trim();
          String[] tszt=new String[]{"有","无"};
          for(int i=0;i<tszt.length;i++)
           {
             if(tszt1.equals(tszt[i]))
               out.println("<option selected>"+tszt[i]+"</option>");
             else
               out.println("<option >"+tszt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">维修管理</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="wxadd" id="wxadd">
          <%String wxadd1=rs.getString("wxadd").trim();
          String[] wxadd=new String[]{"有","无"};
          for(int i=0;i<wxadd.length;i++)
           {
             if(wxadd1.equals(wxadd[i]))
               out.println("<option selected>"+wxadd[i]+"</option>");
             else
               out.println("<option >"+wxadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="wxmod" id="wxmod">
          <%String wxmod1=rs.getString("wxmod").trim();
          String[] wxmod=new String[]{"有","无"};
          for(int i=0;i<wxmod.length;i++)
           {
             if(wxmod1.equals(wxmod[i]))
               out.println("<option selected>"+wxmod[i]+"</option>");
             else
               out.println("<option >"+wxmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="wxdel">
          <%String wxdel1=rs.getString("wxdel").trim();
          String[] wxdel=new String[]{"有","无"};
          for(int i=0;i<wxdel.length;i++)
           {
             if(wxdel1.equals(wxdel[i]))
               out.println("<option selected>"+wxdel[i]+"</option>");
             else
               out.println("<option >"+wxdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="wxview" id="wxview">
          <%String wxview1=rs.getString("wxview").trim();
          String[] wxview=new String[]{"有","无"};
          for(int i=0;i<wxview.length;i++)
           {
             if(wxview1.equals(wxview[i]))
               out.println("<option selected>"+wxview[i]+"</option>");
             else
               out.println("<option >"+wxview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="wxzt" id="wxzt">
          <%String wxzt1=rs.getString("wxzt").trim();
          String[] wxzt=new String[]{"有","无"};
          for(int i=0;i<wxzt.length;i++)
           {
             if(wxzt1.equals(wxzt[i]))
               out.println("<option selected>"+wxzt[i]+"</option>");
             else
               out.println("<option >"+wxzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">市场活动</font></strong></td>
      <td> <font size="2"> 
        <select name="mactadd" id="mactadd">
          <%String mactadd1=rs.getString("mactadd").trim();
          String[] mactadd=new String[]{"有","无"};
          for(int i=0;i<mactadd.length;i++)
           {
             if(mactadd1.equals(mactadd[i]))
               out.println("<option selected>"+mactadd[i]+"</option>");
             else
               out.println("<option >"+mactadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="mactmod" id="mactmod">
          <%String mactmod1=rs.getString("mactmod").trim();
          String[] mactmod=new String[]{"有","无"};
          for(int i=0;i<mactmod.length;i++)
           {
             if(mactmod1.equals(mactmod[i]))
               out.println("<option selected>"+mactmod[i]+"</option>");
             else
               out.println("<option >"+mactmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="mactdel" id="mactdel">
          <%String mactdel1=rs.getString("mactdel").trim();
          String[] mactdel=new String[]{"有","无"};
          for(int i=0;i<mactdel.length;i++)
           {
             if(mactdel1.equals(mactdel[i]))
               out.println("<option selected>"+mactdel[i]+"</option>");
             else
               out.println("<option >"+mactdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="mactview" id="mactview">
          <%String mactview1=rs.getString("mactview").trim();
          String[] mactview=new String[]{"有","无"};
          for(int i=0;i<mactview.length;i++)
           {
             if(mactview1.equals(mactview[i]))
               out.println("<option selected>"+mactview[i]+"</option>");
             else
               out.println("<option >"+mactview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="mactzt" id="mactzt">
          <%String mactzt1=rs.getString("mactzt").trim();
          String[] mactzt=new String[]{"有","无"};
          for(int i=0;i<mactzt.length;i++)
           {
             if(mactzt1.equals(mactzt[i]))
               out.println("<option selected>"+mactzt[i]+"</option>");
             else
               out.println("<option >"+mactzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">竞争对手</font></strong></td>
      <td> <font size="2"> 
        <select name="jzdsadd" id="jzdsadd">
          <%String jzdsadd1=rs.getString("jzdsadd").trim();
          String[] jzdsadd=new String[]{"有","无"};
          for(int i=0;i<jzdsadd.length;i++)
           {
             if(jzdsadd1.equals(jzdsadd[i]))
               out.println("<option selected>"+jzdsadd[i]+"</option>");
             else
               out.println("<option >"+jzdsadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="jzdsmod" id="jzdsmod">
          <%String jzdsmod1=rs.getString("jzdsmod").trim();
          String[] jzdsmod=new String[]{"有","无"};
          for(int i=0;i<jzdsmod.length;i++)
           {
             if(jzdsmod1.equals(jzdsmod[i]))
               out.println("<option selected>"+jzdsmod[i]+"</option>");
             else
               out.println("<option >"+jzdsmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="jzdsdel" id="jzdsdel">
          <%String jzdsdel1=rs.getString("jzdsdel").trim();
          String[] jzdsdel=new String[]{"有","无"};
          for(int i=0;i<jzdsdel.length;i++)
           {
             if(jzdsdel1.equals(jzdsdel[i]))
               out.println("<option selected>"+jzdsdel[i]+"</option>");
             else
               out.println("<option >"+jzdsdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="jzdsview" id="jzdsview">
          <%String jzdsview1=rs.getString("jzdsview").trim();
          String[] jzdsview=new String[]{"有","无"};
          for(int i=0;i<jzdsview.length;i++)
           {
             if(jzdsview1.equals(jzdsview[i]))
               out.println("<option selected>"+jzdsview[i]+"</option>");
             else
               out.println("<option >"+jzdsview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="jzdszt" id="jzdszt">
          <%String jzdszt1=rs.getString("jzdszt").trim();
          String[] jzdszt=new String[]{"有","无"};
          for(int i=0;i<jzdszt.length;i++)
           {
             if(jzdszt1.equals(jzdszt[i]))
               out.println("<option selected>"+jzdszt[i]+"</option>");
             else
               out.println("<option >"+jzdszt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">法律法规</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="flfgadd" id="flfgadd">
          <%String flfgadd1=rs.getString("flfgadd").trim();
          String[] flfgadd=new String[]{"有","无"};
          for(int i=0;i<flfgadd.length;i++)
           {
             if(flfgadd1.equals(flfgadd[i]))
               out.println("<option selected>"+flfgadd[i]+"</option>");
             else
               out.println("<option >"+flfgadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="flfgmod" id="flfgmod">
          <%String flfgmod1=rs.getString("flfgmod").trim();
          String[] flfgmod=new String[]{"有","无"};
          for(int i=0;i<flfgmod.length;i++)
           {
             if(flfgmod1.equals(flfgmod[i]))
               out.println("<option selected>"+flfgmod[i]+"</option>");
             else
               out.println("<option >"+flfgmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="flfgdel" id="flfgdel">
          <%String flfgdel1=rs.getString("flfgdel").trim();
          String[] flfgdel=new String[]{"有","无"};
          for(int i=0;i<flfgdel.length;i++)
           {
             if(flfgdel1.equals(flfgdel[i]))
               out.println("<option selected>"+flfgdel[i]+"</option>");
             else
               out.println("<option >"+flfgdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="flfgview" id="flfgview">
          <%String flfgview1=rs.getString("flfgview").trim();
          String[] flfgview=new String[]{"有","无"};
          for(int i=0;i<flfgview.length;i++)
           {
             if(flfgview1.equals(flfgview[i]))
               out.println("<option selected>"+flfgview[i]+"</option>");
             else
               out.println("<option >"+flfgview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="flfgzt" id="flfgzt">
          <%String flfgzt1=rs.getString("flfgzt").trim();
          String[] flfgzt=new String[]{"有","无"};
          for(int i=0;i<flfgzt.length;i++)
           {
             if(flfgzt1.equals(flfgzt[i]))
               out.println("<option selected>"+flfgzt[i]+"</option>");
             else
               out.println("<option >"+flfgzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">资金管理</font></strong></td>
      <td> <font size="2"> 
        <select name="zjadd" id="zjadd">
          <%String zjadd1=rs.getString("zjadd").trim();
          String[] zjadd=new String[]{"有","无"};
          for(int i=0;i<zjadd.length;i++)
           {
             if(zjadd1.equals(zjadd[i]))
               out.println("<option selected>"+zjadd[i]+"</option>");
             else
               out.println("<option >"+zjadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="zjmod" id="zjmod">
          <%String zjmod1=rs.getString("zjmod").trim();
          String[] zjmod=new String[]{"有","无"};
          for(int i=0;i<zjmod.length;i++)
           {
             if(zjmod1.equals(zjmod[i]))
               out.println("<option selected>"+zjmod[i]+"</option>");
             else
               out.println("<option >"+zjmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="zjdel" id="zjdel">
          <%String zjdel1=rs.getString("zjdel").trim();
          String[] zjdel=new String[]{"有","无"};
          for(int i=0;i<zjdel.length;i++)
           {
             if(zjdel1.equals(zjdel[i]))
               out.println("<option selected>"+zjdel[i]+"</option>");
             else
               out.println("<option >"+zjdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="zjview" id="zjview">
          <%String zjview1=rs.getString("zjview").trim();
          String[] zjview=new String[]{"有","无"};
          for(int i=0;i<zjview.length;i++)
           {
             if(zjview1.equals(zjview[i]))
               out.println("<option selected>"+zjview[i]+"</option>");
             else
               out.println("<option >"+zjview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="zjzt" id="zjzt">
          <%String zjzt1=rs.getString("zjzt").trim();
          String[] zjzt=new String[]{"有","无"};
          for(int i=0;i<zjzt.length;i++)
           {
             if(zjzt1.equals(zjzt[i]))
               out.println("<option selected>"+zjzt[i]+"</option>");
             else
               out.println("<option >"+zjzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">付款汇总</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="fkhzadd" id="fkhzadd">
          <%String fkhzadd1=rs.getString("fkhzadd").trim();
          String[] fkhzadd=new String[]{"有","无"};
          for(int i=0;i<fkhzadd.length;i++)
           {
             if(fkhzadd1.equals(fkhzadd[i]))
               out.println("<option selected>"+fkhzadd[i]+"</option>");
             else
               out.println("<option >"+fkhzadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="fkhzmod" id="fkhzmod">
          <%String fkhzmod1=rs.getString("fkhzmod").trim();
          String[] fkhzmod=new String[]{"有","无"};
          for(int i=0;i<fkhzmod.length;i++)
           {
             if(fkhzmod1.equals(fkhzmod[i]))
               out.println("<option selected>"+fkhzmod[i]+"</option>");
             else
               out.println("<option >"+fkhzmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="fkhzdel" id="fkhzdel">
          <%String fkhzdel1=rs.getString("fkhzdel").trim();
          String[] fkhzdel=new String[]{"有","无"};
          for(int i=0;i<fkhzdel.length;i++)
           {
             if(fkhzdel1.equals(fkhzdel[i]))
               out.println("<option selected>"+fkhzdel[i]+"</option>");
             else
               out.println("<option >"+fkhzdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="fkhzview" id="fkhzview">
          <%String fkhzview1=rs.getString("fkhzview").trim();
          String[] fkhzview=new String[]{"有","无"};
          for(int i=0;i<fkhzview.length;i++)
           {
             if(fkhzview1.equals(fkhzview[i]))
               out.println("<option selected>"+fkhzview[i]+"</option>");
             else
               out.println("<option >"+fkhzview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="fkhzzt" id="fkhzzt">
          <%String fkhzzt1=rs.getString("fkhzzt").trim();
          String[] fkhzzt=new String[]{"有","无"};
          for(int i=0;i<fkhzzt.length;i++)
           {
             if(fkhzzt1.equals(fkhzzt[i]))
               out.println("<option selected>"+fkhzzt[i]+"</option>");
             else
               out.println("<option >"+fkhzzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">收款汇总</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="skhzadd" id="skhzadd">
          <%String skhzadd1=rs.getString("skhzadd").trim();
          String[] skhzadd=new String[]{"有","无"};
          for(int i=0;i<skhzadd.length;i++)
           {
             if(skhzadd1.equals(skhzadd[i]))
               out.println("<option selected>"+skhzadd[i]+"</option>");
             else
               out.println("<option >"+skhzadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="skhzmod" id="skhzmod">
          <%String skhzmod1=rs.getString("skhzmod").trim();
          String[] skhzmod=new String[]{"有","无"};
          for(int i=0;i<skhzmod.length;i++)
           {
             if(skhzmod1.equals(skhzmod[i]))
               out.println("<option selected>"+skhzmod[i]+"</option>");
             else
               out.println("<option >"+skhzmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="skhzdel" id="skhzdel">
          <%String skhzdel1=rs.getString("skhzdel").trim();
          String[] skhzdel=new String[]{"有","无"};
          for(int i=0;i<skhzdel.length;i++)
           {
             if(skhzdel1.equals(skhzdel[i]))
               out.println("<option selected>"+skhzdel[i]+"</option>");
             else
               out.println("<option >"+skhzdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="skhzview" id="skhzview">
          <%String skhzview1=rs.getString("skhzview").trim();
          String[] skhzview=new String[]{"有","无"};
          for(int i=0;i<skhzview.length;i++)
           {
             if(skhzview1.equals(skhzview[i]))
               out.println("<option selected>"+skhzview[i]+"</option>");
             else
               out.println("<option >"+skhzview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="skhzzt" id="skhzzt">
          <%String skhzzt1=rs.getString("skhzzt").trim();
          String[] skhzzt=new String[]{"有","无"};
          for(int i=0;i<skhzzt.length;i++)
           {
             if(skhzzt1.equals(skhzzt[i]))
               out.println("<option selected>"+skhzzt[i]+"</option>");
             else
               out.println("<option >"+skhzzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">付款</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="fkadd" id="fkadd">
          <%String fkadd1=rs.getString("fkadd").trim();
          String[] fkadd=new String[]{"有","无"};
          for(int i=0;i<fkadd.length;i++)
           {
             if(fkadd1.equals(fkadd[i]))
               out.println("<option selected>"+fkadd[i]+"</option>");
             else
               out.println("<option >"+fkadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="fkmod" id="fkmod">
          <%String fkmod1=rs.getString("fkmod").trim();
          String[] fkmod=new String[]{"有","无"};
          for(int i=0;i<fkmod.length;i++)
           {
             if(fkmod1.equals(fkmod[i]))
               out.println("<option selected>"+fkmod[i]+"</option>");
             else
               out.println("<option >"+fkmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="fkdel" id="fkdel">
          <%String fkdel1=rs.getString("fkdel").trim();
          String[] fkdel=new String[]{"有","无"};
          for(int i=0;i<fkdel.length;i++)
           {
             if(fkdel1.equals(fkdel[i]))
               out.println("<option selected>"+fkdel[i]+"</option>");
             else
               out.println("<option >"+fkdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="fkview" id="fkview">
          <%String fkview1=rs.getString("fkview").trim();
          String[] fkview=new String[]{"有","无"};
          for(int i=0;i<fkview.length;i++)
           {
             if(fkview1.equals(fkview[i]))
               out.println("<option selected>"+fkview[i]+"</option>");
             else
               out.println("<option >"+fkview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="fkzt" id="fkzt">
          <%String fkzt1=rs.getString("fkzt").trim();
          String[] fkzt=new String[]{"有","无"};
          for(int i=0;i<fkzt.length;i++)
           {
             if(fkzt1.equals(fkzt[i]))
               out.println("<option selected>"+fkzt[i]+"</option>");
             else
               out.println("<option >"+fkzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">收款</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="skadd" id="skadd">
          <%String skadd1=rs.getString("skadd").trim();
          String[] skadd=new String[]{"有","无"};
          for(int i=0;i<skadd.length;i++)
           {
             if(skadd1.equals(skadd[i]))
               out.println("<option selected>"+skadd[i]+"</option>");
             else
               out.println("<option >"+skadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="skmod" id="skmod">
          <%String skmod1=rs.getString("skmod").trim();
          String[] skmod=new String[]{"有","无"};
          for(int i=0;i<skmod.length;i++)
           {
             if(skmod1.equals(skmod[i]))
               out.println("<option selected>"+skmod[i]+"</option>");
             else
               out.println("<option >"+skmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="skdel" id="skdel">
          <%String skdel1=rs.getString("skdel").trim();
          String[] skdel=new String[]{"有","无"};
          for(int i=0;i<skdel.length;i++)
           {
             if(skdel1.equals(skdel[i]))
               out.println("<option selected>"+skdel[i]+"</option>");
             else
               out.println("<option >"+skdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="skview" id="skview">
          <%String skview1=rs.getString("skview").trim();
          String[] skview=new String[]{"有","无"};
          for(int i=0;i<skview.length;i++)
           {
             if(skview1.equals(skview[i]))
               out.println("<option selected>"+skview[i]+"</option>");
             else
               out.println("<option >"+skview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="skzt" id="skzt">
          <%String skzt1=rs.getString("skzt").trim();
          String[] skzt=new String[]{"有","无"};
          for(int i=0;i<skzt.length;i++)
           {
             if(skzt1.equals(skzt[i]))
               out.println("<option selected>"+skzt[i]+"</option>");
             else
               out.println("<option >"+skzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">欠款</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="qkadd" id="qkadd">
          <%String qkadd1=rs.getString("qkadd").trim();
          String[] qkadd=new String[]{"有","无"};
          for(int i=0;i<qkadd.length;i++)
           {
             if(qkadd1.equals(qkadd[i]))
               out.println("<option selected>"+qkadd[i]+"</option>");
             else
               out.println("<option >"+qkadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="qkmod" id="qkmod">
          <%String qkmod1=rs.getString("qkmod").trim();
          String[] qkmod=new String[]{"有","无"};
          for(int i=0;i<qkmod.length;i++)
           {
             if(qkmod1.equals(qkmod[i]))
               out.println("<option selected>"+qkmod[i]+"</option>");
             else
               out.println("<option >"+qkmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="qkdel" id="qkdel">
          <%String qkdel1=rs.getString("qkdel").trim();
          String[] qkdel=new String[]{"有","无"};
          for(int i=0;i<qkdel.length;i++)
           {
             if(qkdel1.equals(qkdel[i]))
               out.println("<option selected>"+qkdel[i]+"</option>");
             else
               out.println("<option >"+qkdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="qkview" id="qkview">
          <%String qkview1=rs.getString("qkview").trim();
          String[] qkview=new String[]{"有","无"};
          for(int i=0;i<qkview.length;i++)
           {
             if(qkview1.equals(qkview[i]))
               out.println("<option selected>"+qkview[i]+"</option>");
             else
               out.println("<option >"+qkview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="qkzt" id="qkzt">
          <%String qkzt1=rs.getString("qkzt").trim();
          String[] qkzt=new String[]{"有","无"};
          for(int i=0;i<qkzt.length;i++)
           {
             if(qkzt1.equals(qkzt[i]))
               out.println("<option selected>"+qkzt[i]+"</option>");
             else
               out.println("<option >"+qkzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">入库</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="intadd" id="intadd">
          <%String intadd1=rs.getString("intadd").trim();
          String[] intadd=new String[]{"有","无"};
          for(int i=0;i<intadd.length;i++)
           {
             if(intadd1.equals(intadd[i]))
               out.println("<option selected>"+intadd[i]+"</option>");
             else
               out.println("<option >"+intadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="intmod" id="intmod">
          <%String intmod1=rs.getString("intmod").trim();
          String[] intmod=new String[]{"有","无"};
          for(int i=0;i<intmod.length;i++)
           {
             if(intmod1.equals(intmod[i]))
               out.println("<option selected>"+intmod[i]+"</option>");
             else
               out.println("<option >"+intmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="intdel" id="intdel">
          <%String intdel1=rs.getString("intdel").trim();
          String[] intdel=new String[]{"有","无"};
          for(int i=0;i<intdel.length;i++)
           {
             if(intdel1.equals(intdel[i]))
               out.println("<option selected>"+intdel[i]+"</option>");
             else
               out.println("<option >"+intdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="intview" id="intview">
          <%String intview1=rs.getString("intview").trim();
          String[] intview=new String[]{"有","无"};
          for(int i=0;i<intview.length;i++)
           {
             if(intview1.equals(intview[i]))
               out.println("<option selected>"+intview[i]+"</option>");
             else
               out.println("<option >"+intview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="intzt" id="intzt">
          <%String intzt1=rs.getString("intzt").trim();
          String[] intzt=new String[]{"有","无"};
          for(int i=0;i<intzt.length;i++)
           {
             if(intzt1.equals(intzt[i]))
               out.println("<option selected>"+intzt[i]+"</option>");
             else
               out.println("<option >"+intzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">出库</font></strong></td>
      <td width="16%"> <font size="2"> 
        <select name="outadd" id="outadd">
          <%String outadd1=rs.getString("outadd").trim();
          String[] outadd=new String[]{"有","无"};
          for(int i=0;i<outadd.length;i++)
           {
             if(outadd1.equals(outadd[i]))
               out.println("<option selected>"+outadd[i]+"</option>");
             else
               out.println("<option >"+outadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="17%"> <font size="2"> 
        <select name="outmod" id="outmod">
          <%String outmod1=rs.getString("outmod").trim();
          String[] outmod=new String[]{"有","无"};
          for(int i=0;i<outmod.length;i++)
           {
             if(outmod1.equals(outmod[i]))
               out.println("<option selected>"+outmod[i]+"</option>");
             else
               out.println("<option >"+outmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="14%"> <font size="2"> 
        <select name="outdel" id="outdel">
          <%String outdel1=rs.getString("outdel").trim();
          String[] outdel=new String[]{"有","无"};
          for(int i=0;i<outdel.length;i++)
           {
             if(outdel1.equals(outdel[i]))
               out.println("<option selected>"+outdel[i]+"</option>");
             else
               out.println("<option >"+outdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="15%"> <font size="2"> 
        <select name="outview" id="outview">
          <%String outview1=rs.getString("outview").trim();
          String[] outview=new String[]{"有","无"};
          for(int i=0;i<outview.length;i++)
           {
             if(outview.equals(outview[i]))
               out.println("<option selected>"+outview[i]+"</option>");
             else
               out.println("<option >"+outview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td width="21%"> <font size="2"> 
        <select name="outzt" id="outzt">
          <%String outzt1=rs.getString("outzt").trim();
          String[] outzt=new String[]{"有","无"};
          for(int i=0;i<outzt.length;i++)
           {
             if(outzt.equals(outzt[i]))
               out.println("<option selected>"+outzt[i]+"</option>");
             else
               out.println("<option >"+outzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">系统管理</font></strong></td>
      <td> <font size="2"> 
        <select name="sysadd" id="sysadd">
          <%String sysadd1=rs.getString("sysadd").trim();
          String[] sysadd=new String[]{"有","无"};
          for(int i=0;i<sysadd.length;i++)
           {
             if(sysadd1.equals(sysadd[i]))
               out.println("<option selected>"+sysadd[i]+"</option>");
             else
               out.println("<option >"+sysadd[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="sysmod" id="sysmod">
          <%String sysmod1=rs.getString("sysmod").trim();
          String[] sysmod=new String[]{"有","无"};
          for(int i=0;i<sysmod.length;i++)
           {
             if(sysmod1.equals(sysmod[i]))
               out.println("<option selected>"+sysmod[i]+"</option>");
             else
               out.println("<option >"+sysmod[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="sysdel" id="sysdel">
          <%String sysdel1=rs.getString("sysdel").trim();
          String[] sysdel=new String[]{"有","无"};
          for(int i=0;i<sysdel.length;i++)
           {
             if(sysdel1.equals(sysdel[i]))
               out.println("<option selected>"+sysdel[i]+"</option>");
             else
               out.println("<option >"+sysdel[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="sysview" id="sysview">
          <%String sysview1=rs.getString("sysview").trim();
          String[] sysview=new String[]{"有","无"};
          for(int i=0;i<sysview.length;i++)
           {
             if(sysview1.equals(sysview[i]))
               out.println("<option selected>"+sysview[i]+"</option>");
             else
               out.println("<option >"+sysview[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
      <td> <font size="2"> 
        <select name="syszt" id="syszt">
          <%String syszt1=rs.getString("syszt").trim();
          String[] syszt=new String[]{"有","无"};
          for(int i=0;i<syszt.length;i++)
           {
             if(syszt1.equals(syszt[i]))
               out.println("<option selected>"+syszt[i]+"</option>");
             else
               out.println("<option >"+syszt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">决策分析</font></strong></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><font size="2"> 
        <select name="jcfx" id="jcfx">
          <%String jcfx1=rs.getString("jcfx").trim();
          String[] jcfx=new String[]{"有","无"};
          for(int i=0;i<jcfx.length;i++)
           {
             if(jcfx1.equals(jcfx[i]))
               out.println("<option selected>"+jcfx[i]+"</option>");
             else
               out.println("<option >"+jcfx[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><strong><font color="#000080" size="2">客户资源转移</font></strong></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><font size="2">&nbsp; </font>&nbsp;</td>
      <td><font size="2"> 
        <select name="custzyzt" id="custzyzt">
          <%String custzyzt1=rs.getString("custzyzt").trim();
          String[] custzyzt=new String[]{"有","无"};
          for(int i=0;i<custzyzt.length;i++)
           {
             if(custzyzt1.equals(custzyzt[i]))
               out.println("<option selected>"+custzyzt[i]+"</option>");
             else
               out.println("<option >"+custzyzt[i]+"</option>");
           }
        %>
        </select>
        </font>&nbsp;</td>
    </tr>
    <tr> 
      <td><b><font size="2" color="#000000">销售提成自定义</font></b></td>
      <td colspan="5"> <input name="salestc" type="text" id="salestc" value="<%=rs.getInt("salestc")%>" size="3">
        %</td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
</body>
<%}}%>
</html>
