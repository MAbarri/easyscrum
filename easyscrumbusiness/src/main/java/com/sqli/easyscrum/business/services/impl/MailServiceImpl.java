package com.sqli.easyscrum.business.services.impl;

import static com.sqli.easyscrum.core.search.QueryParameter.by;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.time.DateUtils;
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



		@Override
		public List<Mail> GetRecent() {
			Date yesterday = new Date(System.currentTimeMillis() - 1000L * 60L * 60L * 24L);
			return daomail.findWithNamedQuery("GetRecent", by("yesterday",yesterday).parameters());
		}
}
