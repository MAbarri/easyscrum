package com.sqli.easyscrum.web.security;

import java.io.Serializable;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.ldap.userdetails.LdapUserDetailsImpl;
import org.springframework.stereotype.Component;

import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.entity.User;


/**
 * @author Marrafi
 *
 */
@Component("userSession")
@Scope(value="session",proxyMode=ScopedProxyMode.TARGET_CLASS)
public class UserSession implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private User user;
	
	private String currentRole;

	private boolean registered;
	
	private @Value("#{rolesProperties['visitorRole']}") String VISITOR_ROLE;
//	private @Value("#{rolesProperties['adminRole']}") String ADMIN_ROLE;
//	private @Value("#{rolesProperties['collabRole']}") String COLLAB_ROLE;
//	private @Value("#{rolesProperties['formateurRole']}") String FORMATEUR_ROLE;
//	private @Value("#{rolesProperties['managerRole']}") String MANAGER_ROLE;

	@Autowired
	UserService userService;
	
	
	/**
	 * Initialize User with <code>currentRole</code> equal to VISITOR_ROLE
	 *  and as being not registered yet, later on the
	 * <code>CustomLdapAuthoritiesPopulater</code> will change the values
	 * of these fields depending on authentication props;
	 */
	public UserSession() {
	}
	
	@PostConstruct
	void initializer() {
		currentRole=VISITOR_ROLE;
		registered=false;
	}

	/**
	 * @return 
	 */
	public String getLogin() {
		SecurityContext context = SecurityContextHolder.getContext();
		if (context == null)
		    return null;

		Authentication authentication = context.getAuthentication();
		if (authentication == null)
		    return null;
		String principal = authentication.getName();
		return principal;
	    }

	/**
	 * Checks whether the authenticated user 
	 * is registered in the database or not
	 */
	public boolean getRegistered() {
		return registered;
	}

	/**
	 * sets the <code>registered<code> 
	 * to <code>true</code> or <code>false</code>
	 */
	public void setRegistered(boolean registered) {
		this.registered = registered;
	}

	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param the user to set in <code>UserSession</code>
	 */
	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * @return the <code>UserSession</code> currentRole of the user
	 */
	public String getCurrentRole() {
		return currentRole;
	}

	/**
	 * Sets the currentRole value to one of the authorities
	 * 
	 */
	public void setCurrentRole(String currentRole) {
		this.currentRole = currentRole;
	}

	public User getUserDetails(){
		User user=new User();
		String login,email;
		Authentication auth= SecurityContextHolder.getContext().getAuthentication();
		if(auth.getPrincipal() instanceof LdapUserDetailsImpl){
		LdapUserDetailsImpl userDetails=
				(LdapUserDetailsImpl)auth.getPrincipal();
		login=(userDetails.getUsername());
		email=((userDetails.getUsername().
				contains("@")?auth.getName():auth.getName().concat("@sqli.com")));
		}
		else{
		org.springframework.security.core.userdetails.User userDetails =
		(org.springframework.security.core.userdetails.User) auth.getPrincipal();
		login=userDetails.getUsername();
		email=((userDetails.getUsername().
				contains("@")?auth.getName():auth.getName().concat("@sqli.com")));
		}
		user.setLogin(login);
		//user.setEmail(email);
		return user;
	}
}