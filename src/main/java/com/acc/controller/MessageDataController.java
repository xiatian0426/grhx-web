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
import com.acc.model.GrhxMemberAuth;
import com.acc.model.GrhxMessageData;
import com.acc.model.GrhxMessageType;
import com.acc.model.Proprietor;
import com.acc.service.IAccProvinceService;
import com.acc.service.IFrontDataService;
import com.acc.service.IGrhxMemberAuthService;
import com.acc.service.IGrhxMemberService;
import com.acc.service.IGrhxMessageDataService;
import com.acc.service.IGrhxMessageTypeService;
import com.acc.service.IProprietorService;
import com.acc.util.CalendarUtil;
import com.acc.util.Constants;
import com.acc.vo.MessageDataQuery;
import com.acc.vo.Page;
import com.acc.vo.ProprietorQuery;


@Controller
@RequestMapping(value="/messageData")
public class MessageDataController {
	private static Logger _logger = LoggerFactory.getLogger(MessageDataController.class);
	
	@Autowired
	private IGrhxMessageDataService grhxMessageDataService;
	
	@Autowired
	private IAccProvinceService accProvinceService;
	
	@Autowired
	private IGrhxMessageTypeService grhxMessageTypeService;
	
	@Autowired
	private IGrhxMemberService grhxMemberService;
	
	@Autowired
	private IGrhxMemberAuthService grhxMemberAuthService;
	
	@Autowired
	private IProprietorService proprietorService;
	
