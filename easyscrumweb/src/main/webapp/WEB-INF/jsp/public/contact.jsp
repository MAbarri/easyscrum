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
	<%@ include file="../Component/PublicMenupage.jsp"%>

	<div id="cover" class="backsite">

		<div class="panel panel-default clientPanel">
			<div class="panel-heading">Mail to Supportsl</div>
			<div class="panel-body msgpanel">
			<form action="userspace/sendmail?id=0" method="POST">
				<div class="shadow">
					Send a Mail to administration<br>
				</div>
				<div class="shadow">
				<br>
					 <input name="mailtitle" class="form-control" type="text" id="mailtitle" placeholder="Title"> <br>
					<textarea name="mailtext" id="mailtext" class="form-control" rows="8" placeholder="Message text"></textarea>
					<br>
				</div>
				
				<button type="button" class="btn btn-primary btn-sm">Cancel</button>
				 <button type="submit" class="btn btn-primary btn-sm rightbubble">Send Message</button>
				 </form>
			</div>
		</div>
	</div>
	<!-- footer -->
	<div class="Upspace">
	<%@ include file="../Component/footer.jsp"%></div>
</body>
</html>