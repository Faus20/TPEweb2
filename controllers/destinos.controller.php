<?php
require_once('models/destinos.model.php');
require_once('views/view.php');
require_once('views/view.destinos.paises.php');
require_once('models/paises.model.php');
include_once('helpers/auth.helper.php');

class DestinosController
{

    private $modeldestinos;
    private $view;
    private $modelpaises;

    //En el constructor hago las conecciones a las 2 bases de datos y
    //a la vista para poder usarlas dentro de esta clase.
    public function __construct()
    {
        $this->modeldestinos = new DestinosModel();
        $this->modelpaises = new PaisesModel();
        $this->view = new DestinosPaisesView();
    }

    //funcion para mostrar pagina
    public function mostrarHome()
    {
        $paises = $this->modelpaises->obtenerTodos();
        $destinos = $this->modeldestinos->obtenerTodos();

        $this->view->destinos($paises, $destinos);
    }

    //obtengo todo la info de un destino en particular a partir de la id.
    public function mostrarDetalle($id)
    {
        $destino = $this->modeldestinos->obtener($id);
        $paises = $this->modelpaises->obtenerTodos();

        $this->view->detalle($destino, $paises);
    }

    //obtengo todos los destinos pertenecientes a un mismo pais y los muestro.
    public function mostrarDestinosPorPais()
    {
        $id = $_POST["pais"];

        $paises = $this->modelpaises->obtenerTodos();
        if ($id == "todos") {
            $destinos = $this->modeldestinos->obtenerTodos();
        } else {
            $destinos = $this->modeldestinos->obtenerTodosId($id);
        }

        $this->view->destinos($paises, $destinos);
    }

    //obtengo todos los destinos que coincidan con lo ingresado por usuarix
    public function mostrarDestinosPorNombre()
    {
        $nombre = $_POST["busqueda"];

        $paises = $this->modelpaises->obtenerTodos();
        $destinos = $this->modeldestinos->obtenerPorNombre($nombre);

        $this->view->destinos($paises, $destinos);
    }

    //Obtengo los destinos ordenas de una determinada forma dependiendo lo elegido por usuarix
    public function mostrarDestinosPorPrecio()
    {
        $precio = $_POST["precio"];

        $paises = $this->modelpaises->obtenerTodos();

        if ($precio == "menor") {
            $destinos =  $this->modeldestinos->obtenerPorPrecioMenor();
        } else {
            $destinos =  $this->modeldestinos->obtenerPorPrecioMayor();
        }

        $this->view->destinos($paises, $destinos);
    }

    //funcion para mostrar el formulario de editar con la info de la base de datos precargada
    public function mostrarEditar($id, $error = null)
    {
        if (AuthHelper::obtenerUsuarixAdmin() == 2) {
            $destino = $this->modeldestinos->obtener($id);

            $this->view->mostrarEditarDestinos($destino, $error);
        } else {
            $this->view->mostrarError("Acceso denegado");
        }
    }

    //funcion para editar un destino con lo ingresado en el formulario.
    public function editar()
    {
        if (AuthHelper::obtenerUsuarixAdmin() == 2) {

            $id = $_POST['destino'];
            $nombre = $_POST['name'];
            $detail = $_POST['detail'];
            $precio = $_POST['precio'];
            $dias = $_POST['dias'];

            if (!empty($nombre) && !empty($detail) && !empty($precio) && !empty($dias)) {
                if (($_FILES['imagen']['type'] == "image/jpg" ||
                    $_FILES['imagen']['type'] == "image/jpeg" ||
                    $_FILES['imagen']['type'] == "image/png")) {
                    $this->modeldestinos->editar($id, $nombre, $detail, $precio, $dias, $_FILES['imagen']['type']);
                } else {
                    $this->modeldestinos->editarSinImagen($id, $nombre, $detail, $precio, $dias);
                }
                header("Location: " . BASE_URL . 'home');
            } else
                $this->mostrarEditar($id, "Error, campos vacios");
        } else {
            $this->view->mostrarError("Acceso denegado");
        }
    }

    //funcion para mostrar el formulario para agregar un destino
    public function mostrarAgregar($error = null)
    {
        $paises = $this->modelpaises->obtenerTodos();

        $this->view->mostrarAgregar($paises, $error);
    }

    //funcion para agregar un destino con toda la info que esta en el form de admin.
    public function agregar()
    {
        if (AuthHelper::obtenerUsuarixAdmin() == 2) {
            $pais = $_POST['pais'];
            $nombre = $_POST['name'];
            $detail = $_POST['detail'];
            $precio = $_POST['precio'];
            $dias = $_POST['dias'];

            //chequeo que ningun imput este vacio y despues si lo agrego
            if (!empty($nombre) && !empty($detail) && !empty($precio) && !empty($dias)) {

                if (($_FILES['imagen']['type'] == "image/jpg" ||
                    $_FILES['imagen']['type'] == "image/jpeg" ||
                    $_FILES['imagen']['type'] == "image/png")) {
                    $this->modeldestinos->agregar($pais, $nombre, $detail, $precio, $dias, $_FILES['imagen']['type']);
                } else {
                    $this->modeldestinos->agregar($pais, $nombre, $detail, $precio, $dias);
                }
                header("Location: " . BASE_URL . 'home');
            } else  $this->mostrarAgregar("Error, campos vacios");
        } else {
            $this->view->mostrarError("Acceso denegado");
        }
    }

    //funcion para eliminar un destino que coincida con el id pasado por parametro 
    public function eliminar($id)
    {
        if (AuthHelper::obtenerUsuarixAdmin() == 2) {

            $this->modeldestinos->eliminar($id);
            header("Location: " . BASE_URL . 'home');
        } else {
            $this->view->mostrarError("Acceso denegado");
        }
    }

    //funcion para eliminar una portada que coincida con el id pasado por parametro 
    public function eliminarPortada($id)
    {
        if (AuthHelper::obtenerUsuarixAdmin() == 2) {

            $this->modeldestinos->eliminarPortada($id);
            header("Location: " . BASE_URL . 'home');
        } else {
            $this->view->mostrarError("Acceso denegado");
        }
    }

    //Funcion para mostrar errores generales
    public function mostrarError($msg)
    {
        $this->view->mostrarError($msg);
    }
}
