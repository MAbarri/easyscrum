package com.sqli.easyscrum.core.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;


@Component
public class MailUtil
{

	@Autowired
	JavaMailSender mailSender;

	public void doSendEmail(final String message, final String emailTo, final String subject)
	{
		final SimpleMailMessage email = new SimpleMailMessage();
		email.setTo(emailTo);
		email.setSubject("easyscrum - new session");
		email.setText(message);
		email.setFrom("easyscrum@sqli.com");
		mailSender.send(email);

	}
}
