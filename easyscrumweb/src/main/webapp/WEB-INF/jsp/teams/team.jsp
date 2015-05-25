<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Team</title>
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/accountstyle.css">
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
			<div class="panel-heading">Team</div>
			<div class="panel-body msgpanel">
				<div class="shadow profilheight">
					<div class="container"
						style="margin-top: 20px; margin-bottom: 20px;">
						<div class="row panel">
							<div class="col-md-4 bg_blur "
								style="background-image: url('/easyscrumweb/resources/images/teamtag.jpg');"></div>
							<div class="col-md-8  col-xs-12">
								<img src="http://lorempixel.com/output/people-q-c-100-100-1.jpg"
									class="img-thumbnail picture hidden-xs" /> <img
									src="http://lorempixel.com/output/people-q-c-100-100-1.jpg"
									class="img-thumbnail visible-xs picture_mob" />
								<div class="header">
									<h1>
										<c:out value="${team.name}"></c:out>
									</h1>
									<h4>
										Team Reputation
										<c:out value="${team.karma}"></c:out>
									</h4>
									<span> <label>Caption :</label>&nbsp;<c:out
											value="${team.caption}"></c:out><br> <label>Boss
											:</label>&nbsp;<a
										href="/easyscrumweb/userspace/Account?pro=<c:out value="${team.boss.userId}"></c:out>">
											<c:out value="${team.boss.nom}"></c:out>&nbsp;<c:out
												value="${team.boss.prenom}"></c:out>
									</a><br> <label>Members :</label>
									<c:forEach items="${team.members }" var="mem">
																							&nbsp;<a
												href="/easyscrumweb/userspace/Account?pro=<c:out value="${mem.userId}"></c:out>">
												<c:out value="${mem.nom}"></c:out>&nbsp;<c:out
													value="${mem.prenom}"></c:out>
											</a>,
																							</c:forEach> <br> <label>Projects :</label>
									<c:forEach items="${team.projects }" var="pro">
																							&nbsp;<a
												href="/easyscrumweb/userspace/project?idproject=<c:out value="${pro.projectId}"></c:out>">
												<c:out value="${pro.nomproject}"></c:out>
											</a>,
																							</c:forEach><br>
									</span>
								</div>
							</div>
						</div>

						<div class="row nav">
							<div class="col-md-4"></div>
							<div class="col-md-8 col-xs-12"
								style="margin: 0px; padding: 0px;">
								<a href="#" style="color: white;">
									<div class="col-md-4 col-xs-4 well" id="editclick"
										style="display: 
									<c:choose>
									<c:when test="${sessionScope.editrights}">
									block
									</c:when>
									<c:when test="${!sessionScope.editrights}">
									none
									</c:when>
									</c:choose>
									
									;">
										<button data-toggle="modal" data-target="#myModal" id="edit"
											style="display: none;"></button>
										<i class="glyphicon glyphicon-pencil" id="editlink"></i> Edit
										Team
									</div>
								</a> <a href="/easyscrumweb/userspace/Invitein?idteam=<c:out value="${team.idteam}"></c:out>" style="color: white;">
									<div class="col-md-4 col-xs-4 well" id="editclick"
										style="display: 
									<c:choose>
									<c:when test="${sessionScope.editrights}">
									block
									</c:when>
									<c:when test="${!sessionScope.editrights}">
									none
									</c:when>
									</c:choose>
									
									;">
										<button id="edit" style="display: none;"></button>
										<i class="glyphicon glyphicon-pencil" id="editlink"></i> Add
										Members
									</div>
								</a>
								<!-- Modal -->
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="myModalLabel">Update My
													Team</h4>
											</div>
											<div class="modal-body innerspace">
												<div class="tab-content">
													<div class="tab-pane active registersingltab"
														id="tab_default_1">
														<form class="form-horizontal" role="form" style="margin-top: 150px;color: darkslateblue;"
															action="creatnewTeam" method="get">
															<div class="form-group">
																<label class="col-lg-3 control-label">Team Name</label>
																<div class="col-lg-8">
																	<input class="form-control" type="text" name="name">
																</div>
															</div>
															<div class="form-group">
																<label class="col-lg-3 control-label">Company:</label>
																<div class="col-lg-8">
																	<input class="form-control" type="text" value=""
																		name="company">
																</div>
															</div>
															<div class="form-group">
																<label class="col-lg-3 control-label">Email:</label>
																<div class="col-lg-8">
																	<input class="form-control" type="text" name="email">
																</div>
															</div>
															<div class="form-group">
																<label class="col-lg-3 control-label">Caption:</label>
																<div class="col-lg-8">
																	<textarea id="mailtext" class="form-control" rows="6"
																		placeholder="caption text" name="caption"></textarea>
																</div>
															</div>
															
														</form>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Cancel</button>
												<button type="button" class="btn btn-primary"
													onclick="submit()">Update</button>
											</div>
										</div>
									</div>
								</div>
								<a href="/easyscrumweb/userspace/newmail?dest=Utilisateur"
									style="color: white;">
									<div class="col-md-4 col-xs-4 well"
										style="display: 
									<c:choose>
									<c:when test="${!sessionScope.editrights}">
									block
									</c:when>
									<c:when test="${sessionScope.editrights}">
									none
									</c:when>
									</c:choose>
									
									;">
										<i class="glyphicon glyphicon-envelope"></i> Send Email
									</div>
								</a> <a href="#" style="color: white;">
									<div class="col-md-4 col-xs-4 well"
										style="display: 
									<c:choose>
									<c:when test="${!sessionScope.editrights}">
									block
									</c:when>
									<c:when test="${sessionScope.editrights}">
									none
									</c:when>
									</c:choose>
									
									;">
										<i class="glyphicon glyphicon-flag"></i> Report
									</div>
								</a>
							</div>
						</div>
					</div>
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
	<script src="/easyscrumweb/resources/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript">
		$("#editclick").click(function() {
			$("#edit").click();
		});
	</script>
</body>
</html>