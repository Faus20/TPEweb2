<?php

include_once('views/user.view.php');
include_once('models/user.model.php');
include_once('helpers/auth.helper.php');
include_once('views/view.destinos.paises.php');

class UserController {

    private $model;
    private $view;
    private $viewDestinoPais;

    public function __construct() {
        $this->model = new UserModel();
        $this->view = new UserView();
        $this->viewDestinoPais = new DestinosPaisesView();
    }

     //funcion para mostrar registro
     public function mostrarRegistrar() {
        $this->view->mostrarRegistrar();
    }

    //funcion para registrar usuarix
    public function registrar() {
        $user = $_POST['username'];
        $pass = $_POST['password'];
        
        if (!empty($user) && !empty($pass)) {
            $this->model->add($user, $pass);
            
            $userDb = $this->model->getUserByUsername($user);
            AuthHelper::login($userDb);
            header("Location: " . BASE_URL . 'home');
        } else {
            $this->view->mostrarRegistrar("User o Password incompleto");
        }
    }
    
    //funcion para mostrar login.
    public function mostrarIniciarSesion() {
        $this->view->mostrarIniciarSesion();
    }

    //funcion para verificar lo ingresado por el formulario login con lo que esta en la base de datos.
    public function verificar() {
        if (!empty($_POST['username']) && !empty($_POST['password'])) {
            $user = $_POST['username'];
            $pass = $_POST['password'];
            $userDb = $this->model->getUserByUsername($user);
            
           //si coincide inicio sesion
            if (!empty($userDb) && password_verify($pass, $userDb->password)) {
                AuthHelper::login($userDb);
                header("Location: " . BASE_URL . 'home');
            } else 
                $this->view->mostrarIniciarSesion("Login incorrecto, password o usuario incorrecto");
        } else {
            $this->view->mostrarIniciarSesion("Login incompleto");
        }
    }

    //funcion para mostrar lista de usuarixs
    public function mostrarListaUsuarixs(){
        if (AuthHelper::obtenerUsuarixAdmin() == 2){
            $usuarixs = $this->model->obtenerUsuarixs();
            $this->view->mostrarListaUsuarixs($usuarixs);
        }
        else {
            $this->viewDestinoPais->mostrarError("Acceso denegado");
        }
    }

     //elimino usuarix en base al id pasado por parametro
     public function eliminar($id){
        if (AuthHelper::obtenerUsuarixAdmin() == 2){
            $this->model->eliminar($id);
            header("Location: " . BASE_URL . 'listaUsuarixs');
            
        } else {
            $this->viewDestinoPais->mostrarError("Acceso denegado");
        }
    }

     //edito permisos de usuarix en base al id pasado por parametro
     public function editarPermisos($id){
        if (AuthHelper::obtenerUsuarixAdmin() == 2){
          $admin = $this->model->obtenerRol($id); 
            
          //si la variable admin devolvio true llamo a editarPermisos con un 1(normal),sino con un 2(admin)
            if ($admin) {
                $this->model->editarPermisos($id, 1);
            } else {
                $this->model->editarPermisos($id, 2);
            }
            header("Location: " . BASE_URL . 'listaUsuarixs');
        } else {
            $this->viewDestinoPais->mostrarError("Acceso denegado");
        }
    }

    //funcion para cerrar sesion.
    public function cerrarSesion() {
        AuthHelper::logout();
        header("Location: " . BASE_URL . 'formIniciarSesion');
    }
}