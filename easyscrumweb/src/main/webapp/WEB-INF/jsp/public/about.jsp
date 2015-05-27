<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
	<link rel="stylesheet"
	href="/easyscrumweb/resources/css/thetimeline.css">
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">

</head>
<body>
	<!-- Main navbar -->
	<%@ include file="../Component/PublicMenupage.jsp"%>

	<div id="cover" class="backsite">

		<div class="registrepanel getstart" style="background-color: rgb(255, 255, 255);margin-bottom: 20px">
			 <ul class="timeline">
        <li>
          <div class="timeline-badge"><i class="glyphicon glyphicon-check"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">EasyScrum project Started</h4>
              <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i> 01/04/2015</small></p>
            </div>
            <div class="timeline-body">
              <p>This Web site at the beggining was only a training project, The student Mohamed Abarri had 2 months of training in IISS SQLI Groupe, and this was His project, He's awsome isn't he ?</p>
            </div>
          </div>
        </li>
        <li>
          <div class="timeline-badge danger"><i class="glyphicon glyphicon-credit-card"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">First deploiement of EasyScrum</h4>
              <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i> 01/05/2015</small></p>
            </div>
            <div class="timeline-body">
              <p>After two weeks of studing, Mohamed was able to deploie his application for the first time, it was a really glorious day for him.</p>
            </div>
          </div>
        </li>
        <li>
          <div class="timeline-badge info"><i class="glyphicon glyphicon-floppy-disk"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Project's Final Phases</h4>
              <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i> 22/05/2015</small></p>
            </div>
            <div class="timeline-body">
              <p>By the 20's of Mai, Mohamed had already passed the 80% work in the project, he was working on the final phases of the project, and the training report.</p>
            </div>
          </div>
        </li>
        <li>
          <div class="timeline-badge info"><i class="glyphicon glyphicon-floppy-disk"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Project creation end</h4>
              <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i> 02/06/2015</small></p>
            </div>
            <div class="timeline-body">
              <p>after two Months of work, Mohamed completed all his work with the project, he was proud that only in 2month he was able to learn a new programming language, 2 major frameworks of that laguage and a new database system managin.</p>
            </div>
          </div>
        </li>
    </ul>
		</div>
	</div>
</body>
</html>