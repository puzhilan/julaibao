const express = require("express");
const router = express.Router();
const pool = require("../pool.js");

router.post("/login",(req,res)=>{
	var {account,password}=req.body;
	var sql="select * from user where account=? and password=?";
	pool.query(sql,[account,password],(err,result)=>{
		if(err) throw("err");
		console.log(result)
		res.send(result)
	})
})

router.post("/check",(req,res)=>{
	var account = req.body.account;
	var sql = "select * from user where account=?";
	pool.query(sql,[account],(err,result)=>{
		if(err) throw err;
		console.log(result);
		if(result.length>0)
		{
			res.send("账号已被注册");
		}else{
			res.send("账号可用");
		}
	})
})

router.post("/register",(req,res)=>{
	var {account,password,phone,email,username} = req.body;
	if(!account)
	{
		return;
	}
	if(!password)
	{
		return;
	}
	if(!phone)
	{
		return;
	}
	if(!email)
	{
		return;
	}
	if(!username)
	{
		return;
	}
	var sql = "insert into user values(null,?,?,?,?,?)";
	pool.query(sql,[account,password,phone,email,username],(err,result)=>{
		if(err) throw err;
		res.send("注册成功");
	})
})


module.exports=router;