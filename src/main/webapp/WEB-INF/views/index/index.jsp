<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>中项招标网</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${cssRoot}/main.css"/>
	<link rel="stylesheet" href="${cssRoot}/main2.css"/>
	<link rel="stylesheet" href="${cssRoot}/style.css"/>
	<script src="${jsRoot}/jquery-1.11.1.min.js"></script>
	
	<script>
	$(function(){
		$('#tab-div div').mouseover(function(){
			$('#tab-div div').removeClass('no_left').addClass('no_right');
			$(this).addClass('no_left');
			var index = $(this).index();
			$('#div-cont>div').addClass('divNone');
			$('#div-cont>div').eq(index).removeClass('divNone');
		});
	})
	function liChange(sign){
		$('#move_li li').removeClass('no_left').addClass('no_right');
		if(sign=='1'){
			$("#li_1").addClass('no_left');
			document.getElementById("div_1").style.display="";
			document.getElementById("div_2").style.display="none";
		}else{
			$("#li_2").addClass('no_left');
			document.getElementById("div_1").style.display="none";
			document.getElementById("div_2").style.display="";
		}
	}
	$(document).ready(function(){ 
	　　   var loginSign = ${loginSign};
		if(loginSign=='1'){
			document.getElementById("unlogin").style.display="none";
			document.getElementById("logined").style.display="";
			document.getElementById("unlogin_div").style.display="none";
			document.getElementById("logined_div").style.display="";
		}
	});
	</script>
</head>
<body>
<jsp:include  page="../def/top.jsp"/>

<div id="middle">
	<a href="http://fypac.com/" target="_blank"><img src="${imageRoot }/hengfu1.png" width="100%" height="80px;"/></a>
