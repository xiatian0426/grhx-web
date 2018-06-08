package com.acc.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acc.exception.SelectException;
import com.acc.model.GrhxMember;
import com.acc.service.IGrhxMemberService;


@Controller
@RequestMapping(value="/member")
public class GrhxMemberController {
	private static Logger _logger = LoggerFactory.getLogger(GrhxMemberController.class);
	
	@Autowired
	private IGrhxMemberService grhxMemberService;
	
	/**
	 * 验证 用户名是否存在  存在 false 不存在 true 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/checkUserid")
	public boolean checkUserid (final HttpServletRequest request) {
		String userid = request.getParameter("userid");
		try {
			GrhxMember member = grhxMemberService.getByIdAll(userid.trim());
			//当前登录名称不存在
			if (member == null) return false;
		} catch (SelectException e) {
			return true;
		}
		return true;
	}
}
