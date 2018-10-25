var Forma2 = {};

// Comenzar carga de la API
Forma2.init = function(o){
	if( 
		o.appName && o.appName != '' && o.appName != undefined 
		&& o.version && o.version != '' && o.version != undefined 
		&& o.site_url && o.site_url != '' && o.site_url != undefined 
		&& o.login_url && o.login_url != '' && o.login_url != undefined 
		&& o.api_url && o.api_url != '' && o.api_url != undefined 
		&& o.intervalAlerts && o.intervalAlerts != '' && o.intervalAlerts != undefined 
		&& o.timeRefresh && o.timeRefresh != '' && o.timeRefresh != undefined 
		&& o.timeRefreshChatPage && o.timeRefreshChatPage != '' && o.timeRefreshChatPage != undefined 
		&& o.timeNotificationsClose && o.timeNotificationsClose != '' && o.timeNotificationsClose != undefined 
	){
		console.log("Configurando Forma2");
		o.api_url_large = o.api_url+o.version;
		o.api_url_plugins = o.api_url+"plugins/";
		Forma2.options = o;
		
		console.log("Validando ventanas emergentes");
		Forma2.checkPopUps();
		Forma2.loadForma2();
	}else{
		console.log("Forma2 no iniciado.");
		if(o.appName == '' || o.appName == undefined){ console.log("Falta appName."); };
		if(o.version == '' || o.version == undefined){ console.log("Falta version."); };
		if(o.site_url == '' || o.site_url == undefined){ console.log("Falta site_url."); };
		if(o.login_url == '' || o.login_url == undefined){ console.log("Falta login_url."); };
		if(o.api_url == '' || o.api_url == undefined){ console.log("Falta api_url."); };
		if(o.intervalAlerts == '' || o.intervalAlerts == undefined){ console.log("Falta intervalAlerts."); };
		if(o.timeRefresh == '' || o.timeRefresh == undefined){ console.log("Falta timeRefresh."); };
		if(o.timeRefreshChatPage == '' || o.timeRefreshChatPage == undefined){ console.log("Falta timeRefreshChatPage."); };
		if(o.timeNotificationsClose == '' || o.timeNotificationsClose == undefined){ console.log("Falta timeNotificationsClose."); };
	};
};

// Refrescar sesion de chat // actualizar estado
function refreshChatuserActive(){
	Forma2.app("POST", "messenger", {"update_connection":"true"}, function(r){ if(r.error === false){ console.log("Session Actualizada."); } });
};	

Forma2.loadForma2 = function(){
	if(Forma2.loadSession() == false){
		console.log("No hay session o no se encontro");
	}else{
		console.log(Forma2.options.timeRefresh);
		refreshChatuserActive();
		CargarMensagesPageMessengerTIME = setInterval(function() { refreshChatuserActive(); }, Forma2.options.timeRefreshChatPage);
		
		 // REFRESH ALERTS
		var loadRefresh = setInterval(function(){
			cargarAlertasUserActive()
		},Forma2.options.timeRefresh);
		
		//LOOP PARA CARGAR MENSAJES NUEVOS / PENDIENTES POR LEER
		var refreshMessengerChat = setInterval(function() {
			loadChatsPending();
		}, Forma2.options.timeRefreshChatPage);
	}
};

function loadChatsPending(){
	console.log("Cargando loadChatsPending();");
	Forma2.app("POST", "messenger", 
	{
		"action":"pending"
	}, function(r){
		console.log(r);
		if(r.error === false){
			if(r.data.length > 0){
				crearNotificacion({
					theId:15413815,
					theTitle:"Mensajes Pendientes",
					theBody:"Tienes [ "+r.data.length+" ] Mensajes sin leer.",
					theType:"alert"
				});
				
				$total = 0;
				for (i = 0; i < r.data.length; i++) {
					$dataChat = crearItemChatNavBarTop(r.data[i]);
					$total++;
				};

			}else{
				console.log("no hay mensajes pendiente spor leer.")
			}
			
			/*
			$total = 0;
			for (i = 0; i < r.data.length; i++) {
				$dataChat = (r.data[i]);
				$total++;
			};
			
			
			if($('#more-messages').length<=0){
				$more = '';
				$more += '<li id="more-messages">';
					$more += '<div class="notification_bottom">';
						$more += '<a href="messenger.php?action=read_alls">Abrir Messenger</a>';
					$more += '</div>';
				$more += '</li>';
				$(".chats-pending-navbar").append($more);
			}*/
		}
	});
}

