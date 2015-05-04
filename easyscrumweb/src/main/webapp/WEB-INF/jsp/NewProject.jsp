<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/easyscrumweb/resources/css/wizardcss.css">
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">
<title>New Project Wizard</title>
</head>
<body>
	<!-- Main navbar -->
	<%@ include file="Component/UserMenupage.jsp"%>

	<div id="cover" class="backprofil">

		<div class="panel panel-default clientPanel">
			<div class="panel-heading">Projects</div>
			<div class="panel-body wizardplace">
				<div class="stepwizard">
					<div class="stepwizard-row setup-panel">
						<div class="stepwizard-step">
							<a href="#step-1" type="button"
								class="btn btn-primary btn-circlewizard">1</a>
							<p>Step 1</p>
						</div>
						<div class="stepwizard-step">
							<a href="#step-2" type="button"
								class="btn btn-default btn-circlewizard" disabled="disabled">2</a>
							<p>Step 2</p>
						</div>
						<div class="stepwizard-step">
							<a href="#step-3" type="button"
								class="btn btn-default btn-circlewizard" disabled="disabled">3</a>
							<p>Step 3</p>
						</div>
						<div class="stepwizard-step">
							<a href="#step-4" type="button"
								class="btn btn-default btn-circlewizard" disabled="disabled">4</a>
							<p>Step 4</p>
						</div>
					</div>
				</div>
				<form role="form" class="centerformwiz" action="CreatProjects">
					<div class="row setup-content" id="step-1">
						<div class="col-xs-12">
							<div class="col-md-12">
								<h3>Step 1</h3>
								<div class="form-group">
									<label class="control-label">Project Name</label> <input
										maxlength="100" type="text" required="required"
										class="form-control" placeholder="Project Name" name="nomp" />
								</div>
								<div class="form-group">
									<label class="control-label">Project Type</label> <select
										class="form-control" id="sel1">
										<option value="" disabled selected>Type :</option>
										<option>Web App</option>
										<option>Mobile App</option>
										<option>Desktop App</option>
										<option>Other</option>
									</select>
								</div>
								<div class="form-group">
									<label class="control-label">Language</label> <select
										class="form-control" id="sel1">
										<option value="" disabled selected>Language :</option>
										<option>English</option>
										<option>French</option>
										<option>Arabic</option>
										<option>Spanish</option>
									</select>
								</div>
								<button class="btn btn-primary nextBtn btn-lg pull-right"
									type="button">Next</button>
							</div>
						</div>
					</div>
					<div class="row setup-content" id="step-2">
						<div class="col-xs-12">
							<div class="col-md-12">
								<h3>Step 2</h3>
								<div class="form-group">
									<label class="control-label">Description</label> 
									<textarea class="form-control" rows="5" id="Description"></textarea>
								</div>
								<div class="form-group">
									<label class="control-label">Important facts</label> <input
										maxlength="200" type="text" required="required"
										class="form-control" placeholder="what u hate to see and what u Love to see" />
								</div>
								<button class="btn btn-primary nextBtn btn-lg pull-right"
									type="button">Next</button>
							</div>
						</div>
					</div>
					<div class="row setup-content" id="step-3">
						<div class="col-xs-12">
							<div class="col-md-12">
								<h3>Step 2</h3>
								<div class="form-group">
									<label class="control-label">Basic Backlog</label> <input
										maxlength="200" type="text" required="required"
										class="form-control" placeholder="Title of the Backlog" />
										</div>
										<div class="form-group">
									<label class="control-label">Write in details What you want</label> <input
										maxlength="200" type="text" required="required"
										class="form-control" placeholder="User Stories" />
								</div>
								<div id="space"></div>
								<button type="button" class="btn btn-default navbar-btn" onclick="addplace()">More space please</button>
								
								
								<button class="btn btn-primary nextBtn btn-lg pull-right"
									type="button">Next</button>
							</div>
						</div>
					</div>
					<div class="row setup-content" id="step-4">
						<div class="col-xs-12">
							<div class="col-md-12">
								<h3>Final Step</h3>
								<div class="form-group">
								<label class="control-label">Durée du projet</label> <input
										maxlength="200" type="text" required="required"
										class="form-control" placeholder="Durée en semaines" />
								</div>
								<div class="form-group">
								<label class="control-label">Cost of project</label> <input
										maxlength="200" type="text" required="required"
										class="form-control" placeholder="value $" />
								</div>
								<div class="form-group">
								<label class="control-label">Company</label> <input
										maxlength="200" type="text" required="required"
										class="form-control" placeholder="client company" />
								</div>
								<div class="form-group">
								<label class="control-label">Email where You will recieve updates about the project</label> <input
										maxlength="200" type="text" required="required"
										class="form-control" placeholder="Email" />
								</div>
								<button class="btn btn-success btn-lg pull-right" type="submit">Finish!</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="stickfoot">
		<center>CHAT SPACE</center>
	</div>
	<script src="/easyscrumweb/resources/js/jquery-1.10.2.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {

							var navListItems = $('div.setup-panel div a'), allWells = $('.setup-content'), allNextBtn = $('.nextBtn');

							allWells.hide();

							navListItems
									.click(function(e) {
										e.preventDefault();
										var $target = $($(this).attr('href')), $item = $(this);

										if (!$item.hasClass('disabled')) {
											navListItems.removeClass(
													'btn-primary').addClass(
													'btn-default');
											$item.addClass('btn-primary');
											allWells.hide();
											$target.show();
											$target.find('input:eq(0)').focus();
										}
									});

							allNextBtn
									.click(function() {
										var curStep = $(this).closest(
												".setup-content"), curStepBtn = curStep
												.attr("id"), nextStepWizard = $(
												'div.setup-panel div a[href="#'
														+ curStepBtn + '"]')
												.parent().next().children("a"), curInputs = curStep
												.find("input[type='text'],input[type='url']"), isValid = true;

										$(".form-group").removeClass(
												"has-error");
										for (var i = 0; i < curInputs.length; i++) {
											if (!curInputs[i].validity.valid) {
												isValid = false;
												$(curInputs[i]).closest(
														".form-group")
														.addClass("has-error");
											}
										}

										if (isValid)
											nextStepWizard.removeAttr(
													'disabled')
													.trigger('click');
									});

							$('div.setup-panel div a.btn-primary').trigger(
									'click');
						});
	</script>
	<script type="text/javascript">
	function addplace()
	{
		document.getElementById("space").innerHTML+="<div class=\"form-group\"><label class=\"control-label\">More Space</label> <input	maxlength=\"200\" type=\"text\" required=\"required\" class=\"form-control\" placeholder=\"User Stories\" /></div>";
	}
	</script>
</body>
</html>