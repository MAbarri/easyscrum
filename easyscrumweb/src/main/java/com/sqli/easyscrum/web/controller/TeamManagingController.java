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
import com.sqli.easyscrum.business.services.TeamService;
import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.entity.Team;
import com.sqli.easyscrum.entity.User;

@Controller
@RequestMapping("/userspace")
public class TeamManagingController {

	protected static Logger logger = Logger.getLogger("controller");

	@Autowired
	private UserService userService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private SprintService sprintService;
	
	@Autowired
	private TeamService teamService;
	
	@RequestMapping(value = "/Teams", method = RequestMethod.GET)
	public ModelAndView geteamsPage(HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		session.setAttribute("user",userService.find((Integer) session.getAttribute("userid")));
		modelAndView.addObject("teams", teamService.findAll());
		modelAndView.setViewName("sharedpages/allteams");
		

		return modelAndView;
	}
	@RequestMapping(value = "/Team", method = RequestMethod.GET)
	public ModelAndView gesingleteamPage(HttpSession session,@RequestParam int idteam) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		session.setAttribute("user",userService.find((Integer) session.getAttribute("userid")));
		// if the passed parameter is equal to 0 or to the id of the current User's team, we give him the permission to update the profil but if it was different 
		// wich means something else than 0 and userId we give him the right to send a message or to report
				boolean editrights = false;
				User resu=(User) session.getAttribute("user");
				Team team = teamService.find(idteam);
				session.setAttribute("team",team);
				for(User i:team.getMembers())
					if(((i.getType()==4)&&(i.getUserId()==resu.getUserId()))||((i.getType()==4)&&(idteam==0)))
						editrights=true;
								
				session.setAttribute("editrights",editrights);
				resu=null;
				
		
		modelAndView.setViewName("sharedpages/team");
		

		return modelAndView;
	}

	@RequestMapping(value = "/TeamSpace", method = RequestMethod.GET)
	public ModelAndView getteamsPage(HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		session.setAttribute("user",userService.find((Integer) session.getAttribute("userid"))); 
		modelAndView.setViewName("sharedpages/teamspace");
		return modelAndView;
	}
	
	@RequestMapping(value = "/myTeams", method = RequestMethod.GET)
	public ModelAndView getmyteamsPage(HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		session.setAttribute("user",userService.find((Integer) session.getAttribute("userid")));
		modelAndView.setViewName("sharedpages/myteams");
		return modelAndView;
	}
	
	@RequestMapping(value = "/needTeam")
	public ModelAndView getneedteamPage(HttpSession session,boolean change)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		logger.info("need team :"+change);
		User me =userService.find((Integer) session.getAttribute("userid"));
		me.setNeedteam(!change);
		userService.update(me);
		
		modelAndView.setViewName("redirect:"+"TeamSpace");
		return modelAndView;
	}
	
}

