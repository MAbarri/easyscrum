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
		<c:choose>
	<c:when test="${sessionScope.user.type=='2'}">
	<%@ include file="../Component/poprojectsnavbar.jsp"%>
	</c:when>
	<c:when test="${sessionScope.user.type=='3'}">
	<%@ include file="../Component/devprojectnavbar.jsp"%>
		</c:when>
	<c:when test="${sessionScope.user.type=='4'}">
	<%@ include file="../Component/smatserprojectnavbar.jsp"%>
		</c:when>
	</c:choose>
		<div class="panel panel-default clientPanel sprintpanel">
			<div class="panel-heading">Backlog <c:out value="${project.nomproject }"></c:out> </div>
			<div class="panel-body">
				<label>Project :</label>&nbsp; <c:out value="${project.nomproject }"></c:out>
				<br><label>Project Owner</label>&nbsp; <c:out value="${user.nom }"></c:out>&nbsp; <c:out value="${user.prenom }"></c:out>
				<br><label>Backlogs date :</label>&nbsp;
						 <c:out value="${project.backlog.dtPost }"></c:out>
				<br><br><br>
				<br><label>User Stories</label>
				<br><br>
				<c:forEach items="${project.backlog.stories }" var="us" >
					- <c:out value="${us.speech }"></c:out><br>
					</c:forEach>
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