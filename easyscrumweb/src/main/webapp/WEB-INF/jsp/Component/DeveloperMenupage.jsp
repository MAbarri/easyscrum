
<!-- Second navbar for profile settings -->
<nav class="navbar navbar-inverse norandomespace" style="z-index: 99;">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar-collapse-4">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/easyscrumweb/userspace/profil">EasyScrum</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="navbar-collapse-4">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/easyscrumweb/userspace/profil">Home</a></li>
				<li><a href="/easyscrumweb/userspace/CheckProjects">projects</a></li>
				<li><a href="/easyscrumweb/userspace/TeamSpace">Teams</a></li>
				<li><a href="/easyscrumweb/userspace/inbox">Inbox</a></li>
				<li><a class="btn btn-default btn-outline btn-circle collapsed"
					data-toggle="collapse" href="#nav-collapse4" aria-expanded="false"
					aria-controls="nav-collapse4">Profile <i class=""></i>
				</a></li>
			</ul>
			<ul class="collapse nav navbar-nav nav-collapse slide-down"
				role="search" id="nav-collapse4">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"><img
						class="img-circle"
						src="/easyscrumweb/resources/images/
						<c:choose>
						<c:when test="${not empty userpicture}"><c:out value="${userpicture }"></c:out></c:when>
						<c:otherwise>defaultavatar.jpg</c:otherwise>
						</c:choose>
						"
						alt="maridlcrmn" width="20" /> <c:out value="${sessionScope.userlogin}"></c:out> <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/easyscrumweb/userspace/Account?pro=0">My profile</a></li>
						<li class="divider"></li>
						<li><a href="/easyscrumweb/account_logout">Logout</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
</nav>
