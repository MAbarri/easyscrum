package com.sqli.easyscrum.business.services.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.core.dao.jpa.GenericDao;
import com.sqli.easyscrum.core.service.GenericServiceImpl;
import com.sqli.easyscrum.entity.User;
import com.sqli.easyscrum.repository.UserDao;
import static com.sqli.easyscrum.core.search.QueryParameter.by;


@Service("userService")
public class UserServiceImpl extends GenericServiceImpl<User, Integer> implements UserService{

	@Autowired
	public UserDao userDao;
	
	@Override
	protected GenericDao<User, Integer> getDao() {		
		return userDao;
	}
	@Override
	public List<User> findUserByLogin(String login) {
		return userDao.findWithNamedQuery("findByLogin", by("login",login).parameters());
	}
}