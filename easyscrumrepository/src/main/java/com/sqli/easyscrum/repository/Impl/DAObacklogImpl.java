package com.sqli.easyscrum.repository.Impl;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.sqli.easyscrum.core.dao.jpa.impl.GenericDaoImpl;
import com.sqli.easyscrum.entity.Backlog;
import com.sqli.easyscrum.repository.DAObacklog;
@Repository
public class DAObacklogImpl extends GenericDaoImpl<Backlog,Integer> implements DAObacklog{

	@PersistenceContext(unitName="easyScrumPU")
	EntityManager em;
	
	public DAObacklogImpl() {
		super(Backlog.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return em;
	}

}
