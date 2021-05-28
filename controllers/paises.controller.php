<?php

require_once('models/paises.model.php');
require_once('views/view.destinos.paises.php');

class PaisesController {

    private $view;
    private $modelpaises;

    //En el constructor hago las conecciones al modelo y
    //a la vista para poder usarlas dentro de esta clase.
    public function __construct(){
        $this->modelpaises = new PaisesModel();
        $this->view = new DestinosPaisesView();
    }

    //funcion para mostrar el formulario de editar con la info precargada del pais que coincida
    //con el id pasado por parametro (cuando aprieto el boton en la lista de paises)
    public function ShowEditar($id, $error=null){
        
        if (!empty($_POST['pais'])) {
            $id = $_POST['pais'];  
        } 
        $pais= $this->modelpaises->get($id);
        
        $this->view->ShowEditPais($pais, $error);
    }

    //funcion para editar un pais,si esta vacio el nombre, vuelve a mostrar el formulario con un
    //mensaje de error
    public function editar(){
        
        $id = $_POST['pais'];
        $nombre = $_POST['name'];

        if(!empty($_POST['name'])) {
            $this->modelpaises->edit($id, $nombre);
            header("Location: " . BASE_URL . 'destinos');
         } else
            $this->ShowEditar($id, "Error, nombre vacio");
    }

    //funcion para agregar un pais
    public function agregar(){
        $nombre = $_POST['name'];

        //chequeo que no este vacio y ahi si lo agrego
        if (!empty($_POST['name'])) {
            $this->modelpaises->agregar($nombre);
            header("Location: " . BASE_URL . 'destinos');
        } else  $this->view->showError("No es posible agregar paises vacios");
    }

    //funcion para eliminar un pais de la base que coincida con el id 
    public function eliminar($id){
        if (!empty($_POST['pais'])) {
            $id = $_POST['pais'];  
        } 
        $this->modelpaises->eliminar($id);
        header("Location: " . BASE_URL . 'destinos');
    }
}
