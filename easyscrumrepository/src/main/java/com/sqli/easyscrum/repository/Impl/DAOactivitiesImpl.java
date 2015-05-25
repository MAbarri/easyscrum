package com.sqli.easyscrum.repository.Impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.sqli.easyscrum.core.dao.jpa.impl.GenericDaoImpl;
import com.sqli.easyscrum.entity.Activities;
import com.sqli.easyscrum.repository.DAOactivities;
@Repository
public class DAOactivitiesImpl extends GenericDaoImpl<Activities, Integer> implements
		DAOactivities {

	@PersistenceContext(unitName="easyScrumPU")
	EntityManager em;
	
	public DAOactivitiesImpl() {
		super(Activities.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	protected EntityManager getEntityManager() {
		return em;
	}

	

}
