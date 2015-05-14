<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">
	
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="/easyscrumweb/resources/css/jquery.dataTables.css">
</head>
<body style="font-size: 150%">
	<!-- Main navbar -->
	<%@ include file="../Component/adminMenupage.jsp"%>
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
						<th>Mot de passe</th>
						<th>Adresse</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${userlist}" var="u">
						<tr onclick="checkme(this)" >
							<td><input type="checkbox" name="checkselect" id="dunno" value='<c:out value="${u.userId }"></c:out>' onclick="checkit()"/></td>
							<td><c:out value="${u.nom }"></c:out></td>
							<td><c:out value="${u.prenom }"></c:out></td>
							<td><c:out value="${u.email }"></c:out></td>
							<td><c:out value="${u.login }"></c:out></td>
							<td><c:out value="${u.password }"></c:out></td>
							<td><c:out value="${u.adresse }"></c:out></td>
							</tr>
					</c:forEach>
					</tbody>
				</table>
				<center>
					<!-- ---------------------------Creat---------------------------- -->
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary btn-lg"
						data-toggle="modal" data-target="#myModal" id="add">Add</button>

					<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">Ajout
										d'utilisateur</h4>
								</div>
								<form action="addAccount" method="post">
								<div class="modal-body">
								
									<div class="tab-pane registersingltab" id="tab_default_2">
													<table class="tableregister adminaddform">
														<tr>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td><select class="form-control" id="seltype" onchange="typeuser()" name="typestinrg">
																	<option value="" disabled selected>User rights
																		:</option>
																	<option>Project Owner</option>
																	<option>Developer</option>
																	<option>Scrum Master</option>
															</select></td>
															<td><c:out value="${error.adresse}"></c:out></td>
														</tr>
														<tr>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td><input type="email" class="form-control"
																id="exampleInputEmail2" placeholder="Email" required
																name="email"></td>
															<td>&nbsp;*</td>
															<td><c:out value="${ListErreur['email']}"></c:out></td>
														</tr>
														<tr>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td><input type="password" class="form-control"
																id="InputPassword1" placeholder="Password" required
																name="pass"></td>
															<td>&nbsp;*</td>
															<td><c:out value="${ListErreur['pass']}"></c:out></td>
														</tr>
														<tr>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td><input type="text"
																class="form-control inscriptioninput" id="ImputName"
																placeholder="First name" required name="name"> <input
																type="text" class="form-control inscriptioninput"
																id="ImputLname" placeholder="Last name" name="lname"></td>
															<td>&nbsp;*</td>
															<td><c:out value="${ListErreur['Fullname']}"></c:out></td>
														</tr>
														<tr>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td><input type="text" class="form-control"
																id="ImputAdresse" placeholder="Adresse" name="adresse"></td>
															<td><c:out value="${ListErreur['adresse']}"></c:out></td>
														</tr>
														<tr>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td><input type="text" class="form-control"
																id="ImputAdresse" placeholder="Login" name="login"></td>
															<td><c:out value="${ListErreur['login']}"></c:out></td>
														</tr>
														<tr>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td><select class="form-control" id="sel1">
																	<option value="" disabled selected>Specialisation
																		:</option>
																	<option>Web developer</option>
																	<option>Web designer</option>
																	<option>Desktop developer</option>
																	<option>Desktop designer</option>
															</select></td>
															<td><c:out value="${error.adresse}"></c:out></td>
														</tr>
														<tr>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td><c:out value="${error.general}"></c:out></td>
														</tr>
													</table>												
											</div>											
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Cancel</button>
									<button id="adduser" type="submit" class="btn btn-primary" >Add User</button>
								</div>
							</form>
							</div>
						</div>
					</div>
					<!-- ---------------------------Update---------------------------- -->
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary btn-lg"
						data-toggle="modal" data-target="#myModal2" id="edit">Edit</button>

					<!-- Modal -->
					<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">modification
										d'un utilisateur</h4>
								</div>
								<div class="modal-body">
									<div class="tab-content">
										<div class="tab-pane active registersingltab"
											id="tab_default_1">
											<form action="addAccount" method="post">
												<table class="tableregister adminaddform">
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><input type="email" class="form-control"
															id="updateInputEmail1" placeholder="Email" required
															name="email"></td>
														<td>&nbsp;*</td>
														<td><c:out value="${ListErreur['email']}"></c:out></td>
													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><input type="password" class="form-control"
															id="InputPassword1" placeholder="Password" required
															name="pass"></td>
														<td>&nbsp;*</td>
														<td><c:out value="${ListErreur['pass']}"></c:out></td>
													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><input type="text"
															class="form-control inscriptioninput" id="ImputName"
															placeholder="First name" required name="name"> <input
															type="text" class="form-control inscriptioninput"
															id="ImputLname" placeholder="Last name" name="lname"></td>
														<td>&nbsp;*</td>
														<td><c:out value="${ListErreur['Fullname']}"></c:out></td>
													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><input type="text" class="form-control"
															id="ImputAdresse" placeholder="Adresse" name="adresse"></td>
														<td><c:out value="${ListErreur['adresse']}"></c:out></td>
													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><input type="text" class="form-control"
															id="ImputAdresse" placeholder="Login" name="login"></td>
														<td><c:out value="${ListErreur['login']}"></c:out></td>
													</tr>

													<tr>
														<td>&nbsp;</td>
													</tr>

													<tr>
														<td><c:out value="${error.general}"></c:out></td>
													</tr>


												</table>
												<input type="submit" id="updateform" style="display:none"/>
											</form>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Cancel</button>
									<button type="button" class="btn btn-primary"
										onclick="submitupdate()">Update User</button>
								</div>
							</div>
						</div>
					</div>

					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary btn-lg"
						data-toggle="modal" data-target="#myModal3" id="delete">Delete</button>
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
									<h4 class="modal-title" id="myModalLabel">Suppression</h4>
								</div>
								<div class="modal-body">
									<center>Are You sure about deleting these accounts ?</center>
									<br> <br>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Cancel</button>
									<button type="button" class="btn btn-primary"
										onclick="submit()" data-dismiss="modal">Yup, they
										deserve</button>
								</div>
							</div>
						</div>
					</div>

				</center>
			</div>
		</div>
		<!-- Sticky footer -->
		<div class="stickfoot">
			<center>CHAT SPACE</center>
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
	
	function checkit()
	{
		var count =document.querySelectorAll('input[type="checkbox"]:checked').length;
		if(count>1)
			{
			document.getElementById("edit").className  = "btn btn-primary btn-lg disabled";
			document.getElementById("edit").style.backgroundColor="#B2B8BD";
			
			}
		else if(count<=1)
		{
			document.getElementById("edit").className  = "btn btn-primary btn-lg";
			document.getElementById("edit").style.backgroundColor="#424F63";
			}
		}
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
	<script type="text/javascript">
		function typeuser()
		{
			if(document.getElementById("seltype").selectedIndex=="1")
				document.getElementById("sel1").style.display = "none";
			else
				document.getElementById("sel1").style.display = "block";
				
		}
	</script>
</content>
</body>
</html>	