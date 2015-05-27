package com.sqli.easyscrum.web.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sqli.easyscrum.business.services.ProjectService;
import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.entity.User;

/**
 * Handles and retrieves the common or admin page depending on the URI template.
 * A user must be log-in first he can access these pages. Only the admin can see
 * the adminpage, however.
 */

@Controller
@RequestMapping("/")
public class HomePageController {

	protected static Logger logger = Logger.getLogger("controller");

	@Autowired
	private UserService userService;
	
	@Autowired
	private ProjectService projectService;
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView getCommonPage(HttpSession session,@RequestParam(required=false) boolean logoutmsg,@RequestParam(required=false) boolean error,Authentication authentication) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
  		modelAndView.setViewName("public/index");
  		
		if(error)
		{
			modelAndView.addObject("errormessage", "Invalide Username or password");
		}
		if(logoutmsg)
		{
			session.removeAttribute("user");
			session.removeAttribute("res");
			session.removeAttribute("userid");
			try{
			session.setAttribute("active",false);
			}catch(Exception cc){}
		}
  		
		try{
		if((Boolean) session.getAttribute("active"))
			modelAndView.setViewName("redirect:"+"/userspace/profil");}catch(Exception oo){}	
		
		
		return modelAndView;
	}

	
	@RequestMapping(value = "/start", method = RequestMethod.GET)
	public ModelAndView getstartPage(HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("public/start");
		
		try{
			if((Boolean) session.getAttribute("active"))
				modelAndView.setViewName("redirect:"+"/userspace/profil");}catch(Exception oo){}	
		
		return modelAndView;
	}
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public ModelAndView getaboutPage(HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("public/about");
		
		try{
			if((Boolean) session.getAttribute("active"))
				modelAndView.setViewName("redirect:"+"/userspace/profil");}catch(Exception oo){}	
		
		return modelAndView;
	}
	@RequestMapping(value = "/services", method = RequestMethod.GET)
	public ModelAndView getservicesPage(HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("public/services");
		
		try{
			if((Boolean) session.getAttribute("active"))
				modelAndView.setViewName("redirect:"+"/userspace/profil");}catch(Exception oo){}	

		return modelAndView;
	}
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public ModelAndView getwelcomePage(HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("public/news");
		
		try{
			if((Boolean) session.getAttribute("active"))
				modelAndView.setViewName("redirect:"+"/userspace/profil");}catch(Exception oo){}	

		return modelAndView;
	}
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public ModelAndView getcontactPage(HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("public/contact");
		
		try{
			if((Boolean) session.getAttribute("active"))
				modelAndView.setViewName("redirect:"+"/userspace/profil");}catch(Exception oo){}	

		return modelAndView;
	}
	@RequestMapping(value = "/denied", method = RequestMethod.GET)
	public ModelAndView getDeniedPage() {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("errors/denied");	

		return modelAndView;
	}
}
