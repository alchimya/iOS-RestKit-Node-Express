/**
 * Created by domenicovacchiano on 12/05/15.
 */

//define here your custom error domain definitions

function ErrorDomain(){
    //define her your app namespace or app identifier
    var baseDomain="com.domenicovacchiano.myapp";
    return{
        //App
        App_Auth:baseDomain + ".App.Security.ErrorDomain",
        App_ApplicationError:baseDomain + ".App.ApplicationError.ErrorDomain",
        //API
        API_Invalid_Input_Data:baseDomain + ".API.InvalidInputData.ErrorDomain"

    };
}
module.exports=ErrorDomain;