package com.sqli.easyscrum.web.security;

import java.io.Serializable;
import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.PermissionEvaluator;
import org.springframework.security.core.Authentication;

public class Authorizor implements PermissionEvaluator{

	@Autowired
	UserSession userSession;

	@Override
	public boolean hasPermission(Authentication authentication, Object registration, Object permission) {
		return true;
	}

	@Override
	public boolean hasPermission(Authentication authentication, Serializable Id,
			String targetType, Object permission) {
		throw new RuntimeException("Id and Class permissions are not supperted by this application");
	}
}