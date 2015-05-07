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
	<c:when test="${sessionScope.usertype=='1'}">
			<!-- Main navbar -->
			<%@ include file="../Component/adminMenupage.jsp"%>
		</c:when>
		<c:when test="${sessionScope.usertype=='2'}">
			<!-- Main navbar -->
			<%@ include file="../Component/UserMenupage.jsp"%>
		</c:when>
		<c:when test="${sessionScope.usertype=='3'}">
			<%@ include file="../Component/DeveloperMenupage.jsp"%>
		</c:when>
		<c:when test="${sessionScope.usertype=='4'}">
			<!-- Main navbar -->
			<%@ include file="../Component/smastermenupage.jsp"%>
		</c:when>
	</c:choose>
	<div id="cover" class="backprofil">

		<div class="panel panel-default clientPanel">
			<div class="panel-heading">Mail</div>
			<div class="panel-body msgpanel">
				<div class="shadow profilheight">
					<div class="container"
						style="margin-top: 20px; margin-bottom: 20px;">
						<div class="row panel">
							<div class="col-md-4 bg_blur " style="background-image: url(
							<c:choose>
									<c:when test="${sessionScope.usertype=='1'}">
									'/easyscrumweb/resources/images/ADMINtag.jpg'
									</c:when>
									<c:when test="${sessionScope.usertype=='2'}">
									'/easyscrumweb/resources/images/projectowner.jpg'
									</c:when>
									<c:when test="${sessionScope.usertype=='3'}">
									'/easyscrumweb/resources/images/developertag.jpg'
									</c:when>
									<c:when test="${sessionScope.usertype=='4'}">
									'/easyscrumweb/resources/images/scrummastertag.jpg'
									</c:when>
								</c:choose>
							);"></div>
							<div class="col-md-8  col-xs-12">
								<img src="http://lorempixel.com/output/people-q-c-100-100-1.jpg"
									class="img-thumbnail picture hidden-xs" /> <img
									src="http://lorempixel.com/output/people-q-c-100-100-1.jpg"
									class="img-thumbnail visible-xs picture_mob" />
								<div class="header">
									<h1>User Name <c:out value="${sessionScope.usertype}"></c:out> </h1>
									<h4>Web Developer</h4>
									<span>Description .......... .......... ..........
										.......... details !!</span>
								</div>
							</div>
						</div>

						<div class="row nav">
							<div class="col-md-4"></div>
							<div class="col-md-8 col-xs-12"
								style="margin: 0px; padding: 0px;">
								<a href="#" style="color: white;">
								<div class="col-md-4 col-xs-4 well">
									<i class="glyphicon glyphicon-pencil"></i> Edit Profil
								</div>
								</a>
								<a href="/easyscrumweb/userspace/newmail?dest=Utilisateur" style="color: white;">
									<div class="col-md-4 col-xs-4 well">
										<i class="glyphicon glyphicon-envelope"></i> Send Email
									</div>
								</a>
								<a href="#" style="color: white;">
								<div class="col-md-4 col-xs-4 well">
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
</body>
</html>