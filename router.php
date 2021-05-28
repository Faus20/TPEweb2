<?php
require_once('controllers/destinos.controller.php');
require_once('controllers/paises.controller.php');
require_once('controllers/user.controller.php');

if ($_GET['action'] == '') {
    $_GET['action'] = 'home';
}

define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');

$param = explode('/', $_GET['action']); //con el explode parseo la url. EJ: sumar/5/4 params[0]=sumar, params[1]=5



switch ($param[0]) {
    case 'home':
       $DestinosController = new DestinosController();
       $DestinosController -> showHome();
       break;
    case 'destinos':
        $DestinosController = new DestinosController();
        $DestinosController -> showAllDestinos();
        break;
    case 'detalle':
        $DestinosController = new DestinosController();
        $DestinosController -> showDetail($param[1]);
        break;
    case 'pais':
        $DestinosController = new DestinosController();
        $DestinosController -> showDestinos($param[1]);
        break;
    case 'admin':
        $DestinosController = new DestinosController();
        $DestinosController -> showAdmin();
        break;
    case 'formEditarPais':
        $PaisesController = new PaisesController();
        $PaisesController -> ShowEditar($param[1]);
        break;
    case 'editarPais':
        $PaisesController = new PaisesController();
        $PaisesController -> editar();
        break;    
    case 'eliminarPais':
        $PaisesController = new PaisesController();
        $PaisesController -> eliminar($param[1]);
        break;
    case 'agregarPais':
        $PaisesController = new PaisesController();
        $PaisesController -> agregar();
        break;
    case 'formEditarDestino':
        $DestinosController = new DestinosController();
        $DestinosController -> ShowEditar($param[1]);
        break;
    case 'editarDestino':
        $DestinosController = new DestinosController();
        $DestinosController -> editar();
        break;
    case 'agregarDestino':
        $DestinosController = new DestinosController();
        $DestinosController -> agregar();
        break;
    case 'eliminarDestino':
        $DestinosController = new DestinosController();
        $DestinosController -> eliminar($param[1]);
        break;
    case 'formRegistro':
        $UserController = new UserController();
        $UserController -> showRegister();
        break;  
    case 'registrar':
        $UserController = new UserController();
        $UserController -> registrar();
		break;
    case 'login':
        $UserController = new UserController();
        $UserController -> showLogin();
        break;    
    case 'verificar':
        $UserController = new UserController();
        $UserController -> verificar();
        break;  
    case 'logout':
        $UserController = new UserController();
        $UserController -> logout();
        break;   
    default:
        $DestinosController = new DestinosController();
        $DestinosController -> showError("Pagina no encontrada");
}