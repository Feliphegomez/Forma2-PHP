<?php
error_reporting(-1);
ini_set('display_errors', 'on');

setlocale(LC_TIME,"es_CO"); // Configurar Hora para Colombia
setlocale(LC_TIME, 'es_CO.UTF-8'); // Configurar Hora para Colombia en UTF-8
date_default_timezone_set('America/Bogota'); // Configurar Zona Horaria

define('site_name', 'FormaT - No somos nosotros, Eres TU!'); // Titulo X defecto de la aplicacion
define('site_name_md', 'FormaT'); // Titulo X defecto small
define('site_name_sm', 'FT'); // Titulo X defecto medium
define('v_api', 'v1.0'); // Version actual de la API
define('F5_enable', true); // Activar F5

define('connect', 'https'); // Tipo de conexión (HTTP | HTTPS)
define('ssl_enable', true); // SSL Habilitado o no. (False | True)
define('server_default', 'forma2.ltsolucion.com'); // Nombre del servidor Predeterminado (IP | nameserver)
define('folderSitio', ''); // Ruta de la carpeta del Sitio
define('folderAPI', '/api/'.v_api); // Ruta de la carpeta de la API

define('DB_SERVER', 'localhost'); // DB Host url
define('DB_USER', 'feliphegomez_f2'); // DB Usuario de Acceso
define('DB_PASS', 'lnQ40Me6oN'); // DB Contraseña de Acceso
define('DB_NAME', 'feliphegomez_f2'); // DB Nombre de la Base de Datos




############### ---- DEFINIR TABLAS ---- ###############
define('TBL_PERSONAL', 'forma2_people'); // tabla de personal
define('TBL_USERS_ACTIVES', 'forma2_users_actives'); // tabla de usuarios activos
define('TBL_CARGOS', 'forma2_people_cargos'); // tabla de cargos para el personal
define('TBL_JEFES_PERSONAL', 'forma2_people_boss'); // tabla de jefes de personal
define('TBL_PILOTOS', 'forma2_people_pilotos'); // tabla de jefes de pilotos
define('TBL_STATUS_PEOPLE', 'forma2_people_status'); // tabla de estados del personal
define('TBL_ROLES', 'forma2_people_rols'); // tabla de roles del personal
define('TBL_CONTENIDO', 'forma2_publishs'); // tabla de contenido para articulos y las eCards
define('TBL_CATEGORIES', 'forma2_categories'); // tabla de categorias de contenido
define('TBL_VIEWS_AND_LIKES', 'forma2_statistics_publishs'); // tabla de estadisticas de contenido
define('TBL_COMENTARIOS', 'forma2_comments'); // tabla de comentarios y preguntas de contenido y foro

define('TBL_DV_PLATAFORMAS', 'forma2_devices_plataformas'); // tabla de plataformas de simuladores dispositivos
define('TBL_DV_MARCAS', 'forma2_devices_manufacturer'); // tabla de marcas de simuladores dispositivos
define('TBL_DV_VIRTUALSTEPS', 'forma2_devices_virtualsteps'); // tabla de las tutoriales de dispositivos
define('TBL_DV_DISPOSITIVOS', 'forma2_devices_devices'); // tabla de los Dispositivos
define('TBL_DV_TOPICS', 'forma2_devices_topics'); // tabla de los temas de los forma2_devices_topics

define('TBL_MSG_TALKS', 'forma2_messenger_talks'); // tabla de coversaciones del chat messenger
define('TBL_MSG_CHATS', 'forma2_messenger_chats'); // tabla de chats del chat messenger

define('TBL_INDICADORES', 'forma2_indicators'); // tabla de los KPI del personal
define('TBL_ALERTS', 'forma2_alerts'); // tabla de las alertas por pilotos
define('TBL_IMAGENES_GLOBAL', 'forma2_pictures'); // tabla de las imagenes

define('TBL_F5_TEMAS', 'forma2_f5_topics'); // tabla de temas del F5
define('TBL_F5_RESPUESTAS', 'forma2_f5_response'); // tabla de respuestas del F5
define('TBL_F5_PREGUNTAS', 'forma2_f5_questions'); // tabla de preguntas del F5

define('TBL_CALENDARIO', 'forma2_calendary'); // tabla de calendario de capacitaciones

define('TBL_UPLOADS_TEMP', 'forma2_temp_uploads'); // tabla de calendario de capacitaciones

// Palabras en la lista negra -> serialize para +7PHP
define('lista_negra_palabras', serialize(array(
	'puto'
	,'maricon'
	,'marica'
	,'marik'
	,'puta'
	,'gorsovia'
	,'garsovia'
	,'garsofia'
	,'malparido'
	,'gonorrea'
	,'care verga'
	,'CARE CULO'
	,'PICHURRIA'
	,'GASOFIA'
	,'HIJUEPUTI'
	,'MARIQUIS'
	,'percanta'
	,'ZUNGA'
	,'PIROBO'
	,'GUEBA'
	,'GUEBON'
	,'chunchurria'
	,'gurrupleta'
	,'petatera'
	,'maturranga'
	,'perendusca'
))); // Palabras en la lista negra



############### ---- NO TOCAR PARA NADA ---- ###############
if(!isset($_SERVER['REQUEST_SCHEME'])) { $_SERVER['REQUEST_SCHEME']=connect; }; // Detectar si existe REQUEST_SCHEME
if(!isset($_SERVER['SERVER_NAME'])) { $_SERVER['SERVER_NAME']=server_default; }; // Detectar si existe SERVER_NAME
#if($_SERVER['REQUEST_SCHEME'] == 'http' || ssl_enable == true){ $_SERVER['REQUEST_SCHEME'] = 'https'; }; // Detectar si el sitio es ssl por defecto

// Detectar si el sitio es ssl por defecto
//Si no se encuentra el HTTPS "encendido"
if(!isset($_SERVER["HTTPS"]) || $_SERVER["HTTPS"] != "on")
{
    //Indique al navegador que redirija a la URL HTTPS.
    header("Location: https://" . $_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"]);
    //Evita que se ejecute el resto de la secuencia de comandos.
    exit("Espere un momento...");
};

define("SERVER_NAME", $_SERVER['SERVER_NAME']); // Definir nombre del servidor
define("SERVER_HOST", $_SERVER['REQUEST_SCHEME'].'://'.$_SERVER['SERVER_NAME']); // Definir nombre del servidor con host -> ORGANIZAR -> $_SERVER['REQUEST_SCHEME'].
define('url_api', SERVER_HOST.folderAPI); // Definir url de la API
define('url_site', SERVER_HOST.folderSitio); // Definir url del aplicativo/sitio

define('site_author_name', 'FelipheGomez'); // Nombre del desarrollador del Sitio
define('site_author_url', 'wWw.FelipheGomez.Info'); // URL del creador del Sitio

session_set_cookie_params(0, url_site);
session_start(['cookie_lifetime' => 86400,'read_and_close'  => false,]); // 86400 -> 1 Dia /// Tiempo de expiracion de la sesion en el servidor // Lectura y Cierre de la sessio e servidor 
header('Access-Control-Allow-Origin: *'); // Control de acceso Permitir origen de: