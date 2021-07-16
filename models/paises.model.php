<?php

require_once('model.php');

class PaisesModel extends Model{

    /**
     * 
     * Retorna todos los paises almacenados en la tabla paises
     */
    public function obtenerTodos() {
        $query = $this->getDb()->prepare('SELECT * FROM paises ORDER BY nombre ASC');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    /**
     * @param $id
     * return array
     * Retorna toda la info de un pais que coincida con el id.
     */
    public function obtener($id) {
        $query = $this->getDb()->prepare('SELECT * FROM paises WHERE id = ?');
        $query->execute(array($id));

        return $query->fetch(PDO::FETCH_OBJ);
    }

     /**
     * @param $nombre $id
     * Edita un pais en base al nombre y el id pasado por parámetro
     */
    public function editar($id, $nombre){
        $query = $this->getDb()->prepare('UPDATE paises SET nombre = ? WHERE id = ?');
        $query->execute([$nombre, $id]);
    }

 /**
     * @param $nombre
     * Retorna toda la info de un pais si coincide con lo pasado por parametro.
     */
    public function obtenerPais($nombre)
    {
        $query = $this->getDb()->prepare('SELECT * FROM `paises` WHERE nombre = ?');
        $query->execute(array(($nombre)));
        return $query->fetch(PDO::FETCH_OBJ);
    }


    /**
     * @param $nombre
     * Agrega un pais en base al nombre pasado por parámetro
     */
    public function agregar($nombre){
        
        $query = $this->getDb()->prepare("INSERT INTO paises (nombre) VALUES (?)");
        $query->execute([$nombre]);    
    }

    /**
     * @param $id
     * Elimina un pais en base al id pasado por parámetro
     */
    public function eliminar($id){
        $query = $this->getDb()->prepare('DELETE FROM paises WHERE id = ?');
        $query->execute([$id]);
    }
}