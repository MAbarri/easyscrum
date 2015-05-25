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
			
				<form action="createsprint" method="POST">
					<div class="onesprintbyone">
				<label>Sprint :&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" name="nom" placeholder="Name" style="width: 400px; display: inline;"> 
				 </label><br> <label>Description:<br><textarea class="form-control" name="description" rows="8" placeholder="Message text" style="width:600px;margin:auto;"></textarea>
					</label>
				<br><br>
				<table><tr><td><label>Date de debut Sprint :&nbsp;&nbsp;&nbsp;</label></td><td><input type="date" name="dtd" /></td></tr>
				<tr><td><label>Date fin estimée :</label></td><td><input type="date" name="dtf"/></td></tr>
				<tr><td><label>Priority :</label></td><td><select name="Priority"><option>Top priority</option><option>Important</option><option>Moderate</option><option>Optional</option><option>You can skip it</option> </select></td></tr>
				</table>
				</div>
				<input name="projectid" value="<c:out value="${param.idprojet}"></c:out>">
				<button type="button" class="btn btn-primary btn-sm">Cancel</button>
				<button type="submit" class="btn btn-primary btn-sm rightbubble">Start new Sprint</button>				
				</form>
				
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