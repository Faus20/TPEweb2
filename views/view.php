<?php

require_once('libs/smarty/Smarty.class.php');

class View {

    private $smarty;

    public function __construct() {
        $this->smarty = new Smarty();
        $this->smarty->assign('url', BASE_URL);
        $authHelper = new AuthHelper();
        $username = $authHelper->obtenerNombreUsuarix();
        $admin = $authHelper->obtenerUsuarixAdmin();
        $this->getSmarty()->assign('username', $username);
        $this->getSmarty()->assign('admin', $admin);
    }    

    public function getSmarty() {
        return $this->smarty;        
    }
}