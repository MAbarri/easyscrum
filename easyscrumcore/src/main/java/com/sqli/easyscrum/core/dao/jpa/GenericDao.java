package com.sqli.easyscrum.core.dao.jpa;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
	
public interface GenericDao<M, I extends Serializable> {
	

	void create(M model);

	M edit(M model);

	void remove(M model);

	M find(I id);

	List<M> findAll();

	List<M> findRange(int[] range);

	int count();

	void remove(I id);

	List<M> findWithNamedQuery(String namedQueryName, Map<String, ? extends Object> parameters);

	List<M> findWithNamedQuery(String namedQueryName);

	List<M> find(Map<String, ? extends Object> parameters);


}
