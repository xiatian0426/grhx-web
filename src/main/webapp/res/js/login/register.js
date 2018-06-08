/**
 * 验证用户名重复
 * @param userid
 */
function checkUserid(userid){
	$.ajax({
		url:'/member/checkUserid',
		data:{
			userid:userid
		},
		dataType:'json',
		type:'post',
		cache:false,
		async:false,
		success:function(data) {
			if(data){
				$("#userid").validationEngine("showPrompt","用户名已存在","error");
				return false;
			}else {
				return true;
			}
		},
		error : function(){
			$("#userid").validationEngine("showPrompt","发生错误，请稍后再试","error");
			return false;
		}
	});
}
/**
 * 验证码
 */
function changeImg() {
	$("#validatecodeimg").attr("src", "/account/verifycoderegister?"+ Math.random())
}
/**
 * 重置
 */
function perReset(){
	location.reload();
}
/**
 * 提交验证
 * @returns {Boolean}
 */
function save(){
	//用户名
	var userid = $("#userid").val().trim();
	if(userid == ''){
		$("#userid").validationEngine("showPrompt","用户名不能是空","error");
		return false;
	}else if(userid.length<4 || userid.length>20){
		$("#userid").validationEngine("showPrompt","用户名长度4-20个字符","error");
		return false;
	}else if (checkUserid(userid)) {
		$("#userid").validationEngine("showPrompt","用户名已存在","error");
		return false;
	}
	var pwd1 = $("#pwd1").val().trim();
	var pwd2 = $("#pwd2").val().trim();
	if(pwd1!=''){
		if(pwd1.length<6 || pwd1.length>18){
			$("#pwd2").validationEngine("showPrompt","密码长度6-18个字符","error");
			return false;
		}else if(pwd1!=pwd2){
			$("#pwd2").validationEngine("showPrompt","两次密码不一样","error");
			return false;
		}
	}else{
		$("#pwd1").validationEngine("showPrompt","密码不能为空","error");
		return false;
	}
	var phone = $("#phone").val().trim();
	if(phone==''){
		$("#phone").validationEngine("showPrompt","联系方式不能为空","error");
		return false;
	}
	if($("input[name='tel'][checked]").val()=='1'){
		var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
		 if (!reg.test(phone)) {
			 $("#phone").validationEngine("showPrompt","手机有误","error");
				return false;
		 }
	}else{
		var reg = /^0\d{2,3}-?\d{7,8}-\d{3,5}$/;
		var reg2 = /^0\d{2,3}-?\d{7,8}$/;
		var reg3 = /^\d{3,8}$/;
		if (!reg.test(phone)&&!reg2.test(phone)&&!reg3.test(phone)) {
			$("#phone").validationEngine("showPrompt","座机有误","error");
			return false;
		}
	}
	var linkman = $("#linkman").val().trim();
	if(linkman==''){
		$("#linkman").validationEngine("showPrompt","联系人不能为空","error");
		return false;
	}
	var company = $("#company").val().trim();
	if(company==''){
		$("#company").validationEngine("showPrompt","公司全称不能为空","error");
		return false;
	}
	var surePwd = $("#surePwd").val().trim();
	if(surePwd==''){
		$("#surePwd").validationEngine("showPrompt","请填写验证码","error");
		return false;
	}else if(!checkSurePwd(surePwd)){
		$("#surePwd").validationEngine("showPrompt","验证码错误","error");
		return false;
	}else{
		return true;
	}
	
}
/**
 * 校验验证码
 * @param userid
 */
function checkSurePwd(verifycode){
	var status = true;
	$.ajax({
		url:'/ajax/checkSurePwd',
		data:{
			verifycode:verifycode
		},
		dataType:'json',
		type:'post',
		cache:false,
		async:false,
		success:function(data) {
			status = data;
		},
		error : function(){
			status = false;
		}
	});
	return status;
}