	@Autowired
	private IFrontDataService frontDataService;
	/**
	 * 搜索页
	 * @param mav
	 * @param request
	 * @param response
	 * @return
	 * @throws SelectException 
	 */
	@RequestMapping(value = "/goSearch", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView goSearch(ModelAndView mav, final HttpServletRequest request, final HttpServletResponse response,@ModelAttribute MessageDataQuery query) throws SelectException {
		Map<String, Object> model = mav.getModel();
		List<GrhxMessageType> messageTypeList = grhxMessageTypeService.getAll();
		request.setAttribute("messageTypeList", messageTypeList);
		List<AccProvince> provinceList = accProvinceService.getAll();
		request.setAttribute("provinceList", provinceList);
		String dd = "";
		if(query.getDate() != null && !"".equals(query.getDate())){
			dd = query.getDate();
			if("1".equals(query.getDate())){
				query.setDate(CalendarUtil.addDay(CalendarUtil.getCurrentDate(),-7));
			}else if("2".equals(query.getDate())){
				query.setDate(CalendarUtil.addDay(CalendarUtil.getCurrentDate(),-30));
			}else if("3".equals(query.getDate())){
				query.setDate(CalendarUtil.addDay(CalendarUtil.getCurrentDate(),-90));
			}else if("4".equals(query.getDate())){
				query.setDate(CalendarUtil.addDay(CalendarUtil.getCurrentDate(),-180));
			}else if("5".equals(query.getDate())){
				query.setDate(CalendarUtil.addDay(CalendarUtil.getCurrentDate(),-365));
			}
		}
		if(query!=null && query.getContent()!=null && !"".equals(query.getContent())){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("content", query.getContent());
			List<GrhxMessageData> idList = grhxMessageDataService.getByContent(map);
			if(idList!=null && idList.size()>0){
				query.setIds(idList.get(0).getIds());
			}else{
				query.setIds("");
			}
		}
		Page<GrhxMessageData> page = grhxMessageDataService.selectPage(query);
		query.setDate(dd);
		model.put("page", page);
		model.put("query", query);
		String contentQuery = request.getParameter("contentQuery");
		if(contentQuery!=null && !"".equals(contentQuery)){
			model.put("contentQuery", contentQuery);
		}else if(query.getTitle()!=null && !"".equals(query.getTitle())){
			model.put("contentQuery", query.getTitle());
		}else if(query.getContent()!=null && !"".equals(query.getContent())){
			model.put("contentQuery", query.getContent());
		}
		mav=new ModelAndView("/index/search", model);
		return mav;
	}
	
	
	/**
	 * 信息数据详情
	 * @param request
	 * @param response
	 * @param model
	 * @return 
	 * @throws Exception
	 */
	@RequestMapping(value = "/dataDetail")
	public ModelAndView dataDetail (ModelAndView mav, final HttpServletRequest request) {
		Map<String, Object> model = mav.getModel();
		try {
			GrhxMember member = (GrhxMember)request.getSession().getAttribute(Constants.LOGINUSER);
			if(member==null){//未登录
				model.put("auth", "-1");
				mav=new ModelAndView("/messageData/visitorDetail", model);
			}else{//已登录
				GrhxMember grhxMember = grhxMemberService.getById(member.getUserid());
				if(grhxMember==null){
					model.put("auth", "-1");//未登录
					mav=new ModelAndView("/messageData/visitorDetail", model);
				}else{
					String id = request.getParameter("id");
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", id);
					GrhxMessageData messageData = grhxMessageDataService.getById(map);
					model.put("messageData", messageData);
					
					Map<String, Object> authMap = new HashMap<String, Object>();
					authMap.put("id", grhxMember.getAuthid());
					authMap.put("messageright", messageData.getMessagetype());
					GrhxMemberAuth memberAuth = grhxMemberAuthService.getByMap(authMap);
					if(memberAuth==null){
						model.put("auth", "0");//权限不足
						mav=new ModelAndView("/messageData/noAuthDetail", model);
					}else{
						mav=new ModelAndView("/messageData/dataDetail", model);
						model.put("auth", "1");//权限符合
					}
				}
			}
		} catch (Exception e) {
			_logger.error("信息数据详情失败：" + ExceptionUtil.getMsg(e));
			e.printStackTrace();
			mav = new ModelAndView("/common/erroprom", model);
		}
		return mav;
	}
	/**
	 * 热点信息
	 * @param mav
	 * @param request
	 * @return
	 * @throws SelectException
	 */
	@RequestMapping(value = "/getHotMessageData")
	public ModelAndView getHotMessageData (ModelAndView mav, final HttpServletRequest request) throws SelectException{
		Map<String, Object> model = mav.getModel();
		String frontmodule = request.getParameter("frontmodule");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("frontmodule", frontmodule);
		map.put("num", 10);
		List<GrhxMessageData> messageDataList = grhxMessageDataService.getByFrontmodule(map);
		model.put("messageDataList", messageDataList);
		mav=new ModelAndView("/data/hotMessage", model);
		return mav;
	}
	/**
	 * 推荐项目
	 * @param mav
	 * @param request
	 * @return
	 * @throws SelectException
	 */
	@RequestMapping(value = "/getProjectData")
	public ModelAndView getProjectData (ModelAndView mav, final HttpServletRequest request) throws SelectException{
		Map<String, Object> model = mav.getModel();
		String frontmodule = request.getParameter("frontmodule");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("frontmodule", frontmodule);
		map.put("num", 5);
		List<GrhxMessageData> messageDataList = grhxMessageDataService.getByFrontmodule(map);
		model.put("messageDataList", messageDataList);
		mav=new ModelAndView("/data/projectMessage", model);
		return mav;
	}
	/**
	 * 
	 * @param mav
	 * @param request
	 * @return
	 * @throws SelectException
	 */
	@RequestMapping(value = "/getDataByMessagetype")
	public ModelAndView getDataByMessagetype (ModelAndView mav, final HttpServletRequest request) throws SelectException{
		Map<String, Object> model = mav.getModel();
		String messagetype = request.getParameter("messagetype");
		String frontmodule = request.getParameter("frontmodule");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("frontmodule", frontmodule);
		map.put("messagetype", messagetype);
		map.put("num", 3);
		List<GrhxMessageData> messageDataList = grhxMessageDataService.getFrontmoduleByMessagetype(map);
		model.put("messageDataList", messageDataList);
		mav=new ModelAndView("/data/messagetype", model);
		return mav;
	}
	
	@RequestMapping(value = "/getProprietorByType")
	public ModelAndView getProprietorByType (ModelAndView mav, final HttpServletRequest request) throws SelectException{
		Map<String, Object> model = mav.getModel();
		String type = request.getParameter("type");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("num", 5);
		List<Proprietor> proprietorList = proprietorService.getProprietorByType(map);
		model.put("proprietorList", proprietorList);
		mav=new ModelAndView("/data/proprietorList", model);
		return mav;
	}
	
	@RequestMapping(value = "/getFrontDataByType")
	public ModelAndView getFrontDataByType (ModelAndView mav, final HttpServletRequest request) throws SelectException{
		Map<String, Object> model = mav.getModel();
		String type = request.getParameter("type");
		String num = request.getParameter("num");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("num", num);
		List<FrontData> frontDataList = frontDataService.getFrontDataByType(map);
		model.put("frontDataList", frontDataList);
		mav=new ModelAndView("/data/frontDataList", model);
		return mav;
	}
	
	/**
	 * 搜索业主页
	 * @param mav
	 * @param request
	 * @param response
	 * @return
	 * @throws SelectException 
	 */
	@RequestMapping(value = "/goSearchProprietor", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView goSearchProprietor(ModelAndView mav, final HttpServletRequest request, final HttpServletResponse response,@ModelAttribute ProprietorQuery query) throws SelectException {
		Map<String, Object> model = mav.getModel();
		Page<Proprietor> page = proprietorService.selectPage(query);
		model.put("page", page);
		model.put("query", query);
		mav=new ModelAndView("/proprietor/search", model);
		return mav;
	}
	
	/**
	 * 业主详情页
	 * @param mav
	 * @param request
	 * @param response
	 * @return
	 * @throws SelectException 
	 */
	@RequestMapping(value = "/proprietorDetail", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView proprietorDetail(ModelAndView mav, final HttpServletRequest request, final HttpServletResponse response) throws SelectException {
		Map<String, Object> model = mav.getModel();
		try {
			GrhxMember member = (GrhxMember)request.getSession().getAttribute(Constants.LOGINUSER);
			if(member==null){//未登录
				model.put("auth", "-1");
				mav=new ModelAndView("/messageData/visitorDetail", model);
			}else{//已登录
				GrhxMember grhxMember = grhxMemberService.getById(member.getUserid());
				if(grhxMember==null){
					model.put("auth", "-1");//未登录
					mav=new ModelAndView("/messageData/visitorDetail", model);
				}else{
					String id = request.getParameter("id");
					Proprietor proprietor = proprietorService.getById(id);
					model.put("proprietor", proprietor);
					String auth = grhxMember.getAuthid();
					if(auth==null || auth.equals("1") || auth.equals("2")){
						model.put("auth", "0");//权限不足
						mav=new ModelAndView("/messageData/noAuthProprietorDetail", model);
					}else{
						mav=new ModelAndView("/proprietor/proprietorDetail", model);
						model.put("auth", "1");//权限符合
					}
				}
			}
		} catch (Exception e) {
			_logger.error("业主详情页失败：" + ExceptionUtil.getMsg(e));
			e.printStackTrace();
			mav = new ModelAndView("/common/erroprom", model);
		}
		return mav;
	}
}
