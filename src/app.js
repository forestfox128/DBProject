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
var typy = require('./routes/typy');
var klienci = require('./routes/klienci');
var adresy = require('./routes/adresy');
var zamowienia = require('./routes/zamowienia');
var wysylki = require('./routes/wysylki');
var platnosci = require('./routes/platnosci');
var app = express();
var connection = require('express-myconnection');
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
app.use(
    connection(mysql, {
        host: 'localhost',
        user: 'root',
        password: 'Varden97',
        database: 'DBProject'
    }, 'request')
);//route index, hello world
app.get('/', routes.index);
app.get('/produkty', produkty.list);
app.get('/produkty/add', produkty.add);
app.post('/produkty/add', produkty.save);
app.get('/produkty/delete/:id', produkty.delete_produkt);
app.get('/produkty/edit/:id', produkty.edit);
app.post('/produkty/edit/:id', produkty.save_produkt);
app.get('/buy/:id', routes.buy);
app.post('/buy/:id', routes.buy_produkt);
app.get('/buy_klienci', routes.buy_klienci);
app.post('/buy_klienci', routes.save_klienci);
app.get('/buy_adresy', routes.buy_adresy);
app.post('/buy_adresy', routes.save_adresy);
app.get('/szopy', routes.szopy);
app.get('/producenci', producenci.list);
app.get('/producenci/add', producenci.add);
app.post('/producenci/add', producenci.save);
app.get('/producenci/delete/:id', producenci.delete_producent);
app.get('/producenci/edit/:id', producenci.edit);
app.post('/producenci/edit/:id', producenci.save_producent);
app.get('/typy', typy.list);
app.get('/typy/add', typy.add);
app.post('/typy/add', typy.save);
app.get('/typy/delete/:id', typy.delete_typy);
app.get('/typy/edit/:id', typy.edit);
app.post('/typy/edit/:id', typy.save_typy);
app.get('/klienci', klienci.list);
app.get('/klienci/delete/:id', klienci.delete);
app.get('/adresy', adresy.list);
app.get('/adresy/edit/:id', adresy.edit);
app.post('/adresy/edit/:id', adresy.save);
app.get('/zamowienia', zamowienia.list);
app.get('/zamowienia/delete/:id', zamowienia.delete);
app.get('/wysylki', wysylki.list);
app.get('/wysylki/edit/:id', wysylki.edit);
app.post('/wysylki/edit/:id', wysylki.save);
app.get('/platnosci', platnosci.list);
app.get('/platnosci/edit/:id', platnosci.edit);
app.post('/platnosci/edit/:id', platnosci.save);
app.use(app.router);
http.createServer(app).listen(app.get('port'), function () {
    console.log('Szop is listening on port ' + app.get('port'));
    console.log('-> http://www.localost:' + app.get('port'));
});