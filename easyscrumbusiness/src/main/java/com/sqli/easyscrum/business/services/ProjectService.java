package com.sqli.easyscrum.business.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.entity.Sprint;
import com.sqli.easyscrum.entity.User;
@Service
public interface ProjectService {
	
	public Project getProjectById(int id,User u);
	
	public void creatProject(Project u);
	
	public void deleteProject(Project u);
	
	public void editProject(Project u);
	public List<Project> getAllProject();
	
	public Sprint getSprintById(int id,Project u);
}
