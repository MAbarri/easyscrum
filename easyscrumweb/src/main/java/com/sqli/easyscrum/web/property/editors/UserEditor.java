package com.sqli.easyscrum.web.property.editors;

import java.beans.PropertyEditorSupport;
import java.util.List;

import com.sqli.easyscrum.entity.User;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sqli.easyscrum.business.services.UserService;


@Component
public class UserEditor extends PropertyEditorSupport {
    private @Autowired
    UserService userService;

    // Converts a String to a USer (when submitting form or url)
    @Override
    public void setAsText(String text) {
    	User user=null;
    	String[] strings;
    	String login,userName;
    	if(!StringUtils.isBlank(text)){
		if(text.indexOf(":")!=-1){
			strings=text.split(":");
			login=strings[1];
			userName=strings[0];
			
			List<User> list = userService.findByLogin(login);
		if(list.size()>0)
			user=list.get(0);
		else{
			user=new User();
			user.setNomComplet(userName);
			user.setLogin(login);

		}
		}
		}
	this.setValue(user);
    }
}