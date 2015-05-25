package com.sqli.easyscrum.business.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sqli.easyscrum.core.service.GenericService;
import com.sqli.easyscrum.entity.Activities;
@Service
public interface ActivitiesService extends GenericService<Activities, Integer> {
	List<Activities> findUserActivities(int ID);
}
