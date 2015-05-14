package com.sqli.easyscrum.repository.Impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.sqli.easyscrum.core.dao.jpa.impl.GenericDaoImpl;
import com.sqli.easyscrum.entity.Mail;
import com.sqli.easyscrum.repository.DAOmail;
@Repository
public class DAOmailImpl extends GenericDaoImpl<Mail, Integer> implements DAOmail {

	@PersistenceContext(unitName="easyScrumPU")
	EntityManager em;
	
	public DAOmailImpl() {
		super(Mail.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return em;
	}

	
}
