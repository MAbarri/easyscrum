<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mail</title>
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/sidebarstyle.css">
	<link rel="stylesheet"
	href="/easyscrumweb/resources/css/inboxstyle.css">
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
			<div class="panel-heading">Mail</div>
			<div class="panel-body msgpanel">
			<div class="shadow">
				<label>Envoyé par :</label>&nbsp;<c:out value="${currentmail.sender.login }"></c:out> <span style="float:right">Date d'envoi : <c:out value="${currentmail.dateenvoi }"></c:out></span>
				<br><label>A :</label>&nbsp;<c:out value="${currentmail.reciever.login }"></c:out>
				<br>
				</div>
				<div class="shadow">
				<label><c:out value="${currentmail.title }"></c:out></label>
				<br><br>
				<c:if test="${currentmail.mailtype == '4' }">
					<c:out value="${currentmail.text }"></c:out>
				</c:if>
				<c:if test="${currentmail.mailtype != '4' }">
					<c:out value="${currentmail.text }" escapeXml="false"></c:out>
				</c:if>
				<br>
				<c:if test="${currentmail.mailtype == '1' }">
					<div class="teaminvitation">
					<h4>invitation card</h4>
					<p>This is an invitation card sent by 
					<a href="/easyscrumweb/userspace/Account?pro=<c:out value="${currentmail.sender.userId}"></c:out>">
							<c:out value="${currentmail.sender.nom}"></c:out>&nbsp;<c:out
							value="${currentmail.sender.prenom}"></c:out></a>
					 to Join His team
					 <a href="/easyscrumweb/userspace/Team?idteam=<c:out value="${mailteam.idteam }"></c:out>"> <c:out value="${mailteam.name}"></c:out></a>
					  
					
					Do you want to Join it ?</p>
					<form action="acceptinviteteam" method="POST">
					<input name="team" id="team" value="<c:out value="${mailteam.idteam }"></c:out>" style="display:none;" />
					<c:if test="${sessionScope.user.type!='4'}">
					<button type="submit" class="btn btn-primary">Accept invitation</button>
					<a href="#"> <button type="button" class="btn btn-default">Delete Message</button></a>
					</c:if>
					</form>
					</div>
				</c:if>
				<c:if test="${currentmail.mailtype == '2' }">
					<div class="teaminvitation">
					<h4>invitation card</h4>
					<p>This is a Job Applicaction card sent by 
					<a href="/easyscrumweb/userspace/Account?pro=<c:out value="${currentmail.sender.userId}"></c:out>">
							<c:out value="${currentmail.sender.nom}"></c:out>&nbsp;<c:out
							value="${currentmail.sender.prenom}"></c:out></a>
					 for your Project <a href="/easyscrumweb/userspace/Account?pro=<c:out value="${project.user.userId }"></c:out>"><c:out value="${project.user.nom}"></c:out>&nbsp;<c:out value="${project.user.prenom}"></c:out></a>
					 <a href="/easyscrumweb/userspace/Team?idteam=<c:out value="${mailteam.idteam }"></c:out>"> <c:out value="${mailteam.name}"></c:out></a>
					  
					
					Do you want accept it ?</p>
					<form action="acceptjobapp" method="POST">
					<input name="team" id="team" value="<c:out value="${mailteam.idteam }"></c:out>" style="display:none;" />
					<input name="project" id="project" value="<c:out value="${project.projectId }"></c:out>" style="display:none;" />
					<c:if test="${sessionScope.user.type!='4'}">
					<button type="submit" class="btn btn-primary">Accept invitation</button>
					<a href="#"> <button type="button" class="btn btn-default">Delete Message</button></a>
					</c:if>
					</form>
					</div>
				</c:if>
				</div>
				<c:if test="${currentmail.mailtype == '3' }">
				<div class="shadow">
					<form action="sendmail" method="POST">
					<input name="destination" type="text" value="<c:out value="${currentmail.sender.login}"></c:out>" style="display: none">
					<input name="mailtitle" type="text" value="Reply to Your Message :<c:out value="${currentmail.title}"></c:out>" style="display: none">
					<label>Reply</label><br>
					<textarea name="mailtext" class="form-control" rows="8" placeholder="Message text"></textarea><br>
					<button type="submit" class="btn btn-default btn-sm rightbubble">Reply</button><br><br>
					</form>
				</div>
				</c:if>
				 <button type="button" class="btn btn-primary btn-sm">Return</button>
				  <button type="button" class="btn btn-primary btn-sm rightbubble">Delete message</button>
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