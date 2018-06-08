<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../common/pages.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>客户登陆</title>
	<%@ include file="../common/jsp_contants.jsp"%>
	<%@ include file="../common/js_contants.jsp"%>
	<script type="text/javascript" src="${jsRoot }/jquery-1.11.1.min.js"></script>
	<!-- 验证 -->
	<link rel="stylesheet" href="${toolRoot }/validata/validationEngine.css" />
	<script type="text/javascript" src="${toolRoot }/validata/jquery.validationEngine.js"></script>
	<script type="text/javascript" src="${toolRoot }/validata/jquery.validationEngine-zh_CN.js" charset="utf-8"></script>
	<link rel="stylesheet" href="${cssRoot}/login.css"/>
	<link rel="stylesheet" href="${cssRoot}/main.css"/>
	<script type="text/javascript" src="${jsRoot}/login/login.js"></script>
	<script type="text/javascript">
	
	$(function(){
		//开启表单验证
		$("#loginForm").validationEngine();
	});
	$(document).ready(function(){ 
		var loginMsg = $("#loginMsg").val();
		if(loginMsg!=''){
			alert(loginMsg);
		}
	});
	function changeImg() {
		$("#validatecodeimg").attr("src", "/account/verifycoderegister?"+ Math.random());
	}
	
	</script>
	<style>
		body {
		    font-family: "宋体", "Microsoft Yahei","Tahoma","SimSun";
		    font-size: 14px;
		    _background-image: url(about:blank);
		    _background-attachment: fixed;
		}
	</style>
	
</head>
<body>
	<jsp:include  page="../def/top.jsp"/>
	<center>
	<div id="main" style="margin-top: 30px;">
		<a href="/index/index" style="float:left;"><img src="${imageRoot }/logo.jpg" style="width:180px;height:50px;"></a>
		<div style="border-left:2px solid #ccc;margin-left:10px;height:50px;padding-left:10px;float:left; text-align: left;">
			<span style="font-size:28px;font-weight:bold;line-height:50px;color:#6f99d5;font-family:黑体;">会员登陆</span><br>
		</div>
	</div>
	<div class="m k lognav"></div>
	<div class="m k"></div>
	<div id="main">
		<div style="width:760px;text-align:left;float:left">
			<input type="hidden" value="${sign }" id="sign">
 			<input type="hidden" value="${loginMsg }" id="loginMsg">
 			<form action="/account/login" id="loginForm" name="loginForm" method="post" >
				<dl>
					<dd class="pd10">		    
						<div class="lab1">用户名：<span class="red bold">*</span></div>
						<input id="userid" name="userid" type="text"  value="" style="width:214px;color:gray;" class="validate[required,noSpecialCaracters,maxSize[11]] text-input self-form-control">
					</dd>
					<dd class="pd10">
					    <div class="lab1">密码：<span class="red bold">*</span></div>
						<input id="pwd" name="pwd" type="password" value="" style="width:214px;color:gray;" class="validate[required,noSpecialCaracters,maxSize[11]] text-input self-form-control"/>
					</dd>
					<dd class="rigdd">
						<div class="lab1">验证码：<span class="red bold">*</span></div>
						<input type="text" id="surePwd" name="verifycode" value="" style="width:60px;" class="validate[required,noSpecialCaracters,maxSize[4]] text-input self-form-control"/>
						<img title='看不清 点一下' onclick="javascript:changeImg();" src="/account/verifycoderegister" id="validatecodeimg" width="70" height="28" cursor: hand;>
						<a href="javascript:changeImg();">看不清 换一张</a>
					</dd>
					<dd class="rigdd">
						<div class="lab1"></div>
						<input type="submit" value="" class="an" >
					</dd>
				</dl>
			</form>
		</div>
	</div>
	<div class="m k lognav"></div>
	<div class="m k"></div>
	</center>
	<jsp:include  page="../def/footer.jsp"/>
</body>
</html>