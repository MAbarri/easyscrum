package com.sqli.easyscrum.business.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sqli.easyscrum.entity.Project;
@Service
public interface ProjectService {
	
	public Project getProjectById(int id);
	
	public void creatProject(Project u);
	
	public void deleteProject(Project u);
	
	public void editProject(Project u);
	public List<Project> getAllProject();
}
