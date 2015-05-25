package com.sqli.easyscrum.business.services.impl;

import static com.sqli.easyscrum.core.search.QueryParameter.by;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqli.easyscrum.business.services.ActivitiesService;
import com.sqli.easyscrum.core.dao.jpa.GenericDao;
import com.sqli.easyscrum.core.service.GenericServiceImpl;
import com.sqli.easyscrum.entity.Activities;
import com.sqli.easyscrum.repository.DAOactivities;
@Service
public class ActivitiesServiceImpl extends GenericServiceImpl<Activities, Integer> implements
		ActivitiesService {

	@Autowired
	DAOactivities daoactivities;
	
	@Override
	protected GenericDao<Activities, Integer> getDao() {
		return daoactivities;
	}

	@Override
	public List<Activities> findUserActivities(int ID) {
		return daoactivities.findWithNamedQuery("findByUserId", by("ID",ID).parameters());
	}

	

}
