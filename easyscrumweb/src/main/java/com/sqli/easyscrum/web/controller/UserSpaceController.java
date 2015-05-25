package com.sqli.easyscrum.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sqli.easyscrum.business.services.ActivitiesService;
import com.sqli.easyscrum.business.services.MailService;
import com.sqli.easyscrum.business.services.ProjectService;
import com.sqli.easyscrum.business.services.SprintService;
import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.entity.Mail;
import com.sqli.easyscrum.entity.User;
import com.sqli.easyscrum.web.vo.FormObject;

@Controller
@RequestMapping("/userspace")
public class UserSpaceController {

	protected static Logger logger = Logger.getLogger("controller");

	@Autowired
	private UserService userService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private SprintService sprintService;
	
	@Autowired
	private ActivitiesService activitiesService;

	@Autowired
	private MailService mailService;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView getwelcomePage() {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("public/RegisterPage");

		return modelAndView;
	}

	@RequestMapping(value = "/newAccount")
	public ModelAndView getinscriptedPage(FormObject fm) {

		final ModelAndView modelAndView = new ModelAndView();

		Map<String, String> erreurs = new HashMap<String, String>();

		logger.info("Received request to show common page");

		User u = new User(fm.getLname(), fm.getLname(), "", fm.getAdresse(), true, fm.getEmail(), fm.getLogin(), fm.getPass(), fm.getType());
		
		
		if (fm.getConfpass().equals(fm.getPass())) {
				try{
					User exist = userService.findUserByLogin(u.getLogin()).get(0);
					erreurs.put("login", " ce username existe déja !");
					modelAndView.addObject("ListErreur", erreurs);
					modelAndView.setViewName("public/RegisterPage");
					
				}catch(Exception cc){
				
				userService.persist(u);
				modelAndView.setViewName("public/EmailCheck");				
			}
		} else {
			erreurs.put("confpass", "les deux chaine ne sont pas identiques !");
			modelAndView.addObject("ListErreur", erreurs);
			modelAndView.setViewName("public/RegisterPage");
		}

		return modelAndView;
	}
	
	
	@RequestMapping(value = "/profil")
	public ModelAndView getloginPage(HttpSession session,Authentication authentication) {//FormObject fm,
		final ModelAndView modelAndView = new ModelAndView();
		
		logger.info("Received request to show login page");
		
		List<User> results = null;
		User result=null;
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		//securitycontextholder.getcontext().getauthentication()
		
			results = userService.findUserByLogin(userDetails.getUsername());
			logger.info("Got the list");
			result=results.get(0);
		
						// affectation du session
						
						session.setAttribute("userid",result.getUserId());
						session.setAttribute("userlogin",result.getLogin());
						session.setAttribute("userpicture",result.getPhoto());
						// redirection a la page d'acceuil
						
						modelAndView.addObject("activs", activitiesService.findUserActivities(result.getUserId()));
						modelAndView.addObject("nbmsgs", mailService.GetUnredCount(result.getUserId()));
						//1 for team invitation mail						
						modelAndView.addObject("nbteammsgs", mailService.GetUnreadCountWParam(result.getUserId(), 1));
						//2 for job application						
						modelAndView.addObject("nbjobmsgs", mailService.GetUnreadCountWParam(result.getUserId(), 3));
						//3 for random mail
						modelAndView.addObject("nbnormalmsgs", mailService.GetUnreadCountWParam(result.getUserId(), 2));
						switch (result.getType()){
						
						case 1:
						{
						modelAndView.setViewName("admin/adminProfil");
						session.setAttribute("active",true);
						break;
						}
						case 2:
						{
							modelAndView.setViewName("projectowner/login");
							session.setAttribute("active",true);
							break;}
						case 3:
						{
							modelAndView.setViewName("devloper/Devcpanel");
							session.setAttribute("active",true);
							break;}
						case 4:
						{
							modelAndView.setViewName("scrummaster/SMasterProfil");
							session.setAttribute("active",true);
							break;}
						}
					
			
				

				
		return modelAndView;
	}
	
	
	
	@RequestMapping(value = "/Account", method = RequestMethod.GET)
	public ModelAndView getaccountPage(HttpSession session,@RequestParam int pro) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		
		// if the passed parameter is equal to 0 or to the id of the current User, we give him the permission to update the profil but if it was different 
		// wich means something else than 0 and userId we give him the right to send a message or to report
		boolean editrights = true;
		
		User resu=userService.find((Integer) session.getAttribute("userid"));
		session.setAttribute("user",resu);
		
		if(pro!=0 && pro!=resu.getUserId())
		{
		resu = userService.find(pro);
		editrights = false;
		}
		
		session.setAttribute("editrights",editrights);
		modelAndView.addObject("targetuser", resu);
		resu=null;
		
		modelAndView.setViewName("sharedpages/account");

		return modelAndView;
	}
	
	@RequestMapping(value = "/updateMyAccount")
	public ModelAndView getupdatedPage(FormObject fm,HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		Map<String, String> erreurs = new HashMap<String, String>();
		logger.info("Received request to show common page");

		User u = userService.find((Integer) session.getAttribute("userid") );
		
		if ((fm.getConfpass().equals(fm.getPass()))&&(u.getPassword().equals(fm.getOldpass()))) {
			
			if(fm.getName()!=""&&fm.getName()!=null)
				u.setNom(fm.getName());
			if(fm.getEmail()!=""&&fm.getEmail()!=null)
				u.setEmail(fm.getEmail());
			if(fm.getAdresse()!=""&&fm.getAdresse()!=null)
				u.setAdresse(fm.getAdresse());
			if(fm.getLogin()!=""&&fm.getLogin()!=null)
				u.setLogin(fm.getLogin());
			if(fm.getLname()!=""&&fm.getLname()!=null)
				u.setPrenom(fm.getLname());
			if(fm.getPass()!=""&&fm.getPass()!=null)
				u.setPassword(fm.getPass());
				
			userService.update(u);
		} else {
			erreurs.put("confpass", "les deux chaine ne sont pas identiques !");
			modelAndView.addObject("ListErreur", erreurs);
		}
		
		modelAndView.setViewName("redirect:Account?pro=0");
		return modelAndView;
	}
}
