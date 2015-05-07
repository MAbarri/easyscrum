<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mail</title>
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/sidebarstyle.css">
	<link rel="stylesheet"
	href="/easyscrumweb/resources/css/inboxstyle.css">
</head>
<body>
	<c:choose>
	<c:when test="${sessionScope.usertype=='1'}">
			<!-- Main navbar -->
			<%@ include file="../Component/adminMenupage.jsp"%>
		</c:when>
		<c:when test="${sessionScope.usertype=='2'}">
			<!-- Main navbar -->
			<%@ include file="../Component/UserMenupage.jsp"%>
		</c:when>
		<c:when test="${sessionScope.usertype=='3'}">
			<%@ include file="../Component/DeveloperMenupage.jsp"%>
		</c:when>
		<c:when test="${sessionScope.usertype=='4'}">
			<!-- Main navbar -->
			<%@ include file="../Component/smastermenupage.jsp"%>
		</c:when>
	</c:choose>
	<div id="cover" class="backprofil">

		<div class="panel panel-default clientPanel">
			<div class="panel-heading">Mail</div>
			<div class="panel-body msgpanel">
			<div class="shadow">
				<label>Envoyé par :</label>&nbsp;
				<br><label>A :</label>&nbsp;
				<br>
				</div>
				<div class="shadow">
				<label>Title</label>
				<br><br>
				Message Text Message Text Message Text Message Text Message Text Message Text Message Text
				Message Text Message Text Message Text Message Text Message Text Message Text Message Text
				Message Text Message Text Message Text Message Text Message Text Message Text Message Text
				Message Text Message Text Message Text Message Text Message Text Message Text Message Text
				Message Text Message Text Message Text Message Text Message Text Message Text Message Text
				</div>
				<div class="shadow txtright">
					Date d'envoi : Date
				</div>
				 <button type="button" class="btn btn-primary btn-sm">Return</button>
				  <button type="button" class="btn btn-primary btn-sm rightbubble">Delete message</button>
			</div>
		</div>
	</div>
</body>
</html>