<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sprint</title>
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
				Sprint 
				<c:out value="${spr.nom }"></c:out>
			</div>
			<div class="panel-body">
			
				
					<div class="onesprintbyone">
				<label>Sprint : <c:out value="${spr.nom }"></c:out> </label><br> <label>description:
					</label>&nbsp;<c:out value="${spr.description }"></c:out>&nbsp;&nbsp;<label>date de debut Sprint :</label>&nbsp;<c:out value="${spr.dtd }"></c:out>
				
					<br> <label>Date fin estimée :</label>&nbsp;<c:out value="${spr.dtf }"></c:out>
				<br> <label>Durée restante :</label>&nbsp;1 month
				<br> <label>Developpement Team :</label>&nbsp;Team test
				<br> <label>Developpement Team Master :</label>&nbsp;Master of Puppets
				<br> <label>Priority :</label>&nbsp;<c:out value="${spr.priority }"></c:out>
				
				<br> <label for="progress">progress :</label>&nbsp;<c:out value="${spr.status }"></c:out><br><br>
				<div class="progress">
					<div class="progress-bar" role="progressbar" aria-valuenow="60"
						aria-valuemin="0" aria-valuemax="100" style="width: 
							<c:choose><c:when test="${spr.status=='Starting'}">20%</c:when>
							<c:when test="${spr.status=='Working On'}">40%</c:when>
							<c:when test="${spr.status=='Testing'}">60%</c:when>
							<c:when test="${spr.status=='Ready for a Demo'}">80%</c:when>
							<c:when test="${spr.status=='Delivery'}">99%</c:when>
							<c:when test="${spr.status=='Finished'}">100%</c:when></c:choose> ;">
							<c:choose>
							<c:when test="${spr.status=='Starting'}">20%</c:when>
							<c:when test="${spr.status=='Working On'}">40%</c:when>
							<c:when test="${spr.status=='Testing'}">60%</c:when>
							<c:when test="${spr.status=='Ready for a Demo'}">80%</c:when>
							<c:when test="${spr.status=='Delivery'}">99%</c:when>
							<c:when test="${spr.status=='Finished'}">100%</c:when></c:choose></div>
						
				</div>
				<c:if test="${spr.status!='Finished'}">
				<form action="changedsprintstat" method="POST">
				<input name="values" value="<c:out value="${spr.idsprint }"></c:out>;0" style="display: none">
				<button type="submit" class="btn btn-default btn-sm leftbubble">Restart Sprint</button></form><form action="changedsprintstat" method="POST"><input name="values" value="<c:out value="${spr.idsprint }"></c:out>;1" style="display: none">
				<button type="submit" class="btn btn-default btn-sm rightbubble">Pass Sprint to Next Phase</button></form><br><br>
				</c:if>
				</div>
				
				
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