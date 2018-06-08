package com.acc.service;

import java.util.List;
import java.util.Map;

import com.acc.exception.SelectException;
import com.acc.model.Proprietor;

public interface IProprietorService extends IBaseService<Proprietor> {
	
	List<Proprietor> getProprietorByType (Map<String, Object> map) throws SelectException;
	
	Proprietor getById(String id)  throws SelectException;
	
}
