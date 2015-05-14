package com.sqli.easyscrum.business.services.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqli.easyscrum.business.services.UserStoryService;
import com.sqli.easyscrum.core.dao.jpa.GenericDao;
import com.sqli.easyscrum.core.service.GenericServiceImpl;
import com.sqli.easyscrum.entity.UserStorie;
import com.sqli.easyscrum.repository.DAOuserstorie;
@Service
public class UserStorieServiceImpl extends GenericServiceImpl<UserStorie, Integer> implements
		UserStoryService {

	@Autowired
	DAOuserstorie daouserstorie;
	
	@Override
	protected GenericDao<UserStorie, Integer> getDao() {
		return daouserstorie;
	}


}
