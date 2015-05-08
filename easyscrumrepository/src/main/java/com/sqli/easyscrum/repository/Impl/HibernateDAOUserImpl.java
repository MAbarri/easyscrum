package com.sqli.easyscrum.repository.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import util.HibernateUtil;

import com.sqli.easyscrum.entity.User;
import com.sqli.easyscrum.repository.DAOuser;

public class HibernateDAOUserImpl implements DAOuser {

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
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		User u = (User)session.load(User.class, lgn);
		return u;
		
	}
	public List<User> getAllUsers()
	{
		return list;
	}

}
