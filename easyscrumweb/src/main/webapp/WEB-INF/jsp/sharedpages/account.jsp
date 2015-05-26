<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
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
			<div class="panel-heading">User Profil</div>
			<div class="panel-body msgpanel">
			
			<c:if test="${not empty targetuser.email}">
				<div class="shadow profilheight">
					<div class="container"
						style="margin-top: 20px; margin-bottom: 20px;">
						<div class="row panel">
							<div class="col-md-4 bg_blur "
								style="background-image: url(
							<c:choose>
									<c:when test="${targetuser.type=='1'}">
									'/easyscrumweb/resources/images/ADMINtag.jpg'
									</c:when>
									<c:when test="${targetuser.type=='2'}">
									'/easyscrumweb/resources/images/projectowner.jpg'
									</c:when>
									<c:when test="${targetuser.type=='3'}">
									'/easyscrumweb/resources/images/developertag.jpg'
									</c:when>
									<c:when test="${targetuser.type=='4'}">
									'/easyscrumweb/resources/images/scrummastertag.jpg'
									</c:when>
								</c:choose>
							);"></div>
							<div class="col-md-8  col-xs-12"><form method="POST" action="changepic" enctype="multipart/form-data" style="display:none">
							<input type="file" id="uploadpic" name="uploadpic">
							<input type="submit" id="saveupload">
							</form>
								<div class="pointerpic" id="uploadtrigger"><img 
									<c:if test="${empty targetuser.photo }">src="/easyscrumweb/resources/images/avatar.png"</c:if>
									<c:if test="${not empty targetuser.photo }">src="/easyscrumweb/resources/<c:out value="${targetuser.photo}"></c:out>"</c:if>
									class="img-thumbnail picture hidden-xs"/> <img
									<c:if test="${empty targetuser.photo }">src="/easyscrumweb/resources/images/avatar.png"</c:if>
									<c:if test="${not empty targetuser.photo }">src="/easyscrumweb/resources/<c:out value="${targetuser.photo}"></c:out>"</c:if>
									class="img-thumbnail visible-xs picture_mob" /></div>
								<div class="header">
									<h1>
										<c:out value="${targetuser.nom}"></c:out>&nbsp;<c:out value="${targetuser.prenom}"></c:out><c:out value="${result}"></c:out>
									</h1>
									<h4>
									<c:choose>
									<c:when test="${targetuser.type=='1'}">
									Admin
									</c:when>
									<c:when test="${targetuser.type=='2'}">
									Project Owner
									</c:when>
									<c:when test="${targetuser.type=='3'}">
									Developer
									</c:when>
									<c:when test="${targetuser.type=='4'}">
									Scrum Master
									</c:when>
								</c:choose>
									</h4>
									<span>
									<label>Email :</label>&nbsp;<c:out value="${targetuser.email }"></c:out><br>
									<label>Adress :</label>&nbsp;<c:out value="${targetuser.adresse }"></c:out><br>
									<label>Phone number :</label>&nbsp;<c:out value="${targetuser.telephone }"></c:out><br>
									<label>Speciality :</label>
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
														<form action="updateMyAccount" method="post">
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
																		name="email" value="<c:out value="${targetuser.email }"></c:out>" ></td>
																	<td>&nbsp;*</td>
																	<td><c:out value="${ListErreur['email']}"></c:out></td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td><input type="password" class="form-control"
																		id="InputPassword1" placeholder="Old Password" required
																		name="oldpass"></td>
																	<td>&nbsp;*</td>
																	<td><c:out value="${ListErreur['pass']}"></c:out></td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td><input type="password" class="form-control"
																		id="InputPassword1" placeholder="New Password" required
																		name="pass"></td>
																	<td>&nbsp;*</td>
																	<td><c:out value="${ListErreur['pass']}"></c:out></td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td><input type="password" class="form-control"
																		id="InputPassword1" placeholder="Confirme New Password" required
																		name="confpass"></td>
																	<td>&nbsp;*</td>
																	<td><c:out value="${ListErreur['pass']}"></c:out></td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td><input type="text"
																		class="form-control inscriptioninput" id="ImputName"
																		placeholder="First name" required name="name" value="<c:out value="${targetuser.nom }"></c:out>">
																		<input type="text"
																		class="form-control inscriptioninput" id="ImputLname"
																		placeholder="Last name" name="lname" value="<c:out value="${targetuser.prenom }"></c:out>"></td>
																	<td>&nbsp;*</td>
																	<td><c:out value="${ListErreur['Fullname']}"></c:out></td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td><input type="text" class="form-control"
																		id="ImputAdresse" placeholder="Adresse" name="adresse" value="<c:out value="${targetuser.adresse }"></c:out>"></td>
																	<td><c:out value="${ListErreur['adresse']}"></c:out></td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td><input type="text" class="form-control"
																		id="ImputAdresse" placeholder="Login" name="login" <c:out value="${targetuser.login }"></c:out>></td>
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
												<button type="button" id="lunchsubmit" class="btn btn-primary">Update</button>
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
				</c:if>
				<c:if test="${empty targetuser.email }">
					<center>
					<br><br><br>
						<h1 style="color: crimson;">User not found !</h1>
						<h3 style="color: saddlebrown;">This User doesn't exist, he may have deleted his account or have been Banned from this site !</h3><br>
						<a href="#"><h6>Contact Us</h6></a>
					</center>
				</c:if>
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
		$("#lunchsubmit").click(function() {
			$("#sendform").click();
		});
		$("#uploadtrigger").click(function() {
			$("#uploadpic").click();
		});
		$("#uploadpic").change(function() {
			$("#saveupload").click();
		});
	</script>
	<script src="/easyscrumweb/resources/js/tooltip.js"></script>
</body>
</html>