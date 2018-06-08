package com.acc.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.acc.dao.FrontDataMapper;
import com.acc.exception.SelectException;
import com.acc.model.FrontData;
import com.acc.service.IFrontDataService;

@Service("frontDataService")
@Transactional
public class FrontDataServiceImpl extends BaseServiceImpl<FrontData> implements IFrontDataService {

	private static Logger _logger = LoggerFactory.getLogger(FrontDataServiceImpl.class);
	@Autowired
	private FrontDataMapper frontDataMapper;
	
	@Override
	public List<FrontData> getFrontDataByType (Map<String, Object> map) throws SelectException{
		return frontDataMapper.getFrontDataByType(map);
	}

}
