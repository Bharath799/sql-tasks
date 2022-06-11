const mysql = require('mysql');

//create here mysql connection

const dbConn = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    database:'himpact'
});

dbConn.connect(function(error){
    if(error) throw error;
    console.log('database connected successfully!!');
})

module.exports = dbConn;