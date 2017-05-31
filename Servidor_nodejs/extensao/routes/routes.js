//define as rotas do projeto

var express = require('express');
var router = express.Router();

var controllers = require('.././controllers')

var path = require('path');

// viewed at http://localhost:8080
router.get('/', function(req, res) {
    res.sendFile(path.join(__dirname + '/teste.html'));
});

// direciona as requisiçoes
router.post('/salvarCodigo', controllers.controller.salvarCodigo);
router.post('/salvarUsuario', controllers.controller.salvarUsuario);
router.post('/salvarFase', controllers.controller.salvarFase);

/*router.get('/', function(req, res, next) {
	//página incial
	//sobe para a memória, passando como parametro Express, para para a view parametrizada
	res.render('index', { title: 'Extensao IC' });

});*/

module.exports = router;
