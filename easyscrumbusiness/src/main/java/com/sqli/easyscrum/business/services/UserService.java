package com.sqli.easyscrum.business.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sqli.easyscrum.core.service.GenericService;
import com.sqli.easyscrum.entity.User;
@Service
public interface UserService extends GenericService<User,Integer>{
	List<User> findUserByLogin(String login);
}
