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
<link rel="stylesheet"
	href="/easyscrumweb/resources/bootstrap-table/bootstrap-table.css">
<link rel="stylesheet"
	href="/easyscrumweb/resources/bootstrap-table/bootstrap-table.min.css">
<!-- DataTables CSS -->


</head>
<body style="font-size: 150%">
	<!-- Main navbar -->
	<%@ include file="Component/adminMenupage.jsp"%>
	<div id="cover" class="backprofil">

		<div class="panel panel-default clientPanel">
			<div class="panel-heading">Liste des Utilisateurs</div>
			<div class="panel-body">

				<table class="table .table-striped" data-toggle="table">
					<tr>
						<th>Item</th>
						<th>Nom</th>
						<th>Prenom</th>
						<th>Email</th>
						<th>Login</th>
						<th>Mot de passe</th>
						<th>Adresse</th>
					</tr>
					<c:forEach items="${userlist}" var="u">
						<tr>
							<td><input type="checkbox"/></td>
							<td><c:out value="${u.nom }"></c:out></td>
							<td><c:out value="${u.prenom }"></c:out></td>
							<td><c:out value="${u.email }"></c:out></td>
							<td><c:out value="${u.login }"></c:out></td>
							<td><c:out value="${u.password }"></c:out></td>
							<td><c:out value="${u.adresse }"></c:out></td>
					</c:forEach>
				</table>
				<center>Jquery import problem with mvc resources</center>
				<center>
				<!-- ---------------------------Creat---------------------------- -->
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary btn-lg"
						data-toggle="modal" data-target="#myModal">Add</button>

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
								<div class="modal-body">
									<div class="tabbable-line">
										<ul class="nav nav-tabs ">
											<li class="active"><a href="#tab_default_1"
												data-toggle="tab">Project Owner </a></li>
											<li><a href="#tab_default_2" data-toggle="tab">Developper </a></li>
											<li><a href="#tab_default_3" data-toggle="tab">
													Scrum Master </a></li>
										</ul>
										<div class="tab-content">
											<div class="tab-pane active registersingltab"
												id="tab_default_1">
												<form action="addAccount" method="post" >
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
																id="exampleInputEmail1" placeholder="Email" required
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
													<input type="submit" id="sendform" />
												</form>
											</div>
											<div class="tab-pane registersingltab" id="tab_default_2">
												<form action="newAccount" method="post">
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
																id="exampleInputEmail1" placeholder="Email" required
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
													<input type="submit" id="sendform" />
												</form>
											</div>
											<div class="tab-pane registersingltab" id="tab_default_3">
												<form action="newAccount" method="post">
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
																id="exampleInputEmail1" placeholder="Email" required
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
													<input type="submit" id="sendform" />
												</form>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Cancel</button>
									<button type="button" class="btn btn-primary" onclick="submit()">Add User</button>
								</div>
							</div>
						</div>
					</div>
					<!-- ---------------------------Update---------------------------- -->
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary btn-lg"
						data-toggle="modal" data-target="#myModal2">Edit</button>

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
												<form action="addAccount" method="post" >
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
																id="exampleInputEmail1" placeholder="Email" required
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
													<input type="submit" id="sendform" />
												</form>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Cancel</button>
									<button type="button" class="btn btn-primary" onclick="submit()">Add User</button>
								</div>
							</div>
						</div>
					</div>
					
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary btn-lg"
						data-toggle="modal" data-target="#myModal3">Delete</button>
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
										<br><br>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Cancel</button>
									<button type="button" class="btn btn-primary" onclick="submit()" data-dismiss="modal">Yup, they deserve</button>
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
	<script
		src="/easyscrumweb/resources/bootstrap-table/bootstrap-table.js"></script>
	<-- put your locale files after bootstrap-table.js -->
	<script
		src="/easyscrumweb/resources/bootstrap-table/bootstrap-table-en-US.js"></script>
		<script type="text/javascript">
		function submit()
		{
			document.getElementById("sendform").click();
		}
		</script>
</body>
</html>