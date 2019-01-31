<?php
error_reporting(-1);
ini_set('display_errors', 'on');

setlocale(LC_TIME,"es_CO"); // Configurar Hora para Colombia
setlocale(LC_TIME, 'es_CO.UTF-8'); // Configurar Hora para Colombia en UTF-8
date_default_timezone_set('America/Bogota'); // Configurar Zona Horaria

define('site_name', 'FormaT - No somos nosotros, Eres TU!'); // Titulo X defecto de la aplicacion
define('site_name_md', 'FormaT'); // Titulo X defecto small

define('connect', 'https'); // Tipo de conexión (HTTP | HTTPS)
define('ssl_enable', true); // SSL Habilitado o no. (False | True)
define('server_default', 'forma2.ltsolucion.com'); // Nombre del servidor Predeterminado (IP | nameserver)
define('folderSitio', ''); // Ruta de la carpeta del Sitio
define('folderAPI', '/api'); // Ruta de la carpeta de la API

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