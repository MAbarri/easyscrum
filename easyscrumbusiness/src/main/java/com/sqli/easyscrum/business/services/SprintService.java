package com.sqli.easyscrum.business.services;

import java.util.List;
import org.springframework.stereotype.Service;
import com.sqli.easyscrum.entity.Sprint;

@Service
public interface SprintService {
	public Sprint getsprintById(int id);
	
	public void creatsprint(Sprint u);
	
	public void deletesprint(Sprint u);
	
	public void editsprint(Sprint u);
	
	public List<Sprint> getAllSprint();
}
