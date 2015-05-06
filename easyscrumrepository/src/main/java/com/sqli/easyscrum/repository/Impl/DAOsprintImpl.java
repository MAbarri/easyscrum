package com.sqli.easyscrum.repository.Impl;

import java.util.ArrayList;
import java.util.List;

import com.sqli.easyscrum.entity.Sprint;
import com.sqli.easyscrum.repository.DAOsprint;

public class DAOsprintImpl implements DAOsprint {
	List<Sprint> list = new ArrayList<Sprint>();
	
	public void init()
	{
		list.add(new Sprint(1,"Main Sprint", "08/09/2014", "28/09/2014", "Delivery"));
		list.add(new Sprint(2,"Side Sprint", "08/02/2014", "28/02/2014", "Ready for a Demo"));
		list.add(new Sprint(3,"Final Sprint", "08/01/2015", "28/01/2015", "Working On"));

		
	}
	
	@Override
	public Sprint getsprintById(int id) {
		Sprint result=null;
		for(Sprint i:list)
			if(i.getIdsprint()==id)
				result=i;
		return result;
	}

	@Override
	public void creatsprint(Sprint u) {
		list.add(u);

	}

	@Override
	public void deletesprint(Sprint u) {
		for(Sprint i:list)
			if(i.getIdsprint()==u.getIdsprint())
				list.remove(i);

	}

	@Override
	public void editsprint(Sprint u) {
		for(Sprint i:list)
			if(i.getIdsprint()==u.getIdsprint())
				i=u;

	}

	@Override
	public List<Sprint> getAllSprint() {
		return list;
	}

}
