package com.sqli.easyscrum.core.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sqli.easyscrum.core.dao.jpa.GenericDao;





@Service
@Transactional
public abstract class GenericServiceImpl<M, I extends Serializable> implements GenericService<M, I>
{

	protected abstract GenericDao<M, I> getDao();

	@Override
	public void persist(final M model)
	{
		getDao().create(model);
	}

	@Override
	public M update(final M model)
	{

		return getDao().edit(model);
	}

	@Override
	public M find(final I id)
	{
		return getDao().find(id);
	}

	@Override
	public M remove(final I id)
	{
		final M model = find(id);
		getDao().remove(model);
		return model;
	}

	@Override
	public void remove(final M model)
	{
		getDao().remove(model);
	}

	@Override
	public List<M> findAll()
	{
		return getDao().findAll();
	}

	@Override
	public List<M> find(final Map<String, ? extends Object> params)
	{
		return getDao().find(params);
	}

	@Override
	public int count(){
	 return getDao().count();	
	}
	
	@Override
	public List<M> findWithNamedQuery(final String namedQueryName, final Map<String, ? extends Object> parameters)
	{
		return getDao().findWithNamedQuery(namedQueryName, parameters);
	}
}
