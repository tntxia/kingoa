<%@ page contentType="text/html;charset=gb2312"%>
<% 
String basePath = request.getContextPath();
%>
<html>
<head>
<title>������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/themes/icon.css" />

<script type="text/javascript" src="<%=basePath%>/js/config.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/js/system/base/manage_item.js" charset="gb2312"></script>
</head>
<body>
	
	

	<table id="datagrid">
		<thead>
			<th data-options="field:'id'">id</th>
			<th data-options="field:'name'">����</th>
			<th data-options="field:'url'">��ַ</th>
			<th data-options="field:'target'">Ŀ��</th>
			<th data-options="field:'winOpt'">�򿪴���ѡ��</th>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	
	<div id="updateDiv" class="easyui-dialog" closed="true">
		<form id="updateForm" action="<%=basePath%>/system/manageItem.dispatch" method="post">
		<input type="hidden" name="method" value="update">
		<table>
			<tr><td>ID</td><td><input type="text" name="id"></td></tr>
			<tr><td>����</td><td><input type="text" name="name"></td></tr>
			<tr><td>��ַ</td><td><input type="text" name="url" size="30"></td></tr>
		</table>
		</form>
		<a class="easyui-linkbutton" onclick="javascript:updateItem()">ȷ��</a>
	</div>
</body> 
</html> 

