package com.sqli.easyscrum.web.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sqli.easyscrum.business.services.ProjectService;
import com.sqli.easyscrum.business.services.SprintService;
import com.sqli.easyscrum.business.services.UserService;

@Controller
@RequestMapping("/userspace")
public class SmasterController {

	protected static Logger logger = Logger.getLogger("controller");

	@Autowired
	private UserService userService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private SprintService sprintService;

	@RequestMapping(value = "/ProjectsManaging", method = RequestMethod.GET)
	public ModelAndView getCommonPage()
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.addObject("projectslist", projectService.getAllProject());
		modelAndView.setViewName("scrummaster/SMProjects");
		return modelAndView;
	}
	@RequestMapping(value = "/newSprint", method = RequestMethod.GET)
	public ModelAndView getnewSprintPage()
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.addObject("projectslist", projectService.getAllProject());
		modelAndView.setViewName("scrummaster/newSprint");
		return modelAndView;
	}

}
