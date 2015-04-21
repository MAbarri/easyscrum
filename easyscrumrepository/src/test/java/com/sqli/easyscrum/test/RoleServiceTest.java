package com.sqli.easyscrum.test;

import java.util.ArrayList;
import java.util.List;


import com.sqli.easyscrum.entity.User;

public class RoleServiceTest {

	@org.junit.Test
	public void shouldListContainsRoleAfterAddingToList() {
		
		//GIVEN
		List<User> rolList = new ArrayList<User>();
		User r1 = new User();
		r1.setLogin("login");
		
		//WHEN
		rolList.add(r1);
		
		//THEN
		assert(rolList.contains(r1));
	}
}
