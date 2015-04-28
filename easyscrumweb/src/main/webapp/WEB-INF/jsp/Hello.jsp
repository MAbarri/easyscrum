<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	votre login :<c:out value="${login }"></c:out>
	votre password :<c:out value="${ password}"></c:out>
	<div style="margin:300px;">
	<table border="1" width="50%">
		<tr>
		<td>La Liste</td>
		</tr>
		<c:forEach items="${list}" var="a">
		<tr>
		<td><c:out value="${a}"></c:out></td>
		</tr>
		</c:forEach>
		
	</table>
	</div>
</body>
</html>