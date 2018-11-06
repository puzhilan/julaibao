const express = require("express");
const pool = require("../pool.js");
const router = express.Router();

router.get("/",(req,res)=>{
	var sid=req.query.sid, obj={product:{},specs:[],pics:[]};
	(async function(){
		//1. 按sid查询商品信息——异步
		var sql="SELECT * FROM product where sid=?";
		await new Promise(function(open){
		  pool.query(sql,[sid],(err,result)=>{
			if(err) console.log(err);
			obj.product=result[0];
			open();
		  })
		})
		//2. 按sid查询规格列表——异步
		var sql=`select sid, size from product 
		where family_id=(
		  select family_id from product where sid=?)`;
		await new Promise(function(open){
		  pool.query(sql,[sid],(err,result)=>{
			if(err) console.log(err);
			obj.specs=result;
			open(); 
		  })
		})
		//3. 按sid查询图片列表——异步
		var sql=`select * from product_img where product_id=?`;
		await new Promise(function(open){
		  pool.query(sql,[sid],(err,result)=>{
			if(err) console.log(err);
			obj.pics=result;
			open(); 
		  })
		})
		res.send(obj);//4. 返回结果
		//测试: http://localhost:3000/details?lid=5
	})()
})







module.exports=router;