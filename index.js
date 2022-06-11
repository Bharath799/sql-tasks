const express =require('express');
const bodyParser = require('body-parser');


//creating express app
const app = express();

//setup the server port 
const port = process.env.port || 5000;

//parse request data content type application/x-www-from-rulencoded
app.use(bodyParser.urlencoded({extended: false}));

//parse request data content type application/json
app.use(bodyParser.json());

//app get method
app.get('/',(req,res) => {
    res.send('Hello World');
});

//import users routes
const usersRoutes = require('./src/routes/users.route');

//creating link employee routes
app.use('/api/users',usersRoutes);

//listen to port
app.listen(port,()=>{
    // console.log(`express running port ${port}`);
    console.log("express server running",port);
});
