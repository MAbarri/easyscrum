package com.sqli.easyscrum.business.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqli.easyscrum.business.services.MailService;
import com.sqli.easyscrum.core.dao.jpa.GenericDao;
import com.sqli.easyscrum.core.service.GenericServiceImpl;
import com.sqli.easyscrum.entity.Mail;
import com.sqli.easyscrum.repository.DAOmail;
@Service
public class MailServiceImpl extends GenericServiceImpl<Mail, Integer>
		implements MailService {

	@Autowired
	DAOmail daomail;
	
	@Override
	protected GenericDao<Mail, Integer> getDao() {
		return daomail;
	}

	
}
