package com.sqli.easyscrum.business.services;

import org.springframework.stereotype.Service;

import com.sqli.easyscrum.core.service.GenericService;
import com.sqli.easyscrum.entity.Backlog;
@Service
public interface BackLogService extends GenericService<Backlog, Integer> {
	
	public void save(Backlog bklg);
}