</div>
<div class="content">
	<div id="middle">
        <!--首页第一栏-->
        <div class="diyilan">
            <div class="yi_left">
                <div class="kuang">
                    <div class="title" style="background-color: #f6f6f6; border-bottom: 1px solid #e7e7e7;
                        padding-left: 0px;">
                        <div class="bghh">
                            <h3 class="Y-t">
                                <a href="#" title="热点信息" target="_blank" style="font-size: 18px;font-weight: bold;">热点信息</a>
                            </h3>
                            <div class="clear">
                            </div>
                        </div>
                    </div>
                    <div class="kuang_list">
                       <c:import url="/messageData/getHotMessageData?frontmodule=1" />
                    </div>
                </div>
                
            </div>
            <div class="yi_center">
                <div class="hot_banner">
                    <div class="main_visual">
						<div class="flicking_con">
							<a class="a01" href="http://www.winteam500.com/index.html" target="_blank">1</a>
							<a class="a01" href="http://www.topsky.com.cn/topskyNew/index.aspx" target="_blank">2</a>
							<a class="a03" href="http://www.lawforever.com/Default.aspx" target="_blank">3</a>
							<a href="http://www.zdlh.com/" target="_blank">4</a>
							<a href="http://www.security.sh.cn/" target="_blank">5</a>
						</div>
						<div class="main_image">
							<ul>
								<li><a href="http://www.lawforever.com/Default.aspx" target="_blank"><span class="img_3"></span></a></li>
								<li><a href="http://www.zdlh.com/" target="_blank"><span class="img_4"></span></a></li>
								<li><a href="http://www.guidelawyer.com/index.aspx" target="_blank"><span class="img_1"></span></a></li>
								<li><a href="http://www.topsky.com.cn/topskyNew/index.aspx" target="_blank"><span class="img_2"></span></a></li>
								<li><a href="http://www.winteam500.com/index.html" target="_blank"><span class="img_5"></span></a></li>
							</ul>
							<a href="javascript:;" id="btn_prev"></a>
							<a href="javascript:;" id="btn_next"></a>
						</div>
					</div>
                </div>
                <div class="kuang">
                    <div class="title" style="border-bottom: 1px solid #e7e7e7; height: 32px;">
                        <h3 class="vip_sj">
                            <a href="#" title="" target="_blank" class="ff" style="font-size: 18px;font-weight: bold;">
                              	 推荐项目
                            </a>
                            <div class="clear">
                            </div>
                        </h3>
                        <div class="clear">
                        </div>
                    </div>
                    <div class="item">
                        <div class="kuang_list">
                			<c:import url="/messageData/getProjectData?frontmodule=2" />
						</div>
                        <div class="clear">
                        </div>
                    </div>
                </div>
            </div>
            <div class="yi_right">
                <div class="zhuce" id="unlogin" style=";height: 40px;">
                    <a href="/account/goRegister" title="注册"  class="denglu" style="color: #fff;">
                        <b>注册</b>
                    </a> 
                    <a href="/account/login" title="登录" class="zc" style="color: #fff;">
                    	<b>登录</b>
                    </a>
                </div>
                <div class="" id="logined" style="display: none;height: 40px;font-size:16px;font-weight:bold;line-height:40px;text-align:left;">
                    &nbsp;&nbsp;${member.userid },您好!&nbsp;
                    <a href="/account/logout" title="注销" style="font-size:16px;">
                    	注销
                    </a>
                </div>
                <div class="kuang" id="unlogin_div">
                    <div class="tool">
                        <a href="/account/goRegister" title="查看最新招标">
                                                                       查看最新招标
                        </a> 
                        <a href="/account/goRegister" title="发布招标信息">
							发布招标信息
						</a>
                        <a href="/account/goRegister" title="了解业主状态">
                                                                     了解业主状态
                        </a> 
                        <a href="/account/goRegister" title="项目深度跟踪">
                        	项目深度跟踪
                        </a> 
                        <a href="/account/goRegister" title="热点项目推荐">
                        	热点项目推荐
                        </a>
                        <a href="/account/goRegister" title=" 专属团队服务">
                                                                    专属团队服务
                        </a>
                        <div class="clear">
                        </div>
                    </div>
                </div>
                <div class="kuang" id="logined_div" style="display: none;">
                    <div class="tool">
                        <a href="/index/contactUs" target="_blank" title="查看最新招标">
                                                                       查看最新招标
                        </a> 
                        <a href="/index/contactUs" target="_blank" title="发布招标信息">
							发布招标信息
						</a>
                        <a href="/index/contactUs" target="_blank" title="了解业主状态">
                                                                     了解业主状态
                        </a> 
                        <a href="/index/contactUs" target="_blank" title="项目深度跟踪">
                        	项目深度跟踪
                        </a> 
                        <a href="/index/contactUs" target="_blank" title="热点项目推荐">
                        	热点项目推荐
                        </a>
                        <a href="/index/contactUs" target="_blank" title=" 专属团队服务">
                                                                    专属团队服务
                        </a>
                        <div class="clear">
                        </div>
                    </div>
                </div>
                <div class="kuang">
                    <div class="title" style="border-bottom: 1px solid #e7e7e7; height: 32px;">
                        <h3 class="vip_sj">
                            <a href="#" title="" target="_blank" class="ff" style="font-size: 18px;font-weight: bold;">
                              	 优秀供应商
                            </a>
                            <div class="clear">
                            </div>
                        </h3>
                        <div class="clear">
                        </div>
                    </div>
                    <style>
                    #golist{position:relative; padding:3px 13px;}
                    #golist ul{position:relative;}
                    .item #golist ul li{float:none; width:227px;}
                    </style>
                    <div class="item">
                        <div class="kuang_list" id="golist">
                		<ul>
                			<c:forEach items="${frontDataThreeList}" var="frontData">                	
						        <li>
						         	<span class="nn_left" style="width: 230px;"><a href="${frontData.url }" title="${frontData.name }" target="_blank">${frontData.name }</a></span>
	                            	<div class="clear"></div>
						        </li>
						    </c:forEach>
						</ul>
					</div>
					<script src="${jsRoot}/jquery.superslide.2.1.1.js"></script>
					<script>
					jQuery(".item").slide({mainCell:"#golist ul",autoPlay:true,effect:"topMarquee",vis:5,interTime:50,trigger:"click"});
					</script>
                        <div class="clear">
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
        <!--首页第一栏结尾-->
        <div id="middle">
        <a href="http://www.64123456.com/" target="_blank"><img src="${imageRoot }/hengfu2.png" width="100%" height="80px;"/></a>
        </div>
        <!--招标专区-->
        <div class="dierlan">
            <div class="er_left">
                <div class="title3" style="font-size: 18px;font-weight: bold;"> 行业专区</div>
                <div class="classify">
                    <ul id="accoradion02" class="accoradion" style="width: 223px;" hovering="false">
                        <li class="active">
                            <a href="#" target="_blank" class="header closed opened" style="font-size: 18px;font-weight: bold;">
                                <em class="">&nbsp;</em>法律项目服务中心
                            </a>
                            <ul style="display: block; height: 100px;">
                                <li style="display: block;">
                                    <div class="tubiaoHH">
                                        <div class="fl_liet">
                                            <span class="dddd">
                                                <a href="/messageData/goSearch?title=法律" target="_blank" title="">法律</a>
                                                <a href="/messageData/goSearch?title=法律顾问" target="_blank" title="" class="duoyu">法律顾问</a>
                                                <a href="/messageData/goSearch?title=律师" target="_blank" title="">律师</a>
                                                <a href="/messageData/goSearch?title=法务顾问" target="_blank" title="" class="duoyu">法务顾问</a>
                                                <a href="/messageData/goSearch?title=律所" target="_blank" title="">律所</a>
                                                <a href="/messageData/goSearch?title=法务服务" target="_blank" title="" class="duoyu">法务服务</a>
                                                <a href="/messageData/goSearch?title=诉讼" target="_blank" title="">诉讼</a>
                                                <a href="/messageData/goSearch?title=纠纷" target="_blank" title="" class="duoyu">纠纷</a>
                                                <div class="clear"> </div>
                                            </span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="active">
                            <a href="#" target="_blank" class="header closed opened" style="font-size: 18px;font-weight: bold;">
                                <em class="">&nbsp;</em>环保项目服务中心
                            </a>
                            <ul style="display: block; height: 100px;">
                                <li style="display: block;">
                                    <div class="tubiaoHH">
                                        <div class="fl_liet">
                                            <span class="dddd">
                                                <a href="/messageData/goSearch?title=絮凝剂" target="_blank" title="">絮凝剂</a>
                                                <a href="/messageData/goSearch?title=絮凝剂" target="_blank" title="" class="duoyu">絮凝剂</a>
                                                <a href="/messageData/goSearch?title=PAC" target="_blank" title="">PAC</a>
                                                <a href="/messageData/goSearch?title=聚合氯化铝" target="_blank" title="" class="duoyu">聚合氯化铝</a>
                                                <a href="/messageData/goSearch?title=PAM" target="_blank" title="">PAM</a>
                                                <a href="/messageData/goSearch?title=聚丙烯酰胺" target="_blank" title="" class="duoyu">聚丙烯酰胺</a>
                                                <a href="/messageData/goSearch?title=药剂" target="_blank" title="">药剂</a>
                                                <a href="/messageData/goSearch?title=污水处理" target="_blank" title="" class="duoyu">污水处理</a>
