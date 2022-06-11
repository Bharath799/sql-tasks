var dbConn = require('../../config/db.config');
const { getusersList } = require('../controllers/users.controller');


var USER_DETAILS = function(users) {
    this.USER_ID            = users.USER_ID;
    this.USERNAME           = users.USERNAME;
    this.CONTACT_NUMBER     = users.CONTACT_NUMBER;
    this.PASSWORD           = users.PASSWORD;
    this.CREATE_DATE_TIME   = new Date();
}

//get all users
USER_DETAILS.getAllusers = (result) => {
    dbConn.query('SELECT * FROM users',(err,res) => {
        if(err){
            console.log('Error in Fetching users',err);
            result(null,err);
        }else{
            console.log("Users Fetch successfully");
            result(null,res);
        }
    })
}


//get users by id from database
USER_DETAILS.getusersByID = (id,result) => {
    dbConn.query('SELECT * FROM users WHERE USER_ID=?',id, (err, res)=>{
        if(err){
            console.log('Error user id');
            result(null,err);
        }else{
            result(null,res);
        }
    })
}


//create new users
USER_DETAILS.createusers = (usersReqData, result) => {
    dbConn.query('INSERT INTO users SET ?'.usersReqData,(err, res) => {
        if(err){
            console.log("Error insert");
            result(null,{status:false,message:err})
        }else{
            console.log('users created successfuly');
            result(null,res)
        }
    })
}

//delete users
USER_DETAILS.deleteusers = (id, result) => {
    dbConn.query('DELETE FROM users WHERE id=?',[id],(err,res) =>{
        if(err){
            console.log('Error while delete users');
            result(null,err);
        }else{
            result(null,res);
        }
    })
}

module.exports = USER_DETAILS;