package com.sqli.easyscrum.web.controller;


import java.util.List;
import java.util.Set;

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
import com.sqli.easyscrum.entity.Backlog;
import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.entity.User;

@Controller
@RequestMapping("/userspace")
public class ProjectOwnerController {
	
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
		
		@RequestMapping(value = "/ManageProjects", method = RequestMethod.GET)
		public ModelAndView getCommonPage(HttpSession session)
		{
			final ModelAndView modelAndView = new ModelAndView();
			logger.info("Received request to show common page");
			modelAndView.addObject("projectslist", projectService.findAll() );
			List<User> results = userService.findUserByLogin(session.getAttribute("login").toString() );
			User resu=results.get(0);
			session.setAttribute("user",resu );
			resu=null;
			modelAndView.setViewName("projectowner/PoProjects");
			return modelAndView;
		}
		@RequestMapping(value = "/newProject", method = RequestMethod.GET)
		public ModelAndView getWizardPage()
		{
			final ModelAndView modelAndView = new ModelAndView();
			logger.info("Received request to show common page");
			modelAndView.setViewName("projectowner/NewProject");
			return modelAndView;
		}
		@RequestMapping(value = "/CreatProjects", method = RequestMethod.GET)
		public ModelAndView getresultPage(FormProjectObject fm,HttpSession session)
		{
			
			final ModelAndView modelAndView = new ModelAndView();
			logger.info("Received request to show common page");
			
			List<User> results = userService.findUserByLogin(session.getAttribute("login").toString() );
			User resu=results.get(0);
					
			
			Project result = fm.toProject(resu);
			//List<Backlog> bklg1 = result.getBacklogs();
			//usService.persist( bklg1.get(0).getStories().get(0));
			projectService.save(result);
			
			logger.info("Project Created Successfully");
			modelAndView.setViewName("redirect:ManageProjects");
			return modelAndView;
		}
		
		@RequestMapping(value = "/ManageSprints", method = RequestMethod.GET)
		public ModelAndView getSprintsPage(HttpSession session)
		{
			final ModelAndView modelAndView = new ModelAndView();
			logger.info("Received request to show common page");
			List<User> results = userService.findUserByLogin(session.getAttribute("login").toString() );
			User resu=results.get(0);
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
			List<User> results = userService.findUserByLogin(session.getAttribute("login").toString() );
			User res=results.get(0);
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
			
			List<User> results = userService.findUserByLogin(session.getAttribute("login").toString() );
			User res=results.get(0);
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
			
			
			List<User> results = userService.findUserByLogin(session.getAttribute("login").toString() );
			User resu=results.get(0);
			session.setAttribute("user",resu); 
			modelAndView.addObject("projectslist", resu.getProjects());
			//modelAndView.addObject("spr", projectService.getSprintById(idSprint, projectService.find(idprojet)));
			resu=null;
			modelAndView.setViewName("sharedpages/singleSprint");
			return modelAndView; 
		}
		@RequestMapping(value = "/projectbacklog", method = RequestMethod.GET)
		public ModelAndView getbacklogPage(HttpSession session,@RequestParam int id) {
			final ModelAndView modelAndView = new ModelAndView();
			logger.info("Received request to show common page");
			List<User> results = userService.findUserByLogin(session.getAttribute("login").toString() );
			User resu=results.get(0);
			session.setAttribute("user",resu);
			modelAndView.addObject("project", projectService.find(id));
			resu=null;
			modelAndView.setViewName("sharedpages/backlog");

			return modelAndView;
		}
}