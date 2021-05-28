<?php
require_once('models/destinos.model.php');
require_once('views/view.php');
require_once('views/view.destinos.paises.php');
require_once('models/paises.model.php');

class DestinosController {

    private $modeldestinos;
    private $view;
    private $modelpaises;

    //En el constructor hago las conecciones a las 2 bases de datos y
    //a la vista para poder usarlas dentro de esta clase.
    public function __construct(){
        $this->modeldestinos = new DestinosModel();
        $this->modelpaises = new PaisesModel();
        $this->view = new DestinosPaisesView();
    }

    //funcion para mostrar home
    public function showHome(){
        $this->view->home();
        
    }
    
    //obtengo todos los paises y los destinos de la base de datos y
    //se los mando a la vista para mostrarlos.
    public function showAllDestinos(){
        $paises = $this->modelpaises->getAll();
        $destinos = $this->modeldestinos->getAll();

        $this->view->destinos($paises, $destinos);
    }

    //obtengo todo la info de un destino en particular a partir de la id.
    public function showDetail($id){
        $destino = $this->modeldestinos->get($id);
        $paises = $this->modelpaises->getAll();
        
        $this->view->detalle($destino, $paises);
    }

    //obtengo todos los destinos pertenecientes a un mismo pais y los muestro.
    public function showDestinos($id){
        $paises = $this->modelpaises->getAll();
        $destinos = $this->modeldestinos->getbyID($id);

        $this->view->destinos($paises, $destinos);
    }

    //funcion para mostrar pagina de admin
    public function showAdmin(){
        $paises = $this->modelpaises->getAll();
        $destinos = $this->modeldestinos->getAll();

        $this->view->admin($paises, $destinos);
    }

   //funcion para mostrar el formulario de editar con la info de la base de datos precargada
   //con el id pasado por parametro (cuando aprieto el boton de la tarjeta)
   public function ShowEditar($id, $error=null){
   
    if (!empty($_POST['destino'])) {
        $id = $_POST['destino'];
    } 

    $destino = $this->modeldestinos->get($id);
    
    $this->view->ShowEditDestinos($destino, $error);
    }

    //funcion para editar un destino,si esta vacio el nombre, vuelve a mostrar el formulario con un
    //mensaje de error
    public function editar(){
        $id = $_POST['destino'];
        $nombre = $_POST['name'];
        $detail = $_POST['detail'];
        $precio = $_POST['precio'];
        $dias = $_POST['dias'];

 
        if(!empty($nombre) && !empty($detail) && !empty($precio) && !empty($dias)) {
            $this->modeldestinos->edit($id, $nombre, $detail, $precio, $dias);
           
            header("Location: " . BASE_URL . 'destinos');
        } else
            $this->ShowEditar($id, "Error, campos vacios");
    }

    //funcion para agregar un destino con toda la info que esta en el form de admin.
    public function agregar(){
        $pais = $_POST['pais'];
        $nombre = $_POST['name'];
        $detail = $_POST['detail'];
        $precio = $_POST['precio'];
        $dias = $_POST['dias'];

        //chequeo que ningun imput este vacio y despues si lo agrego
        if(!empty($nombre) && !empty($detail) && !empty($precio) && !empty($dias)){
            $this->modeldestinos->agregar($pais, $nombre, $detail, $precio, $dias);
            header("Location: " . BASE_URL . 'destinos');
        } else  $this->view->showError("No es posible agregar elementos vacios");
    }

    //funcion para eliminar un destino que coincida con el id pasado por parametro 
    //(cuando aprieto el boton que esta en cada tarjeta)
    public function eliminar($id){

        //si lo quiero eliminar desde la pagina de admin, el id se toma desde ahi.
        if (!empty($_POST['destino'])) {
            $id = $_POST['destino'];
        } 

        $this->modeldestinos->eliminar($id);
        header("Location: " . BASE_URL . 'destinos');
    }

    //Funcion para mostrar errores generales
    public function showError($msg){
        $this->view->showError($msg);
    }
}
