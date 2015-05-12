package com.sqli.easyscrum.repository.Impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.sqli.easyscrum.entity.Sprint;
import com.sqli.easyscrum.repository.DAOsprint;
@Repository
public class DAOsprintImpl implements DAOsprint {
	List<Sprint> list = new ArrayList<Sprint>();
	
	public void init()
	{

		
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
