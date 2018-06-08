package com.acc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acc.exception.ExceptionUtil;
import com.acc.model.AccIp;
import com.acc.service.IAccIpService;
import com.acc.service.IAccRoleService;
import com.acc.util.Constants;


@Controller
@RequestMapping(value="/ajax")
public class AjaxController {
	private static Logger _logger = LoggerFactory.getLogger(AjaxController.class);
	
	@Autowired
	private IAccRoleService accRoleService;
	
	@Autowired
	private IAccIpService accIpService;
	
	/**
	 * 删除Ip
	 * @param request
	 * @param response
	 * @param model
	 * @return 
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteIp", method = RequestMethod.POST)
	public Map<String, Object> deleteIp (final HttpServletRequest request,
	final HttpServletResponse response) {
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			String id = request.getParameter("id");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			accIpService.deleteById(map);
			model.put("info", "删除成功");
		} catch (Exception e) {
			_logger.error("删除Ip失败：" + ExceptionUtil.getMsg(e));
			model.put("info", "删除失败");
		}
		return model;
	}
	/**
	 * 修改Ip
	 * @param request
	 * @param response
	 * @param model
	 * @return 
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/editIp", method = RequestMethod.POST)
	public Map<String, Object> editIp (final HttpServletRequest request,
	final HttpServletResponse response) {
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			String id = request.getParameter("id");
			String ip = request.getParameter("ip");
			String descrip = request.getParameter("descrip");
			AccIp accIp = new AccIp();
			accIp.setId(Integer.valueOf(id));
			accIp.setIp(ip);
			accIp.setDescrip(descrip);
			accIp.setIsDeleted("0");
			accIpService.update(accIp);
			model.put("info", "修改成功");
		} catch (Exception e) {
			_logger.error("修改Ip失败：" + ExceptionUtil.getMsg(e));
			model.put("info", "修改失败");
		}
		return model;
	}
	/**
	 * 添加Ip
	 * @param request
	 * @param response
	 * @param model
	 * @return 
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/addIp", method = RequestMethod.POST)
	public Map<String, Object> addIp (final HttpServletRequest request,
	final HttpServletResponse response) {
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			String ip = request.getParameter("ip");
			String descrip = request.getParameter("descrip");
			AccIp accIp = new AccIp();
			accIp.setIp(ip);
			accIp.setDescrip(descrip);
			accIp.setIsDeleted("0");
			accIpService.insert(accIp);
			model.put("info", "添加成功");
		} catch (Exception e) {
			_logger.error("添加Ip失败：" + ExceptionUtil.getMsg(e));
			model.put("info", "添加失败");
		}
		return model;
	}
	/**
	 * 校验验证码
	 * @param request
	 * @param response
	 * @param model
	 * @return 
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/checkSurePwd", method = RequestMethod.POST)
	public boolean checkSurePwd (final HttpServletRequest request,
	final HttpServletResponse response) {
		try {
			String verifycode = request.getParameter("verifycode");
			String vcode = (String)request.getSession().getAttribute(Constants.VALIDATESESSIONREGISTER);
			if (vcode!=null && verifycode!=null && !verifycode.equals("") && verifycode.equalsIgnoreCase(vcode)){
				return true;
			}else{
				return false;
			}
		} catch (Exception e) {
			_logger.error("校验验证码失败：" + ExceptionUtil.getMsg(e));
			e.printStackTrace();
			return false;
		}
		
	}
}