function cargarAlertasUserActive() {
	var f = new Date();
	if(!localStorage.getItem("forma2_alerts_times")){ localStorage.setItem("forma2_alerts_times", f); }else{ };
	var ult_not_alerts = new Date(localStorage.getItem("forma2_alerts_times"));
	
	var min_not = Forma2.options.intervalAlerts; // ULTIMA NOTIFICACION EN MINUTOS
	var ult_not_alerts_temp = ult_not_alerts.getMinutes()+min_not;
	var ult_not_alerts_temp2 = ult_not_alerts.getHours();
	var ult_not_alerts_temp3 = ult_not_alerts.getDay();
	if(ult_not_alerts_temp==60){ ult_not_alerts_temp=59; };
	
	if(f.getHours() > ult_not_alerts_temp2 || f.getDay() > ult_not_alerts_temp3){
		console.log("Cargando alerts");
		cargarCCC();
	}else if(f.getDay() < ult_not_alerts_temp3){
		console.log("Cargando alerts");
		cargarCCC();
	}else if(f.getMinutes() >= ult_not_alerts_temp && f.getHours() >= ult_not_alerts_temp2){
		console.log("Cargando alerts");
		cargarCCC();
	}else{
		console.log("No cargar alerts");
	}
};

function cargarCCC(){
	console.log("Cargando cargarCCC()");
	Forma2.app("POST", "alerts", 
	{
		"view":"list"
	}, function(r){
		if(r.error === false){
			if(r.data.length>0){
				data = r.data;
				for (i = 0; i < data.length; i++) {
					crearNotificacion({
						theId:data[i].id,
						theTitle:data[i].title,
						theBody:data[i].message,
						theType:"alert"
					});
				}
			}
			localStorage.setItem("forma2_alerts_times", new Date());
		}else{
		}
	});
};

/** FUNCIONES ADICIONALES **/
function crearNotificacion($data){
	
	if(!$data.theId){ $data.theId = 0; };
	if(!$data.theTitle){ $data.theTitle = 'Notificacion Forma2'; };
	if(!$data.theBody){ $data.theBody = 'Tienes una notification de Forma2.'; };
	if(!$data.theType){ $data.theType = 'alert'; };
	if(!$data.theIcon){ $data.theIcon = Forma2.options.api_url_large+"/_docs/icons/danger.png"; };
	
	if($data.theType == 'danger'){
		$data.theType = "error";
	}else if($data.theType == 'warning'){
		$data.theType = "warn";
	}else if($data.theType == 'alert'){
		$data.theType = "info";
	}else{
		$data.theType = "info";
	}
	
	function create_Not($data){
		var opciones = {
			icon: $data.theIcon,
			body: $data.theBody,
			tag: "not-"+$data.theId,
			sound: Forma2.options.api_url_large+"/_docs/audios/alert.mp3",
		}
		// Creamos la notificación
		var notification = new Notification($data.theTitle, opciones);
		notification.vibrate;

		notification.onshow = notification.ondisplay = function() {
			//console.log("Se acaba de mostrar la notificación");
			var audio = new Audio(Forma2.options.api_url_large+"/_docs/audios/alert.mp3");
			audio.play();
		}

		notification.onclose = function() {
			//console.log("¿Pero por qué la cierras?");
		}

		notification.onclick = function() {
			console.log("Has hecho click");
			
			event.preventDefault();			
			open (Forma2.options.site_url+'index.php?pageActive=notifications&view=single&id='+$data.theId, "Visor de Fallas Masivas","location=0,status=0,scrollbars=0,width=640,height=180");
			notification.close();
			var audio = new Audio(Forma2.options.api_url_large+"/_docs/audios/alert2.mp3");
			audio.play();
		}
		notification.onerror = function() {
			$.notify("Ha ocurrido un error mostrando la notificacion","error");
		}

		//notification.show();
		setTimeout(notification.close.bind(notification), Forma2.options.timeNotificationsClose);
	}
	
	
	// Let's check if the browser supports notifications
	if (!("Notification" in window)) {
		console.log("This browser does not support desktop notification");
		$.notify($data.theBody,$data.theType);
	} else if (Notification.permission === "granted") {
		create_Not($data)
	} else if (Notification.permission !== 'denied') {
		Notification.requestPermission(function (permission) {
			if (permission === "granted") {
				create_Not($data)
			}else{
				$.notify($data.theBody,$data.theType);
			}
		});
	}else{
		$.notify($data.theBody,$data.theType);
	}

};

