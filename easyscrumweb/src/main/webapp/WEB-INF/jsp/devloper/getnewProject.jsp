<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Get a new Project</title>
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">
<link rel="stylesheet" href="/easyscrumweb/resources/css/card.css">
<link rel="stylesheet" href="/easyscrumweb/resources/css/card.min.css">
</head>
<body>

	<!-- Main navbar -->
	<%@ include file="../Component/DeveloperMenupage.jsp"%>

	<div id="cover" class="backprofil">

		<div class="panel panel-default clientPanel">
			<div class="panel-heading">Projects</div>
			<div class="panel-body">
				
				<c:choose>
				<c:when test="${empty projectslist }"><center>No available project found</center></c:when>
				<c:otherwise>
				<c:forEach items="${projectslist }" var="p">
				
					<div class="ui card leftbubble cardpad">
					<div class="image">
						<img
							src="/easyscrumweb/resources/images/Old-New-logo_Mark-on-darkBG.png">
					</div>
					<div class="content">
						<a class="header" href="/easyscrumweb/userspace/project?idproject=<c:out value="${p.projectId }"></c:out>"><c:out value="${p.nomproject }"></c:out> </a>
						<div class="meta">
							<span class="date">Date of Creation : <c:out value="${p.dateDebut }"></c:out></span>
						</div>
						<div class="description"><c:out value="${p.desc }"/></div>
					</div>
					<div class="extra content">
						<a> <i class="user icon"></i><c:out value="${p.status}"/></a>
					</div>
				</div>
				</c:forEach></c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<!-- Sticky footer -->
    <div class="stickfoot">
    <center>
    <div class="gconvers">
    <center>Copyright @EasyScrum 2015</center>
    
    </div>
    </center>
    </div>
</body>
</html>