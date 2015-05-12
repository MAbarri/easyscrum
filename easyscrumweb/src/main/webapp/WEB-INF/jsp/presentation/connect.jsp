<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Projects Overview</title>
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">
<link rel="stylesheet" href="/easyscrumweb/resources/css/card.css">
<link rel="stylesheet" href="/easyscrumweb/resources/css/card.min.css">
<script src="//cdn.webrtc-experiment.com/getScreenId.js"></script>
<script src="//cdn.webrtc-experiment.com/screen.js"></script>
</head>
<body>

	<!-- Main navbar -->
	<%@ include file="../Component/UserMenupage.jsp"%>

	<div id="cover" class="backprofil">

		<div class="panel panel-default clientPanel">
			<div class="panel-heading">Demo Presentation</div>
			<div class="panel-body">
			<button id="hare-screen" value="start" >Start</button>
			</div>
		</div>
	</div>
	<div class="stickfoot">
		<center>CHAT SPACE</center>
	</div>
	<content tag="bottom_javascript">
<script type="text/javascript">
	var screen = new Screen('screen-unique-id'); // argument is optional

	//on getting local or remote streams
	screen.onaddstream = function(e) {
		document.body.appendChild(e.video);
	};

	//check pre-shared screens
	//it is useful to auto-view
	//or search pre-shared screens
	screen.check();

	document.getElementById('share-screen').onclick = function() {
		screen.share();
	};
</script>
</content>
</body>
</html>