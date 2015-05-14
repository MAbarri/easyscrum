package com.sqli.easyscrum.repository.Impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.sqli.easyscrum.core.dao.jpa.impl.GenericDaoImpl;
import com.sqli.easyscrum.entity.User;
import com.sqli.easyscrum.repository.UserDao;

@Repository
public class UserDaoImpl extends GenericDaoImpl<User,Integer> implements UserDao {

	@PersistenceContext(unitName="easyScrumPU")
	EntityManager em;
	
	UserDaoImpl(){
		super(User.class);
	}
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}


}