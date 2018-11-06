var $account=$("#account");
var $password=$("#password");
var $login=$("#login");
var $showUser=$("#showUser");
var $showUpwd=$("#showUpwd");
var register=false;
$account.focus(function(){
	$showUser.html("请填写账号")
			 .css("color","#FE4300");
})
$account.blur(function(){
	$showUser.html("");
})
$password.focus(function(){
	$showUpwd.html("请填写密码")
			 .css("color","#FE4300");
})
$password.blur(function(){
	$showUpwd.html("");
})
$login.click(function(){
	var xhr = createXhr();
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4 && xhr.status==200)
		{
			var res = JSON.parse(xhr.responseText);
			if(res.length>0){
				//alert("登录成功")
				sessionStorage.setItem("username",res[0].username);
				var h=window.innerHeight;
				var w=window.innerWidth;
				$fixe = $("#fixe");
				$fixe.css("display","block");
				$fixe.css("top",h/2-75);
				$fixe.css("left",w/2-150);
				var t = setTimeout(function(){
					$fixe.css("opacity",0);
					location.replace("index.html");
				},1000);
				
			}else{
				alert("账号或密码错误")
			}
		}
	}
	xhr.open("post","/user/login",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var account = document.getElementById("account").value;
	var password = document.getElementById("password").value;
	var str = "account="+account+"&password="+password;
	xhr.send(str);
})