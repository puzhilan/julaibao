#定义编码格式
SET NAMES UTF8;
DROP DATABASE IF EXISTS shop;
#创建数据库
CREATE DATABASE shop CHARSET=UTF8;
USE shop;



/*********************首页信息***********************/
CREATE TABLE index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(6,2),
  cost DECIMAL(6,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

/***返利图片***/
CREATE TABLE fanli_link(
  flid INT PRIMARY KEY AUTO_INCREMENT,
  url VARCHAR(128),
  href VARCHAR(128)
);
/***创建导航栏数据表***/
CREATE TABLE nav_list(
  nid INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(16),
  url VARCHAR(128),
  title VARCHAR(32)
);
/***创建轮播图数据表***/
CREATE TABLE banner(
  bid INT PRIMARY KEY AUTO_INCREMENT,
  pic VARCHAR(128),
  url VARCHAR(128),
  title VARCHAR(16)
);



/***********************商品详情*********************************/
/**商品型号家族**/
CREATE TABLE family_product(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

/**创建商品表**/
CREATE TABLE product(
  sid INT PRIMARY KEY AUTO_INCREMENT,        #编号
  family_id INT,                             #所属家族
  title VARCHAR(128),                        #主标题
  subtitle VARCHAR(128),                     #副标题
  csot DECIMAL(6,2),                         #原价
  price DECIMAL(6,2),                        #促销价
  sales INT,                                 #月销量
  chat INT,				     #评价
  score INT,				     #积分
  size VARCHAR(8),			     #尺码
  img VARCHAR(128),			     #颜色分类--图片
  stock INT,                                 #库存

  chengfen VARCHAR(32),                      #材质成分
  saleway VARCHAR(32),                       #销售渠道
  huohao VARCHAR(32),                        #货号
  type VARCHAR(32),                          #服装版型
  style VARCHAR(32),                         #风格
  tongqing VARCHAR(32),                      #通勤
  yichang VARCHAR(32),                       #衣长
  xiuchang VARCHAR(32),                      #袖长
  xiuxing VARCHAR(32),                       #袖型
  lingxing VARCHAR(32),                      #领型
  yimenjin VARCHAR(32),                      #衣门襟
  tuan VARCHAR(32),                          #图案
  xijie VARCHAR(32),                         #服装款式细节
  pinpai VARCHAR(32),                        #品牌
  age VARCHAR(32),                           #适用年龄
  year VARCHAR(32),                          #年份季节
  color VARCHAR(32),                         #颜色分类
  sizes VARCHAR(32)                          #尺码
);
/**商品图片**/
CREATE TABLE product_img(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,             #商品编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径	
);



/***********************用户信息*****************************/
CREATE TABLE user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  account VARCHAR(32),         #账号
  password VARCHAR(32),        #密码
  username VARCHAR(8),         #用户名
  email VARCHAR(32),           #邮箱
  phone VARCHAR(16)            #电话
);



/*******************/
/******数据导入******/
/*******************/

/******************************首页信息**********************************/
/***首页商品***/
INSERT INTO index_product VALUES
(null,'白衬衫女长袖2018夏季新款蕾丝花边纯棉打底衫修身气质淑女棉衬衣','img/product/TB1RB0.OXXXXXXpapXXXXXXXXXX_!!0-item_pic.jpg','89.00','208.00','detail.html?sid=1',1,1,1),
(null,'谨黎夏季短袖女新款百搭韩版学院风百搭印花字母T恤学生打底衫潮','img/product/TB1zfqBi_JYBeNjy1zeXXahzVXa_!!0-item_pic.jpg','49.00','50.00','detail.html',2,2,2),
(null,'辛格茜 蝴蝶结系带雪纺衫女2018春装新款小衫荷叶边长袖女士上衣','img/product/TB1BFFgXEz.BuNjt_bXXXcQmpXa_!!0-item_pic.jpg','149.00','249.00','detail.html',3,3,3),
(null,'民族风镂空披肩夏季新款度假外搭女装长袖中长款宽松蕾丝流苏开衫','img/product/TB1dbY6e2NNTKJjSspeXXaSwpXa_!!0-item_pic.jpg','158.00','258.00','detail.html',4,4,4),
(null,'巴厘岛沙滩裙女夏2018新款波西米亚长裙海边度假显瘦雪纺连衣裙仙','img/product/TB1CU49hZbI8KJjy1zdXXbe1VXa_!!0-item_pic.jpg','148.00','249.00','detail.html',5,5,5),
(null,'少女心仙女裙小心机系带雪纺学生连衣裙女港风短裙少女心夏季衣服','img/product/TB1eUaifeGSBuNjSspbXXciipXa_!!0-item_pic.jpg','169.00','269.00','detail.html',6,6,6),
(null,'2018新款港味复古长袖雪纺连衣裙气质chic碎花裙超仙印花长裙女夏','img/product/TB1FWXnc_tYBeNjy1XdXXXXyVXa_!!0-item_pic.jpg','259.00','399.00','detail.html',7,7,7),
(null,'三亚沙滩裙女夏2018新款波西米亚长裙性感海边度假显瘦泰国连衣裙','img/product/TB14vmxRVXXXXb4XXXXXXXXXXXX_!!0-item_pic.jpg','148.00','250.00','detail.html',8,8,8),
(null,'泓帛2018夏季新品修身时尚雪纺包臀半身裙双层下摆拼接A字鱼尾裙','img/product/TB2dK0uhKGSBuNjSspbXXciipXa_!!2031616500-0-item_pic.jpg','149.00','249.00','detail.html',9,9,9),
(null,'牛仔裤女春秋2018新款微喇叭裤九分韩版显瘦开叉ins超火的裤子女','img/product/TB2G8gemhWYBuNjy1zkXXXGGpXa_!!676607023-0-item_pic.jpg','79.00','89.00','detail.html',10,10,10),
(null,'2018新款短裤女夏宽松花苞阔腿裤休闲韩版百搭高腰小清新学生裤子','img/product/TB2Q5yyof1TBuNjy0FjXXajyXXa_!!3073937137-0-item_pic.jpg','59.00','99.00','detail.html',11,11,11),
(null,'海边度假沙滩裤夏季高腰宽松阔腿短裤薄款热裤女装绑带毛边牛仔裤','img/product/TB1kfczgb9YBuNjy0FgXXcxcXXa_!!0-item_pic.jpg','99.00','199.00','detail.html',12,12,12),
(null,'短袖男 圆领宽松男装潮流夏季新款半袖打底上衣男体恤衫男短袖T','img/product/TB1U0VTcr5YBuNjSspoXXbeNFXa_!!0-item_pic.jpg','69.00','99.00','detail.html',13,13,13),
(null,'pluswind2018夏季新款男士短袖连帽T恤韩版修身小衫半袖体恤','img/product/TB2t6aWhf1TBuNjy0FjXXajyXXa_!!3811395308-0-item_pic.jpg','69.00','79.00','detail.html',14,14,14),
(null,'2件】短袖t恤男圆领夏季青年2018潮流纯色休闲修身新款韩版半袖男','img/product/TB2AWItlhWYBuNjy1zkXXXGGpXa_!!3588046400-0-item_pic.jpg','56.00','59.00','detail.html',15,15,15),
(null,'百圣奴抽象人头短袖潮男士衣服半袖体恤男装短袖上衣男生青年T恤','img/product/TB16iWVQVXXXXXAapXXXXXXXXXX_!!0-item_pic.jpg','88.00','89.00','detail.html',16,16,16),
(null,'九分裤男2018夏季修身裤子男韩版潮流夏天男生百搭小脚休闲男长裤','img/product/TB1VLjPfv1TBuNjy0FjXXajyXXa_!!0-item_pic.jpg','49.00','50.00','detail.html',17,17,17),
(null,'qgf春季男士休闲裤抽绳纯色工装裤日系潮宽松哈伦裤子男束脚裤','img/product/TB1nPPupXOWBuNjy0FiXXXFxVXa_!!0-item_pic.jpg','295.00','300.00','detail.html',18,18,18),
(null,'夏季青少年薄款男士牛仔裤男弹力小脚裤男裤韩版修身直筒长裤子潮','img/product/TB17_pxQVXXXXbnXXXXXXXXXXXX_!!0-item_pic.jpg','89.00','99.00','detail.html',19,19,19),
(null,'春夏季宽松针织薄款纯棉收口卫裤学生百搭休闲运动裤男韩版束脚长','img/product/TB2.2uuhAyWBuNjy0FpXXassXXa_!!3865971418-0-item_pic.jpg','59.00','99.00','detail.html',20,20,20),
(null,'直筒牛仔裤女宽松九分裤2018新款春夏韩版高腰流苏毛边阔腿裤显瘦','img/product/TB1INMgdkyWBuNjy0FpXXassXXa_!!0-item_pic.jpg','99.00','199.00','detail.html',21,21,21),
(null,'微喇叭裤韩版蕾丝阔腿裤休闲裤女裤子学生修身显瘦黑色大码九分裤','img/product/TB2QiNakL5TBuNjSspmXXaDRVXa_!!2995694030-0-item_pic.jpg','79.00','89.00','detail.html',22,22,22),
(null,'春夏季韩版薄款学生宽松校服裤bf原宿风七分百搭休闲直筒阔腿裤女','img/product/TB1r_nufDtYBeNjy1XdXXXXyVXa_!!0-item_pic.jpg','59.00','69.00','detail.html',23,23,23),
(null,'夏季韩版黑色大码牛仔短裤女胖mm破洞2018新款200斤宽松学生bf潮','img/product/TB2pN9udVGWBuNjy0FbXXb4sXXa_!!3278057401-0-item_pic.jpg','189.00','210.00','detail.html',24,24,24),
(null,'桂格即食燕麦片1000g*3袋装早餐冲饮即食营养原味代餐麦片','img/product/TB18P66oruWBuNjSszgXXb8jVXa_!!0-item_pic.jpg','59.90','60.00','detail.html',25,25,25),
(null,'【满99减50，199减100元】花纤菇香菇脆片即食香菇干网','img/product/TB11XxOlKOSBuNjy0FdXXbDnVXa_!!0-item_pic.jpg','59.40','60.00','detail.html',26,26,26),
(null,'【天猫正品】万中堂新疆若羌俊枣灰枣和田红枣干枸杞枣子400g*1袋','img/product/TB12drImPnD8KJjSspbXXbbEXXa_!!0-item_pic.jpg','39.90','40.00','detail.html',27,27,27),
(null,'买2送1 掌微 野生雪燕 天山雪燕 植物燕窝30克 皂角米银耳伴侣','img/product/TB1xOWJjN9YBuNjy0FfXXXIsVXa_!!0-item_pic.jpg','39.80','40.00','detail.html',28,28,28),
(null,'商务皮箱红色拉杆箱女行李箱男万向轮登机箱韩版旅行箱20寸小清新','img/product/TB1DdCFRFXXXXXEXFXXXXXXXXXX_!!0-item_pic.jpg','288.00','388.00','detail.html',29,29,29),
(null,'防盗双肩包女韩版潮2017新款潮个性百搭背包背挎两用牛津布背包女','img/product/TB1Fz7Li1SSBuNjy0FlXXbBpVXa_!!0-item_pic.jpg','99.00','100.00','detail.html',30,30,30),
(null,'V＆N短途旅行包牛仔布手提行李包女休闲手提袋时尚链条包包韩版潮','img/product/TB1m3JFbRDH8KJjSszcXXbDTFXa_!!0-item_pic.jpg','188.00','200.00','detail.html',31,31,31),
(null,'三亚沙滩裙女夏2018新款波西米亚长裙性感海边度假显瘦泰国连衣裙','img/product/TB1y8GBecuYBuNkSmRyXXcA3pXa_!!0-item_pic.jpg','89.00','99.00','detail.html',32,32,32);


/***返利图片***/
INSERT INTO fanli_link VALUES
(1,'img/fanli_link/B4AC6388C3CE5C97.png','http://www.lzyx.com/index.php?mod=tao&act=index'),
(2,'img/fanli_link/FE5EDEAB9A4A8355.png','https://www.jd.com/'),
(3,'img/fanli_link/6F9F4957EB374A47.jpg','http://www.lzyx.com/goods/index-zhidemai.html'),
(4,'img/fanli_link/E66FDFB517DBCA9C.jpg','https://www.suning.com/'),
(5,'img/fanli_link/EE0343B3103A03DC.jpg','https://www.mia.com/'),
(6,'img/fanli_link/DC5800D6BFA8FB7C.jpg','http://www.lzyx.com/goods/index-cf-10001.html'),
(7,'img/fanli_link/2145FA53D88A8990.jpg','http://pc.discoveredcn.com/'),
(8,'img/fanli_link/5925B71B10AA4F50.png','http://www.vip.com/'),
(9,'img/fanli_link/2EBE8ADB68D7B98F.png','http://bj.jumei.com/'),
(10,'img/img/fanli_link/F338A58F48FBC1EE.png','http://corp.zhiwo.com/');


/***导航栏***/
INSERT INTO nav_list VALUES
(1,"首页","/index.html","跳转到首页"),
(2,"合作商城","/index.html","跳转到合作商城"),
(3,"淘宝返利","/index.html","跳转到淘宝返利"),
(4,"超级返利","/index.html","跳转到超级返利"),
(5,"劵返利","/index.html","跳转到劵返利"),
(6,"我的账户","/index.html","跳转到我的账户"),
(7,"手机版","/index.html","跳转到手机版");


/***轮播图***/
INSERT INTO banner VALUES
(1,"img/0820-1.jpg","/index.html","轮播广告1"),
(2,"img/0820-2.jpg","/index.html","轮播广告2"),
(3,"img/0820-3.jpg","/index.html","轮播广告3"),
(4,"img/0820-4.jpg","/index.html","轮播广告4");



/***********************************商品详情*************************************/
/***商品信息***/
INSERT INTO product VALUES
(1,1,'白衬衫女长袖2018秋季新款蕾丝花边纯棉打底衫修身气质淑女棉衬衣','纯棉柔软 蕾丝花边拼接',208.00,89.00,30,591,44,'S','img/detail/sm1.jpg','1894',' 棉100%','纯电商(只在线上销售)','CY6003','修身',' 通勤','韩版','常规款','长袖','常规','POLO领',' 单排多扣','纯色',' 纽扣','Cuooyino/初影','25-29周岁','2018年春季','白色','S M L XL XXL'),
(2,1,'白衬衫女长袖2018秋季新款蕾丝花边纯棉打底衫修身气质淑女棉衬衣','纯棉柔软 蕾丝花边拼接',208.00,89.00,30,591,44,'M','img/detail/sm1.jpg','1894',' 棉100%','纯电商(只在线上销售)','CY6003','修身',' 通勤','韩版','常规款','长袖','常规','POLO领',' 单排多扣','纯色',' 纽扣','Cuooyino/初影','25-29周岁','2018年春季','白色','S M L XL XXL'),
(3,1,'白衬衫女长袖2018秋季新款蕾丝花边纯棉打底衫修身气质淑女棉衬衣','纯棉柔软 蕾丝花边拼接',208.00,89.00,30,591,44,'L','img/detail/sm1.jpg','1894',' 棉100%','纯电商(只在线上销售)','CY6003','修身',' 通勤','韩版','常规款','长袖','常规','POLO领',' 单排多扣','纯色',' 纽扣','Cuooyino/初影','25-29周岁','2018年春季','白色','S M L XL XXL'),
(4,1,'白衬衫女长袖2018秋季新款蕾丝花边纯棉打底衫修身气质淑女棉衬衣','纯棉柔软 蕾丝花边拼接',208.00,89.00,30,591,44,'XL','img/detail/sm1.jpg','1894',' 棉100%','纯电商(只在线上销售)','CY6003','修身',' 通勤','韩版','常规款','长袖','常规','POLO领',' 单排多扣','纯色',' 纽扣','Cuooyino/初影','25-29周岁','2018年春季','白色','S M L XL XXL'),
(5,1,'白衬衫女长袖2018秋季新款蕾丝花边纯棉打底衫修身气质淑女棉衬衣','纯棉柔软 蕾丝花边拼接',208.00,89.00,30,591,44,'XXL','img/detail/sm1.jpg','1894',' 棉100%','纯电商(只在线上销售)','CY6003','修身',' 通勤','韩版','常规款','长袖','常规','POLO领',' 单排多扣','纯色',' 纽扣','Cuooyino/初影','25-29周岁','2018年春季','白色','S M L XL XXL');


/***商品图片***/
INSERT INTO product_img VALUES
(null,1,'img/detail/sm1.jpg','img/detail/md1.jpg','img/detail/lg1.jpg'),
(null,1,'img/detail/sm2.jpg','img/detail/md2.jpg','img/detail/lg2.jpg'),
(null,1,'img/detail/sm3.jpg','img/detail/md3.jpg','img/detail/lg3.jpg'),
(null,1,'img/detail/sm4.jpg','img/detail/md4.jpg','img/detail/lg4.jpg'),
(null,1,'img/detail/sm5.jpg','img/detail/md5.jpg','img/detail/lg5.jpg'),
(null,2,'img/detail/sm1.jpg','img/detail/md1.jpg','img/detail/lg1.jpg'),
(null,2,'img/detail/sm2.jpg','img/detail/md2.jpg','img/detail/lg2.jpg'),
(null,2,'img/detail/sm3.jpg','img/detail/md3.jpg','img/detail/lg3.jpg'),
(null,2,'img/detail/sm4.jpg','img/detail/md4.jpg','img/detail/lg4.jpg'),
(null,2,'img/detail/sm5.jpg','img/detail/md5.jpg','img/detail/lg5.jpg'),
(null,3,'img/detail/sm1.jpg','img/detail/md1.jpg','img/detail/lg1.jpg'),
(null,3,'img/detail/sm2.jpg','img/detail/md2.jpg','img/detail/lg2.jpg'),
(null,3,'img/detail/sm3.jpg','img/detail/md3.jpg','img/detail/lg3.jpg'),
(null,3,'img/detail/sm4.jpg','img/detail/md4.jpg','img/detail/lg4.jpg'),
(null,3,'img/detail/sm5.jpg','img/detail/md5.jpg','img/detail/lg5.jpg'),
(null,4,'img/detail/sm1.jpg','img/detail/md1.jpg','img/detail/lg1.jpg'),
(null,4,'img/detail/sm2.jpg','img/detail/md2.jpg','img/detail/lg2.jpg'),
(null,4,'img/detail/sm3.jpg','img/detail/md3.jpg','img/detail/lg3.jpg'),
(null,4,'img/detail/sm4.jpg','img/detail/md4.jpg','img/detail/lg4.jpg'),
(null,4,'img/detail/sm5.jpg','img/detail/md5.jpg','img/detail/lg5.jpg'),
(null,5,'img/detail/sm1.jpg','img/detail/md1.jpg','img/detail/lg1.jpg'),
(null,5,'img/detail/sm2.jpg','img/detail/md2.jpg','img/detail/lg2.jpg'),
(null,5,'img/detail/sm3.jpg','img/detail/md3.jpg','img/detail/lg3.jpg'),
(null,5,'img/detail/sm4.jpg','img/detail/md4.jpg','img/detail/lg4.jpg'),
(null,5,'img/detail/sm5.jpg','img/detail/md5.jpg','img/detail/lg5.jpg');



/***********************用户信息*****************************/
INSERT INTO user VALUES
(null,'z123456','z123456','Tom','123456@qq.com','15736498546'),
(null,'p123456','p123456','Jerry','jerry@qq.com','13248952348'),
(null,'u123456','u123456','David','david@tedu.com','15736498546');





