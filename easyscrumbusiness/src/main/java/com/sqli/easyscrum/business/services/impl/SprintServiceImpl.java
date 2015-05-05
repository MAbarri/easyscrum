package com.sqli.easyscrum.business.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqli.easyscrum.business.services.SprintService;
import com.sqli.easyscrum.entity.Sprint;
import com.sqli.easyscrum.repository.DAOsprint;
@Service
public class SprintServiceImpl implements SprintService {
	@Autowired
	DAOsprint dao;
	@Override
	public void creatsprint(Sprint u) {
		dao.creatsprint(u);

	}

	@Override
	public void deletesprint(Sprint u) {
		dao.deletesprint(u);

	}

	@Override
	public void editsprint(Sprint u) {
		dao.editsprint(u);

	}

	@Override
	public List<Sprint> getAllSprint() {
		return dao.getAllSprint();
	}

	@Override
	public Sprint getsprintById(int id) {
	
		return dao.getsprintById(id);
	}

}
