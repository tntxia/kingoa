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
<title>����ģ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
function isValid(){
   if(form1.wage_m_dates.value==""){
        alert("�������¹�������!");
        form1.wage_m_dates.focus();
	return false;
    }
   else if(form1.wage_date_price.value==""){
        alert("������ÿ�칤��!");
        form1.wage_date_price.focus();
	return false;
    }
    else {
        return true;
    }
}
</script>


</head>

<body bgcolor="#ffffff" text="#000000" bgcolor="#FFFFFF" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="do_wage.jsp" onSubmit="return isValid();">
  <br />
  <table width="100%" border="0" cellpadding="3" height="50">
    <tr>
      <td><div align="center"><font size="5"><font color="#213e9b"><strong>�� �� ģ ��</strong></font></font></div>
          <hr width="100%" size="1" noshade color="#213e9b">
      </td>
    </tr>
  </table>
  
<table height=8 width="100%" 
bordercolor="#CCBE5A" cellspacing="0" 
                        bordercolordark="#ffffff" cellpadding="3" 
                        align="center" bgcolor="#ffffff" bordercolorlight="#7f9db9" 
                        border="1">    <tr> 
      <td width="21%"><font size="2" color="#000080">Ա������</font></td>
      <td width="27%"> 
        <div align="left"><font size="2"> 
          <select size="1" name="wage_name">
            <%
  try
  {
    ResultSet rs=infocrmdb.executeQuery("select name from menber");
    while(rs.next())
    {
      String name=rs.getString("name");
      out.println("<option value='"+name+"'>"+name+"</option>");
    }
    rs.close();
  }catch(Exception e){}