<!--                                                 <a href="/messageData/goSearch?title=餐饮" target="_blank" title="">餐饮</a> -->
<!--                                                 <a href="/messageData/goSearch?title=汽车租赁" target="_blank" title="" class="duoyu">汽车租赁</a> -->
<!--                                                 <a href="/messageData/goSearch?title=汽车维修" target="_blank" title="">汽车维修</a> -->
<!--                                                 <a href="/messageData/goSearch?title=保险" target="_blank" title="" class="duoyu">保险</a> -->
                                                <div class="clear"> </div>
                                            </span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="active">
                            <a href="#" target="_blank" class="header closed opened" style="font-size: 18px;font-weight: bold;">
                                <em class="">&nbsp;</em>知识产权项目中心
                            </a>
                            <ul style="display: block; height: 100px;">
                                <li style="display: block;">
                                    <div class="tubiaoHH">
                                        <div class="fl_liet">
                                            <span class="dddd">
                                                <a href="/messageData/goSearch?title=知识产权" target="_blank" title="">知识产权</a>
                                                <a href="/messageData/goSearch?title=商标" target="_blank" title="" class="duoyu">商标</a>
                                                <a href="/messageData/goSearch?title=专利" target="_blank" title="">专利</a>
                                                <a href="/messageData/goSearch?title=版权" target="_blank" title="" class="duoyu">版权</a>
                                                <a href="/messageData/goSearch?title=诉讼" target="_blank" title="">诉讼</a>
                                                <a href="/messageData/goSearch?title=境外业务" target="_blank" title="" class="duoyu">境外业务</a>
                                                <%--<a href="/messageData/goSearch?title=LIS" target="_blank" title="">LIS</a>--%>
                                                <%--<a href="/messageData/goSearch?title=健康管理系统" target="_blank" title="" class="duoyu">健康管理系统</a>--%>