/** CALLBACK DE LA API JQUERY **/
Forma2.callback = function(method,url,fields,callback){
	var xhr = new XMLHttpRequest();
	xhr.open(method, url, false);
	
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.onreadystatechange = function() {
		
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
			// Request finished. Do processing here.
			console.log(JSON.parse());
		}
	}
	xhr.send(JSON.stringify(fields)); 
	// xhr.send('string'); 
	// xhr.send(new Blob()); 
	// xhr.send(new Int8Array()); 
	// xhr.send({ form: 'data' }); 
	// xhr.send(document);

};

/** CALLBACK DE LA API BETA SIN JQUERY **/
Forma2.callback_jq = function(method,url,fields,callback){
	$.ajax({
		type: method,
		url: url,
		dataType: "json",
		data: ((fields)),
		success: function(data) { return callback(data); },
		error: function (xhr, ajaxOptions, thrownError) { return "Error: API_CALLBACK : "+xhr.responseText; }
	});
	
};

/** RETURN DE LA API CON ACCESSTOKEN **/
Forma2.api = function(method, url, fields, callback){
	return (Forma2.callback_jq(method,Forma2.options.api_url_large+'/'+url+'.php',fields,callback));
};

/** RETURN DE LA API **/
Forma2.app = function(method, url, fields, callback){
	fields.accesstoken = Forma2.AccessToken();
	return (Forma2.callback_jq(method,Forma2.options.api_url_large+'/'+url+'.php',fields,callback));
};

/** LOGIN DE LA API **/
Forma2.LogIn = function (callback){
	if(localStorage.session && localStorage.session){
		//x = Forma2.session;
		x = Forma2.loadSession();
		console.log(x);
		return callback(x);
	}else{
		bootbox.prompt({
			title: "Ingrese su Login de red.",
			buttons: {
				cancel: {
					label: '<i class="fa fa-times"></i> Cerrar',
					className: 'btn-sm btn-secundary'
				},
				confirm: {
					label: '<i class="fa fa-check"></i> Ingresar',
					className: 'btn-sm btn-primary'
				}
			},
			size: 'small',
			inputType: 'text',
			callback: function (username) {
				if(username != null && username != "" && username != " "){
					console.log(username);
					Forma2.api("POST", "login", 
					{
						"action":"login",
						"user":username
					}, function(r){
						
						
						$r = {};
						if(r.error === false){
							$r.status = 'connected'; // la persona inició sesión en Forma2.
							$r.authResponse = {}; // Se incluye si el estado es connected, y consta de los siguientes elementos:
							$r.authResponse.accessToken = r.session.accessToken; // Contiene un token de acceso para la persona que usa la aplicación.
							$r.authResponse.signedRequest = r.session.session; // Un parámetro que contiene información sobre la persona que usa la aplicación.
							$r.authResponse.userID = r.session.session.id; // Es el identificador de la persona que usa la aplicación.
							
							Forma2.saveSession($r);
						}else{
							$r.status = 'unknown'; //la persona no inició sesión en Forma2, de modo que no sabes si la inició en tu aplicación. O bien, se llamó a Forma2.LogOut() con anterioridad y no se pudo conectar con Forma2.
						};
						
						return callback($r);
					});
				}else{
					$.notify("Ingresa tus datos.","error");
					return callback("cancelled");
				}
			}
		});
	}
};

