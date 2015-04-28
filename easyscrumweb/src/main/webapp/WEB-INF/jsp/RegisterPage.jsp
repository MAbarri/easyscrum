<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">

</head>
<body>
	<!-- Main navbar -->
	<%@ include file="Component/PublicMenupage.jsp"%>

	<!-- Sign Up wizard -->
	<div id="cover" class="backsite">

		<div class="registrepanel">
			<div class="titletext">Join EasyScrum Now.</div>
			<div id="registertabs">
				<div class="row">
					<div class="col-md-12" style=" background-color: rgb(240, 240, 240); margin-left: 5%;width:90%">
						<div class="tabbable-panel">
							<div class="tabbable-line">
								<ul class="nav nav-tabs ">
									<li class="active"><a href="#tab_default_1"
										data-toggle="tab"> as a Client </a></li>
									<li><a href="#tab_default_2" data-toggle="tab"> as a
											Developper </a></li>
									<li><a href="#tab_default_3" data-toggle="tab"> as a
											Team Master </a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active registersingltab" id="tab_default_1">
										<form action="newAccount" method="post">
											<table class="tableregister">
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
														id="exampleInputEmail1" placeholder="Email" required name="email"></td>
													<td>&nbsp;*</td>
													<td><c:out value="${ListErreur['email']}"></c:out></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><input type="password" class="form-control"
														id="InputPassword1" placeholder="Password" required name="pass"></td>
													<td>&nbsp;*</td>
													<td><c:out value="${ListErreur['pass']}"></c:out></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><input type="password" class="form-control"
														id="confirmInputPassword1" placeholder="Confirm Password" name="confpass" required></td>
													<td>&nbsp;*</td>
													<td><c:out value="${ListErreur['confpass']}"></c:out></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><input type="text"
														class="form-control inscriptioninput" id="ImputName" placeholder="First name" required name="name">
														<input type="text" class="form-control inscriptioninput" id="ImputLname"
														placeholder="Last name" name="lname"></td>
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
												<tr><td>ps: You'll be able to connect with both: email or login !</td></tr>
												<tr>
													<td>&nbsp;</td>
												</tr>

												<tr>
													<td><input type="checkbox" name="accept" required> I
														have read and I accept the terms and conditions of the
														site !</td>
													<td>&nbsp;*</td>
												</tr>
												<td><c:out value="${error.echeckmail}"></c:out></td>

												<tr>
													<td>&nbsp;</td>
												</tr>

												<tr>
													<td colspan="2"><button type="submit"
															class="btn btn-success creatButton">Creer un
															compte</button></td>
												</tr>
												<td><c:out value="${error.general}"></c:out></td>

											</table>
										</form>
									</div>
									<div class="tab-pane registersingltab" id="tab_default_2">
										<form action="newAccount" method="post">
											<table class="tableregister">
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
														id="exampleInputEmail1" placeholder="Email" required name="email"></td>
													<td>&nbsp;*</td>
													<td><c:out value="${ListErreur['email']}"></c:out></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><input type="password" class="form-control"
														id="InputPassword1" placeholder="Password" required name="pass"></td>
													<td>&nbsp;*</td>
													<td><c:out value="${ListErreur['pass']}"></c:out></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><input type="password" class="form-control"
														id="confirmInputPassword1" placeholder="Confirm Password" name="confpass" required></td>
													<td>&nbsp;*</td>
													<td><c:out value="${ListErreur['confpass']}"></c:out></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><input type="text"
														class="form-control inscriptioninput" id="ImputName" placeholder="First name" required name="name">
														<input type="text" class="form-control inscriptioninput" id="ImputLname"
														placeholder="Last name" name="lname"></td>
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
												<tr><td>ps: You'll be able to connect with both: email or login !</td></tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
<tr>
													<td>
												      <select class="form-control" id="sel1">
												        <option value="" disabled selected>Specialisation :</option>
												        <option>Web developer</option>
												        <option>Web designer</option>
												        <option>Desktop developer</option>
												        <option>Desktop designer</option>
												      </select>
													</td>
													<td><c:out value="${error.adresse}"></c:out></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><input type="checkbox" name="accept" required> I
														have read and I accept the terms and conditions of the
														site !</td>
													<td>&nbsp;*</td>
												</tr>
												<td><c:out value="${error.echeckmail}"></c:out></td>

												<tr>
													<td>&nbsp;</td>
												</tr>

												<tr>
													<td colspan="2"><button type="submit"
															class="btn btn-success creatButton">Creer un
															compte</button></td>
												</tr>
												<td><c:out value="${error.general}"></c:out></td>

											</table>
										</form>
									</div>
									<div class="tab-pane registersingltab" id="tab_default_3">
									<form action="newAccount" method="post">
											<table class="tableregister">
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
														id="exampleInputEmail1" placeholder="Email" required name="email"></td>
													<td>&nbsp;*</td>
													<td><c:out value="${ListErreur['email']}"></c:out></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><input type="password" class="form-control"
														id="InputPassword1" placeholder="Password" required name="pass"></td>
													<td>&nbsp;*</td>
													<td><c:out value="${ListErreur['pass']}"></c:out></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><input type="password" class="form-control"
														id="confirmInputPassword1" placeholder="Confirm Password" name="confpass" required></td>
													<td>&nbsp;*</td>
													<td><c:out value="${ListErreur['confpass']}"></c:out></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><input type="text"
														class="form-control inscriptioninput" id="ImputName" placeholder="First name" required name="name">
														<input type="text" class="form-control inscriptioninput" id="ImputLname"
														placeholder="Last name" name="lname"></td>
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
												<tr><td>ps: You'll be able to connect with both: email or login !</td></tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
<tr>
													<td>
												      <select class="form-control" id="sel1">
												        <option value="" disabled selected>Specialisation :</option>
												        <option>Web developer</option>
												        <option>Web designer</option>
												        <option>Desktop developer</option>
												        <option>Desktop designer</option>
												      </select>
													</td>
													<td><c:out value="${error.adresse}"></c:out></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><input type="checkbox" name="accept" required> I
														have read and I accept the terms and conditions of the
														site !</td>
													<td>&nbsp;*</td>
												</tr>
												<td><c:out value="${error.echeckmail}"></c:out></td>

												<tr>
													<td>&nbsp;</td>
												</tr>

												<tr>
													<td colspan="2"><button type="submit"
															class="btn btn-success creatButton">Creer un
															compte</button></td>
												</tr>
												<td><c:out value="${error.general}"></c:out></td>

											</table>
										</form>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="Component/footer.jsp"%>
</body>
</html>