<!--                                                 <a href="/messageData/goSearch?title=安防" target="_blank" title="">安防</a> -->
<!--                                                 <a href="/messageData/goSearch?title=弱电" target="_blank" title="" class="duoyu">弱电</a> -->
                                                <div class="clear"> </div>
                                            </span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="active">
                            <a href="#" target="_blank" class="header closed opened" style="font-size: 18px;font-weight: bold;">
                                <em class="">&nbsp;</em>综合
                            </a>
                            <ul style="display: block; height: 100px;">
                                <li style="display: block;">
                                    <div class="tubiaoHH">
                                        <div class="fl_liet">
                                            <span class="dddd">
                                                <a href="/messageData/goSearch?title=标识" target="_blank" title="">标识</a>
                                                <a href="/messageData/goSearch?title=标牌" target="_blank" title="" class="duoyu">标牌</a>
                                                <a href="/messageData/goSearch?title=服装" target="_blank" title="">服装</a>
                                                <a href="/messageData/goSearch?title=家具" target="_blank" title="" class="duoyu">家具</a>
                                                <a href="/messageData/goSearch?title=物资" target="_blank" title="">物资</a>
                                                <a href="/messageData/goSearch?title=劳保" target="_blank" title="" class="duoyu">劳保</a>
                                                <a href="/messageData/goSearch?title=审计" target="_blank" title="">审计</a>
                                                <a href="/messageData/goSearch?title=装饰" target="_blank" title="" class="duoyu">装饰</a>
