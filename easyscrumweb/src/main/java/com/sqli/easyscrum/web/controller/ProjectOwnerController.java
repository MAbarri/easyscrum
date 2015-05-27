package com.sqli.easyscrum.web.controller;


import java.util.ArrayList;
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
import com.sqli.easyscrum.business.services.MailService;
import com.sqli.easyscrum.business.services.ProjectService;
import com.sqli.easyscrum.business.services.SprintService;
import com.sqli.easyscrum.business.services.TeamService;
import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.business.services.UserStoryService;
import com.sqli.easyscrum.entity.Backlog;
import com.sqli.easyscrum.entity.Mail;
import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.entity.Team;
import com.sqli.easyscrum.entity.User;
import com.sqli.easyscrum.web.vo.FormProjectObject;
import com.sqli.easyscrum.web.vo.Mails;

@Controller
@RequestMapping("/userspace")
public class ProjectOwnerController {
	
		protected static Logger logger = Logger.getLogger("controller");
		
		@Autowired
		private ProjectService projectService;
		
		@Autowired
		private MailService mailService;
		
		@Autowired
		private SprintService sprintService;

		@Autowired
		private UserService userService;
		
		@Autowired
		private BackLogService backlogService;
		
		@Autowired
		private TeamService teamService;
		@Autowired
		private UserStoryService usService;
		
		@RequestMapping(value = "/ManageProjects", method = RequestMethod.GET)
		public ModelAndView getCommonPage(HttpSession session)
		{
			final ModelAndView modelAndView = new ModelAndView();
			logger.info("Received request to show common page");
			modelAndView.addObject("projectslist", projectService.findAll() );
			session.setAttribute("user",userService.find((Integer) session.getAttribute("userid")));
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
		@RequestMapping(value = "/CreatProjects")
		public ModelAndView getresultPage(FormProjectObject fm,HttpSession session)
		{
			
			final ModelAndView modelAndView = new ModelAndView();
			logger.info("Received request to show common page");
			
			
			User resu=userService.find((Integer) session.getAttribute("userid"));
					
			Project result = fm.toProject(resu);

			projectService.save(result);
			
			logger.info("Project Created Successfully");
			modelAndView.setViewName("redirect:"+"ManageProjects");
			return modelAndView;
		}
		@RequestMapping(value = "/acceptjobapp")
		public ModelAndView getacceptjobappPage(HttpSession session,@RequestParam int team,@RequestParam int project)
		{
			final ModelAndView modelAndView = new ModelAndView();
			logger.info("Received request to show common page");
			User user = userService.find((Integer) session.getAttribute("userid"));
			session.setAttribute("user",user);
					
			
			List<Mail> mails = new ArrayList<Mail>();
			
			for(Mail inv :user.getRecievedmails())
				if(inv.getMailtype()==2)
					mails.add(inv);
			
			for(Mail i :mails)
				if(i.getAttachement().equals(String.valueOf(team+";"+project)))
				{
					Team tm = teamService.find(team);
					Project prj = projectService.find(project);
					prj.setWorkteam(tm);
					projectService.update(prj);
					logger.info("Update executed");
					Mails ml = new Mails();
					for(Mail notf:ml.JobAppNotifs(tm, prj))
							mailService.persist(notf);
	  			}
			modelAndView.setViewName("redirect:"+"ManageProjects");
			
			return modelAndView;
		}
		@RequestMapping(value = "/deleteproject")
		public ModelAndView deleteprojectPage(@RequestParam int id,HttpSession session)
		{
			final ModelAndView modelAndView = new ModelAndView();
			logger.info("Received request to show common page");
			User user = userService.find((Integer) session.getAttribute("userid"));
			session.setAttribute("user",user);
			
			Project target = projectService.find(id);
			if(target.getUser().getLogin().equals(user.getLogin()))
				projectService.remove(target);
			
			modelAndView.setViewName("redirect:"+"ManageProjects");
			return modelAndView;
		}
}