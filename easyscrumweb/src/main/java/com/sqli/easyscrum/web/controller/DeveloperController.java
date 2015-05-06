package com.sqli.easyscrum.web.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sqli.easyscrum.business.services.ProjectService;
import com.sqli.easyscrum.business.services.SprintService;

@Controller
@RequestMapping("/userspace")
public class DeveloperController {
	
	protected static Logger logger = Logger.getLogger("controller");
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private SprintService sprintService;
	
	@RequestMapping(value = "/CheckProjects", method = RequestMethod.GET)
	public ModelAndView getCommonPage()
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.addObject("projectslist", projectService.getAllProject());
		modelAndView.setViewName("devloper/devProjects");
		return modelAndView;
	}
	@RequestMapping(value = "/getnewProject", method = RequestMethod.GET)
	public ModelAndView getnewProjectPage()
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		//get project not started yet
		modelAndView.addObject("projectslist", projectService.getAllProject());
		modelAndView.setViewName("devloper/getnewProject");
		return modelAndView;
	}
	
}
