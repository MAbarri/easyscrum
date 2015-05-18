package com.sqli.easyscrum.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sqli.easyscrum.business.services.MailService;
import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.entity.Mail;
import com.sqli.easyscrum.entity.User;

@Controller
@RequestMapping("/userspace")
public class MailingController {
	
	protected static Logger logger = Logger.getLogger("controller");
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping(value = "/inbox", method = RequestMethod.GET)
	public ModelAndView getinboxPage(HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		User resu= userService.find((Integer) session.getAttribute("userid") );
		modelAndView.addObject("me", resu);
		session.setAttribute("user",resu);
		resu=null;
		modelAndView.setViewName("sharedpages/inbox");

		return modelAndView;
	}
	@RequestMapping(value = "/mail", method = RequestMethod.GET)
	public ModelAndView getmessagePage(HttpSession session,@RequestParam int id) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");

		session.setAttribute("currentmail",mailService.find(id));
		session.setAttribute("user",userService.find((Integer) session.getAttribute("userid")));
		modelAndView.setViewName("sharedpages/mail");

		return modelAndView;
	}
	
	@RequestMapping(value = "/newmail", method = RequestMethod.GET)
	public ModelAndView getnewmessagePage(HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		session.setAttribute("user",userService.find((Integer) session.getAttribute("userid")));
		modelAndView.setViewName("sharedpages/newmail");

		return modelAndView;
	}
	@RequestMapping(value = "/sendmail", method = RequestMethod.GET)
	public ModelAndView setnewmessage(HttpSession session,FormMailObject fmo) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to send a mail");
		
		User sender= userService.find((Integer) session.getAttribute("userid") );
		session.setAttribute("user",sender);
		List<User> results2 = userService.findUserByLogin(fmo.getDestination());
		User reciever=results2.get(0);
		Mail mail= new Mail(fmo.getMailtitle(), fmo.getMailtext(), "14/05/2015");
		mail.setSender(sender);
		mail.setReciever(reciever);
		
		mailService.persist(mail);
		
		modelAndView.setViewName("redirect:inbox");

		return modelAndView;
	}
	
}
