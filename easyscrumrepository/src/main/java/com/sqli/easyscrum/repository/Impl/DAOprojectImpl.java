package com.sqli.easyscrum.repository.Impl;

import java.util.ArrayList;
import java.util.List;

import com.sqli.easyscrum.entity.Backlog;
import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.entity.Sprint;
import com.sqli.easyscrum.entity.User;
import com.sqli.easyscrum.entity.UserStorie;
import com.sqli.easyscrum.repository.DAOproject;

public class DAOprojectImpl implements DAOproject {
	List<Project> list = new ArrayList<Project>();
	
	public void init()
	{
		
	}
	@Override
	public Project getProjectById(int id,User u) {
		Project result=null;
			for(Project i:u.getProjects())
			if(i.getProjectId()==id)
				result=i;
		return result;
	}

	@Override
	public void creatProject(Project  u) {
		list.add(u);

	}

	@Override
	public void deleteProject(Project u) {
		for(Project i : list)
			if(i.getProjectId()==u.getProjectId())
				list.remove(i);
	}

	@Override
	public void editProject(Project u) {
		for(Project i : list)
			if(i.getProjectId()==u.getProjectId())
				i=u;

	}

	@Override
	public List<Project> getAllProject() {
		return list;
	}
	@Override
	public Sprint getSprintById(int id,Project u) {
		Sprint result=null;
		for(Sprint s:u.getSprints())
			if(s.getIdsprint()==id)
				result=s;
		return result;
	}

}
