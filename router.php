<?php
require_once('controllers/destinos.controller.php');
require_once('controllers/paises.controller.php');
require_once('controllers/user.controller.php');

if ($_GET['action'] == '') {
    $_GET['action'] = 'home';
}

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

$param = explode('/', $_GET['action']); //con el explode parseo la url. EJ: sumar/5/4 params[0]=sumar, params[1]=5



switch ($param[0]) {
    case 'home':
        $DestinosController = new DestinosController();
        $DestinosController->mostrarHome();
        break;
    case 'detalle':
        $DestinosController = new DestinosController();
        $DestinosController->mostrarDetalle($param[1]);
        break;
    case 'filtrarPais':
        $DestinosController = new DestinosController();
        $DestinosController->mostrarDestinosPorPais();
        break;
    case 'filtrarNombre':
        $DestinosController = new DestinosController();
        $DestinosController->mostrarDestinosPorNombre();
        break;
    case 'filtrarPrecio':
        $DestinosController = new DestinosController();
        $DestinosController->mostrarDestinosPorPrecio();
        break;
    case 'formEditarPais':
        $PaisesController = new PaisesController();
        $PaisesController->mostrarEditar();
        break;
    case 'editarPais':
        $PaisesController = new PaisesController();
        $PaisesController->editar();
        break;
    case 'eliminarPais':
        $PaisesController = new PaisesController();
        $PaisesController->eliminar($param[1]);
        break;
    case 'formAgregarPais':
        $PaisesController = new PaisesController();
        $PaisesController->mostrarAgregar();
        break;
    case 'agregarPais':
        $PaisesController = new PaisesController();
        $PaisesController->agregar();
        break;
    case 'formEditarDestino':
        $DestinosController = new DestinosController();
        $DestinosController->mostrarEditar($param[1]);
        break;
    case 'editarDestino':
        $DestinosController = new DestinosController();
        $DestinosController->editar();
        break;
    case 'formAgregarDestino':
        $DestinosController = new DestinosController();
        $DestinosController->mostrarAgregar();
        break;
    case 'agregarDestino':
        $DestinosController = new DestinosController();
        $DestinosController->agregar();
        break;
    case 'eliminarDestino':
        $DestinosController = new DestinosController();
        $DestinosController->eliminar($param[1]);
        break;
    case 'eliminarPortada':
        $DestinosController = new DestinosController();
        $DestinosController->eliminarPortada($param[1]);
        break;
    case 'formRegistro':
        $UserController = new UserController();
        $UserController->mostrarRegistrar();
        break;
    case 'listaUsuarixs':
        $UserController = new UserController();
        $UserController->mostrarListaUsuarixs();
        break;
    case 'registrar':
        $UserController = new UserController();
        $UserController->registrar();
        break;
    case 'formIniciarSesion':
        $UserController = new UserController();
        $UserController->mostrarIniciarSesion();
        break;
    case 'verificar':
        $UserController = new UserController();
        $UserController->verificar();
        break;
    case 'eliminarUsuarix':
        $UserController = new UserController();
        $UserController->eliminar($param[1]);
        break;
    case 'editarPermisos':
        $UserController = new UserController();
        $UserController->editarPermisos($param[1]);
        break;

    case 'cerrarSesion':
        $UserController = new UserController();
        $UserController->cerrarSesion();
        break;
    default:
        $DestinosController = new DestinosController();
        $DestinosController->mostrarError("Pagina no encontrada");
}
