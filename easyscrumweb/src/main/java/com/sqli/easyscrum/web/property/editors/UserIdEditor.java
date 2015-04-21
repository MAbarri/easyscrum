package com.sqli.easyscrum.web.property.editors;

import java.beans.PropertyEditorSupport;

import com.sqli.easyscrum.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sqli.easyscrum.business.services.UserService;

@Component
public class UserIdEditor extends PropertyEditorSupport {

	@Autowired
	UserService userService;
	
	@Override
	public void setAsText(String text){
	User user=null;
	
		if(!text.isEmpty()){
		final int id=Integer.parseInt(text);
		user=userService.find(id);
		}
		setValue(user);
	}

}
