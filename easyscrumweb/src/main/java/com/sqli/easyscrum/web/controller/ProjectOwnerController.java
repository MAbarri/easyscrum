package com.sqli.easyscrum.web.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sqli.easyscrum.business.services.UserService;

@Controller
@RequestMapping("/userspace")
public class ProjectOwnerController {
	
		protected static Logger logger = Logger.getLogger("controller");
		
		@Autowired
		private UserService userService;

		
		@RequestMapping(value = "/ManageProjects", method = RequestMethod.GET)
		public ModelAndView getCommonPage()
		{
			final ModelAndView modelAndView = new ModelAndView();
			logger.info("Received request to show common page");
			modelAndView.setViewName("PoProjects");
			return modelAndView;
		}

}