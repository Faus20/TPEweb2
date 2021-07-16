<?php

require_once('view.php');
include_once('helpers/auth.helper.php');

class DestinosPaisesView extends View{

    public function __construct() {
        parent::__construct();
    }

    //funcion para mostrar la pagina de destinos
    public function destinos($paises, $destinos){
        
        $this->getSmarty()->assign('title','Home');
        $this->getSmarty()->assign('paises', $paises);
        $this->getSmarty()->assign('destinos', $destinos);
        //llamo al template a mostrar al usuarix.
        $this->getSmarty()->display('templates/destinos.tpl');
    }
    
    //funcion para mostrar el detalle de un destino en particular
    public function detalle($destino, $paises){
        
        
        $this->getSmarty()->assign('title','Detalle');
        $this->getSmarty()->assign('destino', $destino);    
        $this->getSmarty()->assign('paises', $paises);
        
        $this->getSmarty()->display('templates/detalle.tpl');
    }

    //funcion para mostrar la pagina de admin
    public function mostrarAgregar($paises, $error=null){
        
        $this->getSmarty()->assign('title','Admin');
        $this->getSmarty()->assign('paises', $paises);
        $this->getSmarty()->assign('error', $error);
        
        $this->getSmarty()->display('templates/agregar.destino.tpl');
    }

     //funcion para mostrar la pagina de admin
     public function mostrarAgregarPais($error=null){
        
        $this->getSmarty()->assign('title','Admin');
        $this->getSmarty()->assign('error', $error);
        
        $this->getSmarty()->display('templates/agregar.pais.tpl');
    }

    //funcion para mostrar la pagina de editar pais
    public function mostrarEditarPais($pais, $error=null){
     
        $this->getSmarty()->assign('title','Edit');
        $this->getSmarty()->assign('pais', $pais);
        $this->getSmarty()->assign('error', $error);

        $this->getSmarty()->display('templates/form.editar.pais.tpl');
    }

    //funcion para mostrar la pagina de editar destino
    public function mostrarEditarDestinos($destino, $error=null){
      
        $this->getSmarty()->assign('title','Edit');
        $this->getSmarty()->assign('destino', $destino);
        $this->getSmarty()->assign('error', $error);

        $this->getSmarty()->display('templates/form.editar.destino.tpl');
    }

    //creo una funcion general para mostrar errores, y recibo un mensaje por parametro
    //para poder utilizarla muchas veces en diferentes casos.
    public function mostrarError($error){
        $this->getSmarty()->assign('title','Error');
        $this->getSmarty()->assign('subtitle', $error);
      
        $this->getSmarty()->display('templates/mostrar.error.tpl');
    }


}