package com.sqli.easyscrum.repository;

import java.util.List;

import com.sqli.easyscrum.entity.Sprint;

public interface DAOsprint {

public Sprint getsprintById(int id);
	
	public void creatsprint(Sprint u);
	
	public void deletesprint(Sprint u);
	
	public void editsprint(Sprint u);
	
	public List<Sprint> getAllSprint();
}
