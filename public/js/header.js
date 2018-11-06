$(function(){
    $(`<link rel="stylesheet" href="css/header.css">`).appendTo("head");
    $.ajax({
        url:"header.html",
        type:"get",
        success:function(res){
            $(res).replaceAll("#header");
			var username = sessionStorage.getItem("username");
			if(username)
			{
				var $login = $("#list_left");
				console.log($login);
				$login.html(`欢迎回来 ${username} <a href="#" id="quit">退出登录</a>`);
				var $quit=$("#quit");
				$quit.click(function(e){
					e.preventDefault();
					sessionStorage.removeItem("username");
					history.go(0);
				})
			}
        }
    })
	
	
})