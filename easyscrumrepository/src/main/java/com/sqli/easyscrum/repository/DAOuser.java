package com.sqli.easyscrum.repository;

import com.sqli.easyscrum.entity.User;

public interface DAOuser {
	public User getUserById(int id);
	
	public void creatUser(User u);
	
	public void deleteUser(User u);
	
	public void editUser(User u);
	public User getUserByLogin (String lgn);
}
