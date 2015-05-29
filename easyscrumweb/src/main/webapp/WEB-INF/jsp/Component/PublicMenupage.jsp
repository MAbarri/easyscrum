
	<div id="header">
		<nav class="navbar navbar-inverse norandomespace">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar-collapse-4">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/easyscrumweb/home">EasyScrum</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse membermenu" id="navbar-collapse-4">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/easyscrumweb/start">Get Started</a></li>
						<li><a href="/easyscrumweb/about">About</a></li>
						<li><a href="/easyscrumweb/services">Our Team</a></li>
						<li><a href="/easyscrumweb/contact">Contact</a></li>
						<li><a
							class="btn btn-default btn-outline btn-circle collapsed"
							data-toggle="collapse" href="#nav-collapse4"
							aria-expanded="false" aria-controls="nav-collapse4">Member Space <i
								class=""></i>
						</a></li>
					</ul>
					<ul class="collapse nav navbar-nav nav-collapse slide-down"
						role="search" id="nav-collapse4">
						<form class="navbar-form navbar-right form-inline memberli" role="form" method="post" 
								action="${pageContext.request.contextPath}/j_spring_security_check" style="  width: 730px;"/>
			              <div class="form-group">
			                <label class="sr-only" for="Email">Email</label>
			                <input type="text" class="form-control" id="Email" placeholder="Email" name="j_username" autofocus required />
			              </div>
			              <div class="form-group">
			                <label class="sr-only" for="Password">Password</label>
			                <input type="password" class="form-control has-error" id="Password" placeholder="password" name="j_password" required />
			              </div>
			              <button type="submit" class="btn btn-success">Sign in</button>
			              <div class="registerb"><a href="/easyscrumweb/userspace/register"><button type="button" class="btn btn-info">Sign up</button></a></div>
			            </form>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container -->
		</nav>
		<!-- /.navbar -->
	</div>