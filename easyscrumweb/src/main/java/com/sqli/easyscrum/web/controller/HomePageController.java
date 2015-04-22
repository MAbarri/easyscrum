package com.sqli.easyscrum.web.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
 * Handles and retrieves the common or admin page depending on the URI template. A user must be log-in first he can
 * access these pages. Only the admin can see the adminpage, however.
 */

@Controller
@RequestMapping("/main")
public class HomePageController
{


	protected static Logger logger = Logger.getLogger("controller");

	
	/**
	 * Handles and retrieves the common JSP page that everyone can see
	 *
	 * @return the modelAndView
	 */
//	@PreAuthorize("hasPermission(this,'ROLE_VISITOR')")
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView getCommonPage()
	{
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("index");
		return modelAndView;
	}
}