<!--                                                 <a href="/messageData/goSearch?title=服装" target="_blank" title="">服装</a> -->
<!--                                                 <a href="/messageData/goSearch?title=门窗" target="_blank" title="" class="duoyu">门窗</a> -->
                                                <div class="clear"> </div>
                                            </span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="li_last" style="border:1px solid #e7e7e7; border-top:0;">
                            <a href="#" target="_blank" class="header closed opened" style="font-size: 18px;font-weight: bold;">
                                <em class="">&nbsp;</em>展会信息
                            </a>
                            <ul style="padding-top:12px; padding-bottom:9px;">
                                <c:import url="/messageData/getFrontDataByType?type=2&num=5" /> 
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="er_center">
                <div class="notice">
                    <div class="n_title" id="move-animate-top1">
                        <h3 class="x_hua" style="font-size: 18px;font-weight: bold;"> 
                        	<a href="/messageData/goSearch?messagetype=5" title="" target="_blank" class="ff" style="font-size: 18px;font-weight: bold;">VIP独家</a>
                        </h3>
                        <div class="clear"> </div>
                    </div>
                    <div class="n_content" id="con_BC_1" style="padding-bottom: 0;">
                    	<c:import url="/messageData/getDataByMessagetype?messagetype=5&frontmodule=3" />
                    </div>
                </div>
                <div class="notice">
                    <div class="n_title" id="move-animate-top1">
                        <h3 class="x_hua" style="font-size: 18px;font-weight: bold;"> 
                        	<a href="/messageData/goSearch?messagetype=4" title="" target="_blank" class="ff" style="font-size: 18px;font-weight: bold;">拟在建项目</a>
                        </h3>
                        <div class="clear"> </div>
                    </div>
                    <div class="n_content" id="con_BC_1" style="padding-bottom: 0;">
            			<c:import url="/messageData/getDataByMessagetype?messagetype=4&frontmodule=3" />
                    </div>
                </div>
                <div class="notice">
                    <div class="n_title" id="move-animate-top1">
                        <h3 class="x_hua" style="font-size: 18px;font-weight: bold;"> 
                        	<a href="/messageData/goSearch?messagetype=1" title="" target="_blank" class="ff" style="font-size: 18px;font-weight: bold;">招标公告</a>
                        </h3>
                        <div class="clear"> </div>
                    </div>
                    <div class="n_content" id="con_BC_1" style="padding-bottom: 0;">
	            		<c:import url="/messageData/getDataByMessagetype?messagetype=1&frontmodule=3" />
                    </div>
                </div>
                <div class="notice">
                    <div class="n_title" id="move-animate-top1">
                        <h3 class="x_hua" style="font-size: 18px;font-weight: bold;"> 
          					<a href="/messageData/goSearch?messagetype=2" title="" target="_blank" class="ff" style="font-size: 18px;font-weight: bold;">中标公告</a></h3>
                        <div class="clear"> </div>
                    </div>
                    <div class="n_content" id="con_BC_1" style="padding-bottom: 0;">
	            		<c:import url="/messageData/getDataByMessagetype?messagetype=2&frontmodule=3" />
                    </div>
                </div>
                <div class="notice">
                    <div class="n_title clearfix" id="tab-div">
                        <div class="no_left" id="BCC1">
                            <a href="/messageData/goSearchProprietor?type=1" style="font-size: 15px;font-weight: bold;"><b>业主库</b></a>
                        </div>
                        <div class="no_right" id="BCC2">
                            <a href="/messageData/goSearchProprietor?type=2" style="font-size: 15px;font-weight: bold;"><b>设计院库</b></a>
                        </div>
                        <div class="no_right" id="BCC3">
                            <a href="/messageData/goSearchProprietor?type=3" style="font-size: 15px;font-weight: bold;"><b>代理机构库</b></a>
                        </div>
                        
                    </div>
                   <div id="div-cont">
                   		 <div class="n_content" id="con_BCC_1" style="_padding: 0;">
                		<c:import url="/messageData/getProprietorByType?type=1" /> 
                    </div>
                    <div class="n_content divNone" id="con_BCC_2" style="_padding: 0;">
                        <c:import url="/messageData/getProprietorByType?type=2" /> 
                    </div>
                    <div class="n_content divNone" id="con_BCC_3" style="_padding: 0;">
                        <c:import url="/messageData/getProprietorByType?type=3" /> 
                    </div>
                   </div>
                </div>
            </div>
            <div class="er_right">
            	<div class="kuang" style="margin-top: 10px;">
                    <div class="title2" style="padding-left: 0px;">
                        <h3 class="Y-t">
                            <div class="bggg">
                                <a href="#" title="标王推荐" target="_blank" class="rightcss" style="color: #fff;font-size: 15px;font-weight: bold;"> 会员中标榜</a>
                            </div>
                        </h3>
                        <div class="clear"> </div>
                    </div>
                    <div class="kuang_list" style="padding: 6px 10px;">
                        <ul>
                              <li>
							     <div class="ico_t_pic" style="border-bottom: 1px solid #e7e7e7;width:233px;"><a href="http://www.qinfang.cn/" target="_blank">
									<img src="${imageRoot }/member_1.png" height="61" width="230">
								</a></div>
							    <div class="clear"></div>
							  </li>
	   						<li>
							     <div class="ico_t_pic" style="border-bottom: 1px solid #e7e7e7;width:233px;"><a href="http://www.qdnasen.com/" target="_blank">
									<img src="${imageRoot }/member_2.png" height="61" width="230">
								</a></div>
							    <div class="clear"></div>
							  </li>
							  <li>
							     <div class="ico_t_pic"><a href="http://www.netstar-soft.com/index.html" target="_blank">
									<img src="${imageRoot }/member_3.png" height="61" width="230">
								</a></div>
							    <div class="clear"></div>
							  </li>
                        </ul>
                    </div>
                </div>
                <div class="kuang">
                    <div class="kuang_list">
                        <ul>
	                        <c:import url="/messageData/getFrontDataByType?type=4&num=10" />
						</ul>
                    </div>
                </div>
                
                <div class="kuang">
                    <div class="title2">
                        <h3 class="Y-t">
                            <a href="#" title="" target="_blank" class="rightcss" style="font-size: 18px;font-weight: bold;">行业动态</a>
                        </h3>
                        <div class="clear"> </div>
                    </div>
                    <div class="kuang_list">
                    	
                        <ul>
                    	<li class="li_last" style="border:1px solid #e7e7e7; border-top:0;">
                    		<ul>
                    			<c:import url="/messageData/getFrontDataByType?type=1&num=5" /> 
                    		</ul>
                        </li>
						</ul>
                    </div>
                </div>
            </div>
            <div class="clear"> </div>
        </div>
		<div id="middle">
        <a href="http://www.henganweishi.com/" target="_blank"><img src="${imageRoot }/hengfu3.png" width="100%" height="80px;"/></a>
        </div>
		<div class="other">
		    <div class="lan">
		        <div class="er_title">
		            <h3 class="x_hua" style="font-size: 18px;font-weight: bold;">
		                	地区导航
		            </h3>
		            <div class="clear">
		            </div>
		        </div>
		        <div class="map_list">
		            <ul>
		                <li class="huadong">
		                    <b>华东:</b>
		                    <a href="/messageData/goSearch?province=31" target="_blank">上海</a>
		                    <a href="/messageData/goSearch?province=32" target="_blank">江苏</a>
		                    <a href="/messageData/goSearch?province=33" target="_blank">浙江</a>
		                    <a href="/messageData/goSearch?province=34" target="_blank">安徽</a>
		                    <a target="_blank" href="/messageData/goSearch?province=35">福建</a>
		                    <a target="_blank" href="/messageData/goSearch?province=36">江西</a>
		                    <a target="_blank" href="/messageData/goSearch?province=37">山东</a>
		                </li>
		                <li class="huadong2">
		                    <b>东北:</b>
		                    <a target="_blank" href="/messageData/goSearch?province=21">辽宁</a>
		                    <a target="_blank" href="/messageData/goSearch?province=22">吉林</a>
		                    <a target="_blank" href="/messageData/goSearch?province=23">黑龙江</a>
		                </li>
		                <li class="huadong2">
		                    <b>西北:</b>
		                    <a target="_blank" href="/messageData/goSearch?province=61">陕西</a>
		                    <a target="_blank" href="/messageData/goSearch?province=62">甘肃</a>
		                    <a target="_blank" href="/messageData/goSearch?province=63">青海</a>
		                    <a target="_blank" href="/messageData/goSearch?province=64">宁夏</a>
		                    <a target="_blank" href="/messageData/goSearch?province=65">新疆</a>
		                </li>
		                <li class="huadong2">
		                    <b>华中:</b>
		                    <a target="_blank" href="/messageData/goSearch?province=41">河南</a>
		                    <a target="_blank" href="/messageData/goSearch?province=42">湖北</a>
		                    <a target="_blank" href="/messageData/goSearch?province=43">湖南</a>
		                </li>
		                <li class="huadong">
		                    <b>华北:</b>
		                    <a target="_blank" href="/messageData/goSearch?province=11">北京</a>
		                    <a target="_blank" href="/messageData/goSearch?province=13">河北</a>
		                    <a target="_blank" href="/messageData/goSearch?province=12">天津</a>
		                    <a target="_blank" href="/messageData/goSearch?province=14">山西</a>
		                    <a target="_blank" href="/messageData/goSearch?province=15">内蒙古</a>
		                </li>
		                <li class="huadong2">
		                    <b>华南:</b>
		                    <a target="_blank" href="/messageData/goSearch?province=44">广东</a>
		                    <a target="_blank" href="/messageData/goSearch?province=46">海南</a>
		                    <a target="_blank" href="/messageData/goSearch?province=45">广西</a>
		                    <a target="_blank" href="/messageData/goSearch?province=81">香港</a>
		                    <a target="_blank" href="/messageData/goSearch?province=82">澳门</a>
		                </li>
		                <li class="huadong">
		                    <b>西南:</b>
		                    <a target="_blank" href="/messageData/goSearch?province=51">四川</a>
		                    <a target="_blank" href="/messageData/goSearch?province=50">重庆</a>
		                    <a target="_blank" href="/messageData/goSearch?province=52">贵州</a>
		                    <a target="_blank" href="/messageData/goSearch?province=53">云南</a>
		                    <a target="_blank" href="/messageData/goSearch?province=54">西藏</a>
		                </li>
		                <div class="clear">
		                </div>
		            </ul>
		        </div>
		    </div>
		  <div class="lan">
		        <div class="er_title">
		            <h3 class="x_hua" style="font-size: 18px;font-weight: bold;">
		                	友情链接
		            </h3>
		            <div class="clear">
		            </div>
		        </div>
		        <div class="map_list">
		            <ul>
		                <li class="huadong" style="width: 100%;">
		                    <a href="http://www.ecpmi.org.cn/" target="_blank">中国物业管理协会</a>
				             <a href="http://www.caepi.org.cn/" target="_blank">中国环境保护产业协会</a>
				             <a href="http://www.fjgpc.cn/" target="_blank">陕西招标网福建省政府采购中心</a>
				             <a href="http://www.cida.org.cn/" target="_blank">中国室内装饰协会</a>
				             <a href="http://www.ndrc.gov.cn/" target="_blank">国家发展改革委员会</a>
				             <a href="http://www.dv37.com/" target="_blank">加盟网</a>
				             <a href="http://www.zhongxiangzhaobiao.com" target="_blank">中项招标网</a>
				             <br/>
				             <a href="http://www.caec.org.cn/" target="_blank">中国展览馆协会</a>
				             <a href="http://www.zhongxiangzhaobiao.com" target="_blank">项目网</a>
				             <a href="http://www.ctba.org.cn/" target="_blank">中国招标投标协会</a>
				             <a href="http://www.acla.org.cn/home/toPage" target="_blank">中国律师网</a>
				             <a href="http://china-jt.com/" target="_blank">高速招标网</a>
				             <a href="http://www.zhongxiangzhaobiao.com" target="_blank">招标网</a>
				             <a href="https://bj.lianjia.com/" target="_blank">北京房产网</a>
				             <a href="http://www.114chn.com/" target="_blank">114黄页</a>
				             <a href="http://jobs.zhaopin.com/" target="_blank">人才网</a>
				             <a href="https://www.chinapp.com/" target="_blank">中国品牌网</a>
				             <a href="http://www.k18.com" target="_blank">中国餐饮加盟网</a>
				             <a href="https://www.autohome.com.cn" target="_blank">汽车之家</a>
		                </li>
		            </ul>
		        </div>
		    </div>
		</div>
	</div>
