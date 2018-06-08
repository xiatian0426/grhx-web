package com.acc.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acc.exception.ExceptionUtil;
import com.acc.model.AccIp;
import com.acc.service.IAccIpService;
import com.acc.vo.MemberQuery;
import com.acc.vo.Page;


@Controller
@RequestMapping(value="/manage")
public class ManageController {
	private static Logger _logger = LoggerFactory.getLogger(ManageController.class);
	
	@Autowired
	private IAccIpService accIpService;
	
	
	/**
	 * IP
	 * @param request
	 * @param response
	 * @param model
	 * @return 
	 * @throws Exception
	 */
	@RequestMapping(value = "/ipList")
	public ModelAndView ipList (ModelAndView mav, final HttpServletRequest request,@ModelAttribute MemberQuery query) {
		Map<String, Object> model = mav.getModel();
		try {
			//ip
			query.setPageSize(500);
			Page<AccIp> page = accIpService.selectPage(query);
			model.put("page", page);
			mav=new ModelAndView("/manage/ipList", model);
		} catch (Exception e) {
			_logger.error("转到ip管理失败：" + ExceptionUtil.getMsg(e));
			mav = new ModelAndView("/common/erroprom", model);
		}
		return mav;
	}
	
}
