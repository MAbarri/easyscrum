package com.sqli.easyscrum.business.services.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqli.easyscrum.business.services.BackLogService;
import com.sqli.easyscrum.business.services.UserStoryService;
import com.sqli.easyscrum.core.dao.jpa.GenericDao;
import com.sqli.easyscrum.core.service.GenericServiceImpl;
import com.sqli.easyscrum.entity.Backlog;
import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.entity.UserStorie;
import com.sqli.easyscrum.repository.DAObacklog;
@Service
public class BacklogServiceImpl extends GenericServiceImpl<Backlog, Integer> implements
		BackLogService {

	@Autowired
	DAObacklog daobacklog;
	
	@Autowired
	private UserStoryService userstorieService;
	
	
	@Override
	public void save(Backlog bklg) {
		bklg.setProjet(null);
		daobacklog.create(bklg);
		for(UserStorie i:bklg.getStories())
			userstorieService.persist(i);
		
		
	}

	@Override
	protected GenericDao<Backlog, Integer> getDao() {
		return daobacklog;
	}


	
}
