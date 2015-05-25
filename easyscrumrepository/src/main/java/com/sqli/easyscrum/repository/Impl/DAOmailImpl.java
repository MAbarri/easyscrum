package com.sqli.easyscrum.repository.Impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

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

	@Override
	public Integer GetUnreadCount(String namedQuery, int userId) {
		Query query=em.createNamedQuery(namedQuery);
		query.setParameter("ID", userId);
		Long result =(Long) query.getSingleResult();
		return result.intValue();
	}

	@Override
	public Integer GetUnreadCountWParam(String namedQuery, int userId, int param) {
		Query query=em.createNamedQuery(namedQuery);
		query.setParameter("ID", userId);
		query.setParameter("PR", param);
		Long result =(Long) query.getSingleResult();
		return result.intValue();
	}

	
}
