<?php
require_once('models/comentarios.model.php');
require_once('view.api.php');
include_once('helpers/auth.helper.php');

class ComentariosApiController
{

    private $view;
    private $model;
    private $data;
   

    //En el constructor hago las conecciones al modelo y
    //a la vista para poder usarlas dentro de esta clase.
    public function __construct()
    {
        $this->model = new ComentariosModel();
        $this->view = new APIView();
        $this->data = file_get_contents("php://input");
    }


    private function getData()
    {
        return json_decode($this->data);
    }


    function obtenerComentarios($params = [])
    {
        $id = $params[':ID'];
        $comentarios = $this->model->obtenerComentarios($id);
        return $this->view->response($comentarios, 200);
    }

    function agregarComentario()
    {

        $datos = $this->getData();

        $nombre = $datos->nombre;
        $comentario = $datos->comentario;
        $puntuacion = $datos->puntaje;
        $destino = $datos->id_destino;

        $res = $this->model->agregar($nombre, $comentario, $puntuacion, $destino);
        if ($res) {
            return $this->view->response($res, 200);
        } else {
            return $this->view->response(null, 200);
        }
    }


    function eliminarComentario($params = [])
    {
        if (AuthHelper::obtenerUsuarixAdmin() == 2) {

            $id = $params[':ID'];

            $res = $this->model->eliminarComentario($id);
            if ($res) {
                return $this->view->response($res, 200);
            } else {
                return $this->view->response(null, 200);
            }
        } 
    }
}
