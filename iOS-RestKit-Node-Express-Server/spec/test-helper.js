/**
 * Created by domenicovacchiano on 12/05/15.
 */

var global=require("./test-global"),
    config=require("./../app/modules/config")

function TestHelper(){

    return{
        //makes an URL with basi auth credentials
        makeBasicAuthUrl:function(action){

            return'http://' +
                global.basicAuthCredentials().username + ':' +
                global.basicAuthCredentials().password +
                '@localhost:' + config.server().port + '/' +  action;
        },
        //makes a base URL with no credentials
        makeBaseUrl:function(){
            return'http://localhost:' + config.server().port;
        }
    };

}

module.exports=TestHelper;