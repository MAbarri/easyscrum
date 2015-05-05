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
			<div class="panel-heading">Project <c:out value="${project.nomproject }"></c:out> </div>
			<div class="panel-body">
				<br> <label for="progress">Project progress</label>
				<div class="progress">
					<div class="progress-bar" role="progressbar" aria-valuenow="60"
						aria-valuemin="0" aria-valuemax="100" style="width: 20%;">
						20%</div>
				</div>
				<div id="cardcontain">
				<div class="row row-margin-bottom sprintcard">
					<div class="col-md-5 no-padding lib-item" data-category="view">
						<div class="lib-panel">
							<div class="row box-shadow">
								<div class="col-md-6">
									<img class="lib-img-show"
										src="/easyscrumweb/resources/images/Old-New-logo_Mark-on-darkBG.png">
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
										<br><label>Backlog :</label>&nbsp;<c:out value="${project.bg.description}"></c:out>
										<br><label>Tags :</label>&nbsp;<c:out value="${project.tags}"></c:out>
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
						<label for="pnl">Sprints :</label>
						<div class="panel-body" id="pnl">
							<div class="list-group">
								<a href="#" class="list-group-item"> <i
									class="fa fa-tasks fa-fw"></i> Sprint 1 <span
									class="pull-right text-muted small"><em>12/12/2014</em> </span>
								</a> <a href="#" class="list-group-item"> <i
									class="fa fa-tasks fa-fw"></i> Sprint 2 <span
									class="pull-right text-muted small"><em>12/11/2014</em> </span>
								</a><a href="#" class="list-group-item"> <i
									class="fa fa-tasks fa-fw"></i> Sprint 3 <span
									class="pull-right text-muted small"><em>22/09/2014</em> </span>
								</a><a href="#" class="list-group-item"> <i
									class="fa fa-tasks fa-fw"></i> Sprint 4 <span
									class="pull-right text-muted small"><em>12/01/2014</em> </span>
								</a><a href="#" class="list-group-item"> <i
									class="fa fa-tasks fa-fw"></i> Sprint 5 <span
									class="pull-right text-muted small"><em>11/01/2014</em> </span>
								</a> 
							</div>
							<!-- /.list-group -->
							<a href="/easyscrumweb/userspace/allSprints?idproject=<c:out value="${project.projectId }"></c:out>" class="btn btn-default btn-block">View All Sprints</a>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<!-- /.col-lg-4 -->
			</div>
		</div>

	</div>
	<div class="stickfoot">
		<center>CHAT SPACE</center>
	</div>

</body>
</html>