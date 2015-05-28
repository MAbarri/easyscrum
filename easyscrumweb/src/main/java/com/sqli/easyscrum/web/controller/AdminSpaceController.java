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
import com.sqli.easyscrum.core.server.SystemInfo;
import com.sqli.easyscrum.entity.User;
import com.sqli.easyscrum.web.vo.FormObject;

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
				User u = new User(fm.getName(), fm.getLname(), "", fm.getAdresse(),
						true, fm.getEmail(), fm.getLogin(), fm.getPass(), fm.getType());
				userService.persist(u);
				logger.info("User created");
				modelAndView.setViewName("redirect:" + "ManageUsers");
			}

		return modelAndView;
	}
	
	@RequestMapping(value = "/updateAccount")
	public ModelAndView updateuser(FormObject fm) {

		final ModelAndView modelAndView = new ModelAndView();

		Map<String, String> erreurs = new HashMap<String, String>();
			
		boolean exist=false;
		try{
			if((userService.findUserByLogin(fm.getLogin()).get(0)!=null)
					&&(userService.findUserByLogin(fm.getLogin()).get(0)!=userService.find(Integer.parseInt(fm.getTypestinrg()))))
				exist=true;
		}catch(Exception ff){}
		
				if(exist)
				{
				erreurs.put("login", " ce username existe déja !");
				modelAndView.addObject("ListErreur", erreurs);
				modelAndView.setViewName("#");
				}
				else
				{
				User u = new User(fm.getName(), fm.getLname(), "", fm.getAdresse(),
						true, fm.getEmail(), fm.getLogin(), fm.getPass(), fm.getType());
				u.setUserId(Integer.parseInt(fm.getTypestinrg()));
				
				userService.update(u);
				logger.info("User updated");
				modelAndView.setViewName("redirect:" + "ManageUsers");
				}
			

		return modelAndView;
	}
	
	
	@RequestMapping(value = "/deleteAccounts")
	public ModelAndView deleteusers(FormObject fm) {

		final ModelAndView modelAndView = new ModelAndView();

		Map<String, String> erreurs = new HashMap<String, String>();
			
		logger.info("Users delete started");
		fm.setTypestinrg(fm.getTypestinrg().substring(0,fm.getTypestinrg().length()-1 ));
		String[] parts = fm.getTypestinrg().split(";");
		for(int i=0;i<parts.length;i++)
		{
			try{
				logger.info("----------------------------User to delete : id = "+parts[i]);
			if(userService.find(Integer.parseInt(parts[i])).getLogin()!="admin")
				userService.remove(Integer.parseInt(parts[i]));
			else 
				erreurs.put("major erreur", "You cannot delete the admin");
			}catch(Exception cc){
				erreurs.put("major erreur", "Errors");
			}
		}
				
				logger.info("Users deleted");
				modelAndView.setViewName("redirect:" + "ManageUsers");
			

		return modelAndView;
	}

	@RequestMapping(value = "/Server", method = RequestMethod.GET)
	public ModelAndView getstatsPage() {
		final ModelAndView modelAndView = new ModelAndView();
		logger.info("Received request to show common page");
		SystemInfo sysinf = new SystemInfo();
		
		String memory=sysinf.MemInfo();
		String disk=sysinf.DiskInfo();
		String os=sysinf.OsInfo();
		
		modelAndView.addObject("memory", memory);
		modelAndView.addObject("disk", disk);
		modelAndView.addObject("osystem", os);
		
		modelAndView.setViewName("admin/stats");
		return modelAndView;
	}
}

