package com.sqli.easyscrum.repository.Impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.sqli.easyscrum.core.dao.jpa.impl.GenericDaoImpl;
import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.repository.DAOproject;
@Repository
public class DAOprojectImpl extends GenericDaoImpl<Project,Integer> implements DAOproject {
	
	@PersistenceContext(unitName="easyScrumPU")
	EntityManager em;
	
	DAOprojectImpl(){
		super(Project.class);
	}
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}

}
