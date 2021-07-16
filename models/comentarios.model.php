<?php
require_once('model.php');

class ComentariosModel extends Model 
{
  
     /**
     * @return array
     * Retorna todos los comentarios en la tabla comentarios
     */
    public function obtenerComentarios($id){
        $query = $this->getDb()->prepare('SELECT * FROM comentarios WHERE id_destino = ? ORDER BY id DESC');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    /**
     * @param $nombre, $comentario, $puntuacion, $destino
     * Agrega un comentario en base a lo pasado por parámetro
     */
    public function agregar($nombre, $comentario, $puntuacion, $destino){
        
        $query = $this->getDb()->prepare("INSERT INTO comentarios (nombre, comentario, puntuacion,
        id_destino) VALUES (?, ?, ?, ?)");
        $res = $query->execute([$nombre, $comentario, $puntuacion, $destino]);    
        return $res;
    }

    
    /**
     * @param $id
     * Elimina un comentario en base al id pasado por parámetro
     */
    public function eliminarComentario($id){
        $query = $this->getDb()->prepare('DELETE FROM comentarios WHERE id = ?');
        $res = $query->execute([$id]);
        return $res;
    }
}