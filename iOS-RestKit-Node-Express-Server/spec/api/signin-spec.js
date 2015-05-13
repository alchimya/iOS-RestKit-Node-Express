/**
 * Created by domenicovacchiano on 12/05/15.
 */


var request = require('request'),
    TestHelper=require ('./../test-helper');

describe('API GET',function(){

    it("user/signin should respond with 500 status code", function(done) {
        request({
            url: TestHelper().makeBasicAuthUrl('user/signin'),
            method: 'GET'
        }, function(error, response, body){
            expect(response.statusCode).toBe(404);
            done();
        });
    });

});


describe ("API POST",function(){


    it ("/user/signin should respond with 401 status code invalid input data",function(done){
        request({
            url: TestHelper().makeBasicAuthUrl("user/signin") ,
            method: 'POST'
        }, function(error, response, body){
            expect(response.statusCode).toBe(401);
            done();
        });
    });

    it ("/user/signin should respond with 401 status code invalid input data",function(done){
        request({
            url: TestHelper().makeBasicAuthUrl("user/signin") ,
            method: 'POST',
            json:{
                uid:"dome"
            }
        }, function(error, response, body){
            expect(response.statusCode).toBe(401);
            done();
        });
    });
    it ("/user/signin should respond with 401 status code invalid input data",function(done){
        request({
            url: TestHelper().makeBasicAuthUrl("user/signin") ,
            method: 'POST',
            json:{
                pwd:"dome"
            }
        }, function(error, response, body){
            expect(response.statusCode).toBe(401);
            done();
        });
    });
    it ("/user/signin should respond with 200 status code and with a JSON body format",function(done){
        request({
            url: TestHelper().makeBasicAuthUrl("user/signin") ,
            method: 'POST',
            json:{
                uid:"dome",
                pwd:"dome"
            }
        }, function(error, response, body){
            expect(response.statusCode).toBe(200);
            expect(body.user).toBeDefined();
            expect(body.user.uid).toBeDefined();
            expect(body.user.pwd).toBeDefined();
            expect(body.user.firstName).toBeDefined();
            expect(body.user.lastName).toBeDefined();
            done();
        });
    });
});

