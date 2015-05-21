package com.sqli.easyscrum.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sqli.easyscrum.business.services.ProjectService;
import com.sqli.easyscrum.business.services.SprintService;
import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.entity.Team;
import com.sqli.easyscrum.entity.User;

@Controller
@RequestMapping("/connect")
public class ConnectController {

	protected static Logger logger = Logger.getLogger("controller");
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private SprintService sprintService;

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/Present", method = RequestMethod.GET)
	public ModelAndView getsingleprojectPage(HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		User res = userService.find((Integer) session.getAttribute("userid"));
		session.setAttribute("user",res); 
		List<Team> tms=userService.find((Integer) session.getAttribute("userid")).getTeams();
		List <Project> resultlist = new ArrayList<Project>();
		for(Team tm:tms)
			resultlist=tm.getProjects();
		modelAndView.addObject("projectslist", resultlist);
		//modelAndView.addObject("project", projectService.find(idproject));
		res=null;
		modelAndView.setViewName("presentation/connect");
		return modelAndView;
	}
	
}
