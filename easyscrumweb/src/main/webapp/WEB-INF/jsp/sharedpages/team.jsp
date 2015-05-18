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
								style="background-image: url('');"></div>
							<div class="col-md-8  col-xs-12">
								<img src="http://lorempixel.com/output/people-q-c-100-100-1.jpg"
									class="img-thumbnail picture hidden-xs" /> <img
									src="http://lorempixel.com/output/people-q-c-100-100-1.jpg"
									class="img-thumbnail visible-xs picture_mob" />
								<div class="header">
									<h1>
										<c:out value="${team.name}"></c:out>
									</h1>
									<h4>Team Reputation <c:out value="${team.karma}"></c:out></h4>
									<span>
									<label>Caption :</label>&nbsp;<c:out value="${team.caption}"></c:out><br>
									<label>Boss :</label>&nbsp;<a href="/easyscrumweb/userspace/Account?pro=<c:out value="${team.boss.userId}"></c:out>"> <c:out value="${team.boss.nom}"></c:out>&nbsp;<c:out value="${team.boss.prenom}"></c:out></a><br>
									<label>Members :</label><c:forEach items="${team.members }" var="mem" >
																							&nbsp;<a href="/easyscrumweb/userspace/Account?pro=<c:out value="${mem.userId}"></c:out>"> <c:out value="${mem.nom}"></c:out>&nbsp;<c:out value="${mem.prenom}"></c:out></a>,
																							</c:forEach>  <br>
									<label>Projects :</label><c:forEach items="${team.projects }" var="pro" >
																							&nbsp;<a href="/easyscrumweb/userspace/project?idproject=<c:out value="${pro.projectId}"></c:out>"> <c:out value="${pro.nomproject}"></c:out></a>,
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
									<div class="col-md-4 col-xs-4 well" id="editclick" style="display: 
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
										Profil
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
												<h4 class="modal-title" id="myModalLabel">Update My Profil</h4>
											</div>
											<div class="modal-body innerspace">
												<div class="tab-content">
													<div class="tab-pane active registersingltab"
														id="tab_default_1">
														<form action="addAccount" method="post">
															<table class="tableregister adminaddform">
																<tr>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td><input type="email" class="form-control"
																		id="exampleInputEmail1" placeholder="Email" required
																		name="email" value="" ></td>
																	<td>&nbsp;*</td>
																	<td><c:out value="${ListErreur['email']}"></c:out></td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td><input type="password" class="form-control"
																		id="InputPassword1" placeholder="Password" required
																		name="pass"></td>
																	<td>&nbsp;*</td>
																	<td><c:out value="${ListErreur['pass']}"></c:out></td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td><input type="text"
																		class="form-control inscriptioninput" id="ImputName"
																		placeholder="First name" required name="name" value="">
																		<input type="text"
																		class="form-control inscriptioninput" id="ImputLname"
																		placeholder="Last name" name="lname" value=""></td>
																	<td>&nbsp;*</td>
																	<td><c:out value="${ListErreur['Fullname']}"></c:out></td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td><input type="text" class="form-control"
																		id="ImputAdresse" placeholder="Adresse" name="adresse" value=""></td>
																	<td><c:out value="${ListErreur['adresse']}"></c:out></td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td><input type="text" class="form-control"
																		id="ImputAdresse" placeholder="Login" name="login" ></td>
																	<td><c:out value="${ListErreur['login']}"></c:out></td>
																</tr>

																<tr>
																	<td>&nbsp;</td>
																</tr>

																<tr>
																	<td><c:out value="${error.general}"></c:out></td>
																</tr>


															</table>
															<input type="submit" id="sendform" />
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
									<div class="col-md-4 col-xs-4 well" style="display: 
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
									<div class="col-md-4 col-xs-4 well" style="display: 
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
	<script src="/easyscrumweb/resources/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript">
		$("#editclick").click(function() {
			$("#edit").click();
		});
	</script>
</body>
</html>