package com.sqli.easyscrum.repository;

import java.util.List;

import com.sqli.easyscrum.entity.Project;

public interface DAOproject {
	public Project getProjectById(int id);
	
	public void creatProject(Project u);
	
	public void deleteProject(Project u);
	
	public void editProject(Project u);
	public List<Project> getAllProject();

}
