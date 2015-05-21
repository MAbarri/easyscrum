package com.sqli.easyscrum.business.services.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqli.easyscrum.business.services.BackLogService;
import com.sqli.easyscrum.business.services.ProjectService;
import com.sqli.easyscrum.core.dao.jpa.GenericDao;
import com.sqli.easyscrum.core.service.GenericServiceImpl;
import com.sqli.easyscrum.entity.Backlog;
import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.repository.DAOproject;
@Service
public class ProjectServiceImpl extends GenericServiceImpl<Project,Integer> implements ProjectService {

	@Autowired
	DAOproject projectdao;
	
	@Autowired
	private BackLogService backLogService;

	@Override
	protected GenericDao<Project, Integer> getDao() {		
		return projectdao;
	}

	public void save(Project prj) {
		Backlog bl = prj.getBacklog();
		bl.setProjet(prj);
		backLogService.save(bl);
		projectdao.create(prj);
		
	}

	
}
