<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>new Team</title>
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
			<div class="panel-heading">new Team</div>
			<div class="panel-body msgpanel" style="padding: 0px;">
				<div class="container">
					<h1>Edit Profile</h1>
					<hr>
					<div class="row" style="color: darkslateblue;">
						<!-- left column -->
						<div class="col-md-3">
							<div class="text-center">
								<img src="//placehold.it/100" class="avatar img-circle"
									alt="avatar">
								<h6>Upload photo for Your Team...</h6>

								<input type="file" class="form-control">
							</div>
						</div>

						<!-- edit form column -->
						<div class="col-md-9 personal-info">
							<h3>Team info</h3>

							<form class="form-horizontal" role="form" action="creatnewTeam" method="get" >
								<div class="form-group">
									<label class="col-lg-3 control-label">Team Name</label>
									<div class="col-lg-8">
										<input class="form-control" type="text" name="name">
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">Company:</label>
									<div class="col-lg-8">
										<input class="form-control" type="text" value="" name="company">
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">Email:</label>
									<div class="col-lg-8">
										<input class="form-control" type="text" name="email">
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label" >Caption:</label>
									<div class="col-lg-8">
										<textarea id="mailtext" class="form-control" rows="6" placeholder="caption text" name="caption"></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label"></label>
									<div class="col-md-8">
										<input type="submit" class="btn btn-primary"
											value="Save Changes"> <span></span> <input
											type="reset" class="btn btn-default" value="Cancel">
									</div>
								</div>
								<br><br>
								</form>
						</div>
					</div>
				</div>
				<hr>
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