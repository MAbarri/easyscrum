package com.sqli.easyscrum.business.services.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqli.easyscrum.business.services.TeamService;
import com.sqli.easyscrum.core.dao.jpa.GenericDao;
import com.sqli.easyscrum.core.service.GenericServiceImpl;
import com.sqli.easyscrum.entity.Team;
import com.sqli.easyscrum.repository.DAOteam;
@Service
public class TeamServiceImpl extends GenericServiceImpl<Team, Integer> implements
		TeamService {

	@Autowired
	DAOteam daoteam;
	
	@Override
	protected GenericDao<Team, Integer> getDao() {
		return daoteam;
	}


}
