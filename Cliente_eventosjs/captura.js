//captura Data
function getDate()
{ 
	var date 	= new Date();

	var day     = date.getDate();     
	var month   = date.getMonth(); 			         
	var year    = date.getFullYear();
	month = month+1;

	if(day < 10)
	{
		day = "0"+day;
	}
	if(month < 10)
	{
		month = "0"+month;
	}

	var str_date = year + '-' + month + '-' + day;
	return  str_date;
}
//captura Hora
function getTime()
{ 
	var time 	= new Date();

	var hour    =  time.getHours();          
	var min     =  time.getMinutes();       
	var sec     =  time.getSeconds(); 

	if(hour < 10)
	{
		hour = "0"+hour;
	}
	if(min < 10)
	{
		min = "0"+min;
	}
	if(sec < 10)
	{
		sec = "0"+sec;
	}

	var str_time = hour + ':' + min + ':' + sec;

	return str_time;
}

//Obtem o codigo
function getCode()
{
	//Marca a data e hora de obtenção do código
	date = getDate();
	time = getTime();

	//Botão Mostrar Código
	divActive = document.querySelector(".generated-code-container");
	if(divActive == null)
	{					
		openWind= document.querySelector('#show-code-header');
		if (openWind != null) 
		{
			//Abre e fecha a janela para obter o código
			openWind.click();
			code = document.getElementsByClassName('generatedCode')["0"].textContent;

			console.log("Codigo enviado pelo aluno em " +date+ ", às "+time+".\n" + code);
			
			closeWind= document.querySelector('#x-close');
			closeWind.click();	

			return code;
		}			    
	}
}


//conta a quantidade de dicas pedidas
function countTips()
{ 
	tips = tips + 1;
	sessionStorage.setItem('tips', tips);
	console.log("O aluno solicitou " +tips+ " dicas."); 
}

//Salva dados sumarizados de cada fase no banco de dados
function saveStep()
{ 
	$.ajax({
	  type: "POST", 
	  url: "https://localhost:3000/salvarFase", 
	  data: { idmaquina: sessionStorage.getItem('idMaquina'), data: getDate(), nomeativ: nomeAtiv, fase: sessionStorage.getItem('fase'), dicas: sessionStorage.getItem('tips'), tentativas: sessionStorage.getItem('sends'), idhora: sessionStorage.getItem('idHora')},
	  success: function(res) {
	    console.log(res);
	  }
	});

	sessionStorage.setItem('fase',faseAtual);
	sessionStorage.setItem('sends', 0);
	sessionStorage.setItem('tips', 0);
	sends = 0;
	tips = 0;
}

//captura a qunatidade de envios, o código e envia para o banco de dados


//Observa as mudanças na div que contém as tips, caso o botão "sim" apareça o relaciona a uma variável
function observerTips( mutations ) {
  mutations.forEach(function(mutation) {
    		
	//Botão sim das tips não tem id, captura por comparação de código
	var btnYesTip = "<button data-radium=\"true\" style=\"color: white; min-width: 100px; background-color: rgb(255, 164, 0); border-color: rgb(255, 164, 0);\">Sim</button>";
	var doc = document.documentElement.innerHTML;

	//Se o document contem o botão "Sim"
	if (doc.indexOf(btnYesTip) >= 0){
		
		//captura manual
		allBtns = document.querySelectorAll("button");						
		tipBtn = allBtns[8];		

		//Evento de click no botão "Sim" das dicas. Incrementa a quantidade de dicas a cada solicitação
		tipBtn.addEventListener('click', countTips());			
	}
		
  });
}


//faz a aplicação dormir 
function sleep(milliseconds) {
  var start = new Date().getTime();
  for (var i = 0; i < 1e7; i++) {
    if ((new Date().getTime() - start) > milliseconds){
      break;
    }
  }
}

var finishButton = null;
var runButton = null;
var tips;
var sends;
var divTip = null; 
var configTip = null;
var obsTip = new MutationObserver( observerTips );
var nomeAtiv = "HoC: Star Wars";
var faseAtual;
var code;


//Temporizadores para tentar "sincronizar" o carregamento
sleep(2500);
	
$(document).ready(function() 
{	
	console.log("Document is ready.");
	sleep(500);

	//Captura da fase pela URL
	var url = window.location.href;
	var urlSplited = url.split("/");
	var fase = parseInt(urlSplited.length);
	faseAtual = parseInt(urlSplited[fase-1]);
	console.log("Fase atual:"+faseAtual);

	//Compara fase atual com a anterior; Se a fase atual é a proxima, salvar dados da fase anterior.
	if(sessionStorage.getItem('fase') == faseAtual-1 && faseAtual != 1)
	{
		saveStep();
	}
	//Se for a fase 1 apenas configura
	else if(faseAtual == 1)
	{
		sessionStorage.setItem('fase',faseAtual);
		sessionStorage.setItem('sends', 0);
		sessionStorage.setItem('tips', 0);
		sends =0;
		tips=0;

	}
	//Se for a ultima fase, salva quando clicar no botão de concluir
	else if (faseAtual == 15) 
	{
		sessionStorage.setItem('fase',faseAtual);
		sessionStorage.setItem('sends', 0);
		sessionStorage.setItem('tips', 0);
		sends =0;
		tips=0;

		finishButton = document.querySelector("#finishButton");
		finishButton.addEventListener('click', saveStep());
	}

	//configura botões
	runBtn = document.querySelector("#runButton");		
	divTip = document.querySelector( '[class="csf-top-instructions"]' );

	//Se os botoes estiverem null, dá refresh na página
	if(runBtn == null || divTip == null)
	{
		console.log("Falha na sincronização e carregamento dos elementos");		
		//quando vai de uma pag pra outra as vezes os elementos não ficam carregados
		//solução: refresh na página
		location.reload();			
	}
	else
	{
		console.log("Elementos configurados!");	
	}	
	
	//configura observação de mudanças no html - identificação da presença de dicas
	configTip = { childList: true };
	obsTip.observe( divTip, configTip );

	//Evento de contagem quantidade de envios, coleta o código data e hora de envio
	runBtn.addEventListener('click', function saveCode()
	{ 
		sends = sends + 1;	
		sessionStorage.setItem('sends', sends);

		console.log("O aluno submeteu o código " +sends+ " vezes."); 
		getCode();				
		
		$.ajax({
		  type: "POST", 
		  url: "https://localhost:3000/salvarCodigo", 
		  data: { idmaquina: sessionStorage.getItem('idMaquina'), data: getDate(), nomeativ: nomeAtiv, fase: faseAtual, versao: sends, codigo: code, hora: getTime() , idhora: sessionStorage.getItem('idHora')},
		  success: function(res) {
		    console.log(res);
		 }
		});
	});
	
	//Salvando identificação da máquina com sessionStorage - mantém durante a execução...
	if(sessionStorage.getItem('idMaquina') == null)
	{
		var idMaquina= prompt("Digite a identificação da máquina que você está usando: ");
		sessionStorage.setItem('idMaquina',idMaquina);
		sessionStorage.setItem('idHora', getTime());

		//envia para salvar no bd
		$.ajax({
		  type: "POST", 
		  url: "https://localhost:3000/salvarUsuario", 
		  data: { idmaquina: sessionStorage.getItem('idMaquina'), data: getDate(), hora: sessionStorage.getItem('idHora') },
		  success: function(res) {
		  	if (res == true)
		  	{		  		
		  		console.log(res);
		  	} 
		  	else
		  	{
		  		var msg = res;
		  		alert(msg);
		  		
		  	}
		  	
		  }
		});

		console.log("Aluno identificado!");
	}
});