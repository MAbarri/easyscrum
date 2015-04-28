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
			<div class="titletext">Welcome Honorable guest.</div>
			<div id="registertabs">
				registration done !
				check your email adresse to confirme
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="Component/footer.jsp"%>
</body>
</html>