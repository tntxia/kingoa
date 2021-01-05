<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="infocrmdb" scope="page" class="infocrmdb.infocrmdb" />
<%@ page import="java.sql.*,java.util.*"%>
<% String getLoginmessage = (String) session.getValue("loginSign");
   if(getLoginmessage!="OK"){
%>
<script language=javascript>
window.location="../../refuse.jsp"
</script>
<% }     
java.text.SimpleDateFormat simple=new java.text.SimpleDateFormat("yyyy-MM-dd");
String currentDate=simple.format(new java.util.Date());
String name1 = (String) session.getValue("username");
%>

<html>
<head>
<title>工资模版</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function isValid(){
   if(form1.wage_m_dates.value==""){
        alert("请输入月工作天数!");
        form1.wage_m_dates.focus();
	return false;
    }
   else if(form1.wage_date_price.value==""){
        alert("请输入每天工资!");
        form1.wage_date_price.focus();
	return false;
    }

    else {
        return true;
    }
}
</script>
<script LANGUAGE="JavaScript">
function click() {
if (event.button==2) {alert('芯片商城有限公司')}}
document.onmousedown=click
</script>

</head>
<%
String id2=request.getParameter("id");
String sql="select  * from wage_mb where id='"+id2+"'";
ResultSet rs=infocrmdb.executeQuery(sql);
if(!rs.next())
  {
    out.println("not have record");
    return;
  }
 String wage_name=rs.getString("wage_name");
%>
<body bgcolor="#ffffff" text="#000000" bgcolor="#FFFFFF" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="do_ewage.jsp" onSubmit="return isValid();">
  <table width="100%" border="0" align="center" cellspacing="0" cellpadding="3">
    <tr> 
      <td>
        <div align="center"><font size="5"><font color="#000000">工 资 模 版</font></font> 
          <font color="#000000" size="2">
          <input name="id" type="hidden" size="10" maxlength="20" value="<%=id2%>">
          </font> </div>
      </td>
    </tr>
    <tr> 
      <td height="29">
        <hr width="400" size="5">
      </td>
    </tr>
  </table>
  <table width="95%" border="1" align="center" cellpadding="3" cellspacing="0" bgcolor="#ffffff">
    <tr> 
      <td width="21%"><b><font size="2" color="#000080">员工姓名</font></b></td>
      <td width="27%"> 
        <div align="left"><font size="2"> 
          <select size="1" name="wage_name">
       <option value='<%=wage_name%>'><%=wage_name%></option>
            <%
  try
  {
    ResultSet rs1=infocrmdb.executeQuery("select name from menber");
    while(rs1.next())
    {
      String name=rs1.getString("name");
      out.println("<option value='"+name+"'>"+name+"</option>");
    }
    rs1.close();
  }catch(Exception e){}
