package com.sqli.easyscrum.repository;

import java.util.List;

import com.sqli.easyscrum.core.dao.jpa.GenericDao;
import com.sqli.easyscrum.entity.Mail;

public interface DAOmail extends GenericDao<Mail, Integer> {

	Integer GetUnreadCount(String namedQuery, int userId);
	Integer GetUnreadCountWParam(String namedQuery, int userId,int param);
}
