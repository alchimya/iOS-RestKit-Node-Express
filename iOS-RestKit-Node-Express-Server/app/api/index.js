/**
 * Created by domenicovacchiano on 12/05/15.
 */

module.exports = function (app) {
    app.use('/user/signin', require('./signin'));
    app.use('/customers', require('./customers'));
    app.use('/orders', require('./orders'));
};