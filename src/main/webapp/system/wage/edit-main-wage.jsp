<%@ page contentType="text/html;charset=gb2312"%>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
<script language=javascript>
window.location="../../refuse.jsp"
</script>
<% }     
%>

<%@ page import="java.sql.*,java.util.*"%>
<jsp:useBean id="infocrmdb" scope="page" class="infocrmdb.infocrmdb" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>芯片商城有限公司</title>
<%
String id2=request.getParameter("id");
String sql="select   id,menber_year,menber_month,menber_name,menber_wage,menber_bt,menber_fl,menber_cd,menber_cs,menber_sb,menber_ht,menber_kgz,menber_jbsj,menber_yjgz,menber_zmjbsj,menber_fdsj,menber_csa,menber_je,menber_bjsj,menber_ykgz,menber_sjsj, menber_sjgz,menber_njsj,menber_njgz,menber_ccsj,menber_yjgzw,menber_zmsj,menber_zmgz,menber_total from wage_menber where id='"+id2+"'";
ResultSet rs=infocrmdb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
	  }%>
	<script LANGUAGE="JavaScript">
function click() {
if (event.button==2) {alert('芯片商城有限公司')}}
document.onmousedown=click
</script>  
</head>
<body bgcolor="#ffffff">
<form method="POST" action="doedit_wage.jsp"  name="form1" target="rtop">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" height="293">
    <tr> 
      <td valign="top" height="13" > 
        <table border="0" width="100%" cellspacing="0" cellpadding="0">
          <TR BGCOLOR="#d3d8eb"> 
            <td width="13%" valign="top" height="8"><a href="#" style="font-size: 12px"></a><a href="#" style="font-size: 12px"> 
              </a><img src="../../images/gzgl-m.gif" width="63" height="20"></td>
            <td width="87%" height="8"> 
              <p align="right"> <font size="2" color="#000000"> </font><font size="2"> 
                </font><font size="2"> 
         <input type="hidden" name="id" size="20" style="border: 1 inset #C3D9FF" value="<%=id2%>">
                </font><font size="2" color="#000000"> </font> 
        <input type="submit" name="Submit" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
        <input type="reset" name="Submit5" value="取消" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
                <font size="2" color="#000000"> </font> &nbsp; 
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr> 
      <td valign="top" height="272" > 
        <table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">
          <tr> 
            <td width="9%"><font face="宋体" size="2">&nbsp;</font>&nbsp;</td>
            <td width="18%"><font color="#000080" size="2" face="黑体">工资年份</font>&nbsp;</td>
            <td width="29%"><font size="2" face="宋体"> 
              <select name="menber_year">
                <%String menber_year1=rs.getString(2).trim();
          String[] menber_year=new String[]{"2002","2003","2004","2005","2006","2007","2008","2009"};
          for(int i=0;i<menber_year.length;i++)
           {
             if(menber_year1.equals(menber_year[i]))
               out.println("<option selected>"+menber_year[i]+"</option>");
             else
               out.println("<option >"+menber_year[i]+"</option>");
           }
        %>
              </select>
              </font>&nbsp;</td>
            <td width="18%"><font color="#000080" size="2" face="黑体">工资月份</font>&nbsp;</td>
            <td width="31%"><font color="#0000FF" size="2" face="黑体"> 
              <select name="menber_month">
                <%String menber_month1=rs.getString(3).trim();
          String[] menber_month=new String[]{"1","2","3","4","5","6","7","8","9","10","11","12"};
          for(int i=0;i<menber_month.length;i++)
           {
             if(menber_month1.equals(menber_month[i]))
               out.println("<option selected>"+menber_month[i]+"</option>");
             else
               out.println("<option >"+menber_month[i]+"</option>");
           }
        %>
              </select>
              </font>&nbsp;</td>
          </tr>
          <tr> 
            <td width="9%"><font face="宋体" size="2">&nbsp;</font>&nbsp;</td>
            <td width="18%"><font color="#000080" size="2" face="黑体">员工名称</font>&nbsp;</td>
            <td width="29%"><font size="2" face="宋体"> 
              <input type="text" name="menber_name" size="20" style="border: 1 inset #C3D9FF" value="<%=rs.getString(4)%>" maxlength="20">
              </font>&nbsp;</td>
            <td width="18%"><font color="#000080" size="2" face="黑体">基本工资</font>&nbsp;</td>
            <td width="31%"><font size="2" face="宋体"> 
              <input type="text" name="menber_wage" size="15" style="border: 1 inset #C3D9FF" value="<%=rs.getString(5)%>" maxlength="20">
              </font><font color="#000000" size="2" face="宋体">RMB</font><font size="2" face="宋体">&nbsp; 
              </font>&nbsp;</td>
          </tr>
          <tr> 
            <td width="9%"><font face="宋体" size="2">&nbsp;</font>&nbsp;</td>
            <td width="18%"><font color="#000080" size="2" face="黑体">住房、交通补贴</font>&nbsp;</td>
            <td width="29%"><font size="2" face="宋体"> 
              <input type="text" name="menber_bt" size="15" style="border: 1 inset #C3D9FF" value="<%=rs.getDouble(6)%>" maxlength="20">
              </font><font color="#000000" size="2" face="宋体">RMB</font>&nbsp;</td>
            <td width="18%"><font color="#000080" size="2" face="黑体">职位奖金</font>&nbsp;</td>
            <td width="31%"><font size="2" face="宋体"> 
              <input type="text" name="menber_fl" size="15" style="border: 1 inset #C3D9FF" value="<%=rs.getDouble(7)%>" maxlength="20">
              </font><font color="#000000" size="2" face="宋体">RMB</font>&nbsp;</td>
          </tr>
          <tr> 
            <td width="9%" height="23"><font face="宋体" size="2">&nbsp;</font>&nbsp;</td>
            <td width="18%" height="23"><font color="#000080" size="2" face="黑体">全勤奖</font>&nbsp;</td>
            <td height="23" colspan="3"><font size="2" face="宋体"> 
              <input type="text" name="menber_cd" size="15" style="border: 1 inset #C3D9FF" value="<%=rs.getString(8)%>" maxlength="20">
              </font><font color="#000000" size="2" face="宋体">RMB</font><font size="2" face="宋体">&nbsp; 
              </font>&nbsp;</td>
          </tr>
          <tr> 
            <td height="23"><font face="宋体" size="2">&nbsp;</font>&nbsp;</td>
            <td height="23"><font color="#000080" size="2" face="黑体">扣除社保费</font>&nbsp;</td>
            <td height="23"><font size="2" face="宋体"> 
              <input name="menber_sb" type="text" id="menber_sb" style="border: 1 inset #C3D9FF" value="<%=rs.getString(10)%>" size="15" maxlength="20">
              </font><font color="#000000" size="2" face="宋体">RMB</font><font size="2" face="宋体">&nbsp; 
              </font>&nbsp;</td>
            <td height="23"><font color="#000080" size="2" face="黑体">履行合同奖金</font>&nbsp;</td>
            <td height="23"><font size="2" face="宋体"> 
              <input name="menber_ht" type="text" id="menber_ht" style="border: 1 inset #C3D9FF" value="<%=rs.getString("menber_ht")%>" size="15" maxlength="20">
              </font><font color="#000000" size="2" face="宋体">RMB</font><font size="2" face="宋体">&nbsp; 
              </font>&nbsp;</td>
          </tr>
          <tr> 
            <td width="9%"><font color="#000080" size="2" face="黑体"><b>加班：</b></font>&nbsp;</td>
            <td width="18%"><font color="#000080" size="2" face="黑体">加班奖</font>&nbsp;</td>
            <td width="29%"><font color="#000000" size="2" face="宋体"> 
              <input type="text" name="menber_jbsj" size="15" maxlength="20" value="<%=rs.getString(13)%>">
              RMB </font>&nbsp;</td>
            <td width="18%"><font color="#000080" size="2" face="黑体">午餐补贴奖</font>&nbsp;</td>
            <td width="31%"><font color="#000000" size="2" face="宋体"> 
              <input type="text" name="menber_zmjbsj" size="15" maxlength="20" value="<%=rs.getString(15)%>">
              RMB </font>&nbsp;</td>
          </tr>
          <tr> 
            <td width="9%"><font color="#000080" size="2" face="黑体"><b>事假：</b></font>&nbsp;</td>
            <td width="18%"><font color="#000080" size="2" face="黑体">事假应扣金额</font><font color="#000000" size="2" face="宋体">&nbsp; 
              </font>&nbsp;</td>
            <td width="29%"><font color="#000000" size="2" face="宋体"> 
              <input type="text" name="menber_sjsj" size="15" maxlength="20" value="<%=rs.getString(21)%>">
              RMB</font>&nbsp;</td>
            <td width="18%"><font face="宋体" size="2">&nbsp;</font>&nbsp;</td>
            <td width="31%"><font face="宋体" size="2">&nbsp;</font>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
