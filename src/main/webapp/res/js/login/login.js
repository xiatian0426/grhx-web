$(function(){
	
	//获取验证码倒计时
	$(".getnum").click(function(){
		if(checkPhoneNum()){
			var $this = document.getElementById("id_getNumBtn");
		    settime($this);
		}
	});
	var countdown=120; 
	function settime(val) { 
		if (countdown == 0) { 
			val.removeAttr('click');    
			val.value ="获取验证码";
			val.style.backgroundColor = "#fea345";
			countdown = 120; 
			clearTimeout(timer);
			return;
		} else { 
			val.setAttribute("disabled", true); 
			val.value = countdown + "s";
			val.style.backgroundColor = "#d9d9d9";
			countdown--; 
	    } 
		var timer = setTimeout(function() { 
		    settime(val) 
		},1000) 
	} 
	
	
	
	
	//表单验证
	$(".loginbtn").click(function(){
		validateForm();
	});
	$(".phone").focus(function(){
		$(this).parents("li").find(".pubcwflag").hide();
	});
	$(".phone").blur(function(){
		//checkPhoneNum();
	});
	$(".num").focus(function(){
		$(this).parents("li").find(".pubcwflag").hide();
	});
	$(".num").blur(function(){
		//checkNumName();
	});
	
	function validateForm(){
	     if(checkPhoneNum()&&checkNumName()){
	         //alert("验证通过！");
	     }
	}
	
	function checkPhoneNum(){
		var reg=/^(1[34578]\d{9})$/;
		var phoneV = $(".phone").val();
		if(phoneV == "" || !reg.test(phoneV)){
	    	 $(".phone").parents("li").find(".pubcwflag").show();
	    	 $(".phone").parents("li").find(".pubcwflag").html("号码输入有误");
	    	 return false;
	    }else{
			$(".phone").parents("li").find(".pubcwflag").hide();
			$(".phone").parents("li").find(".pubcwflag").html("");
			return true;
		}
	}
	
	function checkNumName(){
	    var nameV = $(".num").val();
	    if(nameV == ""){
	    	 $(".num").parents("li").find(".pubcwflag").show();
	    	 $(".num").parents("li").find(".pubcwflag").html("验证码输入有误");
	    	 return false;
	    }else{
	    	 $(".num").parents("li").find(".pubcwflag").html("");
	    	 return true;
	    }
	}
});