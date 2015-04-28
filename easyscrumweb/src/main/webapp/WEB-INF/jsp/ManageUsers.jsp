<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/easyscrumweb/resources/css/CostumeStyle.css">

		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.6/css/jquery.dataTables.css">
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/tabletools/2.2.4/css/dataTables.tableTools.css">
		<link rel="stylesheet" type="text/css" href="/easyscrumweb/resources/css/dataTables.editor.css">

		<script type="text/javascript" charset="utf-8" src="https://code.jquery.com/jquery-1.11.2.js"></script>
		<script type="text/javascript" charset="utf-8" src="https://cdn.datatables.net/1.10.6/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" charset="utf-8" src="https://cdn.datatables.net/tabletools/2.2.4/js/dataTables.tableTools.min.js"></script>
		<script type="text/javascript" charset="utf-8" src="/easyscrumweb/resources/js/dataTables.editor.min.js"></script>
		<script type="text/javascript" charset="utf-8" src="/easyscrumweb/resources/js/table.user.js"></script>

</head>
<body style="font-size: 150%">
	<!-- Main navbar -->
	<%@ include file="Component/adminMenupage.jsp"%>
	<div id="cover" class="backprofil">

		<div class="panel panel-default">
			<div class="panel-body">Basic panel example</div>
		
		<!-- Datatable -->

		<div class="container">
			<h1>
				DataTables Editor - user
			</h1>
			
			<table cellpadding="0" cellspacing="0" border="0" class="display" id="user" width="100%">
				<thead>
					<tr>
						<th>nom</th>
						<th>login</th>
						<th>pass</th>
					</tr>
				</thead>
			</table>

		</div>


		<!-- Datatable -->
		</div>
		<!-- Sticky footer -->
		<div class="stickfoot">
			<center>CHAT SPACE</center>
		</div>
	</div>
	
</body>
</html>