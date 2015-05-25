package com.sqli.easyscrum.web.controller;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
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
import com.sqli.easyscrum.business.services.ProjectService;
import com.sqli.easyscrum.business.services.TeamService;
import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.entity.Mail;
import com.sqli.easyscrum.entity.User;
import com.sqli.easyscrum.web.vo.FormMailObject;

@Controller
@RequestMapping("/userspace")
public class MailingController {
	
	protected static Logger logger = Logger.getLogger("controller");
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private TeamService teamService;
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping(value = "/inbox", method = RequestMethod.GET)
	public ModelAndView getinboxPage(HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		User resu= userService.find((Integer) session.getAttribute("userid") );
		modelAndView.addObject("me", resu);
		session.setAttribute("user",resu);
		resu=null;
		modelAndView.setViewName("mailing/inbox");

		return modelAndView;
	}
	@RequestMapping(value = "/mail", method = RequestMethod.GET)
	public ModelAndView getmessagePage(HttpSession session,@RequestParam int id) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		Mail mail = mailService.find(id);
		session.setAttribute("currentmail",mail);
		User user = userService.find((Integer) session.getAttribute("userid"));
		session.setAttribute("user",user);
		
		if(mail.getMailtype()==1)
			session.setAttribute("mailteam",teamService.find(Integer.parseInt(mail.getAttachement())));
		if(mail.getMailtype()==2)
		{
			String[] parts = mail.getAttachement().split(";");
			session.setAttribute("mailteam",teamService.find(Integer.parseInt(parts[0])));
			session.setAttribute("project",projectService.find(Integer.parseInt(parts[1])));
		}
		if(user.getUserId()==mail.getReciever().getUserId())
		{
		mail.setVue(true);
		mailService.update(mail);
		}
		modelAndView.setViewName("mailing/mail");

		return modelAndView;
	}
	
	@RequestMapping(value = "/newmail", method = RequestMethod.GET)
	public ModelAndView getnewmessagePage(HttpSession session) {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		session.setAttribute("user",userService.find((Integer) session.getAttribute("userid")));
		modelAndView.setViewName("mailing/newmail");

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
		
		//current time------------------------
		// 1) create a java calendar instance
		Calendar calendar = Calendar.getInstance();
		 
		// 2) get a java.util.Date from the calendar instance.
		//		    this date will represent the current instant, or "now".
		java.util.Date now = calendar.getTime();
		 
		// 3) a java current time (now) instance
		java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(now.getTime());
		
		Mail mail= new Mail(fmo.getMailtitle(), fmo.getMailtext(), currentTimestamp);
		mail.setSender(sender);
		mail.setReciever(reciever);
		//mail types :
		//0 for presentation mail
		//1 for team invitation mail
		//2 for job app
		//3 for random mail
		mail.setMailtype(3);
		mailService.persist(mail);
		
		modelAndView.setViewName("redirect:inbox");

		return modelAndView;
	}
	
}
