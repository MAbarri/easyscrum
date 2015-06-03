<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Project owner Desktop</title>
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">
</head>
<body>

	<!-- Main navbar -->
	<%@ include file="../Component/UserMenupage.jsp"%>	
	<div id="cover" class="backprofil">
	<!-- Page component -->
	
	<!-- /.row -->
            <div class="row leftbubble centerbubbles" id="newsroot">
                <div class="col-lg-4 col-md-3">
                    <div class="panel">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">
										<c:out value="${nbnormalmsgs }"></c:out>
									</div>
                                    <div>New Messages!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
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
                                    <div class="huge"><c:out value="${nbteammsgs }"></c:out></div>
                                    <div>New Team Invitations!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
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
                                    <div class="huge"><c:out value="${nbjobmsgs }"></c:out></div>
                                    <div>New Project Updates!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
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
                                    <div class="huge"><c:out value="${nbmsgs }"></c:out></div>
                                    <div>All!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
    <!-- /.row -->
	
	
	
		<!--feed-->
	<div class="col-lg-4 notificationpanel" style="  max-width: 400px;">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw"></i> Notifications Panel
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="list-group">
                             <div id="bottom-bar"></div>
                            </div>
                            <!-- /.list-group -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
                <!-- /.col-lg-4 -->
<!-- Recent work -->

	<div class="col-lg-8 centerbubbles activitiespanel">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Recent Activities
                        </div>
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
   <script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
	<script>
			var cacheData;
			var data = $('#bottom-bar').html();
			var auto_refresh = setInterval(
			function ()
			{
			    $.ajax({
			        url: 'newsbox',
			        type: 'POST',
			        data: data,
			        dataType: 'html',
			        success: function(data) {
			            if (data !== cacheData){
			                //data has changed (or it's the first call), save new cache data and update div
			                cacheData = data;
			                $('#bottom-bar').html(data);
			            }
			        }
			    })
			}, 600); // check every 30000 milliseconds
			
			</script>
</body>
</html>