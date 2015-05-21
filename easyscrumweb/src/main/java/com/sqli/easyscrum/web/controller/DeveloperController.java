package com.sqli.easyscrum.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sqli.easyscrum.business.services.ProjectService;
import com.sqli.easyscrum.business.services.SprintService;
import com.sqli.easyscrum.business.services.TeamService;
import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.entity.Team;
import com.sqli.easyscrum.entity.User;

@Controller
@RequestMapping("/userspace")
public class DeveloperController {
	
	protected static Logger logger = Logger.getLogger("controller");
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private TeamService teamService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SprintService sprintService;
	
	@RequestMapping(value = "/CheckProjects", method = RequestMethod.GET)
	public ModelAndView getCommonPage(HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		List<Team> tms=userService.find((Integer) session.getAttribute("userid")).getTeams();
		List <Project> resultlist = new ArrayList<Project>();
		for(Team tm:tms)
			resultlist=tm.getProjects();
		modelAndView.addObject("projectslist", resultlist);
		modelAndView.setViewName("devloper/devProjects");
		return modelAndView;
	}
	@RequestMapping(value = "/getnewProject", method = RequestMethod.GET)
	public ModelAndView getnewProjectPage()
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		//get project not started yet
		modelAndView.addObject("projectslist", projectService.findAll());
		modelAndView.setViewName("devloper/getnewProject");
		return modelAndView;
	}
	
}
