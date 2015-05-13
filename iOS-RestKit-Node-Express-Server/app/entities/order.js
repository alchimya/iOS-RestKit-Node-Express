/**
 * Created by domenicovacchiano on 12/05/15.
 */

//it represents an Order entity
function Order(){
    this.id=null;
    this.price=0;
    this.quantity=0;
    this.description=null;
    this.customerId=null;
}

module.exports=Order;