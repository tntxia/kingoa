<%@ page contentType="text/html;charset=gb2312" %>
<%@ page language="java" import="com.jspsmart.upload.*"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="einfodb" scope="page" class="infocrmdb.infocrmdb" />
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />
<HTML><title>图片上载</title>
<BODY BGCOLOR="white" >
<H1><font size="2">图片上载成功! <a href="javascript:window.close()" style="font-size: 12px">关闭</a></font></H1>

<%
	int count=0;        
	mySmartUpload.initialize(pageContext);
	mySmartUpload.upload();
	 String id=mySmartUpload.getRequest().getParameter("id");
     for (int i=0;i<mySmartUpload.getFiles().getCount();i++){
		com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);
		 String sql="select * from company where picpath='" + myFile.getFileName() + "'";
         ResultSet rs = einfodb.executeQuery(sql); 
         if(rs.next()) { rs.close();
         session.putValue("picpath_message1","上载图片名称重复,请重新命名图片名称!");
         %>
         <script language=javascript>
         window.open('euppic.jsp?id=<%=id%>','uppic', 'height=300, width=410, top=50, left=50, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no')
         </script>
        <% } else {
		 session.putValue("picpath_message1","");
		 String strdSQL="update company set picpath='" + myFile.getFileName() + "' where id='"+id+"'";
         einfodb.executeUpdate(strdSQL);}
		if (!myFile.isMissing()) {

			myFile.saveAs("/custo_log/" + myFile.getFileName());
			count ++;

		}

	}

%>
</BODY>
</HTML>