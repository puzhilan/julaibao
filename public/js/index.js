(async function(){
    var res = await ajax({
        url:"http://localhost:3000/index/",
        type:"get",
        dataType:"json"
    }); 

	var vm = new Vue({
		el:".section>.product>table",
		data:{
			res
		}
	});
	

	var $banner = $(".banner_img");
	var $list = $(".banner_img>img");
	var $prev = $("#prev");
	var $next = $("#next");
	var c= 0;
	
	var t = setInterval(start,4000);
	function start(){
		c++;
		if(c<$list.length){
			$list[c].style.opacity=1;
			$list[c-1].style.opacity=0;
		}else{
			$list[c-1].style.opacity=0;
			c=0;
			$list[c].style.opacity=1;
		}
	}
	$prev.hide();
	$next.hide();
	$banner.hover(function(){
		$prev.show();
		$next.show();
	},function(){
		$prev.hide();
		$next.hide();
	});
	
	$prev.mouseenter(function(){
		$(this).show();
		$next.show();
	});
	$next.mouseenter(function(){
		$(this).show();
		$prev.show();
	})

	$prev.click(function(){
		$list[c].style.opacity=0;
		c--;
		if(c<0){c=3}
		$list[c].style.opacity=1;
	})
	$next.click(function(){
		$list[c].style.opacity=0;
		c++;
		if(c>3){c=0}
		$list[c].style.opacity=1;
	})



})()