<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>Home Page</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/CostumeStyle.css">
</head>
<body>
	<!-- Main navbar -->
		<%@ include file="../Component/PublicMenupage.jsp" %>

	<div class="subheader nospace tcenter">
		<h1>EasyScrum is the best</h1>
		<p>Description ..................................................</p>
		<a href="/easyscrumweb/start">
		<button type="button"
			class="btn btn-default btn-lg btn-block homebutton">Get
			Started</button></a>
	</div>
	<div id="container" class="nospace tcenter">
		<h1>Some Text</h1>
		<p>Some Pictures down here</p>

		<div class="divider"></div>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br>
		<h1>Some Text</h1>
		<p>Some Pictures down here</p>
		
		<div class="divider"></div>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br>
		<h1>Some Text</h1>
		<p>Some Pictures down here</p>
		<button type="button"
			class="btn btn-default btn-lg btn-block homebutton">Hey look ! A button</button>
	</div>
<%@ include file="../Component/footer.jsp" %>
</body>