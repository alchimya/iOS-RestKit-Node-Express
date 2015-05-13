/**
 * Created by domenicovacchiano on 12/05/15.
 */

//helper class, for error entity response
function ErrorResponse(code,message,domain){
    //console.log("domain:" + domain);
    return  {
        error:{
            code:code,
            message:message,
            domain:domain
        }
    };
}
module.exports=ErrorResponse;