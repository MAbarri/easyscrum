package com.sqli.easyscrum.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		modelAndView.addObject("userlist", userService.findAll());
		return modelAndView;
	}

	@RequestMapping(value = "/addAccount")
	public ModelAndView addnew(FormObject fm) {

		final ModelAndView modelAndView = new ModelAndView();

		Map<String, String> erreurs = new HashMap<String, String>();

		logger.info("Received request to show common page");
			if(fm.getTypestinrg().equals("Project Owner"))
				fm.setType(2);
			else if(fm.getTypestinrg().equals("Developer"))
				fm.setType(3);
			else if(fm.getTypestinrg().equals("Scrum Master"))
				fm.setType(4);
			
			try {
				User u=userService.findUserByLogin(fm.getLogin()).get(0);
				erreurs.put("login", " ce username existe déja !");
				modelAndView.addObject("ListErreur", erreurs);
				modelAndView.setViewName("#");
			}catch(Exception ec)
			{
				User u = new User(fm.getLname(), fm.getLname(), "", fm.getAdresse(),
						true, fm.getEmail(), fm.getLogin(), fm.getPass(), fm.getType());
				userService.persist(u);
				logger.info("User created");
				modelAndView.setViewName("redirect:" + "ManageUsers");
			}

		return modelAndView;
	}

}

