package com.acc.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.acc.exception.ExceptionUtil;
import com.acc.frames.web.Md5PwdEncoder;
import com.acc.frames.web.WebCookies;
import com.acc.model.AccIp;
import com.acc.model.GrhxMember;
import com.acc.service.IAccIpService;
import com.acc.service.IAccUserLoginHisService;
import com.acc.service.IGrhxMemberService;
import com.acc.util.Constants;
import com.acc.util.MakePicture;


@Controller
@RequestMapping(value="/account")
public class AccAccountController {
	private static Logger _logger = LoggerFactory.getLogger(AccAccountController.class);
	
	@Autowired
	private IAccIpService accIpService;
	
	@Autowired
	private IAccUserLoginHisService accUserLoginHisService;
	
	@Autowired
	private IGrhxMemberService grhxMemberService;
	
	/**
	 * 过滤器自动跳转到登录首页
	 * @param request
	 * @param response
	 * @param model
	 * @return 
	 * @throws Exception
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login (ModelAndView mav, final HttpServletRequest request) {
		Map<String, Object> model = mav.getModel();
		try {
			mav=new ModelAndView("/account/login", model);
		} catch (Exception e) {
			_logger.error("转到登录首页失败：" + ExceptionUtil.getMsg(e));
			mav = new ModelAndView("/common/erroprom", model);
		}
		return mav;
	}
	
	/**
	 * 登录按钮
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginPost(ModelAndView mav, final HttpServletRequest request, final HttpServletResponse response) {
		Map<String, Object> model = mav.getModel();
		try {
			String loginMsg = "";
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("pwd");
			String verifycode = request.getParameter("verifycode");
			String vcode = (String)request.getSession().getAttribute(Constants.VALIDATESESSIONREGISTER);
			String noRight = (String)request.getAttribute("noRight");
			if(noRight==null || !noRight.equals("1")){
				if (!verifycode.equalsIgnoreCase(vcode)){
					loginMsg = "验证码不正确！";
					model.put("sign", 2);
					model.put("loginMsg", loginMsg);
					//TODO 测试需要暂时关闭验证码
					return new ModelAndView("/account/login",model);
				}
			}else{
				userid = (String)request.getAttribute("userid");
				passwd = (String)request.getAttribute("passwd");
			}
			GrhxMember member = grhxMemberService.getById(userid);
			if (member == null) {
				model.put("sign", -1);
				loginMsg = "该用户不存在";
				model.put("loginMsg", loginMsg);
				return new ModelAndView("/account/login",model);
			} else if (member.getStatus() != null && member.getStatus()==1){
				model.put("sign", -1);
				model.put("loginMsg", "该用户被删除");
				return new ModelAndView("/account/login",model);
			} else {
				String password = member.getPwd();
				if (!Md5PwdEncoder.getMD5Str(userid+passwd).equals(password)){
					model.put("sign", -1);
					model.put("loginMsg", "密码错误");
					return new ModelAndView("/account/login",model);
				}
			}
			//存入session
			HttpSession session = request.getSession();
			session.setAttribute(Constants.LOGINUSER, member);
			//用户名存入cookies
			WebCookies.addCookie(response, Constants.COOKIESUSERNAME, member.getUserid()+"", Constants.COOKIESTIMES,"/");
			request.getSession().setAttribute(Constants.LOGINUSER, member);
			mav=new ModelAndView("redirect:/", model);
		} catch (Exception e) {
			_logger.error("登录失败：" + ExceptionUtil.getMsg(e));
			mav = new ModelAndView("/common/erroprom", model);
		}
		return mav;
	}
	
	/**
     * 
     * @Title: getRemoteIpAddr
     * @Description: 获得登陆用户IP地址
     * @param @return
     */
    public static String getRemoteIpAddr(final HttpServletRequest request) {
        
        if (request != null && request instanceof HttpServletRequest) {
            String ip = request.getHeader("x-forwarded-for");
            if (ip == null || ip.length() == 0
                    || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("Proxy-Client-IP");
            }
            if (ip == null || ip.length() == 0
                    || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("WL-Proxy-Client-IP");
            }
            if (ip == null || ip.length() == 0
                    || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getRemoteAddr();
            }
            String[] ips = ip.split(",");
            if (ips.length > 1) {
                return ips[0];
            } else {
                return ip;
            }
        } else {
            return null;
        }
    }
	
