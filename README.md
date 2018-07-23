# Forma2-PHP

[![N|Solid](http://feliphegomez.info/images/logo.png)](https://feliphegomez.info)
# Forma2 - No somos nosotros, Eres TU! Developer by FelipheGomez
---
Forma2 es un sistema de gestión de contenidos (CMS) a medida con muchos aspectos positivos, incluyendo su facilidad de uso y extensibilidad, esto a hecho que Forma2 crezca desde su idea inical. Y lo mejor de todo es que Forma2! es una solución pensada especialmente para la empresa Emtelco CX & BPO; El proyecto contiene:
  - eCards
  - Articulos
  - Foro de preguntas
  - Calendario de Capacitaciones
  - Simuladores
  - Chat de Mensajeria
  - Indicadores (KPIs)
  - Cronometro
  - Notificaciones Fallas / Alertas
  - Quiz
  - Exportar Resultados de Quiz
  - Importar Personal de forma masiva
  - Importar KPIs de forma masiva
  - Contenido por categorias y grupos. 

## Usuarios de pruebas!
Los siguientes usuarios son de pruebas, en caso de requerir modificarlos o cambiar sus datos predeterminados se debe realizar por el importador de personal o en su defecto desde la BD.
  - ADMIN: admin.master
  - GUEST: forma2.master

## Rutas de Acceso:
  - [https://forma2.demedallo.com/forma2/][forma2_1] - recomendada
  - [https://id-0851.epmcc-pob.com/forma2/][forma2_2]
  - [https://id-0851/forma2/][forma2_3]
  - [https://10.5.118.16/forma2/][forma2_4]

Forma2 es un CMS y a su vez es una API Graph de uso ligero basado en la exigencia de la linea TigoUne de la compañía Emtelco CX & BPO. Está programado por [Andrés Felipe Gómez Maya] desarrollador full stack [Sitio de FelipheGomez][df1]

¡Ahora vamos a aprender un poco mas de sus **componentes**, **arquitectura** y el **uso basico** con sus primeros pasos para su correcta **instalacion**, **implementación** y **ejecucion**.

## Plugins
Forma2 utiliza una serie de proyectos de código abierto para funcionar correctamente, te mostraremos cuales son:

* [jQuery] - Biblioteca de JavaScript rápida, pequeña y rica en funciones.
* [BootStrap] - Biblioteca de componentes front-end más popular del mundo
* [Notifity.js] - Complemento para crear notificaciones internas la pagina.
* [Bootbox.js] - Complemento para lanzar modals.
* [excel-upload] - Biblioteca para manejar archivos ods y xls.
* [jQuery.Gantt] - Calendario utilizado en estilo TimeLine.
* [tinymce] - Editor de texto.
* [pinterest_grid] Estilo grafico para articulos.
* [fontawesome] Biblioteca de iconos (V 5.0).

Y, por supuesto, Forma2 es aplicable para cualquier tipo de desarrollo ya que tambien puedes acceder a la API por medio de HTTP con metodos POST y GET.

### Instalacion
Forma2 se desarrolló y se ejecutó de manera correcta en un entorno bajo las siguientes especificaciones de manera correcta.

```sh
  Apache/2.4.28 (Win32) OpenSSL/1.0.2l PHP/7.1.10
  Versión actual de PHP: 7.1.10
  mysql Ver 15.1 Distrib 10.1.28-MariaDB, for Win32 (AMD64)
```

Si tienes inconvenientes al momento instalar puedes contactar al desarrollador desde:

```sh
- Correo corporativo: afgomema@emtelco.com.co
- Correo altero: feliphegomez@demedallo.com
```

## Antes de...
Tienes que tener en cuenta que Forma2 se divide en dos Sub Sitios, El Sitio de los archivos de la API que lo mencionaremos de la misma forma "*API*" y el sitio web el cual nos servira de visor y de ejemplo para proximos desarrollos, lo nombraremos "Sitio".

## Estructura de las carpetas
 * api [Carpeta de la API]
    * plugins [Carpeta de los plugins]
        * bootbox
        * bootstrap
        * excel-upload
        * fontawesome
        * fonts [Carpeta para fuentes adicionales]
        * glyphicons [Carpeta para iconos Glyphicons]
        * jquery
        * jQuery.Gantt
        * malihu-custom-scrollbar-plugin
        * notify
        * particles.js [Plugin utilizado para el login (opcional)]
        * pinterest_grid
        * popper.js
        * tinymce
        * virtualsteps
    * sdk [Carpeta para versiones del SDK de la API]
    * v1.0 [Verion de la API y sus paginas]
        * _docs [Archivos para la API segun version - Imagenes,Iconos,Audios,Entre otros]
        * config [Carpeta para archivos de configuracion, definiciones y funciones]
 * config [Carpeta de ejecucion para el sitio]
    * docs [Carpeta para archiuvos del sitio]
        * site
            * errors [Carpeta para paginas de errores]
            * pages [Carpeta donde se almacenan las paginas del sitio]
                * templates [Plantillas para importacion]
                * widgets [Carpeta de complementos segundarios como notificaciones]
            * sliders [Carpeta para Slider o carrousel]
    * include [Carpeta para archivos de configuracion, definiciones y funciones]
    * init [Archivos globales como HEAD, FOOTER, SIDEBAR...]
 * css [Carpeta para las hojas de estilos]
 * images [Carpeta de imagenes]
 * js [Carpeta para funciones (lado del cliente)]

### Paginas de la API

La mayor parte de las pagina de la API requieren su ejecucion con un accesstoken, puedes conocer tu accesstoken desde la consola del navegador ingresando a Forma2 y ejecucado la funcion `` Forma2.AccessToken() ``.

| Pagina | ¿Que puedo hacer? |
| ------ | ------ |
| alerts | Listar todas las alertas, Listar alertas activas, Eliminar alertas, Crear alertas, Modificar alertas, Ver una alerta especifica, activar y desactivar alertas, historial de alertas. |
| calendary | Listar todo el calendario, Eliminar calenario, Crear caledario, Modificar calendario, Ver calendario especifico. |
| categories | Listar todas las categorias, Eliminar categorias, Crear categorias, Modificar categorias, Ver categoria especifica. |
| comments | Listar todos los comentarios o preguntas, Listar comentarios o preguntas pendientes por responder, Eliminar comentarios o preguntas, Crear comentarios o preguntas, Modificar comentarios o preguntas, Ver un comentario o pregunta especifica, contestar o modificar respuesta a comentarios o preguntas. |
| devices | Listar todos los dispositivos o manuales, Ver un dispositivo o manual especifico. |
| kpis | Ver indicadores de la session del accesstoken. |
| login | Crear accesstoken de forma manual, Refrescar sesion activa con accesstoken. |
| masive | Exportar personal que presenta quiz, Importar personal nuevo, actualizar personal. |
| messenger | Actualizar ultima actividad, listar amigos, chats conversaciones pendientes por leer, ultimas coversaciones, ultimos chats por conversacion, agregar persona a la coversacion, enviar chat a conversacion. |
| my | Modificar avatar segun accesstoken, ver mis indicadores, agregar un like. |
| pictures | Visualizar imagen por id, crear imagen nueva. |
| publicaciones | Eliminar publicaciones, crear publicaciones, ver publicaciones, Modificar publicaciones, Historial de publicaciones. |
| quiz | Eliminar preguntas, Crear pregunta, Crear Quiz en borrador, Modificar Quiz, Activar y Desactivar Quiz, Quiz Actual, Ver quiz especifico. |
| search | Buscar publicaciones, dispositivos o manuales, foro y proximamente mucho mas. |
---
[forma2_1]: <https://forma2.demedallo.com/forma2/>
[forma2_2]: <https://id-0851.epmcc-pob.com/forma2/>
[forma2_3]: <https://id-0851/forma2/>
[forma2_4]: <https://10.5.118.16/forma2/>

[jQuery]: <https://jquery.com/>
[BootStrap]: <http://getbootstrap.com/>
[Notifity.js]: <https://notifyjs.com/>
[Bootbox.js]: <http://bootboxjs.com/>
[excel-upload]: <https://github.com/PHPOffice/PHPExcel>
[jQuery.Gantt]: <http://taitems.github.io/jQuery.Gantt/>
[tinymce]: <https://www.tinymce.com/>
[pinterest_grid]: <https://github.com/ivmelo/jQuery-Pinterest-Grid>
[fontawesome]: <https://fontawesome.com>
