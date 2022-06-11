const express = require('express');
// const { route } = require('express/lib/application');
const router = express.Router();

const usersController = require('../controllers/users.controller');

//get all users

router.get('/',usersController.getusersList);

//get user by id
router.get('/:id',usersController.getusersByID);

//create new users
router.post('/',usersController.createNewusers);

//delete users
router.delete('/:id',usersController.deleteusers);

module.exports = router;