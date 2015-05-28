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
		<h1>The EasyScrum experience</h1><br>
		<h4>Smart,Fast,Simple ans secured Developer/Client connecting space provider,</h4><h4> and professional project Managing and int's free for you.</h4>
		<a href="/easyscrumweb/start" style="text-decoration: none;">
		<button type="button"
			class="btn btn-default btn-lg btn-block homebutton">Get
			Started</button></a>
	</div>
	
	<div id="container" class="nospace tcenter">
	<h1>Services</h1>
	<div style="margin-left: 10%;">
		<div style="float: left; margin:10px;width: 300px;border: solid 1px;padding: 10px">
		<h3>Find Developer</h3>
		<p>EasyScrum offers a space when any Project Owner can find a wide choice of developement team to work on his project.</p>
		</div>
		<div style="float: left; margin:10px;width: 300px;border: solid 1px;padding: 10px">
		<h3>Get Connected</h3>
		<p>The Connection between a developer and his Client is the most important fact that leads to a successful project, therefore EasyScrum offers an amazing secured, fast and simple to use, connecting space to stay always connected to your projects or to your clients.</p>
		</div>
		<div style="float: left; margin:10px;width: 300px;border: solid 1px;padding: 10px">
		<h3>Find Client</h3>
		<p>EasyScrum is a place where any developer can start him self a freelance career, where he can find other developers, join developement teams, and find project to work on.</p>
		</div>
</div>
		
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br>
		
		<div class="divider"></div>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br>
		<h1>Partners</h1>
		<p>EasyScrum has two major partners that helped into building </p>
		<div>
		<img alt="OFPPT" src="${pageContext.request.contextPath}/resources/images/ofppt.gif" style="width: 25%;margin: 25px;border-radius: 8px;">
		<img alt="SQLI Groupe" src="${pageContext.request.contextPath}/resources/images/sqli.png" style="background-color: white; padding: 10px; width: 25%;margin: 25px;border-radius: 8px;">
		</div>
	</div>
<%@ include file="../Component/footer.jsp" %>
</body>