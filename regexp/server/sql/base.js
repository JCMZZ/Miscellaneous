var mysql = require("mysql");
var conf = {
    host:'localhost',
    user:'root',
    password:'',
    database:'rule',
    port:3306
}
// alter database rule default character set utf8;更改数据库字符集
var connection = mysql.createConnection(conf);
connection.connect();
function createRegExp(connection){
    let sql = `CREATE TABLE regular(
        id INT PRIMARY KEY AUTO_INCREMENT,
        label VARCHAR(32),
        reg VARCHAR(152),
        warn VARCHAR(64)
    )`;
    connection.query(sql, function (error, results, fields) {
        if (error) return
    })
}

module.exports = {
    connection:connection,
    createRegExp:createRegExp
}
