<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Teams Overview</title>
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">
<link rel="stylesheet" href="/easyscrumweb/resources/css/card.css">
<link rel="stylesheet" href="/easyscrumweb/resources/css/card.min.css">
</head>
<body>

	<!-- Main navbar -->
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
			<div class="panel-heading">Getting Project Recap</div>
			<div class="panel-body">
			<center>
			<div class="shadow" style="width: 50%;margin-top: 6%;">
			<table>
				<tr>
					<td colspan="2"><h1>Summary</h1></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr><tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td><label>Project :</label></td><td><a href="/easyscrumweb/userspace/project?idproject=<c:out value="${project.projectId }"></c:out>"><c:out value="${project.nomproject }"></c:out></a></td>
				</tr>
				<tr>
					<td><label>Project Owner :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td><td><a href="/easyscrumweb/userspace/Account?pro=<c:out value="${project.user.userId }"></c:out>"><c:out value="${project.user.nom}"></c:out>&nbsp;<c:out value="${project.user.prenom}"></c:out></a></td>
				</tr>
				<tr>
					<td><label>Team :</label></td><td><a href="/easyscrumweb/userspace/Team?idteam=<c:out value="${team.idteam }"></c:out>"><c:out value="${team.name }"></c:out></a></td>
				</tr>
			</table>
			<br><br>
			<button type="button" class="btn btn-default">Cancel</button>
			<form action="Projectselected?idteam=<c:out value="${team.idteam }"></c:out>&idpro=<c:out value="${project.projectId }"></c:out>" method="POST" style="display: inline;">
			<button type="submit" class="btn btn-primary">Confirme Getting this Project</button>
			</form>
			</div>
			</center>
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