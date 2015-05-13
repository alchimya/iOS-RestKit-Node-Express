/**
 * Created by domenicovacchiano on 12/05/15.
 */

var express=require('express'),
    config = require('./app/modules/config'),
    security=require('./app/modules/basic-auth-security'),
    bodyParser = require('body-parser'),
    errorResponse = require('./app/modules/error-response'),
    errorDomain= require('./app/modules/error-domain');

//creates express app
var app=express();

//set use body parser
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

//require authentication on each request
//TODO you can ui and pwd for example from a developers db table (ApiKey, Password)
//Each request on this server, will expect an header with basic auth credentials my_uid and my_pwd
app.all('*', security("my_uid","my_pwd").auth)

//start server
var server=app.listen(config.server().port,function(){
    console.log(" iOS-RestKit-Node-Express-Server started on port " + config.server().port);
});

//require index api
var router = require('./app/api')(app);


//http error handling on \ path
app.use(function(err, req, res, next) {
    //TODO LOG ERROR
    console.log(err);
    res.status(500).send(errorResponse(500,"Application Error",errorDomain().App_ApplicationError));
});

