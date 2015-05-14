package com.sqli.easyscrum.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sqli.easyscrum.business.services.ProjectService;
import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.entity.Project;
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

//	/**
//	 * Handles and retrieves the common JSP page that everyone can see
//	 *
//	 * @return the modelAndView
//	 */
//	// @PreAuthorize("hasPermission(this,'ROLE_VISITOR')")
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView getCommonPage(HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Testing persistance");
		
		
		logger.info(projectService.find(1).getCompany());
		
		Project projet = new Project("facebook", "English", "Web App", "an awsome Work", "socialMedia;Blue;Awsome",
				"12000$", "Sumsung", "face@book.com", "22/12/2014", "Getting Started", "22/04/2014", "22/11/2014");
		User user=userService.find(2);
		projectService.persist(projet);
		user.getProjects().add(projet);
		userService.update(user);
		
		
		logger.info("End Testing persistance");
		logger.info("Received request to show common page");
  		modelAndView.setViewName("public/index");
//		//check if a session exist first
//		List<User> results = null;
//		User result=null;
//		
//		boolean fromSession=false;
//		String sessionPass="";
//		
//		
//		try{
//			results = userService.findUserByLogin(session.getAttribute("login").toString());
//			logger.info("Got the list");
//			result=results.get(0);
//			sessionPass=session.getAttribute("pass").toString();
//			fromSession=true;
//			
//			switch (result.getType()){
//						
//						case 1:
//						{
//						modelAndView.setViewName("admin/adminProfil");
//						break;
//						}
//						case 2:
//						{
//							modelAndView.setViewName("projectowner/login");
//							break;}
//						case 3:
//						{
//							modelAndView.setViewName("devloper/Devcpanel");
//							break;}
//						case 4:
//						{
//							modelAndView.setViewName("scrummaster/SMasterProfil");
//							break;}
//						}
//		}catch(Exception l)
//		{
//			logger.info("null pointer");
//		}
		return modelAndView;
	}

	@RequestMapping(value = "/deconnect", method = RequestMethod.GET)
	public ModelAndView DeconnectPage(HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");

		session.setAttribute("login", "");
		session.setAttribute("pass", "");
		session.setAttribute("online", false);
		modelAndView.setViewName("public/index");

		return modelAndView;
	}
	@RequestMapping(value = "/start", method = RequestMethod.GET)
	public ModelAndView getstartPage() {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("public/start");

		return modelAndView;
	}
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public ModelAndView getaboutPage() {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("public/about");

		return modelAndView;
	}
	@RequestMapping(value = "/services", method = RequestMethod.GET)
	public ModelAndView getservicesPage() {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("public/services");

		return modelAndView;
	}
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public ModelAndView getwelcomePage() {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("public/news");

		return modelAndView;
	}
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public ModelAndView getcontactPage() {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("public/contact");

		return modelAndView;
	}
}
