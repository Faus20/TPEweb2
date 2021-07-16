<?php

require_once('models/paises.model.php');
require_once('views/view.destinos.paises.php');
include_once('helpers/auth.helper.php');

class PaisesController
{

    private $view;
    private $modelpaises;

    //En el constructor hago las conecciones al modelo y
    //a la vista para poder usarlas dentro de esta clase.
    public function __construct()
    {
        $this->modelpaises = new PaisesModel();
        $this->view = new DestinosPaisesView();
    }

    //funcion para mostrar el formulario de editar con la info precargada del pais que coincida
    //con el id pasado por parametro
    public function mostrarEditar( $error = null)
    {
        if (AuthHelper::obtenerUsuarixAdmin() == 2){

            $id = $_POST['pais'];
            
            $pais = $this->modelpaises->obtener($id);
            $this->view->mostrarEditarPais($pais, $error);
        } else {
            $this->view->mostrarError("Acceso denegado");
        }
        

    }

    //funcion para editar un pais,si esta vacio el nombre, vuelve a mostrar el formulario con un
    //mensaje de error
    public function editar()
    {
        if (AuthHelper::obtenerUsuarixAdmin() == 2){

            $id = $_POST['pais'];
            $nombre = $_POST['name'];
            
            if (!empty($_POST['name'])) {
                
                //busco en la tabla de paises alguno que coincida con el nombre puesto por el usuario.
                $paisDb =  $this->modelpaises->obtenerPais($nombre);
                //y si no se obtuvo un pais en la base de datos que coincida
                //con lo ingresado por el usuario ahi si lo agrego.
                if (empty($paisDb)) {
                    
                    $this->modelpaises->editar($id, $nombre);
                    header("Location: " . BASE_URL . 'home');
                } else
                $this->mostrarEditar($id, "Ya existe un pais con ese nombre");
            } else
            $this->mostrarEditar($id, "Error,nombre vacio");
        } else {
            $this->view->mostrarError("Acceso denegado");
        }
        }
        
    //funcion para mostrar el formulario para agregar un destino
    public function mostrarAgregar($error = null)
    {
        if (AuthHelper::obtenerUsuarixAdmin() == 2){

            $this->view->mostrarAgregarPais($error);
            
        } else {
            $this->view->mostrarError("Acceso denegado");
        }
    }

    //funcion para agregar un pais
    public function agregar()
    {
        if (AuthHelper::obtenerUsuarixAdmin() == 2){
            $nombre = $_POST['name'];
            
            //chequeo que no este vacio el nombre
            if (!empty($_POST['name'])) {
                
                //busco en la tabla de paises alguno que coincida con el nombre puesto por el usuario.
                $paisDb =  $this->modelpaises->obtenerPais($nombre);

                //y si no se obtuvo un pais en la base de datos que coincida
                //con lo ingresado por el usuario ahi si lo agrego.
                if (empty($paisDb)) {
                    $this->modelpaises->agregar($nombre);
                    header("Location: " . BASE_URL . 'home');
                } else  $this->mostrarAgregar("Ya existe un pais con ese nombre");
            } else  $this->mostrarAgregar("No es posible agregar paises vacios");
        } else {
            $this->view->mostrarError("Acceso denegado");
        }
    }
        
    //funcion para eliminar un pais de la base que coincida con el id 
    public function eliminar($id)
    {
        if (AuthHelper::obtenerUsuarixAdmin() == 2){

            if (!empty($_POST['pais'])) {
                $id = $_POST['pais'];
            }
            $this->modelpaises->eliminar($id);
            header("Location: " . BASE_URL . 'home');
        } else {
            $this->view->mostrarError("Acceso denegado");
        }
    }
}
