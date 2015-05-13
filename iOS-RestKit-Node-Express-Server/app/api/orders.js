/**
 * Created by domenicovacchiano on 12/05/15.
 */

//REST implementation

var express = require('express'),
    Order=require('./../entities/order.js');


var router = express.Router();


//GET /customers/orders/:customerId'
router.get('/', function (req, res,next) {

    //INSERT HERE YOU CUSTOM OPERATIONS FOR  ORDERS LOADING
    var ret=[
        {id:1,price:50,quantity:10,description:"Item 1",customerId:"10001"},
        {id:1,price:20,quantity:30,description:"Item 2",customerId:"10001"},
        {id:1,price:10,quantity:100,description:"Item 3",customerId:"10002"},
        {id:1,price:510,quantity:250,description:"Item 4",customerId:"10005"},
        {id:1,price:100,quantity:1,description:"Item 5",customerId:"10004"}
    ];

    res.status(200).send({orders:ret});
});


//GET /orders/:id/'
router.get('/:id', function (req, res,next) {

    //INSERT HERE YOU CUSTOM OPERATIONS FOR ORDER LOADING
    var ret=new Order();

    ret.id=req.params.id;
    ret.price=100.32;
    ret.quantity=10;
    ret.description="Item 1";
    ret.customerId="10001";

    res.status(200).send({orders:ret});
});



module.exports = router;