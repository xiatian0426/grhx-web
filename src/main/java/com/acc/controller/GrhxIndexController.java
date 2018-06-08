package com.acc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.acc.exception.ExceptionUtil;
import com.acc.exception.SelectException;
import com.acc.model.AccProvince;
import com.acc.model.FrontData;
import com.acc.model.GrhxMember;
import com.acc.model.GrhxMessageData;
import com.acc.model.GrhxMessageType;
import com.acc.service.IAccProvinceService;
import com.acc.service.IFrontDataService;
import com.acc.service.IGrhxMessageDataService;
import com.acc.service.IGrhxMessageTypeService;
import com.acc.util.Constants;
import com.acc.vo.MemberQuery;
import com.acc.vo.MessageDataQuery;
import com.acc.vo.Page;


@Controller
@RequestMapping(value="/index")
public class GrhxIndexController {
	private static Logger _logger = LoggerFactory.getLogger(GrhxIndexController.class);
	
	@Autowired
	private IGrhxMessageTypeService grhxMessageTypeService;
	
	@Autowired
	private IAccProvinceService accProvinceService;
	
	@Autowired
	private IFrontDataService frontDataService;
	/**
	 * 前台首页
	 * @param request
	 * @param response
	 * @param model
	 * @return 
	 * @throws Exception
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView login (ModelAndView mav, final HttpServletRequest request) {
		Map<String, Object> model = mav.getModel();
		try {
			GrhxMember member = (GrhxMember)request.getSession().getAttribute(Constants.LOGINUSER);
			model.put("member", member);
			if(member==null){//未登录
				model.put("loginSign", "0");
			}else{
				model.put("loginSign", "1");
			}
			//优秀供应商
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("type", 3);
			map.put("num", 5);
			List<FrontData> frontDataThreeList = frontDataService.getFrontDataByType(map);
			model.put("frontDataThreeList", frontDataThreeList);
			mav=new ModelAndView("/index/index", model);
		} catch (Exception e) {
			_logger.error("转到前台首页失败：" + ExceptionUtil.getMsg(e));
			mav = new ModelAndView("/common/erroprom", model);
		}
		return mav;
	}
	/**
	 * 服务列表页
	 * @param mav
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/serviceList", method = RequestMethod.GET)
	public ModelAndView serviceList (ModelAndView mav, final HttpServletRequest request) {
		Map<String, Object> model = mav.getModel();
		try {
			mav=new ModelAndView("/html/serviceList", model);
		} catch (Exception e) {
			_logger.error("转到服务列表页失败：" + ExceptionUtil.getMsg(e));
			mav = new ModelAndView("/common/erroprom", model);
		}
		return mav;
	}
	/**
	 * 付费指导页
	 * @param mav
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/payGuidance", method = RequestMethod.GET)
	public ModelAndView payGuidance (ModelAndView mav, final HttpServletRequest request) {
		Map<String, Object> model = mav.getModel();
		try {
			mav=new ModelAndView("/html/payGuidance", model);
		} catch (Exception e) {
			_logger.error("转到付费指导页失败：" + ExceptionUtil.getMsg(e));
			mav = new ModelAndView("/common/erroprom", model);
		}
		return mav;
	}
	/**
	 * 法律声明
	 * @param mav
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/legalDeclaration", method = RequestMethod.GET)
	public ModelAndView legalDeclaration (ModelAndView mav, final HttpServletRequest request) {
		Map<String, Object> model = mav.getModel();
		try {
			mav=new ModelAndView("/html/legalDeclaration", model);
		} catch (Exception e) {
			_logger.error("转到法律声明页失败：" + ExceptionUtil.getMsg(e));
			mav = new ModelAndView("/common/erroprom", model);
		}
		return mav;
	}
	/**
	 * 联系我们
	 * @param mav
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/contactUs", method = RequestMethod.GET)
	public ModelAndView contactUs (ModelAndView mav, final HttpServletRequest request) {
		Map<String, Object> model = mav.getModel();
		try {
			mav=new ModelAndView("/html/contactUs", model);
		} catch (Exception e) {
			_logger.error("转到联系我们页失败：" + ExceptionUtil.getMsg(e));
			mav = new ModelAndView("/common/erroprom", model);
		}
		return mav;
	}
	/**
	 * 关于我们
	 * @param mav
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/aboutUs", method = RequestMethod.GET)
	public ModelAndView aboutUs (ModelAndView mav, final HttpServletRequest request) {
		Map<String, Object> model = mav.getModel();
		try {
			mav=new ModelAndView("/html/aboutUs", model);
		} catch (Exception e) {
			_logger.error("转到关于我们页失败：" + ExceptionUtil.getMsg(e));
			mav = new ModelAndView("/common/erroprom", model);
		}
		return mav;
	}
}
