package com.acc.service;

import java.util.List;
import java.util.Map;

import com.acc.exception.SelectException;
import com.acc.model.FrontData;

public interface IFrontDataService extends IBaseService<FrontData> {
	
	List<FrontData> getFrontDataByType (Map<String, Object> map) throws SelectException;
	
}
