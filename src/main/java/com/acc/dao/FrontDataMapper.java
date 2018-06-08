package com.acc.dao;

import java.util.List;
import java.util.Map;

import com.acc.exception.SelectException;
import com.acc.model.FrontData;

public interface FrontDataMapper  extends BaseMapper<FrontData>{

	List<FrontData> getFrontDataByType (Map<String, Object> map) throws SelectException;
}
