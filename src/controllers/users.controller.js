const usersModel = require('../models/users.modal');


//Get users List
exports.getusersList = (req, res) => {
    // console.log("here all users list");
    usersModel.getAllusers((err, users) => {
        console.log('we are here');
        if(err){
            res.send(err);
        }else{
            console.log("users",users);
            res.send(users)
        }
    })
}
//get user id

exports.getusersByID = (req, res) =>{
    // console.log('get user by id');
    usersModel.getusersByID(req.params.id, (err, users) =>{
        if(err){
            res.send(err);
        }else{
            console.log("single users data",);
            res.send(users);
        }
    })
}


//create new users
exports.createNewusers = (req, res) =>{
    const usersReqData = new USER_DETAILS(req.body);
    console.log('usersdata',usersReqData);
    //chek null
    if(req.body.contructor === Object && Object.keys(req.body).length === 0){
        res.send(400).send({success:false, message:'Please fill all fields'});
    }else{
        console.log('valid data');
        usersModel.createusers(usersReqData,(err, users) => {
            if(err)
                res.send(err);
                res.json({status:true,message:'users created successfully', data: users.insertId})
        })
    }
}

//delete controller
exports.deleteusers = (req, res) => {
    usersModel.deleteusers(req.params.id, (err, users) => {
        if(err)
        res.send(err);
        res.json({success:true, message:'usersr Deleted Success fully'});
    })
}