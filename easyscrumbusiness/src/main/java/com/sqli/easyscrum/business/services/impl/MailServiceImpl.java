package com.sqli.easyscrum.business.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqli.easyscrum.business.services.MailService;
import com.sqli.easyscrum.core.dao.jpa.GenericDao;
import com.sqli.easyscrum.core.service.GenericServiceImpl;
import com.sqli.easyscrum.entity.Mail;
import com.sqli.easyscrum.repository.DAOmail;
@Service
public class MailServiceImpl extends GenericServiceImpl<Mail, Integer>
		implements MailService {

	@Autowired
	DAOmail daomail;
	
	@Override
	protected GenericDao<Mail, Integer> getDao() {
		return daomail;
	}

	

		@Override
		public int GetUnredCount(int userId) {
			Integer result=daomail.GetUnreadCount("GetUnreadCount",userId);
			if(result==null)
			return 0;
			return result;
		}



		@Override
		public Integer GetUnreadCountWParam(int userId, int param) {
			Integer result=daomail.GetUnreadCountWParam("GetUnreadCountWParam",userId,param);
			if(result==null)
			return 0;
			return result;
		}
}
