//用户名
function checkUser(){
	var code = document.getElementById("user").value;
	var span = document.getElementById("user_span");
	//var reg = /^[^/x00-x/xff]{1,5}$/;  双字节字符，包含中文
	//var reg = /^[\u4e00-\u9fa5]{1,5}$/;  中文
	var reg = /^[\u4e00-\u9fa5A-Za-z0-9_]{1,5}$/;
	if(reg.test(code)){
		span.innerHTML="验证通过";
		span.className="ok";
		return true;
	}else{
		span.innerHTML="请输入1到5字符";
		span.className="err";
		return false;
	}
}

//邮箱
function checkEma(){
	var code = document.getElementById("ema").value;
	var span = document.getElementById("ema_span");
	var reg = /^\w+@\w+(\.[a-zA-Z]+)+$/;
	if(reg.test(code)){
		span.innerHTML="验证通过";
		span.className="ok";
		return true;
	}else{
		span.innerHTML="请输入有效邮箱格式";
		span.className="err";
		return false;
	}
	
}