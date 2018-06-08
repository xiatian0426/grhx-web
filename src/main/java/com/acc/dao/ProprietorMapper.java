package com.acc.dao;

import java.util.List;
import java.util.Map;

import com.acc.exception.SelectException;
import com.acc.model.Proprietor;

public interface ProprietorMapper  extends BaseMapper<Proprietor>{

	List<Proprietor> getProprietorByType (Map<String, Object> map) throws SelectException;
	
	Proprietor getById(String id)  throws SelectException;
}
