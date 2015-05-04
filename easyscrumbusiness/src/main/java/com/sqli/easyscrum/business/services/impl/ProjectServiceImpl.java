package com.sqli.easyscrum.business.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqli.easyscrum.business.services.ProjectService;
import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.repository.DAOproject;
@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	DAOproject dao;

	@Override
	public Project getProjectById(int id) {
		return dao.getProjectById(id);

	}

	@Override
	public void creatProject(Project u) {
		dao.creatProject(u);

	}

	@Override
	public void deleteProject(Project u) {
		dao.deleteProject(u);

	}

	@Override
	public void editProject(Project u) {
		dao.editProject(u);

	}

	@Override
	public List<Project> getAllProject() {
		return dao.getAllProject();
	}

}
