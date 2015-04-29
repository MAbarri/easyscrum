package com.sqli.easyscrum.repository.Impl;

import java.util.ArrayList;
import java.util.List;

import com.sqli.easyscrum.entity.User;
import com.sqli.easyscrum.repository.DAOuser;

public class DAOUserImpl implements DAOuser {

		List<User> list = new ArrayList<User>();
	@Override
	public User getUserById(int id) {
		User u=null;
		for(User i:list)
		{
			if(i.getUserId()==id)
				u= i;
		}
		return u;
	}
	public void init()
	{
		list.add(new User(1, "admin", "boss", "photo", "adresse", true, "boss@boss.boss", "admin","admin",1));
		list.add(new User(1, "po", "client", "photo", "adresse", true, "project@owner.com", "po","123456",2));
		list.add(new User(1, "developer", "programmer", "photo", "adresse", true, "dev@loper.com", "dev","123456",3));
		list.add(new User(1, "SM", "teamboss", "photo", "adresse", true, "scrum@master.com", "sm","123456",4));
	}
	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

	@Override
	public void creatUser(User u) {
		list.add(u);

	}

	@Override
	public void deleteUser(User u) {
		for(User i:list)
		{
			if(i.getUserId()==u.getUserId())
				list.remove(i);
		}

	}

	@Override
	public void editUser(User u) {
		for(User i:list)
		{
			if(i.getUserId()==u.getUserId())
				i=u;
		}

	}
	
	public User getUserByLogin (String lgn)
	{
		User u=null;
		for(User i:list)
		{
			if(i.getLogin().equals(lgn))
				u= i;
		}
		return u;
		
	}
	public List<User> getAllUsers()
	{
		return list;
	}

}
