package com.sqli.easyscrum.web.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.entity.User;

@Component("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService{
	
	@Autowired
	UserService userService;
	
	
	@Override
	public UserDetails loadUserByUsername(String userName)
			throws UsernameNotFoundException {
		List<User> users= userService.findUserByLogin(userName);
		User user=null;
		if(users!=null && users.size()>0)
			user=users.get(0);
		
		if(user!=null){
			String password = user.getPassword();
	    boolean enabled = true;
	    boolean accountNonExpired = true;
	    boolean credentialsNonExpired = true;
	    boolean accountNonLocked = true;
	    Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
	    if(user.getType()==1)
		authorities.add(new SimpleGrantedAuthority("Admin_Role"));
	    else if(user.getType()==2)
			authorities.add(new SimpleGrantedAuthority("ProjectOwner_Role"));
	    else if(user.getType()==3)
			authorities.add(new SimpleGrantedAuthority("Developer_Role"));
	    else if(user.getType()==4)
			authorities.add(new SimpleGrantedAuthority("ScrumMaster_Role"));
	    //List<Role> roleList = user.getRoleList();
		//for(Role role:roleList){
		//authorities.add(new SimpleGrantedAuthority(role.getRoleName));} 	
		//Initializing formateurSession
	    org.springframework.security.core.userdetails.User securityUser = new org.springframework.security.core.userdetails.User(userName,
		    password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	    return securityUser;
	} else {
	    throw new UsernameNotFoundException("User not Found!");
	}
	}
}
