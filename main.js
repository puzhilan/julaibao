const express = require("express");
const bodyParser = require("body-parser");
const index = require("./routes/index.js");
const detail = require("./routes/detail.js");
const user = require("./routes/user.js");
//引入session中间件



//创建服务器
var app = express();
var server = app.listen(3000);



//body-paarser中间件
app.use(bodyParser.urlencoded({
	extended:false
}));

//挂载网页
app.use(express.static("public"));

//配置session中间件



//添加路由
app.use("/index",index);
app.use("/detail",detail);
app.use("/user",user);