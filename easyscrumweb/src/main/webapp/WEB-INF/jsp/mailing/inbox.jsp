<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Inbox</title>
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/bootstrap.min.css">
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
			<div class="panel-heading">Mails inbox</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-sm-3 col-md-2">
						<div class="btn-group"></div>
					</div>
					<div class="col-sm-9 col-md-10">
						<!-- Split button -->
						<div class="btn-group">
							<button type="button" class="btn btn-default">
								<div class="checkbox" style="margin: 0;">
									<label> <input type="checkbox">
									</label>
								</div>
							</button>
							<button type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown">
								<span class="caret"></span><span class="sr-only">Toggle
									Dropdown</span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">All</a></li>
								<li><a href="#">None</a></li>
							</ul>
						</div>
						<button type="button" class="btn btn-default"
							data-toggle="tooltip" title="Refresh">
							   <span class="glyphicon glyphicon-refresh"></span>   
						</button>
						<!-- Single button -->
						<div class="btn-group">
							<button type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown">
								More <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Mark all as read</a></li>
							</ul>
						</div>
						<div class="pull-right">
							<span class="text-muted"><b>1</b>–<b>50</b> of <b>277</b></span>
							<div class="btn-group btn-group-sm">
								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</button>
								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<hr />
				<div class="row">
					<div class="col-sm-3 col-md-2">
						<a href="/easyscrumweb/userspace/newmail" class="btn btn-danger btn-sm btn-block" role="button">COMPOSE</a>
						<hr />
						<ul class="nav nav-pills nav-stacked">
							<li class="active"><a href="#"><span
									class="badge pull-right">new</span> Inbox </a></li>
							<li><a href="#">Important</a></li>
							<li><a href="#">Sent Mail</a></li>
						</ul>
					</div>
					<div class="col-sm-9 col-md-10">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs">
							<li class="active"><a href="#home" data-toggle="tab"><span
									class="glyphicon glyphicon-inbox"> </span>Inbox</a></li>
							<li><a href="#profile" data-toggle="tab"><span
									class="glyphicon glyphicon-user"></span> Sent mails</a></li>
							<li><a href="#messages" data-toggle="tab"><span
									class="glyphicon glyphicon-tags"></span> Important</a></li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content">
							<div class="tab-pane fade in active" id="home">
								<div class="list-group">
								<c:forEach items="${me.recievedmails }" var="ml" >
									<a href="/easyscrumweb/userspace/mail?id=<c:out value="${ml.idmail }"></c:out>" class="list-group-item <c:if test="${ml.vue }">read</c:if>">
										<div class="checkbox">
											<label> <input type="checkbox" style="margin-top: 7px">
											</label>
										</div> <span class="glyphicon glyphicon-star-empty"></span><span
										class="name" style="min-width: 120px; display: inline-block;"><c:out value="${ml.title }"></c:out> </span> <span
										class="text-muted" style="font-size: 11px;">- <c:out value="${ml.sender.nom}"></c:out>&nbsp;<c:out value="${ml.sender.prenom}"></c:out></span> <span class="badge" style=" float: right;"><c:out value="${ml.dateenvoi }"></c:out></span> <span
										class="pull-right"><span
											class="glyphicon glyphicon-paperclip"> </span></span>
									</a></c:forEach>
								</div>
							</div>
							<div class="tab-pane fade in" id="profile">
								<div class="list-group">
									<c:forEach items="${me.sentmails }" var="ml" >
									<a href="/easyscrumweb/userspace/mail?id= <c:out value="${ml.idmail }"></c:out>" class="list-group-item read">
										<div class="checkbox">
											<label> <input type="checkbox" style="margin-top: 7px">
											</label>
										</div> <span class="glyphicon glyphicon-star-empty"></span><span
										class="name" style="min-width: 120px; display: inline-block;"><c:out value="${ml.title }"></c:out> </span> <span class="text-muted" style="font-size: 11px;">- <c:out value="${ml.sender.nom}"></c:out>&nbsp;<c:out value="${ml.sender.prenom}"></c:out> <span class="badge" style=" float: right;"><c:out value="${ml.dateenvoi }"></c:out></span> <span
										class="pull-right"></span>
									</a></c:forEach>
								</div>
							</div>
							<div class="tab-pane fade in" id="messages">...</div>
							<div class="tab-pane fade in" id="settings">This tab is
								empty.</div>
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