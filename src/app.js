/**
 * Module dependencies.
 */
var express = require('express');
var routes = require('./routes');
var http = require('http');
var path = require('path');
//load produkty route
var produkty = require('./routes/produkty');
var producenci = require('./routes/producenci');
var app = express();
var connection  = require('express-myconnection');
var mysql = require('mysql');
// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
//app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());
app.use(express.static(path.join(__dirname, 'public')));
// development only
if ('development' === app.get('env')) {
  app.use(express.errorHandler());
}
/*------------------------------------------
    connection peer, register as middleware
    type koneksi : single,pool and request 
-------------------------------------------*/
app.use(

    connection(mysql,{

        host: 'localhost',
        user: 'root',
        password : 'Varden97',
        database:'DBProject'
    },'request')
);//route index, hello world
app.get('/', routes.index);
app.get('/produkty', produkty.list);
app.get('/produkty/add', produkty.add);
app.post('/produkty/add', produkty.save);
app.get('/produkty/delete/:id', produkty.delete_produkt);
app.get('/produkty/edit/:id', produkty.edit);
app.post('/produkty/edit/:id',produkty.save_produkt);
app.get('/buy/:id', routes.buy);
app.post('/buy/:id',routes.buy_produkt);
app.get('/producenci', producenci.list);
app.get('/producenci/add', producenci.add);
app.post('/producenci/add', producenci.save);
app.get('/producenci/delete/:id', producenci.delete_producent);
app.get('/producenci/edit/:id', producenci.edit);
app.post('/producenci/edit/:id',producenci.save_producent);
app.use(app.router);
http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});