package com.sqli.easyscrum.business.services;

import org.springframework.stereotype.Service;

import com.sqli.easyscrum.core.service.GenericService;
import com.sqli.easyscrum.entity.Project;
@Service
public interface ProjectService extends GenericService<Project,Integer>{
	
	public void save(Project prj);
	
	
}
