package com.sqli.easyscrum.repository.Impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.sqli.easyscrum.core.dao.jpa.impl.GenericDaoImpl;
import com.sqli.easyscrum.entity.Sprint;
import com.sqli.easyscrum.repository.DAOsprint;
@Repository
public class DAOsprintImpl extends GenericDaoImpl<Sprint, Integer>    implements DAOsprint  {

	@PersistenceContext(unitName="easyScrumPU")
	EntityManager em;
	
	public DAOsprintImpl() {
		super(Sprint.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	

		
}
