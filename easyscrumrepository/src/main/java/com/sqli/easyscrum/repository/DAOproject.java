package com.sqli.easyscrum.repository;

import java.util.List;

import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.entity.Sprint;
import com.sqli.easyscrum.entity.User;

public interface DAOproject {
	public Project getProjectById(int id,User u);
	
	public void creatProject(Project u);
	
	public void deleteProject(Project u);
	
	public void editProject(Project u);
	
	public List<Project> getAllProject();
	public Sprint getSprintById(int id,Project u);

}
