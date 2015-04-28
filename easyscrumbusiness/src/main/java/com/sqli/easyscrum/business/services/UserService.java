package com.sqli.easyscrum.business.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sqli.easyscrum.core.service.GenericService;
import com.sqli.easyscrum.entity.User;
@Service
public interface UserService extends GenericService<User,Integer>{
	
	public User getUserById(int id);
	
	public User getUserByLogin (String lgn);
	
	public void creatUser(User u);
	
	public void deleteUser(User u);
	
	public void editUser(User u) ;
}
