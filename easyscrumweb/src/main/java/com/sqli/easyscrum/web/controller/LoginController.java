package com.sqli.easyscrum.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/auth")
public class LoginController {
	
	@RequestMapping("/login")
	public ModelAndView getLoginPage(){
		ModelAndView modelAndView = new ModelAndView("public/index");
		
		return modelAndView;
	}
}
