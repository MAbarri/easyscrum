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
				<div style="margin: 7%;">
					<a href="/easyscrumweb/userspace/myTeams"><button class="teampagetiles"><center><h2>My Teams</h2></center></button></a>
					<a href="/easyscrumweb/userspace/Teams"><button class="teampagetiles"><center><h2>All Teams</h2></center></button></a> 
					<c:choose>
						<c:when test="${sessionScope.user.type=='3'}">
							<button class="teampagetiles" data-toggle="modal" data-target="#myModal3"><center><h2>Need Team !</h2></center></button>
						</c:when>
						<c:when test="${sessionScope.user.type=='4'}">
							<a href="/easyscrumweb/userspace/newTeam"><button class="teampagetiles"><center><h2>New Team</h2></center></button></a>
						</c:when>
					</c:choose>
					<!-- Modal -->
					<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">Need Team !</h4>
								</div>
								<div class="modal-body">
								<form action="needTeam?change=<c:out value="${user.needteam }"></c:out>" method="post">
									<div style="color:darkslategray;">By Marking your Profil as "need Team" you will be shown as a free developer for Scrum Maters to invite you into Developement Team !
									<br>Your "needTeam" settings now are turned <label> <c:out value="${user.needteam }"></c:out></label>, Would you like to switch it ?
									
									</div>
									
									<br> <br>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Cancel</button>
									<button type="submit" class="btn btn-primary">Switch need Team !</button>
								</form>
								</div>
							</div>
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
</body>
</html>