    public boolean getIpIsRight(String ip) throws Exception {
		boolean isRight=false;
		 List<AccIp> ipLists=accIpService.getAll();
		 for(int i=0;i<ipLists.size();i++){
			 AccIp loginIp=ipLists.get(i);
			 if(ip.startsWith(loginIp.getIp())){
				 isRight=true;
			 }
		 }
		 return isRight;
	}
    
	/**
	 * 生产验证码图片
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/verifycode")
	public void verifycode(final HttpServletRequest request, final HttpServletResponse response) {
		try {
			MakePicture mp = new MakePicture();
			String str = mp.drawPicture(60, 20, response.getOutputStream());
			System.out.println(str);
			request.getSession().setAttribute(Constants.VALIDATESESSION, str);
			response.getOutputStream().print(str);
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	
	/**
	 * 生产验证码图片
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/verifycoderegister")
	public void verifycoderegister(final HttpServletRequest request, final HttpServletResponse response) {
		try {
			MakePicture mp = new MakePicture();
			String str = mp.drawPicture(60, 20, response.getOutputStream());
			System.out.println(str);
			request.getSession().setAttribute(Constants.VALIDATESESSIONREGISTER, str);
			response.getOutputStream().print(str);
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	
	/**
	 * 退出系统
	 * @param mav
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/logout")
	public ModelAndView logout(final ModelAndView mav,final HttpServletRequest request, final HttpServletResponse response) {
		Map<String, Object> model = mav.getModel();
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if (Constants.COOKIESUSERNAME.equals(cookie.getName())) {
					cookie.setPath("/");
					cookie.setMaxAge(0);
	        		response.addCookie(cookie);
	        		break;
				}
			}
		}
		HttpSession session = request.getSession();
		if (session != null) {
			session.setAttribute(Constants.LOGINUSER, null);
		}
		return new ModelAndView("redirect:/", model);
	}
	/**
	 * 进入注册页面
	 * @param mav
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/goRegister", method = RequestMethod.GET)
	public ModelAndView goRegister(ModelAndView mav, final HttpServletRequest request, final HttpServletResponse response) {
		Map<String, Object> model = mav.getModel();
		mav=new ModelAndView("/account/register", model);
		return mav;
	}
	
	/**
	 * 注册
	 * @param mav
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView register(ModelAndView mav, final HttpServletRequest request, final HttpServletResponse response,@ModelAttribute GrhxMember grhxMember) {
		Map<String, Object> model = mav.getModel();
		try {
			String pwd = grhxMember.getPwd();
			String verifycode = request.getParameter("verifycode");
			String vcode = (String)request.getSession().getAttribute(Constants.VALIDATESESSIONREGISTER);
			if (!verifycode.equalsIgnoreCase(vcode)){
				model.put("sign", 2);
				model.put("loginMsg", "验证码不正确！");
				return new ModelAndView("/account/login",model);
			}
			grhxMember.setPwd(Md5PwdEncoder.getMD5Str(grhxMember.getUserid()+grhxMember.getPwd()));
			grhxMember.setCreatetime(new Date());
			grhxMember.setAuthid("0");
			grhxMember.setStatus(0);
			if(grhxMember.getTel()!=null && "2".equals(grhxMember)){
				grhxMember.setTel(grhxMember.getPhone());
				grhxMember.setPhone("");
			}
			grhxMemberService.insert(grhxMember);
			request.setAttribute("userid", grhxMember.getUserid());
			request.setAttribute("passwd", pwd);
			request.setAttribute("noRight", "1");
		} catch (Exception e) {
			_logger.error("注册失败：" + ExceptionUtil.getMsg(e));
			e.printStackTrace();
			mav = new ModelAndView("/common/erroprom", model);
		}
		return loginPost(mav,request,response);
	}
}
