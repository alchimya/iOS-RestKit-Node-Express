/**
 * Created by domenicovacchiano on 12/05/15.
 */

var basicAuth = require('basic-auth'),
    errorResponse = require('./error-response'),
    errorDomain= require('./error-domain');

//implements a basic authentication by using basic-auth module
//if the credentials set on the class constructor are different of the credentials
//sent on the header, it returns an unauthorized 401 status
function BasicAuthSecurity(uid,pwd){

    return{
        auth:  function (req, res, next) {

            function unauthorized(res) {
                res.set('WWW-Authenticate', 'Basic realm=Authorization Required');
                res.status(401).send(errorResponse(401,"unauthorized",errorDomain.App_Auth()));
            };
            var userIn = basicAuth(req);
            if (!userIn || !userIn.name || !userIn.pass) {
                return unauthorized(res);
            };

            if (userIn.name === uid && userIn.pass === pwd) {
                return next();
            } else {
                return unauthorized(res);
            };

        }
    };

}

module.exports=BasicAuthSecurity;