package com.sqli.easyscrum.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
@RequestMapping("/userspace")
public class UserSpaceController {

	protected static Logger logger = Logger.getLogger("controller");

	@Autowired
	private UserService userService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private SprintService sprintService;
	
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView getwelcomePage() {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("public/RegisterPage");

		return modelAndView;
	}
//
//	@RequestMapping(value = "/newAccount")
//	public ModelAndView getinscriptedPage(FormObject fm) {
//
//		final ModelAndView modelAndView = new ModelAndView();
//
//		Map<String, String> erreurs = new HashMap<String, String>();
//
//		logger.info("Received request to show common page");
//
//		User u = new User(2, fm.getLname(), fm.getLname(), "", fm.getAdresse(),true, fm.getEmail(), fm.getEmail(),fm.getPass(),fm.getType());
//		
//		if (fm.getConfpass().equals(fm.getPass())) {
//			if (userService.getUserByLogin(u.getLogin()) == null) {
//					userService.creatUser(u);
//				modelAndView.setViewName("public/EmailCheck");
//			} else {
//				erreurs.put("login", " ce username existe déja !");
//				modelAndView.addObject("ListErreur", erreurs);
//				modelAndView.setViewName("public/RegisterPage");
//			}
//		} else {
//			erreurs.put("confpass", "les deux chaine ne sont pas identiques !");
//			modelAndView.addObject("ListErreur", erreurs);
//			modelAndView.setViewName("public/RegisterPage");
//		}
//
//		return modelAndView;
//	}
	
	
	@RequestMapping(value = "/profil")
	public ModelAndView getloginPage(FormObject fm,HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		
		logger.info("Received request to show login page");
		modelAndView.setViewName("public/index");
		
		List<User> results = null;
		User result=null;
		
		
		
			results = userService.findUserByLogin(fm.getLogin());
			logger.info("Got the list");
			result=results.get(0);
		
			if(result.getPassword().equals(fm.getPass()))
					{
						// affectation du session
						session.setAttribute("login", fm.getLogin());
						session.setAttribute("pass", fm.getPass());
						
						// redirection a la page d'acceuil
						
						switch (result.getType()){
						
						case 1:
						{
						modelAndView.setViewName("admin/adminProfil");
						break;
						}
						case 2:
						{
							modelAndView.setViewName("projectowner/login");
							break;}
						case 3:
						{
							modelAndView.setViewName("devloper/Devcpanel");
							break;}
						case 4:
						{
							modelAndView.setViewName("scrummaster/SMasterProfil");
							break;}
						}
					}
			
				

				
		return modelAndView;
	}
	
	@RequestMapping(value = "/inbox", method = RequestMethod.GET)
	public ModelAndView getinboxPage(HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		List<User> results = userService.findUserByLogin(session.getAttribute("login").toString() );
		User resu=results.get(0);
		session.setAttribute("user",resu );
		resu=null;
		modelAndView.setViewName("sharedpages/inbox");

		return modelAndView;
	}
	@RequestMapping(value = "/mail", method = RequestMethod.GET)
	public ModelAndView getmessagePage(HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		List<User> results = userService.findUserByLogin(session.getAttribute("login").toString() );
		User resu=results.get(0);
		session.setAttribute("user",resu);
		resu=null;
		modelAndView.setViewName("sharedpages/mail");

		return modelAndView;
	}
	
	@RequestMapping(value = "/newmail", method = RequestMethod.GET)
	public ModelAndView getnewmessagePage(HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("sharedpages/newmail");

		return modelAndView;
	}
	@RequestMapping(value = "/Account", method = RequestMethod.GET)
	public ModelAndView getaccountPage(HttpSession session,@RequestParam int pro) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		// if the passed parameter is equal to 0 or to the id of the current User, we give him the permission to update the profil but if it was different 
		// wich means something else than 0 and userId we give him the right to send a message or to report
		boolean editrights = true;
		List<User> results = userService.findUserByLogin(session.getAttribute("login").toString() );
		User resu=results.get(0);
		if(pro!=0 && pro!=resu.getUserId())
		{
		resu = userService.find(pro);
		editrights = false;
		}
		
		session.setAttribute("user",resu);
		session.setAttribute("editrights",editrights);
		resu=null;
		
		modelAndView.setViewName("sharedpages/account");

		return modelAndView;
	}
	
//
}