%>
          </select>
          </font></div>
      </td>
      <td width="18%"><font size="2" color="#000080">�Ǽ�����</font></td>
      <td width="18%"><%=currentDate%><font color="#000000" size="2"> 
        <input name="wage_date" type="hidden" size="10" maxlength="20" value="<%=currentDate%>">
        </font></td>
      <td width="18%"><font size="2" color="#000080">�Ǽ���</font></td>
      <td width="26%"><%=name1%><font color="#000000" size="2"> 
        <input name="wage_rgman" type="hidden" size="10" maxlength="20" value="<%=name1%>">
        </font></td>
    </tr>
    <tr> 
      <td width="21%"><font size="2" color="#000080">�¹�������</font></td>
      <td width="27%"><font color="#000000" size="2"> 
        <input name="wage_m_dates" type="text" size="10" maxlength="20" value="22">
        </font></td>
      <td width="18%"><font size="2" color="#000080">�»�������</font></td>
      <td width="26%"><font color="#000000" size="2"> 
        <input name="wage_date_price" type="text" size="10" maxlength="20" value="0">
        </font><font color="#000000" size="2">RMB</font></td>
      <td width="21%"><font size="2" color="#000080">ÿСʱ�Ӱ��</font></td>
      <td width="27%"><font color="#000000" size="2"> 
        <input name="wage_awork_price" type="text" value="0" size="10" maxlength="25">
        RMB*</font></td>
    </tr>
    <tr> 
      <td width="18%"><font size="2" color="#000080">ס��������</font></td>
      <td width="26%"><font color="#000000" size="2"> 
        <input type="text" name="wage_zf_price" size="10" maxlength="20" value="0">
        RMB</font></td>
      <td height="2"><font size="2" color="#000080">��ͨ������</font></td>
      <td height="2"><font color="#000000" size="2"> 
        <input type="text" name="wage_jt_price" size="10" maxlength="25" value="0">
        RMB </font></td>
      <td height="2"><font size="2" color="#000080">��Ͳ�����</font></td>
      <td height="2"><font color="#000000" size="2"> 
        <input type="text" name="wage_wc_price" size="10" maxlength="25" value="0">
        RMB </font></td>
    </tr>
    <tr> 
      <td width="18%"><font size="2" color="#000080">�۳��籣��</font></td>
      <td colspan="5"><font color="#000000" size="2"> 
        <input type="text" name="wage_sb_price" size="10" maxlength="20" value="0">
        RMB</font></td>
    </tr>
    <tr> 
      <td height="2" colspan="6"><font size="2" color="#000080">�Զ�����Ŀ</font></td>
    </tr>
    <tr> 
      <td height="2"><font color="#000000" size="2"> 
        <input name="wage_zdy_sub" type="text" id="menber_sb" value="�Զ���һ" size="10" maxlength="25">
        </font></td>
      <td height="2"><font color="#000000" size="2"> 
        <input name="wage_zdy_price" type="text" id="menber_sb" value="0" size="10" maxlength="25">
        RMB </font></td>
      <td height="2"><font size="2" color="#000080">�Ƿ�����</font></td>
      <td height="2"> 
        <select name="wage_zdy_qy">
          <option>ͣ��</option>
          <option>����</option>
        </select>
      </td>
      <td height="2"><font size="2" color="#000080">�۳�/����</font></td>
      <td height="2"> 
        <div align="left"><font color="#000000" size="2"> 
          <select name="wage_zdy_zj">
            <option>����</option>
            <option>�۳�</option>
          </select>
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="2"><font color="#000000" size="2"> 
        <input name="wage_zdy_sub2" type="text" id="menber_sb" value="�Զ����" size="10" maxlength="25">
        </font></td>
      <td height="2"><font color="#000000" size="2"> 
        <input name="wage_zdy_price2" type="text" id="menber_sb" value="0" size="10" maxlength="25">
        RMB </font></td>
      <td height="2"><font size="2" color="#000080">�Ƿ�����</font></td>
      <td height="2"> 
        <select name="wage_zdy_qy2">
          <option>ͣ��</option>
          <option>����</option>
        </select>
      </td>
      <td height="2"><font size="2" color="#000080">�۳�/����</font></td>
      <td height="2"> 
        <div align="left"><font color="#000000" size="2"> 
          <select name="wage_zdy_zj2">
            <option>����</option>
            <option>�۳�</option>
          </select>
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="2"><font color="#000000" size="2"> 
        <input name="wage_zdy_sub3" type="text" id="menber_sb" value="�Զ�����" size="10" maxlength="25">
        </font></td>
      <td height="2"><font color="#000000" size="2"> 
        <input name="wage_zdy_price3" type="text" id="menber_sb" value="0" size="10" maxlength="25">
        RMB </font></td>
      <td height="2"><font size="2" color="#000080">�Ƿ�����</font></td>
      <td height="2"> 
        <select name="wage_zdy_qy3">
          <option>ͣ��</option>
          <option>����</option>
        </select>
      </td>
      <td height="2"><font size="2" color="#000080">�۳�/����</font></td>
      <td height="2"> 
        <div align="left"><font color="#000000" size="2"> 
          <select name="wage_zdy_zj3">
            <option>����</option>
            <option>�۳�</option>
          </select>
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="2"><font color="#000000" size="2"> 
        <input name="wage_zdy_sub4" type="text" id="menber_sb" value="�Զ�����" size="10" maxlength="25">
        </font></td>
      <td height="2"><font color="#000000" size="2"> 
        <input name="wage_zdy_price4" type="text" id="menber_sb" value="0" size="10" maxlength="25">
        RMB </font></td>
      <td height="2"><font size="2" color="#000080">�Ƿ�����</font></td>
      <td height="2"> 
        <select name="wage_zdy_qy4">
          <option>ͣ��</option>
          <option>����</option>
        </select>
      </td>
      <td height="2"><font size="2" color="#000080">�۳�/����</font></td>
      <td height="2"> 
        <div align="left"><font color="#000000" size="2"> 
          <select name="wage_zdy_zj4">
            <option>����</option>
            <option>�۳�</option>
          </select>
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="2"><font color="#000000" size="2"> 
        <input name="wage_zdy_sub5" type="text" id="menber_sb" value="�Զ�����" size="10" maxlength="25">
        </font></td>
      <td height="2"><font color="#000000" size="2"> 
        <input name="wage_zdy_price5" type="text" id="menber_sb" value="0" size="10" maxlength="25">
        RMB </font></td>
      <td height="2"><font size="2" color="#000080">�Ƿ�����</font></td>
      <td height="2"> 
        <select name="wage_zdy_qy5">
          <option>ͣ��</option>
          <option>����</option>
        </select>
      </td>
      <td height="2"><font size="2" color="#000080">�۳�/����</font></td>
      <td height="2"> 
        <div align="left"><font color="#000000" size="2"> 
          <select name="wage_zdy_zj5">
            <option>����</option>
            <option>�۳�</option>
          </select>
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="2"><font size="2" color="#000080">��ע</font></td>
      <td height="2" colspan="5">
        <textarea name="remark" cols="60"></textarea>
      </td>
    </tr>
  </table>
  <p align="center"><font color="#0000FF"> 
    <input type="submit" name="Submit2" value="ȷ��" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF">
    </font><font color="#000000" size="2"> 
    <input type="button" value="�ر�" name="B22342" style="background-color: #E1E1E1; font-family: ����; font-size: 9pt; border: 1 groove #C3D9FF" onClick="window.close()">
    <br><br>
    (Ա���������������¹���������)</font></p>
  </form>
</body>
</html>
