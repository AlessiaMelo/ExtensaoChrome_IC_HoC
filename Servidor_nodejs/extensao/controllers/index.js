var fs = require('fs');
var path = require('path');


//Captura os arquivos da pasta atual
var files = fs.readdirSync(__dirname);

files.forEach(function(file){

	var fileName = path.basename(file, '.js');
	//importa
	if(fileName !== 'index'){
		//exporta o controller.js para as routes
		exports[fileName] = require('./'+ fileName);
	}

});
