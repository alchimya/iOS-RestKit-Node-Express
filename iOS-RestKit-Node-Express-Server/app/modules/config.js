/**
 * Created by domenicovacchiano on 12/05/15.
 */

//set here the server port
exports.server=function(){
    return{
        port:8000
    };
};

//you can use this config data for the db connection
exports.database=function(){

    return{
        name:"my_db",
        user:"my_db_user",
        password:"my_db_password",
        host:"localhost",
        port:3306
    };

};
