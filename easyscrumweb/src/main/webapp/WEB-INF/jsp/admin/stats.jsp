<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Statistics</title>
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">
</head>
<body style="font-size: 150%">
	<!-- Main navbar -->
	<%@ include file="../Component/adminMenupage.jsp"%>
	<div id="cover" class="backprofil">

		<div class="panel panel-default clientPanel">
			<div class="panel-heading">Server Information</div>
			<div class="panel-body" style="position: relative;">
			<div class="shadow" style="width: 25%">
			<table style="  width: 100%;">
			<c:out value="${osystem }" escapeXml="false"></c:out>
			</table></div>
			<br>
			<div class="shadow" style="width: 25%">
			<table style="  width: 100%;">
			<c:out value="${memory }" escapeXml="false"></c:out>
			</table>
			</div>
			<br>
			<div class="shadow" style="width: 70%;top:3%;right:3%;position: absolute;">
			<table style="  width: 100%;">
			<c:out value="${disk }" escapeXml="false"></c:out>
			</table>
			</div>
			<br>
				
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
	</div>
	<content tag="bottom_javascript">


</content>
</body>
</html>	