(async function(){
  if(location.search.indexOf("sid=")!=-1){
    var sid=location.search.split("=")[1];
    var res=await ajax({
      url:"http://localhost:3000/detail",
      type:"get",
      data:`sid=${sid}`,
      dataType:"json"
    });
    var {product,specs,pics}=res;
    var {title,subtitle,csot,price,sales,chat,score,size,img,stock}=product;
    var html=`<h6>${title}</h6>
			<p>${subtitle}</p>
			<table class="info">
				
				<tr>
					<td>价格</td>
					<td>￥<s>${csot}</s> <img src="img/detail/TB1okcBKVXXXXbBXVXXXXXXXXXX-116-32.png"></td>
				</tr>
				<tr>
					<td>促销价</td>
					<td>￥${price}</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<p>想￥${price}拿下？</p>
						<span>手机天猫购买更便宜</span>
						<img src="img/detail/bg.png">
					</td>
				</tr>
			</table>
			<div id="jd" class="d_none">
				<img src="img/detail/TB1bXaEPFXXXXc9XpXXwu0bFXXX.png">
			</div>
			<div class="score">
				<p>月销量 <span>${sales}</span></p>
				<span>|</span>
				<p>累计评价 <span>${chat}</span></p>
				<span>|</span>
				<p>送天猫积分 <span>${score}</span></p>	
			</div>
			<table class="chose">
				<tr>
					<td>运费</td>
					<td>
						<span>上海 至</span>
						<select name="city" id="city">
							<option value="">北京</option>
							<option value="">深圳</option>
							<option value="">广州</option>
							<option value="">四川</option>
						</select>
						<span>快递：<b>0.00</b></span>
					</td>
				</tr>
				<tr>
					<td>尺码</td>
					<td>
					</td>
				</tr>
					<tr>
					<td>颜色分类</td>
					<td>
						<img src="${img}">
					</td>
				</tr>
				<tr>
					<td>数量</td>
					<td>
						<button class="btn1">-</button>
						<input type="text">
						<button class="btn2">+</button>
						<span>库存<b>${stock}</b>件</span>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<button>立即购买</button>
						<button>加入购物车</button>	
					</td>
				</tr>
			</table>`;
    var div=document.querySelector(".all>.top>.right");
    div.innerHTML=html;
	
	var html="";
    for(var s of specs){
	  html+=`<a href="detail.html?sid=${s.sid}">${s.size}</a>`;
    }
    var td=document.querySelector(".all>.top>.right>.chose>tbody>tr:nth-child(2)>td:last-child");
	td.innerHTML=html;

    var html="";
    for(var p of pics){
      var {sm,md,lg}=p
      html+=`<li><img src="${sm}" data-md="${md}" data-lg="${lg}"></li>`;
    }
    var ul=document.querySelector(".all>.top>.left>ul.sm_img");
    ul.innerHTML=html;
    ul.style.width=`${80*pics.length}px`;
    var mdImg=document.querySelector(".all>.top>.left>div.md_img");
    mdImg.src=pics[0].md;
    var lgDiv=document.getElementById("lg_img");
    lgDiv.style.backgroundImage=`url(${pics[0].lg})`;
  }

 
/*****************************放大镜****************************/
 var $ul=$(".all>.top>.left>ul.sm_img");
 var $mdImg=$(".all>.top>.left>div.md_img>img");
 var $lgDiv=$("#lg_img");
 $ul.on("mouseover","img",function(){
    var $img=$(this)
    var md=$img.attr("data-md");
    $mdImg.attr("src",md);
    $lgDiv.css("backgroundImage",`url(${$img.attr("data-lg")})`);
  });

  var $mask=$("#mask");
  var $smask = $("#super_mask");
  var MSIZE = 150,SMSIZE=400,MAX=SMSIZE-MSIZE;

  $smask.hover(function(){
    $mask.toggleClass("d_none");
    $lgDiv.toggleClass("d_none");
  }).mousemove(function(e){
	var top=e.offsetY-MSIZE/2;
	var left=e.offsetX -MSIZE/2;
	if(top<0) top=0; else if(top>MAX) top=MAX;
	if(left<0) left=0; else if(left>MAX) left=MAX;
	$mask.css({top,left});
	$lgDiv.css("backgroundPosition",`${-2*left}px ${-2*top}px`)
  });
  
/*************************二维码****************************/
  $jd=$("#jd");
  $jdImg=$(".all>.top>.right>.info>tbody>tr:last-child>td:last-child>img");
  $jdImg.hover(function(){
	$jd.toggleClass("d_none");
  })
  
  $jd2=$("#jd2");
  $jdImg2=$(".all>.detail>.text>.tp>.erweima>img");
  $jdImg2.hover(function(){
	$jd2.toggleClass("d_none");
  });

/****************************加减购买数量**********************************/
  var $btn1=$(".all>.top>.right>.chose>tbody>tr:nth-child(4)>td:last-child>.btn1");
  var $btn2=$(".all>.top>.right>.chose>tbody>tr:nth-child(4)>td:last-child>.btn2");
  var $number=$btn1.next();
  $number.val("1");
  $btn1.click(function(){
	var n= parseInt($number.val());
	if(n>1)
	{
		n--;
		$number.val(n);
	}
  })
  $btn2.click(function(){
	var n= parseInt($number.val());
	n++;
	$number.val(n);
  })
var shop = document.getElementById("shopping_car")
	
	var x = shop.offsetTop;
	var y = shop.offsetLeft;
window.onscroll = function(){
	var t = document.documentElement.scrollTop;
	console.log(x)
		console.log(y)
		console.log(t)
	if(t<x){
		shop.style.position="relative";
		shop.style.top=0+"px";
		shop.style.left=0+"px";
	}else if(t>=x){
		shop.style.position="fixed";
		shop.style.top=0+"px";
		shop.style.left=y+"px";
	}

}

})()
