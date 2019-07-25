SET NAMES UTF8;
#丢弃
DROP DATABASE IF EXISTS xz;
#创建
CREATE DATABASE xz CHARSET=UTF8;
#进入
USE xz;
#创建表格
#表名1：xz_user，用户信息表
CREATE TABLE xz_user(  
  uid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16) NOT NULL UNIQUE,  #手机号码
  avatar VARCHAR(128),  #头像图片路径
  user_name VARCHAR(32),  #用户名，如王小明
  gender  CHAR(1)    #1/0
);

INSERT INTO xz_user VALUES(1,'123456','123456','123456@163.com','123456','头像路径','钢铁侠',1);
INSERT INTO xz_user VALUES(2,'789012','789012','789012@163.com','789012','头像路径','美国队长',1);
INSERT INTO xz_user VALUES(3,'345678','345678','345678@163.com','345678','头像路径','蜘蛛侠',1);


#表名2：xz_receiver_address，用户地址表
CREATE TABLE xz_receiver_address(    
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,  #用户编号
  receiver VARCHAR(16),  #接收人姓名
  province VARCHAR(16),  #省
  city VARCHAR(16),  #市
  county VARCHAR(16),  #县
  address VARCHAR(128),  #详细地址
  cellphone VARCHAR(16),  #手机
  fixedphone VARCHAR(16), #固定电话
  postcode CHAR(6),  #邮编
  tag VARCHAR(16),  #标签名
  is_default BOOL  #是否为当前用户的默认收货地址
);

INSERT INTO xz_receiver_address VALUES(1,6156632,'周杰伦','广东省','广州市','白云区','详细地址','17602038234','固定电话','510510','我像风一',1);
INSERT INTO xz_receiver_address VALUES(2,1234575,'焦迈奇','福建省','漳州市','秀篆镇','详细地址','13560172636','固定电话','101010','I see ',1);
INSERT INTO xz_receiver_address VALUES(3,8141515,'周柏豪','广东省','梅州市','区','详细地址','15918478557','固定电话','506070',' you pain',1);


 #表头3：xz_shopping_cart,用户购物车表
CREATE TABLE xz_shopping_cart( 
  cid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,  #用户编号
  product_id INT,  #商品编号
  count INT  #购买数量
); 

INSERT INTO xz_shopping_cart VALUES(11,85589341,51651787,10);
INSERT INTO xz_shopping_cart VALUES(22,1292161606,564124554,50);
INSERT INTO xz_shopping_cart VALUES(33,50820058,56152232,100);


#表头4：xz_order，用户订单表
CREATE TABLE xz_order(  
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,  #用户编号
  address_id INT, 
  status INT(1), #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,  #下单时间
  pay_time BIGINT,  #付款时间
  deliver_time BIGINT,  #发货时间
  received_time BIGINT  #签收时间
);

INSERT INTO xz_order VALUES(1,85589341,5614561,1,20190706,20190707,20190708,20190709);
INSERT INTO xz_order VALUES(2,50820058,561456,2,20190708,20190709,20190710,20190711);
INSERT INTO xz_order VALUES(3,2275674941,54156,3,20190710,20190711,20190712,20190713);


#表头5：xz_order_detail，用户订单详情表
CREATE TABLE xz_order_detail(  
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,  #订单编号
  product_id INT,  #产品编号
  count INT  #购买数量
);

INSERT INTO xz_order_detail VALUES(1,156156156,13213,10);
INSERT INTO xz_order_detail VALUES(2,564156156,1321,30);
INSERT INTO xz_order_detail VALUES(3,132132488,61421,100);


#表头6：xz_laptop_family，商品类别表
CREATE TABLE xz_laptop_family( 
  fid INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(32)  #类别姓名
);

INSERT INTO xz_laptop_family VALUES(1,'小米pro');
INSERT INTO xz_laptop_family VALUES(2,'一加一手机');
INSERT INTO xz_laptop_family VALUES(3,'小米max');


#表头7：xz_laptop，商品表
CREATE TABLE xz_laptop(  
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,  #所属型号家族编号
  product_id INT,  #产品编号
  title VARCHAR(128),  #主标题
  subitle VARCHAR(128),  #副标题
  price DECIMAL(10,2),  #价格
  promise VARCHAR(64),  #服务承诺
  spec VARCHAR(64),  #规格/颜色
  name VARCHAR(32),  #商品名称
  os VARCHAR(32),  #操作系统
  memory VARCHAR(32),  #内存容量
  resolution VARCHAR(32),  #分辨率
  video_card VARCHAR(32),  #显卡型号
  cpu VARCHAR(32),  #处理器
  video_memory VARCHAR(32),  #显存容量
  category VARCHAR(32),  #所属分类
  disk VARCHAR(32), #硬盘容量及分类
  details VARCHAR(32),  #产品详细说明
  shelf_time BIGINT,  #上架时间
  sold_count INT,  #已售出的数量
  is_onsale BOOL  #是否促销中
);


INSERT INTO xz_laptop VALUES(1,10,1918151,'主标题不知道写啥','这副标题',11748.98,'我承诺商品有瑕疵','红色','游戏本','windows','64g','1024分辨率','一般型号','一般处理器cpu','32g','低级笔记本','512GB','产品的详细说明','20190707','520','1');
INSERT INTO xz_laptop VALUES(2,20,5615616,'流啊流','资金都是风景',84562.11,'我承诺不会退货','黑色','笔记本','windows','256g','512分辨率','最新型号','二般处理器cpu','16g','中等笔记本','1TB','假的','20190706','100','1');
INSERT INTO xz_laptop VALUES(3,30,3214481,'山东富豪','大家回顾',75412.58,'服务承诺','粉色','不明商品','windows','128g','2048分辨率','显卡型号','三般处理器cpu','8g','高级笔记本','256GB','骗人的','20190708','219','1');



 #表头8：xz_laptop_pic商品详情图表
CREATE TABLE xz_laptop_pic( 
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop INT,  #笔记本电脑编号
  sm VARCHAR(128),  #小图片路径
  md VARCHAR(128),  #中图片路径
  lg VARCHAR(128)  #大图片路径
);

INSERT INTO xz_laptop_pic VALUES(1,45354,'小路径','中路径','大路径');
INSERT INTO xz_laptop_pic VALUES(2,12354,'小路径','中路径','大路径');
INSERT INTO xz_laptop_pic VALUES(3,78963,'小路径','中路径','大路径');


 #表头9：xz_index_carousel，首页轮播图表
CREATE TABLE xz_index_carousel( 
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),  #图片路径
  title VARCHAR(64),  #图片描述
  href VARCHAR(128)  #图片链接
);

INSERT INTO xz_index_carousel VALUES(1,'图片路径','图片描述','图片链接');
INSERT INTO xz_index_carousel VALUES(2,'图片路径','图片描述','图片链接');
INSERT INTO xz_index_carousel VALUES(3,'图片路径','图片描述','图片链接');


#表头10：xz_index_product，首页商品栏目表
CREATE TABLE xz_index_product(  
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),  #商品标题
  details VARCHAR(128),  #详细描述
  pic VARCHAR(128),  #图片
  price VARCHAR(128),  #商品价格
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

INSERT INTO xz_index_product VALUES(1,'商品的标题','商品详情页','图片商品',88888.88,'www.vip.com',10,52,18);
INSERT INTO xz_index_product VALUES(2,'啥商品不知道','商品的描述','图片商品',77777.77,'www.baidu.com',50,20,30);
INSERT INTO xz_index_product VALUES(3,'商品的第三','撒大家分散','图片商品',66666.66,'www.4399.com',70,40,90);