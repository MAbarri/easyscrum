package com.sqli.easyscrum.repository.Impl;

import java.util.ArrayList;
import java.util.List;

import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.repository.DAOproject;

public class DAOprojectImpl implements DAOproject {
	List<Project> list = new ArrayList<Project>();
	
	public void init()
	{
		list.add(new Project(1, "facebook","12/12/2013","12/09/2014"));
		list.add(new Project(1, "twitter","12/12/2013","12/09/2014"));
	}
	@Override
	public Project getProjectById(int id) {
		Project result=null;
		for(Project i : list)
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

}