</div>
<jsp:include  page="../def/footer.jsp"/>

	<script src="${jsRoot}/jquery.event.drag-1.5.min.js"></script>
	<script src="${jsRoot}/jquery.touchSlider.js"></script>
<script type="text/javascript">
    $(document).ready(function(){

	$dragBln = false;
	
	$(".main_image").touchSlider({
		flexible : true,
		speed : 300,
		btn_prev : $("#btn_prev"),
		btn_next : $("#btn_next"),
		paging : $(".flicking_con a"),
		counter : function (e){
			$(".flicking_con a").removeClass("on").eq(e.current-1).addClass("on");
		}
	});
	
	$(".main_image").bind("mousedown", function() {
		$dragBln = false;
	});
	
	$(".main_image").bind("dragstart", function() {
		$dragBln = true;
	})
	
	$(".main_image .a").click(function(){
		if($dragBln) {
			return false;
		}
	});
	
	timer = setInterval(function(){
		$("#btn_next").click();
	}, 3000);
	
	$(".main_visual").hover(function(){
		clearInterval(timer);
	},function(){
		timer = setInterval(function(){
			$("#btn_next").click();
		},3000);
	});
	
	$(".main_image").bind("touchstart",function(){
		clearInterval(timer);
	}).bind("touchend", function(){
		timer = setInterval(function(){
			$("#btn_next").click();
		}, 2000);
	});
	
});
</script>
</body>
</html>