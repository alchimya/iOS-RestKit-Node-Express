/**
 * Created by domenicovacchiano on 12/05/15.
 */

//REST implementation

var express = require('express'),
    errorResponse = require('./../modules/error-response'),
    errorDomain= require('./../modules/error-domain'),
    errorCodes= require('./../modules/error-codes'),
    User=require('./../entities/user.js');


var router = express.Router();


/*
//GET /signin/:uid/:pwd'
//You can use a get verb, but when you work with secure data, is much better to send data by using POST
router.get('/:uid/:pwd', function (req, res,next) {

    console.log(req.params.id);
    res.status(200).send({user:{uid:req.params.uid,pwd:req.params.pwd}});

});
*/

// POST /signin
router.post('/', function (req, res,next) {


    //input data validation
    if (!req.body.uid | !req.body.pwd){
        res.status(401).send(errorResponse(errorCodes().API_Invalid_Input_Data,"Invalid input data",errorDomain().API_Invalid_Input_Data));
        return;
    }

    //HERE YOUR LOGIN OPERATIONS
    //IF OK
    var ret= new User();
    ret.uid=req.body.uid;
    ret.pwd=req.body.pwd;
    ret.firstName="Domenico";
    ret.lastName="Vacchiano";

    res.status(200).send({user:ret});


});


module.exports = router;