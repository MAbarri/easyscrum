package com.sqli.easyscrum.business.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqli.easyscrum.business.services.SprintService;
import com.sqli.easyscrum.core.dao.jpa.GenericDao;
import com.sqli.easyscrum.core.service.GenericServiceImpl;
import com.sqli.easyscrum.entity.Mail;
import com.sqli.easyscrum.entity.Sprint;
import com.sqli.easyscrum.repository.DAOmail;
import com.sqli.easyscrum.repository.DAOsprint;
@Service
public class SprintServiceImpl extends GenericServiceImpl<Sprint, Integer> implements SprintService {

	@Autowired
	DAOsprint daosprint;
	
	@Override
	protected GenericDao<Sprint, Integer> getDao() {
		return daosprint;
	}

}
