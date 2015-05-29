<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sprints Overview</title>
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
			<div class="panel-heading">
				Project
				<c:out value="${project.nomproject }"></c:out>
			</div>
			<div class="panel-body">
			<c:if test="${sessionScope.usertype=='4'}">
			<a href="/easyscrumweb/userspace/newSprint"><button type="button" class="btn btn-primary rightbubble">Start new Sprint</button></a>
			</c:if>
			<br><br>
				<c:forEach items="${Sprintslist }" var="sprint">
					<div class="onesprintbyone">
				<label>Sprint : <a href="/easyscrumweb/userspace/singleSprint?idSprint=<c:out value="${sprint.idsprint }"></c:out>&idprojet=<c:out value="${project.projectId}"></c:out>" > <c:out value="${sprint.nom }"></c:out></a> </label><br> <label>description:
					</label>&nbsp;<c:out value="${sprint.description }"></c:out>&nbsp;&nbsp;<label>date de debut Sprint :</label>&nbsp;<c:out value="${sprint.dtd }"></c:out>				
				<br> <label for="progress">progress :</label>&nbsp;<c:out value="${sprint.status }"></c:out><br><br>
				<div class="progress">
					<div class="progress-bar" role="progressbar" aria-valuenow="60"
						aria-valuemin="0" aria-valuemax="100" style="width: 
							<c:choose><c:when test="${sprint.status=='Starting'}">20%</c:when>
							<c:when test="${sprint.status=='Working On'}">40%</c:when>
							<c:when test="${sprint.status=='Testing'}">60%</c:when>
							<c:when test="${sprint.status=='Ready for a Demo'}">80%</c:when>
							<c:when test="${sprint.status=='Delivery'}">99%</c:when>
							<c:when test="${sprint.status=='Finished'}">100%</c:when></c:choose> ;">
							<c:choose>
							<c:when test="${sprint.status=='Starting'}">20%</c:when>
							<c:when test="${sprint.status=='Working On'}">40%</c:when>
							<c:when test="${sprint.status=='Testing'}">60%</c:when>
							<c:when test="${sprint.status=='Ready for a Demo'}">80%</c:when>
							<c:when test="${sprint.status=='Delivery'}">99%</c:when>	
							<c:when test="${sprint.status=='Finished'}">100%</c:when></c:choose></div>
						
				</div>
				</div>
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