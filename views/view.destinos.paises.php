<?php

require_once('view.php');
include_once('helpers/auth.helper.php');

class DestinosPaisesView extends View{

    public function __construct() {
        parent::__construct();
        $authHelper = new AuthHelper();
        $username = $authHelper->getLoggedUserName();
        $this->getSmarty()->assign('username', $username);
        
    }

    //Funcion para mostrar el home
    public function home(){  
        $this->getSmarty()->assign('title','Home');
        
        //llamo al template a mostrar al usuarix.
        $this->getSmarty()->display('templates/home.tpl');
    }

    //funcion para mostrar la pagina de destinos
    public function destinos($paises, $destinos){
        
        $this->getSmarty()->assign('title','Destinos');
        $this->getSmarty()->assign('paises', $paises);
        $this->getSmarty()->assign('destinos', $destinos);

        //llamo al template a mostrar al usuarix.
        $this->getSmarty()->display('templates/destinos.tpl');
    }
    
    //funcion para mostrar el detalle de un destino en particular
    public function detalle($destino, $paises){
        
        $this->getSmarty()->assign('title','Detalle');
        $this->getSmarty()->assign('paises', $paises);
        $this->getSmarty()->assign('destino', $destino);    
        
        $this->getSmarty()->display('templates/detalle.tpl');
    }

    //funcion para mostrar la pagina de admin
    public function admin($paises, $destino){
        
        $this->getSmarty()->assign('title','Admin');
        $this->getSmarty()->assign('paises', $paises);
        $this->getSmarty()->assign('destinos', $destino);
        $this->getSmarty()->display('templates/admin.tpl');
    }

    //funcion para mostrar la pagina de editar pais
    public function ShowEditPais($pais, $error=null){
     
        $this->getSmarty()->assign('title','Edit');
        $this->getSmarty()->assign('pais', $pais);
        $this->getSmarty()->assign('error', $error);

        $this->getSmarty()->display('templates/form.editar.pais.tpl');
    }

    //funcion para mostrar la pagina de editar destino
    public function ShowEditDestinos($destino, $error=null){
      
        $this->getSmarty()->assign('title','Edit');
        $this->getSmarty()->assign('destino', $destino);
        $this->getSmarty()->assign('error', $error);

        $this->getSmarty()->display('templates/form.editar.destino.tpl');
    }

    //creo una funcion general para mostrar errores, y recibo un mensaje por parametro
    //para poder utilizarla muchas veces en diferentes casos.
    public function showError($error){
        $this->getSmarty()->assign('error', "Error");
        $this->getSmarty()->assign('subtitle', $error);
      
        $this->getSmarty()->display('templates/showError.tpl');
    }


}