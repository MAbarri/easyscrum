<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
			<div class="panel-heading">Project <c:out value="${project.nomproject }"></c:out> </div>
			<div class="panel-body">
				
				<c:choose>
					<c:when test="${getproject }"><h1>Free project</h1></c:when>
				<c:otherwise>
				
				<br> <label for="progress">Project progress</label>
				<div class="progress">
					<div class="progress-bar" role="progressbar" aria-valuenow="60"
						aria-valuemin="0" aria-valuemax="100" style="width: 20%;">
						20%</div>
				</div>
				</c:otherwise>
				</c:choose>
				
				<div id="cardcontain">
				<div class="row row-margin-bottom sprintcard">
					<div class="col-md-5 no-padding lib-item" data-category="view">
						<div class="lib-panel">
							<div class="row box-shadow">
							<form method="POST" action="uploadtriggerproject?idp=<c:out value="${project.projectId}"></c:out>" enctype="multipart/form-data" style="display:none">
							<input type="file" id="uploadpic" name="uploadpic">
							<input type="submit" id="saveupload">
							</form>
								<div class="col-md-6 pointerpic" id="uploadtrigger">
									<img class="lib-img-show"
									<c:if test="${empty project.logo }">src="/easyscrumweb/resources/images/Old-New-logo_Mark-on-darkBG.png"</c:if>
									<c:if test="${not empty project.logo }">src="/easyscrumweb/resources/<c:out value="${project.logo}"></c:out>"</c:if>>
								</div>
								<div class="col-md-6">
									<div class="lib-row lib-header">
										<c:out value="${project.nomproject }"></c:out>
										<div class="lib-header-seperator"></div>
									</div>
									<div class="lib-row lib-desc">
										<label>Langue :</label>&nbsp;<c:out value="${project.language}"></c:out>
										<br><label>Type :</label>&nbsp;<c:out value="${project.type}"></c:out>
										<br><label>Company :</label>&nbsp;<c:out value="${project.company}"></c:out>
										<br><label>Status :</label>&nbsp;<c:out value="${project.status}"></c:out>
										<br><label>Description :</label>&nbsp;<c:out value="${project.desc}"></c:out>
										<br><label>Cost :</label>&nbsp;<c:out value="${project.cost}"></c:out>
										<br><label>Tags :</label>&nbsp;<c:out value="${project.tags}"></c:out>
										<br><a href="/easyscrumweb/userspace/projectbacklog?id=<c:out value="${project.projectId }"></c:out>" style="position: static;">Backlog</a>
										
										<c:choose>
										<c:when test="${getproject }">
										<form action="selectTeam" method="POST">
										<input id="idpro" name="idpro" value="<c:out value="${project.projectId}"></c:out>" style="display: none" >
										<br><button type="submit" class="btn btn-primary">Get this Project</button>
										</form>
										</c:when>
										<c:otherwise>
										<br><label>Team working on :</label>&nbsp;<c:if test="${empty project.workteam.idteam }">(no team yet)</c:if>
										<a href="/easyscrumweb/userspace/Team?idteam=<c:out value="${project.workteam.idteam }"></c:out>" style="position: static;"> <c:out value="${project.workteam.name}"></c:out></a>
										</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div></div>
				<!--feed-->
				<div class="col-lg-4 notificationpanel">
					<div class="panel panel-default sprintslist">
						<!-- /.panel-heading -->
						<c:choose>
						<c:when test="${getproject }"></c:when>
						<c:otherwise>
						<label for="pnl">Sprints :</label>
						<div class="panel-body" id="pnl">
							<div class="list-group">
							<c:forEach items="${project.sprints }" var="spr" end="4" >
								<a href="/easyscrumweb/userspace/allSprints?idproject=<c:out value="${project.projectId }"></c:out>" class="list-group-item"> <i
									class="fa fa-tasks fa-fw"></i> <c:out value="${spr.nom }"></c:out> <span
									class="pull-right text-muted small"><em> <c:out value="${spr.dtd }"></c:out> </em> </span>
								</a> 
							</c:forEach>
							</div>
							<!-- /.list-group -->
							<a href="/easyscrumweb/userspace/allSprints?idproject=<c:out value="${project.projectId }"></c:out>" class="btn btn-default btn-block">View All Sprints</a>
						</div>
						</c:otherwise>
						</c:choose>
						<!-- /.panel-body -->
					</div>
				</div>
				<!-- /.col-lg-4 -->
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
<script src="/easyscrumweb/resources/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript">
			$("#uploadtrigger").click(function() {
				$("#uploadpic").click();
			});
			$("#uploadpic").change(function() {
				$("#saveupload").click();
			});
		</script>
</body>
</html>