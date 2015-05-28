<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="${pageContext.request.contextPath}/resources/css/style-responsive.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/responsiveeasyscrum.css" rel="stylesheet"/>
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet"/>
		<title>EasyScrum - <decorator:title /></title>
		<decorator:head />
</head>
<body>
	
	<decorator:body />
	
	
<!-- Placed js at the end of the document so the pages load faster  -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<decorator:getProperty property="page.bottom_javascript"></decorator:getProperty>
</body>
</html>