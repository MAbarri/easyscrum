package com.sqli.easyscrum.repository.Impl;

import java.util.ArrayList;
import java.util.List;

import com.sqli.easyscrum.entity.Backlog;
import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.entity.UserStorie;
import com.sqli.easyscrum.repository.DAOproject;

public class DAOprojectImpl implements DAOproject {
	List<Project> list = new ArrayList<Project>();
	
	public void init()
	{
		list.add(new Project(1, "facebook", "English", "Web App", "an awsome Work", "socialMedia;Blue;Awsome", "12000$", "Sumsung", "face@book.com", "22/12/2014", new Backlog(1, "first Backlog", "13/06/2014",new UserStorie(1, "Work Well please")) , "Getting Started", "22/04/2014", "22/11/2014"));

		list.add(new Project(2, "twitter", "British", "Web App", "a good Work", "socialMedia;Blue;Bird", "22000$", "Apple", "tweet@tter.com", "22/12/2013", new Backlog(2, "second Backlog", "13/06/2013",new UserStorie(2, "A lot of money to offer")) , "Getting Started", "22/04/2013", "22/11/2013"));
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
