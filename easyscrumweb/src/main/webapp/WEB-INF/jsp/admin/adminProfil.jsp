<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>You are the BOSS</title>
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">
</head>
<body>
	<!-- Main navbar -->
	<%@ include file="../Component/adminMenupage.jsp"%>
	<div id="cover" class="backprofil">
		<!-- Page component -->

		<!-- /.row -->
		<div class="row leftbubble centerbubbles">
			<div class="col-lg-4 col-md-4">
				<div class="panel">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-comments fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">26</div>
								<div>New Messages!</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">View Details</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-lg-4 col-md-3">
				<div class="panel">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-tasks fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">12</div>
								<div>New Reports!</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">View Details</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-lg-4 col-md-3">
				<div class="panel">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-star-o fa-5x"></i>
							</div>	
							<div class="col-xs-9 text-right">
								<div class="huge">124</div>
								<div>NEW Support Messages!</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">View Details</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-lg-4 col-md-3">
				<div class="panel">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-plus fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">13</div>
								<div>All!</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">View Details</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
		</div>
		<!-- /.row -->



		<!--feed-->
		<div class="col-lg-4 notificationpanel">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-bell fa-fw"></i> Notifications Panel
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="list-group">
						<a href="#" class="list-group-item"> <i
							class="fa fa-comment fa-fw"></i> New Comment <span
							class="pull-right text-muted small"><em>4 minutes ago</em>
						</span>
						</a> <a href="#" class="list-group-item"> <i
							class="fa fa-twitter fa-fw"></i> 3 New Followers <span
							class="pull-right text-muted small"><em>12 minutes
									ago</em> </span>
						</a> <a href="#" class="list-group-item"> <i
							class="fa fa-envelope fa-fw"></i> Message Sent <span
							class="pull-right text-muted small"><em>27 minutes
									ago</em> </span>
						</a> <a href="#" class="list-group-item"> <i
							class="fa fa-tasks fa-fw"></i> New Task <span
							class="pull-right text-muted small"><em>43 minutes
									ago</em> </span>
						</a> <a href="#" class="list-group-item"> <i
							class="fa fa-upload fa-fw"></i> Server Rebooted <span
							class="pull-right text-muted small"><em>11:32 AM</em> </span>
						</a> <a href="#" class="list-group-item"> <i
							class="fa fa-bolt fa-fw"></i> Server Crashed! <span
							class="pull-right text-muted small"><em>11:13 AM</em> </span>
						</a> <a href="#" class="list-group-item"> <i
							class="fa fa-warning fa-fw"></i> Server Not Responding <span
							class="pull-right text-muted small"><em>10:57 AM</em> </span>
						</a> <a href="#" class="list-group-item"> <i
							class="fa fa-shopping-cart fa-fw"></i> New Order Placed <span
							class="pull-right text-muted small"><em>9:49 AM</em> </span>
						</a> <a href="#" class="list-group-item"> <i
							class="fa fa-money fa-fw"></i> Payment Received <span
							class="pull-right text-muted small"><em>Yesterday</em> </span>
						</a>
					</div>
				</div>
				<!-- /.panel-body -->
			</div>
		</div>
		<!-- /.col-lg-4 -->

		<!-- Recent work -->

		<div class="col-lg-8 centerbubbles">
			<div class="panel panel-default">
				<div class="panel-heading">Recent Activities</div>
				<div class="panel-body">
				<table style="width: 100%">
                        <c:forEach items="${activs}" var="r" end="5"><tr>
							<td><label>Activitie : </label></td><td><c:out value="${r.activities }"></c:out></td><td><label>Date :</label></td><td><c:out value="${r.dtActivities }"></c:out></td>
                        </tr></c:forEach>
                        </table>
                        <c:if test="${empty activs}"><center>no recent activities.</center></c:if>
				</div>
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
</body>
</html>