<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,java.util.*,java.text.*"%>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
    <script language=javascript>
    window.location="../../../refuse.jsp"
    </script>
<% } else {    
java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String currentDate=simple.format(new java.util.Date());
%>
<html>
<head>
<title>批量自动增加产品信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" topmargin="0">
<form name="form1" method="post" action="dozy.jsp"><br>  <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
    <tr> 
      <td><font color="#000000" size="2"><font color="#000000">将符合下</font></font><font size="2">列条件的产品信息</font>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="2"><font color="#000000">产品编号</font> 
        <input type="text" name="pnumber"  style="background-color: #ffffff; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" size="10">
        <font color="#000000">产品型号 
        <input type="text" name="pro_model"  style="background-color: #ffffff; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" size="10">
        产品批号
</font> <font color="#000000"> 
        <input type="text" name="pro_name"  style="background-color: #ffffff; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" size="10">
        </font></font>&nbsp;</td>
    </tr>
    <tr> 
      <td> <font size="2"> 
        <select name="pro_addr" id="select2" >
          <%
			try
            {
            ResultSet hlrs=einfodb.executeQuery("select * from profl");
            while(hlrs.next())
           {
            String currname=hlrs.getString(4);
            out.println("<option  value="+currname+">"+currname+"</option>");
             }
             hlrs.close();
             }catch(Exception e){}
             %>
        </select>
        <select name="pro_type" id="select2" >
          <option value="">产品类别</option>
          <%
			try
            {
            ResultSet hlrs=einfodb.executeQuery("select * from secprofl");
            while(hlrs.next())
           {
            String currname=hlrs.getString(3);
            out.println("<option  value="+currname+">"+currname+"</option>");
             }
             hlrs.close();
             }catch(Exception e){}
             %>
        </select>
        <select name="pro_sup_number" id="select2" >
          <option value="">品牌</option>
          <%
			try
            {
            ResultSet hlrs=einfodb.executeQuery("select * from profll");
            while(hlrs.next())
           {
            String currname=hlrs.getString(4);
            out.println("<option  value="+currname+">"+currname+"</option>");
             }
             hlrs.close();
             }catch(Exception e){}
             %>
        </select>
        <font color="#000000"><font color="#000000"> 
        <select name="sale_states" id="sale_states">
          <option value="">销售状况</option>
          <option value="热销产品">热销产品</option>
          <option value="常销产品">常销产品</option>
          <option value="促销产品">促销产品</option>
        </select>
        </font></font></font>&nbsp;</td>
    </tr>
    <tr>
      <td><font size="2">增加添加到仓库: 
        <select name="pro_addr2" id="select2" >
          <%
			try
            {
            ResultSet hlrs=einfodb.executeQuery("select * from profl");
            while(hlrs.next())
           {
            String currname=hlrs.getString(4);
            out.println("<option  value="+currname+">"+currname+"</option>");
             }
             hlrs.close();
             }catch(Exception e){}
             %>
        </select>
        仓库管理员: 
        <select name="pro_man" size="1" id="w_spman">
          <%
  try
  {
    ResultSet rs=einfodb.executeQuery("select name from username   order by hometel");
    while(rs.next())
    {
      String name=rs.getString("name");
      out.println("<option value='"+name+"'>"+name+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%>
        </select>
        <input type="submit" name="Submit" value="确定"  style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
        <font size="2"><font color="#000000" size="2"> </font></font></font>&nbsp;</td>
    </tr>
    <tr> 
      <td><font size="2"><font size="2">(备注:从一个仓库的产品信息自动形成另外一个仓库的产品信息,以产品型号为主键,即如果该仓库已经有该型号,则系统不增加该型号在仓库中,否则系统自动增加在该仓库中) 
        </font> </font>&nbsp;</td>
    </tr>
  </table>
  <font size="2"><br>
  </font>
</form>
</body>
</html>
<%}%>