%>
          </select>
          </font></div>
      </td>
      <td width="18%"><b><font size="2" color="#000080">登记日期</font></b></td>
      <td width="18%"><%=rs.getDate("wage_date")%><b><font color="#000000" size="2"> 
        <input name="wage_date" type="hidden" size="10" maxlength="20" value="<%=currentDate%>">
        </font></b></td>
      <td width="18%"><b><font size="2" color="#000080">登记人</font></b></td>
      <td width="26%"><%=rs.getString("wage_rgman")%><b><font color="#000000" size="2"> 
        <input name="wage_rgman" type="hidden" size="10" maxlength="20" value="<%=name1%>">
        </font></b></td>
    </tr>
    <tr> 
      <td width="21%"><b><font size="2" color="#000080">月工作天数</font></b></td>
      <td width="27%"><b><font color="#000000" size="2"> 
        <input name="wage_m_dates" type="text" size="10" maxlength="20" value="<%=rs.getString("wage_m_dates")%>">
        </font></b></td>
      <td width="18%"><b><font size="2" color="#000080">月基本工资</font></b></td>
      <td width="26%"><b><font color="#000000" size="2"> 
        <input name="wage_date_price" type="text" size="10" maxlength="20" value="<%=rs.getString("wage_date_price")%>">
        </font></b><b><font color="#000000" size="2">RMB</font></b></td>
      <td width="21%"><b><font size="2" color="#000080">每小时加班费</font></b></td>
      <td width="27%"><b><font color="#000000" size="2"> 
        <input name="wage_awork_price" type="text" value="<%=rs.getString("wage_awork_price")%>" size="10" maxlength="25">
        RMB*</font></b></td>
    </tr>
    <tr> 
      <td width="18%"><b><font size="2" color="#000080">住房补贴费</font></b></td>
      <td width="26%"><b><font color="#000000" size="2"> 
        <input type="text" name="wage_zf_price" size="10" maxlength="20" value="<%=rs.getString("wage_zf_price")%>">
        RMB</font></b></td>
      <td height="2"><b><font size="2" color="#000080">交通补贴费</font></b></td>
      <td height="2"><b><font color="#000000" size="2"> 
        <input type="text" name="wage_jt_price" size="10" maxlength="25" value="<%=rs.getString("wage_jt_price")%>">
        RMB </font></b></td>
      <td height="2"><b><font size="2" color="#000080">午餐补贴费</font></b></td>
      <td height="2"><b><font color="#000000" size="2"> 
        <input type="text" name="wage_wc_price" size="10" maxlength="25" value="<%=rs.getString("wage_wc_price")%>">
        RMB </font></b></td>
    </tr>
    <tr> 
      <td width="18%"><b><font size="2" color="#000080">扣除社保费</font></b></td>
      <td colspan="5"><b><font color="#000000" size="2"> 
        <input type="text" name="wage_sb_price" size="10" maxlength="20" value="<%=rs.getString("wage_sb_price")%>">
        RMB</font></b></td>
    </tr>
    <tr> 
      <td height="2" colspan="6"><b><font size="2" color="#000080">自定义项目</font></b></td>
    </tr>
    <tr> 
      <td height="2"><b><font color="#000000" size="2"> 
        <input name="wage_zdy_sub" type="text" id="menber_sb" value="<%=rs.getString("wage_zdy_sub")%>" size="10" maxlength="25">
        </font></b></td>
      <td height="2"><b><font color="#000000" size="2"> 
        <input name="wage_zdy_price" type="text" id="menber_sb" value="<%=rs.getString("wage_zdy_price")%>" size="10" maxlength="25">
        RMB </font></b></td>
      <td height="2"><b><font size="2" color="#000080">是否启用</font></b></td>
      <td height="2"> 
        <select name="wage_zdy_qy">
         <%
		  String wage_zdy_qy1=rs.getString("wage_zdy_qy").trim();
          String[] wage_zdy_qy=new String[]{"启用","停用"};
          for(int i=0;i<wage_zdy_qy.length;i++)
           {
             if(wage_zdy_qy1.equals(wage_zdy_qy[i]))
               out.println("<option selected>"+wage_zdy_qy[i]+"</option>");
             else
               out.println("<option >"+wage_zdy_qy[i]+"</option>");
           }
        %>
        </select>
      </td>
      <td height="2"><b><font size="2" color="#000080">扣除/增加</font></b></td>
      <td height="2"> 
        <div align="left"><font color="#000000" size="2"> 
          <select name="wage_zdy_zj">
         <%
		  String wage_zdy_zj1=rs.getString("wage_zdy_zj").trim();
          String[] wage_zdy_zj=new String[]{"增加","扣除"};
          for(int i=0;i<wage_zdy_zj.length;i++)
           {
             if(wage_zdy_zj1.equals(wage_zdy_zj[i]))
               out.println("<option selected>"+wage_zdy_zj[i]+"</option>");
             else
               out.println("<option >"+wage_zdy_zj[i]+"</option>");
           }
        %>
          </select>
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="2"><b><font color="#000000" size="2"> 
        <input name="wage_zdy_sub2" type="text" id="menber_sb" value="<%=rs.getString("wage_zdy_sub2")%>" size="10" maxlength="25">
        </font></b></td>
      <td height="2"><b><font color="#000000" size="2"> 
        <input name="wage_zdy_price2" type="text" id="menber_sb" value="<%=rs.getString("wage_zdy_price2")%>" size="10" maxlength="25">
        RMB </font></b></td>
      <td height="2"><b><font size="2" color="#000080">是否启用</font></b></td>
      <td height="2"> 
        <select name="wage_zdy_qy2">
         <%
		  String wage_zdy_qy21=rs.getString("wage_zdy_qy2").trim();
          String[] wage_zdy_qy2=new String[]{"启用","停用"};
          for(int i=0;i<wage_zdy_qy2.length;i++)
           {
             if(wage_zdy_qy21.equals(wage_zdy_qy2[i]))
               out.println("<option selected>"+wage_zdy_qy2[i]+"</option>");
             else
               out.println("<option >"+wage_zdy_qy2[i]+"</option>");
           }
        %>
        </select>
      </td>
      <td height="2"><b><font size="2" color="#000080">扣除/增加</font></b></td>
      <td height="2"> 
        <div align="left"><font color="#000000" size="2"> 
          <select name="wage_zdy_zj2">
         <%
		  String wage_zdy_zj21=rs.getString("wage_zdy_zj2").trim();
          String[] wage_zdy_zj2=new String[]{"增加","扣除"};
          for(int i=0;i<wage_zdy_zj2.length;i++)
           {
             if(wage_zdy_zj21.equals(wage_zdy_zj2[i]))
               out.println("<option selected>"+wage_zdy_zj2[i]+"</option>");
             else
               out.println("<option >"+wage_zdy_zj2[i]+"</option>");
           }
        %>
          </select>
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="2"><b><font color="#000000" size="2"> 
        <input name="wage_zdy_sub3" type="text" id="menber_sb" value="<%=rs.getString("wage_zdy_sub3")%>" size="10" maxlength="25">
        </font></b></td>
      <td height="2"><b><font color="#000000" size="2"> 
        <input name="wage_zdy_price3" type="text" id="menber_sb" value="<%=rs.getString("wage_zdy_price3")%>" size="10" maxlength="25">
        RMB </font></b></td>
      <td height="2"><b><font size="2" color="#000080">是否启用</font></b></td>
      <td height="2"> 
        <select name="wage_zdy_qy3">
         <%
		  String wage_zdy_qy31=rs.getString("wage_zdy_qy3").trim();
          String[] wage_zdy_qy3=new String[]{"启用","停用"};
          for(int i=0;i<wage_zdy_qy3.length;i++)
           {
             if(wage_zdy_qy31.equals(wage_zdy_qy3[i]))
               out.println("<option selected>"+wage_zdy_qy3[i]+"</option>");
             else
               out.println("<option >"+wage_zdy_qy3[i]+"</option>");
           }
        %>
        </select>
      </td>
      <td height="2"><b><font size="2" color="#000080">扣除/增加</font></b></td>
      <td height="2"> 
        <div align="left"><font color="#000000" size="2"> 
          <select name="wage_zdy_zj3">
         <%
		  String wage_zdy_zj31=rs.getString("wage_zdy_zj3").trim();
          String[] wage_zdy_zj3=new String[]{"增加","扣除"};
          for(int i=0;i<wage_zdy_zj3.length;i++)
           {
             if(wage_zdy_zj31.equals(wage_zdy_zj3[i]))
               out.println("<option selected>"+wage_zdy_zj3[i]+"</option>");
             else
               out.println("<option >"+wage_zdy_zj3[i]+"</option>");
           }
        %>
          </select>
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="2"><b><font color="#000000" size="2"> 
        <input name="wage_zdy_sub4" type="text" id="menber_sb" value="<%=rs.getString("wage_zdy_sub4")%>" size="10" maxlength="25">
        </font></b></td>
      <td height="2"><b><font color="#000000" size="2"> 
        <input name="wage_zdy_price4" type="text" id="menber_sb" value="<%=rs.getString("wage_zdy_price4")%>" size="10" maxlength="25">
        RMB </font></b></td>
      <td height="2"><b><font size="2" color="#000080">是否启用</font></b></td>
      <td height="2"> 
        <select name="wage_zdy_qy4">
         <%
		  String wage_zdy_qy41=rs.getString("wage_zdy_qy4").trim();
          String[] wage_zdy_qy4=new String[]{"启用","停用"};
          for(int i=0;i<wage_zdy_qy4.length;i++)
           {
             if(wage_zdy_qy41.equals(wage_zdy_qy4[i]))
               out.println("<option selected>"+wage_zdy_qy4[i]+"</option>");
             else
               out.println("<option >"+wage_zdy_qy4[i]+"</option>");
           }
        %>
        </select>
      </td>
      <td height="2"><b><font size="2" color="#000080">扣除/增加</font></b></td>
      <td height="2"> 
        <div align="left"><font color="#000000" size="2"> 
          <select name="wage_zdy_zj4">
         <%
		  String wage_zdy_zj41=rs.getString("wage_zdy_zj4").trim();
          String[] wage_zdy_zj4=new String[]{"增加","扣除"};
          for(int i=0;i<wage_zdy_zj4.length;i++)
           {
             if(wage_zdy_zj41.equals(wage_zdy_zj4[i]))
               out.println("<option selected>"+wage_zdy_zj4[i]+"</option>");
             else
               out.println("<option >"+wage_zdy_zj4[i]+"</option>");
           }
        %>
          </select>
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="2"><b><font color="#000000" size="2"> 
        <input name="wage_zdy_sub5" type="text" id="menber_sb" value="<%=rs.getString("wage_zdy_sub5")%>" size="10" maxlength="25">
        </font></b></td>
      <td height="2"><b><font color="#000000" size="2"> 
        <input name="wage_zdy_price5" type="text" id="menber_sb" value="<%=rs.getString("wage_zdy_price5")%>" size="10" maxlength="25">
        RMB </font></b></td>
      <td height="2"><b><font size="2" color="#000080">是否启用</font></b></td>
      <td height="2"> 
        <select name="wage_zdy_qy5">
         <%
		  String wage_zdy_qy51=rs.getString("wage_zdy_qy5").trim();
          String[] wage_zdy_qy5=new String[]{"启用","停用"};
          for(int i=0;i<wage_zdy_qy5.length;i++)
           {
             if(wage_zdy_qy51.equals(wage_zdy_qy5[i]))
               out.println("<option selected>"+wage_zdy_qy5[i]+"</option>");
             else
               out.println("<option >"+wage_zdy_qy5[i]+"</option>");
           }
        %>
        </select>
      </td>
      <td height="2"><b><font size="2" color="#000080">扣除/增加</font></b></td>
      <td height="2"> 
        <div align="left"><font color="#000000" size="2"> 
          <select name="wage_zdy_zj5">
         <%
		  String wage_zdy_zj51=rs.getString("wage_zdy_zj5").trim();
          String[] wage_zdy_zj5=new String[]{"增加","扣除"};
          for(int i=0;i<wage_zdy_zj5.length;i++)
           {
             if(wage_zdy_zj51.equals(wage_zdy_zj5[i]))
               out.println("<option selected>"+wage_zdy_zj5[i]+"</option>");
             else
               out.println("<option >"+wage_zdy_zj5[i]+"</option>");
           }
        %>
          </select>
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="2"><b><font size="2" color="#000080">备注</font></b></td>
      <td height="2" colspan="5">
        <textarea name="remark" cols="60"><%=rs.getString("remark")%></textarea>
      </td>
    </tr>
  </table>
  <p align="center"><font color="#0000FF"> 
    <input type="submit" name="Submit2" value="确定" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF">
    </font><font color="#000000" size="2"> 
    <input type="button" value="删除" name="B2233" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.open('del-wage.jsp?id=<%=id2%>','_self', 'height=446, width=1002, top=200, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no')">
    <input type="button" value="关闭" name="B22342" style="background-color: #E1E1E1; font-family: 宋体; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()">
    <br>
    (员工姓名必须在人事管理中设置)</font></p>
  </form>
</body>
</html>
