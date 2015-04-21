package com.sqli.easyscrum.business.services;

import java.util.List;

import com.sqli.easyscrum.core.service.GenericService;

import com.sqli.easyscrum.entity.User;

public interface UserService extends GenericService<User,Integer>{

	List<User> findByLogin(String username);

}
