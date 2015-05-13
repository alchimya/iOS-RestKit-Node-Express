/**
 * Created by domenicovacchiano on 12/05/15.
 */

//REST implementation

var express = require('express'),
    Customer=require('./../entities/customer.js'),
    errorResponse = require('./../modules/error-response'),
    errorDomain= require('./../modules/error-domain'),
    errorCodes= require('./../modules/error-codes');


var router = express.Router();

//GET /customers'
router.get('/', function (req, res,next) {

    //INSERT HERE YOU CUSTOM OPERATIONS FOR CUSTOMER LIST LOADING


    var ret=[
        {firstName:"Domenico",lastName:"Vacchiano",email:"info@domenicovacchiano.com",id:"100001"},
        {firstName:"fName_1",lastName:"lName_1",email:"info@domain1.com",id:"100002"},
        {firstName:"fName_2",lastName:"lName_2",email:"info@domain2.com",id:"100003"},
    ];

    res.status(200).send({customers:ret});

});

//GET /customers/:id/'
router.get('/:id', function (req, res,next) {

    if (!req.params.id){
        res.status(401).send(errorResponse(errorCodes().API_Invalid_Input_Data,"Invalid input data",errorDomain().API_Invalid_Input_Data));
        return;
    }

    //INSERT HERE YOU CUSTOM OPERATIONS FOR CUSTOMER LOADING
    var ret=new Customer();
    ret.firstName="Domenico";
    ret.lastName="Vacchiano";
    ret.email="info@domenicovacchiano.com";
    ret.id=req.params.id;

    res.status(200).send({customers:ret});

});



module.exports = router;