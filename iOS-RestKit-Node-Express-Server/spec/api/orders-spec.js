/**
 * Created by domenicovacchiano on 12/05/15.
 */

var request = require('request'),
    TestHelper=require ('./../test-helper');

describe('API POST',function(){

    it("/orders should respond with 500 status code", function(done) {
        request({
            url: TestHelper().makeBasicAuthUrl('orders'),
            method: 'POST'
        }, function(error, response, body){
            expect(response.statusCode).toBe(404);
            done();
        });
    });

});

describe ("API GET",function(){


    it ("/orders should respond with 200 status code and with a JSON body format",function(done){
        request({
            url: TestHelper().makeBasicAuthUrl("orders") ,
            method: 'GET'
        }, function(error, response, body){
            expect(response.statusCode).toBe(200);
            done();
        });
    });

    it ("/orders/:id should respond with 200 status code and with a JSON body format",function(done){
        request({
            url: TestHelper().makeBasicAuthUrl("orders/OD0001") ,
            method: 'GET'
        }, function(error, response, body){
            expect(response.statusCode).toBe(200);
            done();
        });
    });

});
