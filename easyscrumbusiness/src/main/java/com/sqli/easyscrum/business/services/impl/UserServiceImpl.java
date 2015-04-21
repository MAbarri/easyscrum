package com.sqli.easyscrum.business.services.impl;

import static com.sqli.easyscrum.core.search.QueryParameter.by;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;


import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.core.dao.jpa.GenericDao;
import com.sqli.easyscrum.core.email.MailUtil;
import com.sqli.easyscrum.core.service.GenericServiceImpl;
import com.sqli.easyscrum.entity.User;
import com.sqli.easyscrum.repository.UserDao;



@Service
public class UserServiceImpl extends GenericServiceImpl<User, Integer> implements UserService{
	
	@Autowired
	MailUtil mailUtil;
	
	@Autowired
	private UserDao userDao;
	
	@Override
	protected GenericDao<User, Integer> getDao() {		
		return userDao;
	}
	
	private @Value("#{rolesProperties['adminRole']}") String ADMIN_ROLE;
	


	private final Integer MAX=99;

	@Override
	public List<User> findByLogin(String username) {
		return userDao.findWithNamedQuery("findByLogin",by("login",username).parameters());
	}

}