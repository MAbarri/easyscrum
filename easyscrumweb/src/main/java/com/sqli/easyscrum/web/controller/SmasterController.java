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

import com.sqli.easyscrum.business.services.MailService;
import com.sqli.easyscrum.business.services.ProjectService;
import com.sqli.easyscrum.business.services.SprintService;
import com.sqli.easyscrum.business.services.TeamService;
import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.entity.Mail;
import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.entity.Sprint;
import com.sqli.easyscrum.entity.Team;
import com.sqli.easyscrum.entity.User;
import com.sqli.easyscrum.web.vo.FormSprintObject;
import com.sqli.easyscrum.web.vo.Mails;

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
	
	@Autowired
	private TeamService teamService;
	
	@Autowired
	private MailService mailService;

	@RequestMapping(value = "/ProjectsManaging", method = RequestMethod.GET)
	public ModelAndView getCommonPage(HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		User user =userService.find((Integer) session.getAttribute("userid"));
		session.setAttribute("user",user);
		//getting all type of project related to the Scrum Master
		List<Project> list = new ArrayList<Project>();
		List<Team> tlist = new ArrayList<Team>();
		
		tlist.addAll(user.getTeamchef());
		tlist.addAll(user.getTeams());
		
		for(Team i : tlist)
			list.addAll(i.getProjects());
		
		modelAndView.addObject("projectslist", list);
		modelAndView.addObject("page", "canadd");
		
		modelAndView.setViewName("scrummaster/SMProjects");
		return modelAndView;
	}
	@RequestMapping(value = "/newSprint", method = RequestMethod.GET)
	public ModelAndView getnewSprintPage(HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");

		User user=userService.find((Integer) session.getAttribute("userid"));
		session.setAttribute("user",user); 


		List<Project> list = new ArrayList<Project>();
		List<Team> tlist = new ArrayList<Team>();
		
		tlist.addAll(user.getTeamchef());
		tlist.addAll(user.getTeams());
		
		for(Team i : tlist)
			list.addAll(i.getProjects());
		list.addAll(user.getProjects());
		modelAndView.addObject("projectslist", list);
		
		modelAndView.setViewName("scrummaster/newSprint");
		return modelAndView;
	}
	
	@RequestMapping(value = "/getnewProjectselection", method = RequestMethod.GET)
	public ModelAndView getselectprojectPage(HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		
		session.setAttribute("user",userService.find((Integer) session.getAttribute("userid")));
		//getting all type of project related to the Scrum Master
		List<Project> listini =projectService.findAll();
		List<Project> list = new ArrayList<Project>();
		
		for(Project i : listini)
			if(i.getWorkteam()==null)
				list.add(i);
		
		modelAndView.addObject("projectslist", list);
		modelAndView.addObject("page", "projects");
		modelAndView.setViewName("scrummaster/SMProjects");
		return modelAndView;
	}
	@RequestMapping(value = "/Getproject", method = RequestMethod.GET)
	public ModelAndView getsingleprojectPage(@RequestParam int idproject,HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		User res=userService.find((Integer) session.getAttribute("userid"));
		session.setAttribute("user",res); 
		modelAndView.addObject("project", projectService.find(idproject));
		modelAndView.addObject("projectslist", res.getProjects());
		modelAndView.addObject("getproject",true);
		
		res=null;
		modelAndView.setViewName("sharedpages/singleproject");
		return modelAndView;
	}
	@RequestMapping(value = "/selectTeam", method = RequestMethod.POST)
	public ModelAndView getmyteamsPage(HttpSession session,@RequestParam int idpro)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		session.setAttribute("user",userService.find((Integer) session.getAttribute("userid")));
		modelAndView.addObject("project",idpro);
		modelAndView.addObject("selectteam",true);
		modelAndView.setViewName("teams/myteams");
		return modelAndView;
	}
	@RequestMapping(value = "/GetRecap")
	public ModelAndView getrecapPage(HttpSession session,@RequestParam int idpro,@RequestParam int idteam)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		session.setAttribute("user",userService.find((Integer) session.getAttribute("userid")));
		modelAndView.addObject("project",projectService.find(idpro));
		modelAndView.addObject("team",teamService.find(idteam));
		modelAndView.setViewName("scrummaster/getrecap");
		return modelAndView;
	}
	@RequestMapping(value = "/Projectselected")
	public ModelAndView getbusinessPage(HttpSession session,@RequestParam int idpro,@RequestParam int idteam)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		
		User sender= userService.find((Integer) session.getAttribute("userid") );
		Project project =projectService.find(idpro);
		Team team = teamService.find(idteam);
		
		session.setAttribute("user",sender);
				
		User reciever =userService.find (project.getUser().getUserId());

		Mails mails = new Mails();
		Mail invitation = mails.JobApplication(reciever, sender, team, project);
		
		invitation.setSender(sender);
		invitation.setReciever(reciever);
		invitation.setAttachement(String.valueOf(idteam)+";"+String.valueOf(idpro));
		//mail types :
		//0 for presentation mail
		//1 for team invitation mail
		//2 for Job Application mail
		//3 for random mail
		invitation.setMailtype(2);
		
			mailService.persist(invitation); 
		
		modelAndView.setViewName("redirect:"+"ProjectsManaging");
		return modelAndView;
	}
	@RequestMapping(value = "/createsprint")
	public ModelAndView getOneSprintPage(FormSprintObject fso,HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		User user=userService.find((Integer) session.getAttribute("userid"));
		session.setAttribute("user",user); 

		Sprint sprt = new Sprint(fso.getNom(), fso.getconvertedDtd(), fso.getconvertedDtf(), fso.getDescription(),fso.getPriority());
		sprt.setProjet(projectService.find(fso.getProjectid()));
		sprintService.persist(sprt);
		
		List<Project> list = new ArrayList<Project>();
		List<Team> tlist = new ArrayList<Team>();
		
		tlist.addAll(user.getTeamchef());
		tlist.addAll(user.getTeams());
		
		for(Team i : tlist)
			list.addAll(i.getProjects());
		list.addAll(user.getProjects());
		modelAndView.addObject("projectslist", list);
		
		modelAndView.setViewName("redirect:"+"allSprints?idproject="+fso.getProjectid());
		return modelAndView; 
	}
	
	@RequestMapping(value = "/changedsprintstat")
	public ModelAndView getOneSprintPage(@RequestParam String  values,HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		User user=userService.find((Integer) session.getAttribute("userid"));
		session.setAttribute("user",user); 

		String[] parts = values.split(";");

		int idSprint = Integer.valueOf(parts[0]);
		int operation = Integer.valueOf(parts[1]);
		Sprint targetSpr=sprintService.find(idSprint);
		if(operation==0)
			targetSpr.setStatus("Starting");
		else if(operation==1)
		{
			if(targetSpr.getStatus().equals("Starting"))
				targetSpr.setStatus("Working On");
			else if(targetSpr.getStatus().equals("Working On"))
				targetSpr.setStatus("Testing");
			else if(targetSpr.getStatus().equals("Testing"))
				targetSpr.setStatus("Ready for a Demo");
			else if(targetSpr.getStatus().equals("Ready for a Demo"))
				targetSpr.setStatus("Delivery");
			else if(targetSpr.getStatus().equals("Delivery"))
				targetSpr.setStatus("Finished");
		}
		sprintService.update(targetSpr);
			
		List<Project> list = new ArrayList<Project>();
		List<Team> tlist = new ArrayList<Team>();
		
		tlist.addAll(user.getTeamchef());
		tlist.addAll(user.getTeams());
		
		for(Team i : tlist)
			list.addAll(i.getProjects());
		list.addAll(user.getProjects());
		modelAndView.addObject("projectslist", list);
		
		modelAndView.addObject("spr", targetSpr);
		modelAndView.setViewName("sharedpages/singleSprint");
		return modelAndView; 
	}
//
}
