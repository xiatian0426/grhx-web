package com.acc.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.acc.dao.ProprietorMapper;
import com.acc.exception.SelectException;
import com.acc.model.Proprietor;
import com.acc.service.IProprietorService;

@Service("proprietorService")
@Transactional
public class ProprietorServiceImpl extends BaseServiceImpl<Proprietor> implements IProprietorService {

	private static Logger _logger = LoggerFactory.getLogger(ProprietorServiceImpl.class);
	@Autowired
	private ProprietorMapper proprietorMapper;

	@Override
	public List<Proprietor> getProprietorByType (Map<String, Object> map) throws SelectException {
		List<Proprietor> list = proprietorMapper.getProprietorByType(map);
		return list;
	}
	
	@Override
	public Proprietor getById(String id)  throws SelectException{
		return proprietorMapper.getById(id);
	}
}
