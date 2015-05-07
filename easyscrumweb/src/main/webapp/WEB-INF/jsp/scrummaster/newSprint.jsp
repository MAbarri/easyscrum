<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sprint</title>
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/projectcard.css">
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/sidebarstyle.css">
</head>
<body>
			<!-- Main navbar -->
			<%@ include file="../Component/smastermenupage.jsp"%>

	<div id="cover" class="backprofil">
	
	<%@ include file="../Component/smatserprojectnavbar.jsp"%>
		<div class="panel panel-default clientPanel sprintpanel">
			<div class="panel-heading">
				Project
				<c:out value="${sprint.nom }"></c:out>
			</div>
			<div class="panel-body">
			
				
					<div class="onesprintbyone">
				<label>Sprint :&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" placeholder="Name" style="width: 400px; display: inline;"> 
				 </label><br> <label>Description:<br><textarea class="form-control" rows="8" placeholder="Message text" style="width:600px;margin:auto;"></textarea>
					</label>
				<br><br>
				<table><tr><td><label>Date de debut Sprint :&nbsp;&nbsp;&nbsp;</label></td><td><input type="date" /></td></tr>
				<tr><td><label>Date fin estimée :</label></td><td><input type="date" /></td></tr>
				<tr><td><label>Priority :</label></td><td><select><option>Top priority</option><option>Important</option><option>Moderate</option><option>Optional</option><option>You can skip it</option> </select></td></tr>
				</table>
				</div>
				<button type="button" class="btn btn-primary btn-sm">Cancel</button>
				<button type="button" class="btn btn-primary btn-sm rightbubble">Start new Sprint</button>				
				
				
			</div>
		</div>

	</div>
	<div class="stickfoot">
		<center>CHAT SPACE</center>
	</div>

</body>
</html>