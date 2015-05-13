/**
 * Created by domenicovacchiano on 12/05/15.
 */

var request = require('request'),
    TestHelper=require ('./../test-helper');

describe('API POST',function(){

    it("/customers should respond with 500 status code", function(done) {
        request({
            url: TestHelper().makeBasicAuthUrl('customers'),
            method: 'POST'
        }, function(error, response, body){
            expect(response.statusCode).toBe(404);
            done();
        });
    });

});

describe ("API GET",function(){


    it ("/customer should respond with 200 status code and with a JSON body format",function(done){
        request({
            url: TestHelper().makeBasicAuthUrl("customers") ,
            method: 'GET'
        }, function(error, response, body){
            expect(response.statusCode).toBe(200);
            done();
        });
    });

    it ("/customer/:id should respond with 200 status code and with a JSON body format",function(done){
        request({
            url: TestHelper().makeBasicAuthUrl("customers/10001") ,
            method: 'GET'
        }, function(error, response, body){
            expect(response.statusCode).toBe(200);
            done();
        });
    });

});
