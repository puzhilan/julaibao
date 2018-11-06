var $account = $("#account");
var $password = $("#password");
var $phone = $("#phone");
var $email = $("#email");
var $username = $("#username");
var $agree =$(":checkbox"); 
var $login = $(".login")
//禁用提交按钮
$agree.click(function(){
	$(".login").prop("disabled",this.checked?false:true);
})
$login.on("mousedown",function(){
	$(this).css("backgroundColor","red");
})
$login.on("mouseup",function(){
	$(this).css("backgroundColor","#FE4300");
})
//表单验证
$account.blur(function(){
	if($account.val().length==0)
	{
		$account.parent().next().html("账号不能为空");
	}else{
		var xhr = createXhr();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200)
			{
				var res = xhr.responseText;
				$account.parent().next().html(res);
			}
		}
		xhr.open("post","/user/check",true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		var account = $account.val();
		var str = "account="+account;
		xhr.send(str);
	}	
})
$password.blur(function(){
	$password.parent().next().html("");
	if($password.val().length==0)
	{
		$password.parent().next().html("密码不能为空");
	}else if($password.val().length>18 || $password.val().length<6){
		$password.parent().next().html("长度要在6~18之间");
	}
})
$phone.blur(function(){
	$phone.parent().next().html("");
	if($phone.val().length==0)
	{
		$phone.parent().next().html("电话不能为空");
	}else if($phone.val().length!=11){
		$phone.parent().next().html("长度出错");
	}
})
$email.blur(function(){
	$email.parent().next().html("");
	if($email.val().length==0)
	{
		$email.parent().next().html("邮箱不能为空");
	}
})
$username.blur(function(){
	$username.parent().next().html("");
	if($username.val().length==0)
	{
		$username.parent().next().html("姓名不能为空");
	}
})
//提交
$login.click(function(){
		var xhr = createXhr();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200)
			{
				var h=window.innerHeight;
				var w=window.innerWidth;
				var res = xhr.responseText;
				$fixe = $("#fixe");
				$fixe.css("display","block");
				$fixe.css("top",h/2-75);
				$fixe.css("left",w/2-150);
				var t = setTimeout(function(){
					$fixe.css("opacity",0);
					location.replace("login.html");
				},1000);
			}
		}
		xhr.open("post","/user/register",true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		var account = $account.val();
		var password = $password.val();
		var phone = $phone.val();
		var eamil = $email.val();
		var username = $username.val();
		var str = "account="+account+"&password="+password+"&phone="+phone+"&email="+email+"&username="+username;
		xhr.send(str);
	})
