package com.sqli.easyscrum.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.entity.User;

@Controller
@RequestMapping("/userspace")
public class AdminSpaceController {

	protected static Logger logger = Logger.getLogger("controller");

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/ManageUsers", method = RequestMethod.GET)
	public ModelAndView getwelcomePage() {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("admin/ManageUsers");
		modelAndView.addObject("userlist", userService.getAllUsers());
		return modelAndView;
	}

	@RequestMapping(value = "/addAccount")
	public ModelAndView addnew(FormObject fm) {

		final ModelAndView modelAndView = new ModelAndView();

		Map<String, String> erreurs = new HashMap<String, String>();

		logger.info("Received request to show common page");
try{
		User u = new User(2, fm.getLname(), fm.getLname(), "", fm.getAdresse(),
				true, fm.getEmail(), fm.getEmail(), fm.getPass(), fm.getType());

			if (userService.getUserByLogin(u.getLogin()) == null) {
				userService.creatUser(u);
				logger.info("User created");
				modelAndView.setViewName("redirect:" + "admin/ManageUsers");
			} else {
				erreurs.put("login", " ce username existe déja !");
				modelAndView.addObject("ListErreur", erreurs);
				modelAndView.setViewName("#");
			}}catch(Exception ec){}

		return modelAndView;
	}

}
