package com.sqli.easyscrum.business.services;

import org.springframework.stereotype.Service;

import com.sqli.easyscrum.core.service.GenericService;
import com.sqli.easyscrum.entity.Mail;
@Service
public interface MailService extends GenericService<Mail, Integer> {

	public int GetUnredCount(int userIdc);
	Integer GetUnreadCountWParam(int userId,int param);
}
