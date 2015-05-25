<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Team</title>

<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">
<link rel="stylesheet" href="/easyscrumweb/resources/css/inboxstyle.css">
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="/easyscrumweb/resources/css/jquery.dataTables.css">
</head>
<body style="font-size: 150%">
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
			<div class="panel-heading">Liste des Utilisateurs</div>
			<div class="panel-body">


				<table id="example" class="display" cellspacing="0" width="100%">
					<thead>
					 <tr>
						<th>Item</th>
						<th>Nom</th>
						<th>Prenom</th>
						<th>Email</th>
						<th>Login</th>
						<th>Adresse</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${userlist}" var="u">
					<c:out value="${u.needteam }"></c:out>
					<c:if test="${u.needteam }">
						<tr >
							<td><input type="checkbox" name="checkselect" class="dunno" value='<c:out value="${u.userId }"></c:out>' onclick="checkit()"/></td>
							<td id="nomatt<c:out value="${u.userId }"></c:out>"><c:out value="${u.nom }"></c:out></td>
							<td id="prenomatt<c:out value="${u.userId }"></c:out>"><c:out value="${u.prenom }"></c:out></td>
							<td id="emailatt<c:out value="${u.userId }"></c:out>"><c:out value="${u.email }"></c:out></td>
							<td id="loginatt<c:out value="${u.userId }"></c:out>"><c:out value="${u.login }"></c:out></td>
							<td id="adresseatt<c:out value="${u.userId }"></c:out>"><c:out value="${u.adresse }"></c:out></td>
							</tr>
					</c:if>
					</c:forEach>
					</tbody>
				</table>
				<center>
					<!-- ---------------------------Cancel---------------------------- -->
					<!-- Button trigger modal -->
					<a href="#"> <button type="button" class="btn btn-default btn-lg" id="add">Cancel</button></a>


					<!-- ---------------------------Clear Selected---------------------------- -->
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-default btn-lg" id="edit" 
										onclick="clearchecks()">Clear</button>

					
					<!-- ---------------------------Invite Users---------------------------- -->
					<!-- Button trigger modal -->
					<form action="InviteUsers" method="get" style="display: inline;">
					<input type="text" name="selected" style="display: none" id="selected" />
					<input type="text" name="idteam" style="display: none" id="idteam" value="<c:out value="${param.idteam}"></c:out>"/>
					<button type="submit" class="btn btn-primary btn-lg" id="delete">Invite Users</button>
					</form>

				</center>
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


<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="/easyscrumweb/resources/js/Jquery-datatable/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('#example').DataTable();
		});
	</script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		  $(".dunno").click(function() {
			  var id;
			  var add="";
			  if ($('.dunno:checked').length) {
		          var chkId = '';
		          $('.dunno:checked').each(function () {
		        	  id=$(this).val();
		        	  add+=$(this).val()+";";
		          });
	
		          $("#selected").val(add);
			
			  }
		  });
		});
	</script>		
	<script type="text/javascript">
	$(document).ready(function() {
		  $('tr').click(function(event) {
		    if (event.target.type !== 'checkbox') {
		      $(':checkbox', this).trigger('click');
		    }
		  });
		});
	</script>
	
</content>
	
</body>
</html>