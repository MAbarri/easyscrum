package com.sqli.easyscrum.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
public class UserSpaceController {

	protected static Logger logger = Logger.getLogger("controller");

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView getwelcomePage() {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		modelAndView.setViewName("RegisterPage");

		return modelAndView;
	}

	@RequestMapping(value = "/newAccount")
	public ModelAndView getinscriptedPage(FormObject fm) {

		final ModelAndView modelAndView = new ModelAndView();

		Map<String, String> erreurs = new HashMap<String, String>();

		logger.info("Received request to show common page");

		User u = new User(2, fm.getLname(), fm.getLname(), "", fm.getAdresse(),true, fm.getEmail(), fm.getEmail(),fm.getPass());
		
		if (fm.getConfpass().equals(fm.getPass())) {
			if (userService.getUserByLogin(u.getLogin()) == null) {
					userService.creatUser(u);
				modelAndView.setViewName("EmailCheck");
			} else {
				erreurs.put("login", " ce username existe déja !");
				modelAndView.addObject("ListErreur", erreurs);
				modelAndView.setViewName("RegisterPage");
			}
		} else {
			erreurs.put("confpass", "les deux chaine ne sont pas identiques !");
			modelAndView.addObject("ListErreur", erreurs);
			modelAndView.setViewName("RegisterPage");
		}

		return modelAndView;
	}
	
	
	@RequestMapping(value = "/profil")
	public ModelAndView getloginPage(FormObject fm,HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		
		modelAndView.setViewName("index");
		User result = null;
		boolean i=true; 
		String sessionpass="";
		logger.info("1");
		try{
		result = userService.getUserByLogin(session.getAttribute("login").toString());
		sessionpass=session.getAttribute("pass").toString();
		}catch(Exception l){}
		if(result==null)
		{
		result = userService.getUserByLogin(fm.getLogin());
		i=false;
		}
		logger.info("3");
		if(result!=null)
			if(result.getPassword().equals(fm.getPass())||result.getPassword().equals(sessionpass))
			{
				if(!i)
				{
				session.setAttribute("login", fm.getLogin());
				session.setAttribute("pass", fm.getPass());
				}
				modelAndView.setViewName("adminProfil");
			}
				
		return modelAndView;
	}

}
