<?php
require_once('model.php');

//Las clases siempre empiezan con mayusculas
class DestinosModel extends Model{

    /**
     * @return array
     * Retorna todos los destinos almacenados en la tabla destinos
     */
    public function getAll() {
        $query = $this->getDb()->prepare('SELECT * FROM destinos ORDER BY id DESC');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    /**
     * @param $id
     * @return array
     * Retorna toda la info de un destino que coincida con el id.
     */
    public function get($id) {
        $query = $this->getDb()->prepare('SELECT * FROM destinos WHERE id = ?');
        $query->execute(array($id));

        return $query->fetch(PDO::FETCH_OBJ);
    }

     /**
     * @param $id
     * @return array
     * Retorna todos los destinos que compartan el id_pais($id).
     */
    public function getbyID($id) {
        $query = $this->getDb()->prepare('SELECT * FROM destinos WHERE id_pais = ? ORDER BY nombre ASC');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

     /**
     * @param $nombre, $detail, $precio, $dias
     * Edito un destino en base al nombre, detail, precio y dias pasados por parámetro
     */
    public function edit($id, $nombre, $detail, $precio, $dias){
        $query = $this->getDb()->prepare('UPDATE destinos SET nombre = ?, precio = ?, dias = ?, detalle = ?  WHERE id = ?');
        $query->execute([$nombre,$precio,$dias,$detail, $id]);
        
    }

    /**
     * @param $nombre, $pais, $detail, $precio, $dias
     * Agrega un destino en base al nombre, pais, detail, precio y dias pasados por parámetro
     */
    public function agregar($pais,$nombre, $detail, $precio, $dias){
         $query = $this->getDb()->prepare("INSERT INTO destinos (nombre, precio, dias, detalle, id_pais) VALUES (?, ?, ?, ?, ?)");
         $query->execute([$nombre, $precio, $dias, $detail, $pais]);
        
    }

    /**
     * @param $id
     * Elimina un destino en base al id pasado por parámetro
     */
    public function eliminar($id){
        $query = $this->getDb()->prepare('DELETE FROM destinos WHERE id = ?');
        $query->execute([$id]);
    }
}