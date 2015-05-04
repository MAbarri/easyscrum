<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <!--  
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/js/gritter/css/jquery.gritter.css" />
  -->
  <link href="${pageContext.request.contextPath}/resources/css/style-responsive.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
  <title>EasyScrum - <decorator:title /></title>

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="${pageContext.request.contextPath}/resources/js/html5shiv.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/respond.min.js"></script>
  <![endif]-->
  <decorator:head />
  
</head>
<c:set var="actif" value="${sessionScope['scopedTarget.userSession'].user.actif}"/>
<c:if test="${actif}">
<body class="sticky-header">
<jsp:directive.page session="true" />

<c:set var="selectedMenu" scope="request">
<decorator:getProperty property='meta.menu' />
</c:set>
<c:set var="selectedSubMenu" scope="request">
<decorator:getProperty property='meta.subMenu' />
</c:set>
<c:set var="actifView" value="${sessionScope['scopedTarget.userSession'].currentRole}"/>

<section>
	
    <!-- left side start-->
    <div class="left-side sticky-left-side">

        <!--logo and iconic logo start-->
        <div class="logo">
            <a href=""><img src="${pageContext.request.contextPath}/resources/images/logo_sqli2.png" alt=""></a>
        </div>

        <div class="logo-icon text-center">
            <a href=""><img src="${pageContext.request.contextPath}/resources/images/logo_icon.png" alt=""></a>
        </div>
        <!--logo and iconic logo end-->
        
        <div class="left-side-inner">
            <!-- visible to small devices only -->
            <div class="visible-xs hidden-sm hidden-md hidden-lg">
                <div class="media logged-user">
                    <img alt="" src="${pageContext.request.contextPath}/resources/images/avatar.png" class="media-object">
                    <div class="media-body">
                        <span>"Hello There..."</span>
                    </div>
                </div>
            </div>

            <!--sidebar nav start-->
            <ul class="nav nav-pills nav-stacked custom-nav">
                <li class="menu-list ${selectedMenu == 'administration' ? 'nav-active' : ''}"><a href="/"><i class="fa fa-laptop"></i> <span>Administration</span></a>
                    <ul class="sub-menu-list">
                        <li class="${selectedSubMenu == 'ajoutCompte' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/blank_page.html"> Créer un compte</a></li>
                        <li class="${selectedSubMenu == 'listUsers' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/#"> Liste des utilisateurs</a></li>
                    </ul>
                </li>
                <li class="menu-list ${selectedMenu == 'maFormation' ? 'nav-active' : ''}"><a href="${pageContext.request.contextPath}/"><i class="fa fa-book"></i> <span>Ma formation</span></a>
                    <ul class="sub-menu-list">
                        <li class="${selectedSubMenu == 'listFormations' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/main/formation/liste"> Liste des formations</a></li>
                        <li class="${selectedSubMenu == 'propFormation' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/"> Proposer une formation</a></li>
                    </ul>
                </li>

                <li class="menu-list ${selectedMenu == 'gestionFormation' ? 'nav-active' : ''}"><a href="${pageContext.request.contextPath}/"><i class="fa fa-archive"></i> <span>Gestion de formation</span></a>
                    <ul class="sub-menu-list">
                        <li class="${selectedSubMenu == 'creaFormation' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/main/formation/afficher"> Créer fiche session</a></li>
                        <li class="${selectedSubMenu == 'tabEval' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/main/formation/tableau-evaluation"> Tableau d'évaluation</a></li>
                        <li class="${selectedSubMenu == 'creaQCM' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/main/qcm/afficher"> Créer QCM</a> </li>
                        <li class="${selectedSubMenu == 'listQCMs' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/main/qcm/liste"> Liste des QCMs</a> </li>
                    </ul>
                </li>
            </ul>
            <!--sidebar nav end-->
        </div>
    </div>
    <!-- left side end-->
    
    <!-- main content start-->
    <div class="main-content" >

        <!-- header section start-->
        <div class="header-section">

         
        <div class="btn-group btn-justified menu-left">
            <sec:authorize access="hasRole('ROLE_ADMIN')">
            <a class="btn ${actifView == 'ROLE_ADMIN'? 'btn-primary' : 'btn-default' } btn-lg" href="${pageContext.request.contextPath}/auth/changeProfil/admin">Administrateur</a>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_MANAGER')">
            <a class="btn ${actifView == 'ROLE_MANAGER'? 'btn-primary' : 'btn-default' } btn-lg" href="${pageContext.request.contextPath}/auth/changeProfil/manager">Manager</a>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_FORMATEUR')">
            <a class="btn ${actifView == 'ROLE_FORMATEUR'? 'btn-primary' : 'btn-default' } btn-lg" href="${pageContext.request.contextPath}/auth/changeProfil/formateur">Formateur</a>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_COLLAB')">
            <a class="btn ${actifView == 'ROLE_COLLAB'? 'btn-primary' : 'btn-default' } btn-lg" href="${pageContext.request.contextPath}/auth/changeProfil/collab">Collaborateur</a>
        	</sec:authorize>
        </div>
        <!--notification menu start -->
        <div class="menu-right">
            <ul class="notification-menu">
                <li>
                    <a href="" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <img src="${pageContext.request.contextPath}/resources/images/avatar.png" alt="" />
                        ${sessionScope['scopedTarget.userSession'].user.nomComplet}
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                        <li><a href=""><i class="fa fa-user"></i>  Profile</a></li>
                        <c:url var="logoutUrl" value="/auth/logout" />
                        <li><a href="${logoutUrl}"><i class="fa fa-sign-out"></i> Log Out</a></li>
                    </ul>
                </li>   
            </ul>
        </div>
        </div>
        

        <!--body wrapper start-->
        <div class="wrapper">
           <decorator:body />
        </div>
        <!--body wrapper end-->
		
    </div>
    <!-- main content end-->
</section>
</c:if>
<c:if test="${not actif}">
<decorator:body/>
</c:if>

<!-- Placed js at the end of the document so the pages load faster  -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<decorator:getProperty property="page.bottom_javascript"></decorator:getProperty>
<!--common scripts for all pages
 <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>-->
<!-- <script>
$(document).ready(function(){
	<c:if test="${not empty message}">
	$.gritter.add({
        text: '${message}'
    });
	return false;
	</c:if>
});
</script>
 -->
</body>
</html>