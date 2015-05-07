package com.sqli.easyscrum.web.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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

	/**
	 * Handles and retrieves the common JSP page that everyone can see
	 *
	 * @return the modelAndView
	 */
	// @PreAuthorize("hasPermission(this,'ROLE_VISITOR')")
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView getCommonPage(HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("public/index");
		try {
			if ((Boolean) session.getAttribute("online")) {
				User result = userService.getUserByLogin(session.getAttribute(
						"login").toString());
				String sessionpass = session.getAttribute("pass").toString();
				if (result.getPassword().equals(sessionpass))
					switch (result.getType()) {

					case 1: {
						modelAndView.setViewName("admin/adminProfil");
						break;
					}
					case 2: {
						modelAndView.setViewName("projectowner/login");
						break;
					}
					case 3: {
						modelAndView.setViewName("devloper/Devcpanel");
						break;
					}
					case 4: {
						modelAndView.setViewName("scrummaster/SMasterProfil");
						break;
					}
					}
			}
		} catch (Exception k) {
		}

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
