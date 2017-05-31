var mysql = require('mysql');
var Q = require("q");
//Controller -  cria o objeto e ja insere no banco
//exporta as funcoes para poder usar em outras páginas

function salvarCodigoBD(dados)
{	
	try{

		var config = require('.././database/config');
		var db = mysql.createConnection(config);

		db.connect();

		var deferred = Q.defer();
	
		db.query('INSERT INTO versoes SET ?', dados,  function(err, rows, fields){
			
			if(err)
			{
				console.log("\n\n-----------------------------------------ERRO:--------------------------------------------\n\n" 
					+ err + "\n\n-------------------------------------------------------------------------------------\n\n" );
				
				deferred.reject(false);		
			}
			else
			{
				
				console.log("\nCódigo armazenado com sucesso.\n");
				deferred.resolve(true);	
			}		
					
			db.end();			
			
		});	

		return deferred.promise;
	}
	catch(e)
	{
		console.log(e);
	}

};


function salvarUsuarioBD(dados)
{	
	try{

		var config = require('.././database/config');
		var db = mysql.createConnection(config);

		db.connect();

		var deferred = Q.defer();
	
		db.query('INSERT INTO alunos SET ?', dados,  function(err, rows, fields){

			if(err)
			{
				console.log("\n\n-----------------------------------------ERRO:--------------------------------------------\n\n" 
					+ err + "\n\n-------------------------------------------------------------------------------------\n\n" );
				deferred.reject(false);	
						
			}
			else
			{
				console.log("\nUsuário armazenado com sucesso.\n");
				deferred.resolve(true);	
				
			}		
			
			db.end();						
		});

		return deferred.promise;
	}
	catch(e)
	{
		console.log(e);
	}

};

function salvarFaseBD(dados)
{	
	try{

		var config = require('.././database/config');
		var db = mysql.createConnection(config);

		db.connect();

		var deferred = Q.defer();
	
		db.query('INSERT INTO fases SET ?', dados,  function(err, rows, fields){
			
			if(err)
			{
				console.log("\n\n-----------------------------------------ERRO:--------------------------------------------\n\n" 
					+ err + "\n\n-------------------------------------------------------------------------------------\n\n" );
				deferred.reject(false);			
			}
			else
			{
				console.log("\nDados da fase armazenado com sucesso.\n");
				deferred.resolve(true);	
			}		
					
			db.end();
			
		});		

		return deferred.promise;
	}
	catch(e)
	{
		console.log(e);
	}

};

module.exports = {


		
	salvarCodigo : function(req, res, next){		
			
		var resposta = {res: false};

		var dados = {
			idmaquina: req.body.idmaquina,
			data: req.body.data,
			nomeativ: req.body.nomeativ,
			fase: req.body.fase,
			versao: req.body.versao,
			codigo: req.body.codigo,
			hora: req.body.hora,
			idhora: req.body.idhora
		}

		console.log(dados);	

		try{
			salvarCodigoBD(dados);
		} catch(e) {
			console.log(e);
		}

		res.json(true);	
	},
	

	//funcao	
	salvarUsuario : function(req, res, next){			
		
		var resposta = {res: false};

		var dados = {
			idmaquina: req.body.idmaquina,
			data: req.body.data,
			hora: req.body.hora
		}

		console.log(dados);	

		try{
			salvarUsuarioBD(dados);
		} catch(e) {
			console.log(e);
		}

		res.json(true);					
	},

	salvarFase : function(req, res, next){		
		
		var resposta = {res: false};

		var dados = {
			idmaquina: req.body.idmaquina,
			data: req.body.data,
			nomeativ: req.body.nomeativ,
			fase: req.body.fase,
			dicas: req.body.dicas,
			tentativas: req.body.tentativas,
			idhora: req.body.idhora
		}

		console.log(dados);		
		
		try{
			salvarFaseBD(dados);
		} catch(e) {
			console.log(e);
		}
		res.json(true);		

	}



}
