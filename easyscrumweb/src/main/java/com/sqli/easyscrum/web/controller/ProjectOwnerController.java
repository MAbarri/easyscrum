package com.sqli.easyscrum.web.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sqli.easyscrum.business.services.ProjectService;
import com.sqli.easyscrum.business.services.SprintService;
import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.entity.Backlog;
import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.entity.Sprint;
import com.sqli.easyscrum.entity.User;
import com.sqli.easyscrum.entity.UserStorie;

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
		
		@RequestMapping(value = "/ManageProjects", method = RequestMethod.GET)
		public ModelAndView getCommonPage()
		{
			final ModelAndView modelAndView = new ModelAndView();
			logger.info("Received request to show common page");
			modelAndView.addObject("projectslist", projectService.getAllProject());
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
		public ModelAndView getresultPage(FormProjectObject fm)
		{
			final ModelAndView modelAndView = new ModelAndView();
			logger.info("Received request to show common page");
			UserStorie us=new UserStorie(3, fm.getUstext());
			Backlog bklg = new Backlog(4,fm.getBacklogtitle(),"today",us);
			Project prj = new Project(3, fm.getNom(), fm.getSel2(), fm.getSel1(), fm.getDescription(), fm.getTags(), fm.getCost(), fm.getCompany(), fm.getEmail(), "12/12/12", bklg, "getting started", "today", "--");
			projectService.creatProject(prj);
			us=null;
			bklg=null;
			prj=null;
			logger.info("Project Created Successfully");
			modelAndView.setViewName("redirect:ManageProjects");
			return modelAndView;
		}
		
		@RequestMapping(value = "/ManageSprints", method = RequestMethod.GET)
		public ModelAndView getSprintsPage(HttpSession session)
		{
			final ModelAndView modelAndView = new ModelAndView();
			logger.info("Received request to show common page");
			modelAndView.addObject("projectslist", projectService.getAllProject());
			modelAndView.addObject("Sprintslist", sprintService.getAllSprint());
			User res = userService.getUserByLogin(session.getAttribute("login").toString() );
			session.setAttribute("usertype",res.getType() );
			res=null;
			modelAndView.setViewName("sharedpages/ProjectsSprints");
			return modelAndView;
		}
		
		@RequestMapping(value = "/project", method = RequestMethod.GET)
		public ModelAndView getsingleprojectPage(@RequestParam int idproject,HttpSession session)
		{
			final ModelAndView modelAndView = new ModelAndView();
			logger.info("Received request to show common page");
			modelAndView.addObject("project", projectService.getProjectById(idproject));
			modelAndView.addObject("projectslist", projectService.getAllProject());
			modelAndView.addObject("Sprintslist", sprintService.getAllSprint());
			User res = userService.getUserByLogin(session.getAttribute("login").toString() );
			session.setAttribute("usertype",res.getType() );
			res=null;
			modelAndView.setViewName("sharedpages/singleproject");
			return modelAndView;
		}
		@RequestMapping(value = "/allSprints", method = RequestMethod.GET)
		public ModelAndView getSprintsprojectPage(@RequestParam int idproject,HttpSession session)
		{
			final ModelAndView modelAndView = new ModelAndView();
			logger.info("Received request to show common page");
			modelAndView.addObject("project", projectService.getProjectById(idproject));
			modelAndView.addObject("projectslist", projectService.getAllProject());
			modelAndView.addObject("Sprintslist", sprintService.getAllSprint());
			User res = userService.getUserByLogin(session.getAttribute("login").toString() );
			session.setAttribute("usertype",res.getType() );
			res=null;
			modelAndView.setViewName("sharedpages/SprintsOverview");
			return modelAndView;
		}
		@RequestMapping(value = "/singleSprint", method = RequestMethod.GET)
		public ModelAndView getOneSprintPage(@RequestParam int idSprint,HttpSession session)
		{
			final ModelAndView modelAndView = new ModelAndView();
			logger.info("Received request to show common page");
			modelAndView.addObject("projectslist", projectService.getAllProject());
			modelAndView.addObject("Sprintslist", sprintService.getAllSprint());
			Sprint res=sprintService.getsprintById(idSprint);
			logger.info(res.getStatus());
			modelAndView.addObject("spr", res);
			User resu = userService.getUserByLogin(session.getAttribute("login").toString() );
			session.setAttribute("usertype",resu.getType() );
			resu=null;
			modelAndView.setViewName("sharedpages/singleSprint");
			return modelAndView;
		}
}