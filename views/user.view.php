<?php

require_once('view.php');

class UserView extends View {

    public function __construct() {
        parent::__construct();
    }

    //funcion para mostrar login, si hay algun error en el formulario(vacio, contraseña no coicide,etc)
    //se pasa por paramatro y se muestra.
    public function mostrarIniciarSesion($error=null) {
        $this->getSmarty()->assign('title', "Login");
        $this->getSmarty()->assign('error', $error);        
        $this->getSmarty()->display('templates/iniciar.sesion.tpl');
    }

    //funcion para mostrar register, si hay algun error en el formulario(vacio)
    //se pasa por paramatro y se muestra el error.
    public function mostrarRegistrar($error=null) {
        $this->getSmarty()->assign('title', "Registro");
        $this->getSmarty()->assign('error', $error);        
        $this->getSmarty()->display('templates/registrar.tpl');
    }

    //funcion para mostrar lista de usuarixs
    public function mostrarListaUsuarixs($usuarixs) {
        $this->getSmarty()->assign('title', "Usuarixs");
        $this->getSmarty()->assign('usuarixs', $usuarixs);        
        $this->getSmarty()->display('templates/lista.usuarixs.tpl');
    }
}