<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Teams Overview</title>
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">
<link rel="stylesheet" href="/easyscrumweb/resources/css/card.css">
<link rel="stylesheet" href="/easyscrumweb/resources/css/card.min.css">
</head>
<body>

	<!-- Main navbar -->
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
			<div class="panel-heading">
			<c:if test="${selectteam }">select one of your </c:if>
			Teams
			</div>
			<div class="panel-body">
				<c:choose>
				<c:when test="${selectteam }">
				<c:forEach items="${user.teamchef }" var="p">
				
					<div class="ui card leftbubble cardpad">
					<div class="image">
						<img
							src="/easyscrumweb/resources/images/Old-New-logo_Mark-on-darkBG.png">
					</div>
					<div class="content">
						<a class="header" href="/easyscrumweb/userspace/GetRecap?idteam=<c:out value="${p.idteam }"></c:out>&idpro=<c:out value="${project }"></c:out>"><c:out value="${p.name }"></c:out> </a>
						<div class="meta">
							<span class="date">Date of Creation : <c:out value="${p.creationDate }"></c:out></span>
						</div>
						<div class="description"><c:out value="${p.caption }"/></div>
					</div>
					<div class="extra content">
						<i class="user icon"></i><c:if test="${p.available }">Available</c:if><c:if test="${not p.available }">Not Available</c:if>
					</div>
				</div>
				</c:forEach>
				</c:when>
				<c:otherwise>
				<c:forEach items="${user.teams }" var="p">
				
					<div class="ui card leftbubble cardpad">
					<div class="image">
						<img
							src="/easyscrumweb/resources/images/Old-New-logo_Mark-on-darkBG.png">
					</div>
					<div class="content">
						<a class="header" href="/easyscrumweb/userspace/Team?idteam=<c:out value="${p.idteam }"></c:out>"><c:out value="${p.name }"></c:out> </a>
						<div class="meta">
							<span class="date">Date of Creation : <c:out value="${p.creationDate }"></c:out></span>
						</div>
						<div class="description"><c:out value="${p.caption }"/></div>
					</div>
					<div class="extra content">
						<i class="user icon"></i><c:if test="${p.available }">Available</c:if><c:if test="${not p.available }">Not Available</c:if>
					</div>
				</div>
				</c:forEach>
				<c:forEach items="${user.teamchef }" var="p">
				
					<div class="ui card leftbubble cardpad">
					<div class="image">
						<img
							src="/easyscrumweb/resources/images/Old-New-logo_Mark-on-darkBG.png">
					</div>
					<div class="content">
						<a class="header" href="/easyscrumweb/userspace/Team?idteam=<c:out value="${p.idteam }"></c:out>"><c:out value="${p.name }"></c:out> </a>
						<div class="meta">
							<span class="date">Date of Creation : <c:out value="${p.creationDate }"></c:out></span>
						</div>
						<div class="description"><c:out value="${p.caption }"/></div>
					</div>
					<div class="extra content">
						<i class="user icon"></i><c:if test="${p.available }">Available</c:if><c:if test="${not p.available }">Not Available</c:if>
					</div>
				</div>
				</c:forEach>
				</c:otherwise>
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