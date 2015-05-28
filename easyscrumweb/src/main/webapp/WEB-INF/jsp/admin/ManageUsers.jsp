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
			<div class="panel-heading">Users List</div>
			<div class="panel-body">


				<table id="example" class="display" cellspacing="0" width="100%">
					<thead>
					 <tr>
						<th>Item</th>
						<th>First Name</th>
						<th>Last name</th>
						<th>Email</th>
						<th>Login</th>
						<th>Password</th>
						<th>Adresse</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${userlist}" var="u">
						<tr >
							<td><input type="checkbox" name="checkselect" class="dunno" value='<c:out value="${u.userId }"></c:out>' onclick="checkit()"/></td>
							<td id="nomatt<c:out value="${u.userId }"></c:out>"><c:out value="${u.nom }"></c:out></td>
							<td id="prenomatt<c:out value="${u.userId }"></c:out>"><c:out value="${u.prenom }"></c:out></td>
							<td id="emailatt<c:out value="${u.userId }"></c:out>"><c:out value="${u.email }"></c:out></td>
							<td id="loginatt<c:out value="${u.userId }"></c:out>"><c:out value="${u.login }"></c:out></td>
							<td id="passatt<c:out value="${u.userId }"></c:out>"><c:out value="${u.password }"></c:out></td>
							<td id="adresseatt<c:out value="${u.userId }"></c:out>"><c:out value="${u.adresse }"></c:out></td>
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
					<button type="button" class="btn btn-primary btn-lg" id="edit" 
										onclick="submitupdate()">Edit</button>

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
								<form action="updateAccount" method="post">
								<div class="modal-body">
									<div class="tab-content">
										<div class="tab-pane active registersingltab"
											id="tab_default_1">
											
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
															id="updateInputPassword1" placeholder="Password" required
															name="pass"></td>
														<td>&nbsp;*</td>
														<td><c:out value="${ListErreur['pass']}"></c:out></td>
													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><input type="text"
															class="form-control inscriptioninput" id="updateImputName"
															placeholder="First name" required name="name"> <input
															type="text" class="form-control inscriptioninput"
															id="updateImputLname" placeholder="Last name" name="lname"></td>
														<td>&nbsp;*</td>
														<td><c:out value="${ListErreur['Fullname']}"></c:out></td>
													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><input type="text" class="form-control"
															id="updateImputAdresse" placeholder="Adresse" name="adresse"></td>
														<td><c:out value="${ListErreur['adresse']}"></c:out></td>
													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><input type="text" class="form-control"
															id="updateImputlogin" placeholder="Login" name="login"></td>
														<td><c:out value="${ListErreur['login']}"></c:out></td>
													</tr>

													<tr>
														<td>&nbsp;<input type="text" class="form-control" style="display:none"
															id="oldid" placeholder="Login" name="typestinrg"></td></td>
													</tr>

													<tr>
														<td><c:out value="${error.general}"></c:out></td>
													</tr>


												</table>
												<input type="submit" id="updateform" style="display:none"/>
										</div>
									</div>
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Cancel</button>
									<button type="submit" class="btn btn-primary">Update User</button>
								</div>
								</form>
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
								<form action="deleteAccounts" method="post">
									<center>Are You sure about deleting these accounts with all their projects, mails and data ?</center>
									<input type="text" id="hiddenIDs" style="display:none" name="typestinrg" />
									<br> <br>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Cancel</button>
									<button type="submit" class="btn btn-primary">Yup, they
										deserve</button>
								</form>
								</div>
							</div>
						</div>
					</div>

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
		  $(".dunno").click(function() {
			  var id;
			  var delet="";
			  if ($('.dunno:checked').length) {
		          var chkId = '';
		          $('.dunno:checked').each(function () {
		        	  id=$(this).val();
		        	  delet+=$(this).val()+";";
		          });
			
		          
			var aim = "#emailatt" +id;
			$("#updateInputEmail1").val($(aim).text());
			aim="#nomatt"+id;
			$("#updateImputName").val($(aim).text());
			aim="#prenomatt"+id;
			$("#updateImputLname").val($(aim).text());
			aim="#loginatt"+id;
			$("#updateImputlogin").val($(aim).text());
			aim="#passatt"+id;
			$("#updateInputPassword1").val($(aim).text());
			aim="#adresseatt"+id;
			$("#updateImputAdresse").val($(aim).text());
			$("#oldid").val(id);
			$("#hiddenIDs").val(delet);
			
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
	<script type="text/javascript">
		function typeuser()
		{
			if(document.getElementById("seltype").selectedIndex=="1")
				document.getElementById("sel1").style.display = "none";
			else
				document.getElementById("sel1").style.display = "block";
				
		}
	</script>
	<script type="text/javascript">
		function submitupdate()
		{
			var count =document.querySelectorAll('input[type="checkbox"]:checked').length;
			if(count==0)
				{
				alert("Please select a user !")
				document.getElementById("edit").setAttribute("data-toggle", "");
				document.getElementById("edit").setAttribute("data-target", "");
				}
			else if(count >0)
				{
				document.getElementById("edit").setAttribute("data-toggle", "modal");
				document.getElementById("edit").setAttribute("data-target", "#myModal2");
				}
				
		}
	</script>
	
</content>
</body>
</html>	