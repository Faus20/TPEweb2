<?php
require_once('libs/Router.php');
require_once('api/controller.api.php');

//crea el router
$router = new Router();

//tabla de ruteo
$router->addRoute('comentarios/:ID', 'GET', 'ComentariosApiController', 'obtenerComentarios');
$router->addRoute('comentario', 'POST', 'ComentariosApiController', 'agregarComentario');
$router->addRoute('comentario/:ID', 'DELETE', 'ComentariosApiController', 'eliminarComentario');

//rutea
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);

