<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write a Mail</title>
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/sidebarstyle.css">
<link rel="stylesheet" href="/easyscrumweb/resources/css/inboxstyle.css">
</head>
<body>
	<c:choose>
	<c:when test="${sessionScope.user.type=='1'}">
			<!-- Main navbar -->
			<%@ include file="../Component/adminMenupage.jsp"%>
		</c:when>
		<c:when test="${sessionScope.user.type=='2'}">
			<!-- Main navbar -->
			<%@ include file="../Component/UserMenupage.jsp"%>
		</c:when>
		<c:when test="${sessionScope.user.type=='3'}">
			<%@ include file="../Component/DeveloperMenupage.jsp"%>
		</c:when>
		<c:when test="${sessionScope.user.type=='4'}">
			<!-- Main navbar -->
			<%@ include file="../Component/smastermenupage.jsp"%>
		</c:when>
	</c:choose>
	<div id="cover" class="backprofil">

		<div class="panel panel-default clientPanel">
			<div class="panel-heading">New Mail</div>
			<div class="panel-body msgpanel">
				<div class="shadow">
					<br>
					<label>A :</label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" value="<c:out value="${param.dest }"></c:out>" placeholder="addresser" style="width: 300px; display: inline;">
					<br><br>
				</div>
				<div class="shadow">
				<br>
					 <input class="form-control" type="text" id="formGroupInputLarge" placeholder="Title"> <br>
					<textarea class="form-control" rows="8" placeholder="Message text"></textarea>
					<br>
				</div>
				
				<button type="button" class="btn btn-primary btn-sm">Cancel</button>
				<button type="button" class="btn btn-primary btn-sm rightbubble">Send Message</button>
			</div>
		</div>
	</div>
</body>
</html>