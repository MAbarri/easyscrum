package com.sqli.easyscrum.business.services.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqli.easyscrum.business.services.ProjectService;
import com.sqli.easyscrum.core.dao.jpa.GenericDao;
import com.sqli.easyscrum.core.service.GenericServiceImpl;
import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.entity.Sprint;
import com.sqli.easyscrum.entity.User;
import com.sqli.easyscrum.repository.DAOproject;
@Service
public class ProjectServiceImpl extends GenericServiceImpl<Project,Integer> implements ProjectService {

	@Autowired
	DAOproject projectdao;

	@Override
	protected GenericDao<Project, Integer> getDao() {		
		return projectdao;
	}

	
}
