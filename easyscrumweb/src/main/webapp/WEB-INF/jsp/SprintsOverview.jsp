<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Projects Overview</title>
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/projectcard.css">
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/sidebarstyle.css">
</head>
<body>

	<!-- Main navbar -->
	<%@ include file="Component/UserMenupage.jsp"%>

	<div id="cover" class="backprofil">
	
		<%@ include file="Component/projectsnavbar.jsp"%>
		<div class="panel panel-default clientPanel sprintpanel">
			<div class="panel-heading">
				Project
				<c:out value="${project.nomproject }"></c:out>
			</div>
			<div class="panel-body">
			<c:forEach items="projectslist	" >item</c:forEach>
				<div class="onesprintbyone">
				<label>Sprint : name of Sprint</label><br> <label>description:
					</label>&nbsp;resultarea&nbsp;&nbsp;<label>date de Sprint :</label>&nbsp;resultarea
				<br> <label for="progress">progress</label><br><br>
				<div class="progress">
					<div class="progress-bar" role="progressbar" aria-valuenow="60"
						aria-valuemin="0" aria-valuemax="100" style="width: 20%;">20%</div>
				</div>
				</div>
				
				
			</div>
		</div>

	</div>
	<div class="stickfoot">
		<center>CHAT SPACE</center>
	</div>

</body>
</html>