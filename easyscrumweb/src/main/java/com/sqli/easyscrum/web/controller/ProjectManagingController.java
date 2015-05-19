package com.sqli.easyscrum.web.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sqli.easyscrum.business.services.BackLogService;
import com.sqli.easyscrum.business.services.ProjectService;
import com.sqli.easyscrum.business.services.SprintService;
import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.business.services.UserStoryService;
import com.sqli.easyscrum.entity.User;

@Controller
@RequestMapping("/userspace")
public class ProjectManagingController {
	
	protected static Logger logger = Logger.getLogger("controller");
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private SprintService sprintService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private BackLogService backlogService;
	@Autowired
	private UserStoryService usService;
	
	
	@RequestMapping(value = "/ManageSprints", method = RequestMethod.GET)
	public ModelAndView getSprintsPage(HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		User resu=userService.find((Integer) session.getAttribute("userid"));
		session.setAttribute("user",resu); 
		modelAndView.addObject("projectslist", resu.getProjects());
		resu=null;
		modelAndView.setViewName("sharedpages/ProjectsSprints");
		return modelAndView;
	}
		
	@RequestMapping(value = "/project", method = RequestMethod.GET)
	public ModelAndView getsingleprojectPage(@RequestParam int idproject,HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		User res=userService.find((Integer) session.getAttribute("userid"));
		session.setAttribute("user",res); 
		modelAndView.addObject("project", projectService.find(idproject));
		modelAndView.addObject("projectslist", res.getProjects());
		res=null;
		modelAndView.setViewName("sharedpages/singleproject");
		return modelAndView;
	}
	@RequestMapping(value = "/allSprints", method = RequestMethod.GET)
	public ModelAndView getSprintsprojectPage(@RequestParam int idproject,HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		
		User res=userService.find((Integer) session.getAttribute("userid"));
		session.setAttribute("user",res); 
		modelAndView.addObject("project", projectService.find(idproject));
		modelAndView.addObject("Sprintslist", projectService.find(idproject).getSprints());
		modelAndView.addObject("projectslist", res.getProjects());
		res=null;
		modelAndView.setViewName("sharedpages/SprintsOverview");
		return modelAndView;
	}
	@RequestMapping(value = "/singleSprint", method = RequestMethod.GET)
	public ModelAndView getOneSprintPage(@RequestParam int idSprint,@RequestParam int idprojet,HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		User res=userService.find((Integer) session.getAttribute("userid"));
		session.setAttribute("user",res); 
		modelAndView.addObject("projectslist", res.getProjects());
		//modelAndView.addObject("spr", projectService.getSprintById(idSprint, projectService.find(idprojet)));
		modelAndView.setViewName("sharedpages/singleSprint");
		return modelAndView; 
	}
	@RequestMapping(value = "/projectbacklog", method = RequestMethod.GET)
	public ModelAndView getbacklogPage(HttpSession session,@RequestParam int id) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		User res=userService.find((Integer) session.getAttribute("userid"));
		session.setAttribute("user",res);
		modelAndView.addObject("project", projectService.find(id));
		res=null;
		modelAndView.setViewName("sharedpages/backlog");

		return modelAndView;
	}

}
