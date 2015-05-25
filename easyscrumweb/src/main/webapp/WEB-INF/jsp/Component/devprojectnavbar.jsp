<div class="nav-side-menu">
			<div class="brand">EasyScrum</div>
			<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
				data-target="#menu-content"></i>

			<div class="menu-list">

				<ul id="menu-content" class="menu-content collapse out">
					<li><a href="/easyscrumweb/userspace/ManageProjects"> <i
							class="fa fa-dashboard fa-lg"></i> Projects
					</a></li>
					<c:forEach items="${user.projects }" var="p">
						<li data-toggle="collapse"
							data-target="#products-<c:out value="${p.nomproject}"></c:out>"
							class="collapsed"><a href="#"><i
								class="fa fa-gift fa-lg"></i> <c:out value="${p.nomproject}"></c:out>
								<span class="arrow"></span></a></li>
						<ul class="sub-menu collapse"
							id="products-<c:out value="${p.nomproject}"></c:out>">
							<c:forEach items="${p.sprints }" var="sprint">
							<li><a href="/easyscrumweb/userspace/singleSprint?idSprint=<c:out value="${sprint.idsprint }"></c:out>"><c:out value="${sprint.nom }"></c:out></a></li>
							</c:forEach>
						</ul>
					</c:forEach>


					<li data-toggle="collapse" data-target="#service" class="collapsed">
						<a href="#"><i class="fa fa-globe fa-lg"></i> Stats</a>
					</li>



				</ul>
			</div>
		</div>