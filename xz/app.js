//练习  创建web服务器，托管静态资源到public目录，在public目录下创建user_reg.html
const express=require('express');
const userRouter=require('./routes/user.js');
const bodyParser=require('body-parser');
const productRouter=require('./routes/product.js');
var app=express();
app.listen(8080);

//使用body-parser中间件
app.use(bodyParser.urlencoded({
  extended:false
}));

//托管静态资源到public目录
app.use(express.static('./public'));
app.use('/user',userRouter);
//使用商品路由器，挂载到/product /product/list
app.use('/product',productRouter);