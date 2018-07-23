<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="javax.servlet.http.Cookie"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 	boolean flag = false;
 	String userid = "";
	Cookie[] cook = request.getCookies();
	if(cook != null && cook.length > 0){
		for(int k = 0;k < cook.length;k++){
			if("cookieUserName_web".equals(cook[k].getName())){
				userid = cook[k].getValue();
				flag = true;
			}
		} 
	} 
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${jsRoot}/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	function topSearch(){
		var selected = $("#selected").text();
		var contentQuery = $("#contentQuery").val();
		if(contentQuery==''){
			alert("请输入关键字!");
			return false;
		}
		if(selected=='标题'){//搜标题
			$("#title").val(contentQuery);
		}else{//搜全文
			$("#content").val(contentQuery);
		}
		$("#topSearch").submit();
	}
	$(function(){
		$('.selected').click(function(){
			$('.selBox').show();
		})
		$('.selBox p').click(function(){
			$('.selected').html($(this).text());
			$('.selBox').hide();
		});
		$(document).click(function(ev){
			if(ev.target==$('#selected')[0]){
				return false;
			}else{
				$('.selBox').hide();
			}
		})
	})
</script>
</head>
<style>
    .top-nav{width:1000px; height:50px; background:#1d59bd; margin:0 auto;}
    .clearfix:after{display:block; content:'';clear:both;}
    .clearfix{zoom:1;}
    .nav-left{float:left; width:198px; border-right:1px solid #ccc; text-align:center; line-height:50px; font-size:26px; font-weight:700;color:#fff;}
    .nav-right{float:left; width:800px;}
    .nav-right a{display:inline-block; width:150px; line-height:50px; text-align:center; color:#fff; font-size:18px; font-weight:600;}
	.clearfix:after{clear:both; content:'';display:block;}
	.header .div_sear .sel{cursor:pointer; margin-right:3px; line-height:40px; width:100px; text-align:center; height:40px; background:#fff; float:left;position:relative;}
	.header .div_sear input{width:300px;float:left;}
	.header .div_sear span{ width:60px; height:40px; font-weight:600; color:#fff; text-align:center; border:none; float:left; line-height:40px; cursor:pointer; background:#e83939;}
	.sel{position:relative;}
	.selected{background:url(${imageRoot }/icon2.jpg) 68px 17px no-repeat;}
	.sel .selBox{position:absolute; left:0; top:40px; background:#fff; width:100%; display:none;}
	.sel .selBox p{line-height:30px;text-align:center;} 
</style>
<body>
<div class="h-top header" style="background: rgba(200,200,200,.3);">
	<div class="h-banner">
	    <div class="hleft">
	    	<% if(flag){%>
	    		您好！<a class="zcbtn1" target="_blank" href="#" style="color: red;font-size: 16px;line-height:18px;"><%=userid%></a>，欢迎来到中项招标
	    		<a class="dlbtn" href="/account/logout">注销</a>
	    	<%}else{%>
	    		<a class="zcbtn" href="/account/goRegister">注册</a>
	    		<a class="dlbtn" href="/account/login">登录</a>
	    	<%}%>
	    </div>	
	    <div class="hright">
	    	服务热线：028-81711663&nbsp;&nbsp;&nbsp;
	    	<a href="/index/serviceList" target="_blank">服务列表</a>
	    	<a href="/index/payGuidance" target="_blank">付费指导</a>
	    	<a href="#" target="_blank">帮助中心</a>
	    </div>
	    <p class="clear"></p>
	</div>
</div>
	<div class="header">
    <div class="h-bg">
    	<div class="h-con">
    		<div class="logo"><a href="/index/index"><img src="${imageRoot }/logo.jpg" width="100%" width="100%"/> </a></div>
    	    <div class="search">
    	    	<form action="/messageData/goSearch" id="topSearch" method="POST">
    	    		<input type="hidden" name="title" id="title"/>
    	    		<input type="hidden" name="content" id="content"/>
	    	    	<div class="div_sear clearfix">
	    	    		<div class="sel">
	    	    			<div class="selected" id="selected">标题</div>
	    	    			<div class="selBox">
	    	    				<p>标题</p>
	    	    				<p>全文</p>
	    	    			</div>
	    	    		</div>
	    	    		<input type="text" name="contentQuery" id="contentQuery" value="${contentQuery }" placeholder="请输入您的产品关键字"/>
	    	    		<span onclick="topSearch();">搜索</span>
	    	    	</div>
    	    	</form>
    	    	<div class="ssgjz" style="margin-top:8px;">
    	    		<a href="#">热门招标：</a>
    	    		<a href="/messageData/goSearch?title=物业">物业</a>
    	    		<a href="/messageData/goSearch?title=律师">律师</a>
    	    		<a href="/messageData/goSearch?title=环保">环保</a>
    	    		<a href="/messageData/goSearch?title=餐饮">餐饮</a>
    	    		<a href="/messageData/goSearch?title=装饰">装饰</a>
    	    		<a href="/messageData/goSearch?title=电梯">电梯</a>
    	    	</div>
    	    </div>
    	    <div style="width:148px;float:right;margin-top: 18px;">
    	    	<span style="background: url(http://img_al.qianlima.com/newDefault/images/guohui.gif) no-repeat left center;display: block;height: 20px;text-indent: 25px;font-size: 12px;line-height:25px;"><a href="http://www.ndrc.gov.cn/" target="_blank">中华人民共和国发改委</a></span>
    	    	<span style="background: url(http://img_al.qianlima.com/newDefault/images/guohui.gif) no-repeat left center;display: block;height: 20px;text-indent: 25px;font-size: 12px;line-height:25px;"><a href="http://www.mohurd.gov.cn/" target="_blank">中华人民共和国建设部</a></span>
    	    	<span style="background: url(http://img_al.qianlima.com/newDefault/images/guohui.gif) no-repeat left center;display: block;height: 20px;text-indent: 25px;font-size: 12px;line-height:25px;"><a href="http://www.mof.gov.cn/" target="_blank">中华人民共和国财政部</a></span>
    	    	<span style="background: url(http://img_al.qianlima.com/newDefault/images/guohui.gif) no-repeat left center;display: block;height: 20px;text-indent: 25px;font-size: 12px;line-height:25px;"><a href="http://www.mofcom.gov.cn/" target="_blank">中华人民共和国商务部</a></span>
    	    </div>
    	</div>
    </div>
</div>
<div class="top-nav clearfix">
    	<a href="/index/index"><div class="nav-left">中项招标</div></a>
    	<div class="nav-right">
    		<a href="/index/index">平台首页</a>
    		<a href="/messageData/goSearch?messagetype=1">招标公告</a>
    		<a href="/messageData/goSearch?messagetype=2">中标公示</a>
    		<a href="/messageData/goSearch?messagetype=4">拟在建项目</a>
    		<a href="/messageData/goSearch?messagetype=5">VIP独家</a>
    	</div>
    </div>
</body>
</html>