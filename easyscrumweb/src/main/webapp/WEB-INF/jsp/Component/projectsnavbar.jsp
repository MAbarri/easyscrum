<div class="nav-side-menu">
			<div class="brand">EasyScrum</div>
			<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
				data-target="#menu-content"></i>

			<div class="menu-list">

				<ul id="menu-content" class="menu-content collapse out">
					<li><a href="/easyscrumweb/userspace/ManageProjects"> <i
							class="fa fa-dashboard fa-lg"></i> Projects
					</a></li>
					<c:forEach items="${projectslist }" var="p">
						<li data-toggle="collapse"
							data-target="#products-<c:out value="${p.nomproject}"></c:out>"
							class="collapsed"><a href="#"><i
								class="fa fa-gift fa-lg"></i> <c:out value="${p.nomproject}"></c:out>
								<span class="arrow"></span></a></li>
						<ul class="sub-menu collapse"
							id="products-<c:out value="${p.nomproject}"></c:out>">
							<li class="active"><a href="#">Sprint 1</a></li>
							<li><a href="#">Sprint 2</a></li>
							<li><a href="#">Sprint 3</a></li>
							<li><a href="#">Sprint 4</a></li>
						</ul>
					</c:forEach>


					<li data-toggle="collapse" data-target="#service" class="collapsed">
						<a href="#"><i class="fa fa-globe fa-lg"></i> Stats</a>
					</li>
					<ul class="sub-menu collapse" id="service">
						<li>New Service 1</li>
						<li>New Service 2</li>
						<li>New Service 3</li>
					</ul>


					<li data-toggle="collapse" data-target="#new" class="collapsed">
						<a href="#"><i class="fa fa-car fa-lg"></i> New <span
							class="arrow"></span></a>
					</li>
					<ul class="sub-menu collapse" id="new">
						<li>New Project</li>
						<li>New Sprint</li>
						<li>New Backlog</li>
					</ul>

				</ul>
			</div>
		</div>