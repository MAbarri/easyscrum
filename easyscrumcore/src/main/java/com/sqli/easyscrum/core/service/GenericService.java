package com.sqli.easyscrum.core.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface GenericService<M, I extends Serializable> {

    /**
     * 
     * Save or Update object
     * 
     * @param m
     */
    public void persist(M m);

    /**
     * 
     * Save or Update object
     * 
     * @param m
     */
    M update(M m);

    /**
     * get object by PK
     * 
     * @param pk
     * @return target object
     */
    M find(I id);

    /**
     * remove object
     * 
     * @param model
     */
    M remove(I id);

    /**
     * remove object
     * 
     * @param model
     */
    public void remove(M model);

    /**
     * Searches for all instances of model given as a generic type.
     * 
     * @return List of all instances of model given as a generic type.
     */
    List<M> findAll();

    List<M> findWithNamedQuery(String namedQueryName, Map<String, ? extends Object> parameters);

    List<M> find(final Map<String, ? extends Object> params);
}
