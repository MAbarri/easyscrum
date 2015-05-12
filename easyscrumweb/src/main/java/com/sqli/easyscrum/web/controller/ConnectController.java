package com.sqli.easyscrum.web.controller;

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
	public ModelAndView getsingleprojectPage(@RequestParam int idproject,HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		List<User> results = userService.findUserByLogin(session.getAttribute("login").toString() );
		User res=results.get(0);
		session.setAttribute("user",res); 
		modelAndView.addObject("project", projectService.find(idproject));
		modelAndView.addObject("projectslist", res.getProjects());
		res=null;
		modelAndView.setViewName("presentation/connect");
		return modelAndView;
	}
	
}
