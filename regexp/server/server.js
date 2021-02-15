var express = require("express");
var app = express();
var bodyParser = require("body-parser");
var cors = require("cors");
var path = require("path");
var cors = require("cors");
var mysqlBase = require("./sql/base.js");
var connection =mysqlBase.connection;
var bodyParserUrl = bodyParser.urlencoded({extendex:false});

// mysqlBase.createRegExp(connection);创建数据表regular
app.use(cors());
app.use(express.static(path.join(__dirname,'../')))

// 页面
app.get(/^(\/||\/index)$/,function(req, res){
    res.sendFile(path.join(__dirname,'../html/index.html'));   
})
// 添加
app.post('/add',bodyParserUrl,function(req, res){
    var parameters = req.body;
    let sql = `INSERT INTO regular VALUE(
        NULL,'${parameters.label}','${parameters.reg}','${parameters.warn}'
    ) `
    connection.query(sql,function (error, result){
        if(error) {
            res.send({code:0,message:"失败"});
            return
        }else{
            res.send({code:1,message:"成功"});
        }
    })
})
// 更新
app.post('/update',bodyParserUrl,function(req, res){
    var parameters = req.body;
    let sql = `UPDATE regular SET
       label = '${parameters.label}',reg = '${parameters.reg}', warn = '${parameters.warn}' WHERE id = ${parameters.id}
     `
    connection.query(sql,function (error, result){
        if(error) {
            res.send({code:0,message:"失败"});
            return
        }else{
            res.send({code:1,message:"成功"});
        }
    })
})
// 删除
app.post('/del',bodyParserUrl,function(req, res){
    var id = req.body.id;
    let sql = `DELETE FROM regular WHERE id=${id} `
    connection.query(sql,function (error, result){
        if(error) {
            res.send({code:0,message:"失败"});
            return
        }else{
            res.send({code:1,message:"成功"});
        }
    })
})
// 查询
app.post('/search',bodyParserUrl,function(req, res){
    var str = req.body.str;
    let sql = `SELECT * FROM regular WHERE label LIKE'%${str}%' or warn LIKE'%${str}%' ORDER BY LENGTH(reg)`
    connection.query(sql,function (error, result){
        if(error) {
            res.send({code:0,message:"失败"});
            return
        }else{
            res.send({code:1,message:result});
        }
    })
})
var server = app.listen(666,function(){
    console.log('Server running at http://127.0.0.1:666/'); 
})