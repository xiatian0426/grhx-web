/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2016
 */

package com.acc.vo;

import java.io.Serializable;

/**
 * @version 1.0
 * @since 1.0
 */

public class ProprietorQuery extends BaseQuery implements Serializable {
	private static final long serialVersionUID = 8919702895609433060L;
	private Integer id;
	private String company;
	private String type;
	private String createtime;
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
}
