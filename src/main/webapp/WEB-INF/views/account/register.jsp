<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../common/pages.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>客户注册</title>
	<%@ include file="../common/jsp_contants.jsp"%>
	<%@ include file="../common/js_contants.jsp"%>
	<script type="text/javascript" src="${jsRoot }/jquery-1.11.1.min.js"></script>
	<!-- 验证 -->
	<link rel="stylesheet" href="${toolRoot }/validata/validationEngine.css" />
	<script type="text/javascript" src="${toolRoot }/validata/jquery.validationEngine.js"></script>
	<script type="text/javascript" src="${toolRoot }/validata/jquery.validationEngine-zh_CN.js" charset="utf-8"></script>
	<link rel="stylesheet" href="${cssRoot}/login.css"/>
	<link rel="stylesheet" href="${cssRoot}/main.css"/>
	<script type="text/javascript" src="${jsRoot}/login/register.js"></script>
	<script type="text/javascript">
		$(function(){
			//开启表单验证
			$("#saveMemberFrom").validationEngine();
		});
	</script>
</head>
<style>
	body {
	    font-family: "宋体", "Microsoft Yahei","Tahoma","SimSun";
	    font-size: 14px;
	    _background-image: url(about:blank);
	    _background-attachment: fixed;
	}
</style>
<body>
	<jsp:include  page="../def/top.jsp"/>
	<center>
	<div id="main" style="margin-top: 30px;">
		<a href="/index/index" style="float:left;"><img src="${imageRoot }/logo.jpg" style="width:180px;height:50px;"></a>
		<div style="border-left:2px solid #ccc;margin-left:10px;height:50px;padding-left:10px;float:left; text-align: left;">
			<span style="font-size:28px;font-weight:bold;line-height:50px;color:#6f99d5;font-family:黑体;">会员注册</span><br>
		</div>
	</div>
	
	<div class="m k lognav"></div>
	<div class="m k"></div>
	
	<div id="main">
		<div style="width:760px;text-align:left;float:left">
			<form action="/account/register" name="memberForm" method="post" target="_self" id="saveMemberFrom" onsubmit="return save();">
				<dl>
					<dd class="pd10">		    
						<div class="lab1">账号：<span class="red bold">*</span></div>
						<input id="userid" name="userid" type="text"  onblur="checkUserid(this.value)" value="" style="width:214px;color:gray;" class="validate[required,noSpecialCaracters,maxSize[20]] text-input self-form-control">
					<span id="false1" class="formtips"><span class="rigok">　</span><span style="width:480px;" class="blue">4-20个字符，可包含小写字母、数字、下划线。</span></span></dd>
					
					<dd class="pd10">
					    <div class="lab1">密码：<span class="red bold">*</span></div>
						<input id="pwd1" name="pwd" type="password" value="" style="width:214px;color:gray;" class="validate[required,noSpecialCaracters,maxSize[11]]  text-input self-form-control" />
					<span id="false2" class="formtips"><span class="rigok">　</span><span style="width:480px;" class="blue">请设定密码，6-18位字母、数字组合。</span></span></dd>
					
					<dd class="pd10">
					    <div class="lab1">确认密码：<span class="red bold">*</span></div>
						<input id="pwd2" name="repwd" type="password" value="" style="width:214px;color:gray;" class="validate[required,noSpecialCaracters,maxSize[11]] text-input self-form-control"/>
					<span id="false3" class="formtips"><span class="rigok">　</span><span style="width:480px;" class="blue">请再输入一次密码。</span></span></dd>
					
					<dd class="rigdd">
						<div class="lab1">联系方式：<span class="red bold">*</span></div>
						<span id="mDIV">						
							<input type="text" id="phone" name="phone" value="" style="width:214px;" class="validate[required,noSpecialCaracters,maxSize[11]]  text-input self-form-control" />
						</span>&nbsp;&nbsp;&nbsp;&nbsp;
						<label><input type="radio" value="1" checked="checked" class="inRadio_blue" name="tel">手机</label>
						<label><input type="radio" value="2" class="inRadio_blue" name="tel">座机</label>
					</dd>	
					
					<dd class="rigdd">
						<div class="lab1">联系人：<span class="red bold">*</span></div>
						<input type="text" id="linkman" name="linkman" value="" style="width:214px;" class="validate[required,noSpecialCaracters,maxSize[12]] text-input self-form-control"/>
					<span id="false6" class="formtips"><span class="rigok">　</span><span style="width:480px;" class="blue">请填写您的姓名、英文名等称呼。</span></span></dd>
					
					<dd class="rigdd">
						<div class="lab1">性别：<span class="red bold">*</span></div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label><input type="radio" name="sex" value="1" checked="" class="inRadio_blue">先生</label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label><input type="radio" name="sex" value="2" class="inRadio_blue">女士</label>
					</dd>			
					
					<dd class="rigdd">
						<div class="lab1">公司全称：<span class="red bold">*</span></div>
						<input type="text" style="width:214px;" id="company" name="company" value="" class="validate[required,noSpecialCaracters,,maxSize[50]] text-input self-form-control"/>
					<span id="false8" class="formtips"><span class="rigok">　</span><span style="width:480px;" class="blue">请填写工商局注册公司全称。</span></span></dd>
					
					<dd class="rigdd">
						<div class="lab1">验证码：<span class="red bold">*</span></div>
						<input type="text" id="surePwd" name="verifycode" value="" style="width:60px;" class="validate[required,noSpecialCaracters,maxSize[4]]  text-input self-form-control" />
						<img title='看不清 点一下' onclick="javascript:changeImg();" src="/account/verifycoderegister" id="validatecodeimg" width="70" height="28" cursor: hand;>
						<a href="javascript:changeImg();">看不清 换一张</a>
					<span id="false9" class="formtips"><span class="rigok">　</span><span style="width:480px;" class="blue">请填写验证码。</span></span></dd>
		
					<dd class="rigdd">
						<div class="lab1"></div>
						<input type="checkbox" name="checkbox" value="checkbox" checked="true" id="agree" class="inRadio_blue">同意《<a href="#">中国招标网用户服务协议</a>》
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