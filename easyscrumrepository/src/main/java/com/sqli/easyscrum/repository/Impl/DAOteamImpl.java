package com.sqli.easyscrum.repository.Impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.sqli.easyscrum.core.dao.jpa.impl.GenericDaoImpl;
import com.sqli.easyscrum.entity.Team;
import com.sqli.easyscrum.repository.DAOteam;
@Repository
public class DAOteamImpl extends GenericDaoImpl<Team, Integer> implements DAOteam {

	@PersistenceContext(unitName="easyScrumPU")
	EntityManager em;
	
	public DAOteamImpl() {
		super(Team.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return em;
	}

	

}
