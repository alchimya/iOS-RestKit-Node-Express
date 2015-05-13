/**
 * Created by domenicovacchiano on 12/05/15.
 */

var request = require('request'),
    TestHelper=require ('./../test-helper');

describe('API GET',function(){

    it("root server should respond with 500 status code", function(done) {
        request(TestHelper().makeBaseUrl(), function (error, response, body) {
            expect(response.statusCode).toBe(500);
            done();
        })
    });

});

describe ("API BASIC AUTH TEST",function(){

    it ("basic auth ok on /customers",function(done){
        request({
            url: TestHelper().makeBasicAuthUrl('customers'),
            method: 'GET'
        }, function(error, response, body){
            expect(response.statusCode).not.toBe(500);
            done();
        });
    });

    it ("basic auth fail on /customers",function(done){
        request({
            url: TestHelper().makeBaseUrl() + "/customers",
            method: 'POST'
        }, function(error, response, body){
            expect(response.statusCode).toBe(500);
            done();
        });
    });

});

