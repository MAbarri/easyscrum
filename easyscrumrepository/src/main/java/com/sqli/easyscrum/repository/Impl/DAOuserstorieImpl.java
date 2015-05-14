package com.sqli.easyscrum.repository.Impl;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.sqli.easyscrum.core.dao.jpa.impl.GenericDaoImpl;
import com.sqli.easyscrum.entity.UserStorie;
import com.sqli.easyscrum.repository.DAOuserstorie;
@Repository
public class DAOuserstorieImpl extends GenericDaoImpl<UserStorie, Integer> implements
		DAOuserstorie {

	@PersistenceContext(unitName="easyScrumPU")
	EntityManager em;
	
	public DAOuserstorieImpl() {
		super(UserStorie.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return em;
	}



}
