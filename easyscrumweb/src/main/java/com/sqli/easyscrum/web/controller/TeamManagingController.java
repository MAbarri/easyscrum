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
import com.sqli.easyscrum.entity.Team;
import com.sqli.easyscrum.entity.User;
import com.sqli.easyscrum.web.vo.FormTeamObject;
import com.sqli.easyscrum.web.vo.Mails;

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
	

	@Autowired
	private MailService mailService;
	
	@RequestMapping(value = "/Teams", method = RequestMethod.GET)
	public ModelAndView geteamsPage(HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		session.setAttribute("user",userService.find((Integer) session.getAttribute("userid")));
		modelAndView.addObject("teams", teamService.findAll());
		modelAndView.setViewName("teams/allteams");
		

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
				if(team.getBoss().getUserId()==resu.getUserId())
						editrights=true;
								
				session.setAttribute("editrights",editrights);
				resu=null;
				
		
		modelAndView.setViewName("teams/team");
		

		return modelAndView;
	}

	@RequestMapping(value = "/TeamSpace", method = RequestMethod.GET)
	public ModelAndView getteamsPage(HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		session.setAttribute("user",userService.find((Integer) session.getAttribute("userid"))); 
		modelAndView.setViewName("teams/teamspace");
		return modelAndView;
	}
	
	@RequestMapping(value = "/myTeams", method = RequestMethod.GET)
	public ModelAndView getmyteamsPage(HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		session.setAttribute("user",userService.find((Integer) session.getAttribute("userid")));
		modelAndView.setViewName("teams/myteams");
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
	@RequestMapping(value = "/newTeam")
	public ModelAndView getnewteamPage(HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		session.setAttribute("user",userService.find((Integer) session.getAttribute("userid")));		
		
		modelAndView.setViewName("teams/newteam");
		return modelAndView;
	}
	@RequestMapping(value = "/creatnewTeam")
	public ModelAndView getcreatteamPage(HttpSession session,FormTeamObject fto)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		session.setAttribute("user",userService.find((Integer) session.getAttribute("userid")));		
		teamService.persist(fto.toTeam(userService.find((Integer) session.getAttribute("userid"))));
		modelAndView.setViewName("redirect:"+"TeamSpace");
		return modelAndView;
	}
	
	@RequestMapping(value = "/Invitein")
	public ModelAndView getMemberstoteamPage(HttpSession session)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		session.setAttribute("user",userService.find((Integer) session.getAttribute("userid")));
		modelAndView.addObject("userlist", userService.findAll());
		modelAndView.setViewName("teams/hiremembers");
		return modelAndView;
	}
	
	@RequestMapping(value = "/InviteUsers")
	public ModelAndView getinvitemembersPage(HttpSession session,@RequestParam String selected,@RequestParam int idteam)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		//Send Invitation Mail !!
		User sender= userService.find((Integer) session.getAttribute("userid") );
		session.setAttribute("user",sender);
		
		selected=selected.substring(0,selected.length()-1 );
		Team team  =teamService.find(idteam);
		String[] parts = selected.split(";");
		for(int i=0;i<parts.length;i++)
		{
			User reciever =userService.find (Integer.parseInt(parts[i]));
			Mails mails = new Mails();
			Mail invitation = mails.TeamInvitation(reciever, sender, team);
			invitation.setSender(sender);
			invitation.setReciever(reciever);
			invitation.setAttachement(String.valueOf(idteam));
			//mail types :
			//0 for presentation mail
			//1 for team invitation mail
			//2 for random mail
			invitation.setMailtype(1);
			
				mailService.persist(invitation); 
			
		}		
		modelAndView.setViewName("redirect:"+"TeamSpace");
		return modelAndView;
	}
	@RequestMapping(value = "/acceptinviteteam")
	public ModelAndView getacceptteamPage(HttpSession session,@RequestParam int team)
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		User user = userService.find((Integer) session.getAttribute("userid"));
		session.setAttribute("user",user);
				
		
		List<Mail> mails = new ArrayList<Mail>();
		
		for(Mail inv :user.getRecievedmails())
			if(inv.getMailtype()==1)
				mails.add(inv);
		
		for(Mail i :mails)
			if(Integer.parseInt(i.getAttachement())==team)
			{
				Team tm = teamService.find(team);
				List<Team> list = user.getTeams();
				if(!list.contains(tm))
					list.add(tm);
				user.setTeams(list);
				userService.update(user);
				logger.info("Update executed");
  			}
		modelAndView.setViewName("redirect:"+"TeamSpace");
		
		return modelAndView;
	}
}