Forma2.sessionRefresh = function(callback) {
	Forma2.api("POST", "login", 
	{
		"action":"refresh",
		"accesstoken":Forma2.AccessToken()
	}, function(r){
		$r = {};
		if(r.error === false){
			$r.status = 'connected'; // la persona inició sesión en Forma2.
			$r.authResponse = {}; // Se incluye si el estado es connected, y consta de los siguientes elementos:
			$r.authResponse.accessToken = r.session.accessToken; // Contiene un token de acceso para la persona que usa la aplicación.
			$r.authResponse.signedRequest = r.session.session; // Un parámetro que contiene información sobre la persona que usa la aplicación.
			$r.authResponse.userID = r.session.session.id; // Es el identificador de la persona que usa la aplicación.
			
			Forma2.saveSession($r);
		}else{
			$r.status = 'unknown'; //la persona no inició sesión en Forma2, de modo que no sabes si la inició en tu aplicación. O bien, se llamó a Forma2.LogOut() con anterioridad y no se pudo conectar con Forma2.
		};
		
		return callback($r);
	});
};

/** GUARDAR SESSION DE LA API **/
Forma2.saveSession = function($r){
	localStorage.session = JSON.stringify($r);
	localStorage.accessToken = $r.authResponse.accessToken;
};

/** LOGOUT DE LA API **/
Forma2.LogOut = function (){
	localStorage.clear()
	setInterval(function(){ location.reload(); },1000);
};

/** CARGAR SESSION DE LA API **/
Forma2.loadSession = function(){
	if(localStorage.session){
		return JSON.parse(localStorage.session);
	}else{
		return false;
	}
};

/** VALIDAR ESTADO LA SESSION DE LA API **/
Forma2.getLoginStatus = function(callback){
	$r = 'not_connected';
	if(localStorage.session){
		$r = Forma2.loadSession();
	}
	return callback($r);
};

/** ACESSTOKEN DE LA SESSION ACTUAL DE LA API **/
Forma2.AccessToken = function (){
	if(localStorage.accessToken){
		return (localStorage.accessToken);
	}else{
		//$.notify("Sesion no encontrada.","error");
		return false;
	}
};

/** INFO BASICA DE LA SESSION ACTUAL DE LA API **/
Forma2.signedRequest = function (){
	x = Forma2.loadSession();
	if(x.authResponse.signedRequest){
		return (x.authResponse.signedRequest);
	}else{
		//$.notify("Sesion no encontrada.","error");
		return false;
	}
};

/** VALIDAR VENTANAS EMERGENTES **/
Forma2.checkPopUps = function(){
	if(Forma2.options.checkPopUpsChecked == 'false' || Forma2.options.checkPopUpsChecked == undefined){
		var windowName = 'userConsole';
		var popUp = window.open('index.php', windowName, 'width=1, height=1, left=0, top=0, scrollbars, resizable');
		if (popUp == null || typeof(popUp)=='undefined') {  
			console.log('Por favor deshabilita el bloqueador de ventanas emergentes.');
			$.notify('Por favor deshabilita el bloqueador de ventanas emergentes.');
			Forma2.options.checkPopUpsChecked = false;
		}else {  
			popUp.close();
			Forma2.options.checkPopUpsChecked = true;
		}
	};
};

/** VALIDAR SI EXITE AUTO INIT DE LA API **/
if(window.f2AsyncInit){
	console.log("Iniciando Forma2");
	window.f2AsyncInit();
}